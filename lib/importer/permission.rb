module Importer
  class Permission < Base
    table 'permissions'
    
    def self.find_all_by_repositories(repositories)
      find_all("`active` = 1 AND `repository_id` IN (#{repositories.collect { |r| quote_string(r.attributes['id']) } * ', '})")
    end
  end
end