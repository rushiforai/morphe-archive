load('common.js');
function execute(text, from, to, source, model, style) {
    if (!text || source && source !== 'chapterContent') return Response.success(text || '');
    try { return Response.success(ceEdit(text, ceSettings(model, style))); }
    catch (e) { return Response.error(String(e.message || 'Không biên tập được chương.')); }
}
