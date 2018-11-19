class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  post '/recipes' do
    recipe = Recipe.create(name: params[:name],
                           ingredients: params[:ingredients],
                           cook_time: params[:cook_time])
    redirect "/recipes/#{recipe.id}"
  end

  get '/recipes/new' do
    erb :new_recipe
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show_recipe
  end

  patch '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    binding.pry
    recipe.name = params[:name]
    binding.pry
    recipe.ingredients = params[:ingredients]
    binding.pry
    recipe.cook_time = params[:cook_time]
    binding.pry
    redirect "recipes/#{recipe.id}"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit_recipe
  end
end
