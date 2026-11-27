load('common.js');
function execute() {
    var styles = [], known = {};
    for (var id in CE_STYLES) {
        if (!Object.prototype.hasOwnProperty.call(CE_STYLES, id)) continue;
        styles.push({id:id, name:CE_STYLE_NAMES[id] || id, description:String(CE_STYLES[id]).replace(/\s+/g,' ').substring(0,140)});
        known[id] = true;
    }
    var rows = localDatabase.list('', CE_PROMPT_TABLE, 0, 200) || [];
    for (var i = 0; i < rows.length; i++) {
        var key = String(rows[i].key || '').trim();
        if (!key || known[key]) continue;
        styles.push({id:key, name:CE_STYLE_NAMES[key] || key, description:String(rows[i].value || '').replace(/\s+/g,' ').substring(0,140)});
        known[key] = true;
    }
    return Response.success(styles);
}
