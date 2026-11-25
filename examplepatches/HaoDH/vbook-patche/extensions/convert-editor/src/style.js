load('common.js');
function execute() {
    var styles = [
        {id:'natural',name:'Tự nhiên'},
        {id:'wuxia',name:'Kiếm hiệp / Tiên hiệp'},
        {id:'modern',name:'Hiện đại / Đô thị'}
    ];
    var known = {natural:true,wuxia:true,modern:true};
    var rows = localDatabase.list('', CE_PROMPT_TABLE, 0, 200) || [];
    for (var i = 0; i < rows.length; i++) {
        var id = String(rows[i].key || '').trim();
        if (!id || known[id]) continue;
        styles.push({id:id,name:id,description:String(rows[i].value || '').replace(/\s+/g,' ').substring(0,140)});
        known[id] = true;
    }
    return Response.success(styles);
}
