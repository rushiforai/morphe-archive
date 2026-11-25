function execute() {
    return Response.success([
        {id:'vi',name:'Việt convert (QT/Hán Việt)',type:'from'},
        // vBook compares base languages before running JS; vi-convert -> vi cannot enable Vietnamese editing.
        {id:'qaa',name:'Tiếng Việt – biên tập',type:'to'}
    ]);
}
