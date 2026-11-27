load('common.js');
function execute() {
    var list = [];
    for (var i = 0; i < CE_MODELS.length; i++)
        list.push({id:CE_MODELS[i].id, name:CE_MODELS[i].name, description:CE_MODELS[i].description, isNetworkRequired:true});
    return Response.success(list);
}
