# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

Artist.delete_all
Song.delete_all
Genre.delete_all

10.times { Artist.create(name: Faker::Artist.name, bio: Faker::Quote.most_interesting_man_in_the_world) }
10.times { Genre.create(name: Faker::Music.genre)}

def all_artist_ids
  Artist.all.map { |artist| artist.id }
end

def all_genre_ids
  Genre.all.map { |genre| genre.id }
end

20.times { Song.create(name: Faker::Book.title, artist_id: all_artist_ids.sample, genre_id: all_genre_ids.sample) }