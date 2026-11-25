load('common.js');
function execute() {
    var book = ceBook();
    if (!book || !book.id) return Response.success({});
    var description;
    try {
        var chapters = ceChapters(), range = ceRange(chapters);
        description = 'Mục ' + range.from + ': ' + ceTitle(chapters[range.from - 1]) + '\nĐến mục ' + range.to + ': ' + ceTitle(chapters[range.to - 1]) +
            '\nTổng ' + (range.to - range.from + 1) + ' chương. Có phí DeepSeek cho các đoạn chưa lưu. Có thể dừng và chạy lại; bản gốc giữ nguyên.';
    } catch (e) { description = String(e.message); }
    return Response.success({
        check_language:{name:'Kiểm tra điều kiện ngôn ngữ',description:'Không gọi API, không mất token. Kiểm tra ngôn ngữ sách và ngôn ngữ đích để biết vì sao chương chưa hiển thị bản biên tập.',script:'check-language.js'},
        edit_range:{name:'Biên tập khoảng chương A–B',description:description,script:'batch.js'}
    });
}
