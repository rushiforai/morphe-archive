load('common.js');
function execute() {
    var book = ceBook(), done = 0, missing = [];
    if (!book || !book.id) return Response.error('Mở cài đặt extension từ truyện cần biên tập để dùng chức năng này.');
    try {
        var chapters = ceChapters(), range = ceRange(chapters), options = ceSettings();
        console.log('Biên tập mục lục ' + range.from + '–' + range.to + ' bằng model local. Chỉ dùng chương đã có trên máy; miễn phí.');
        for (var i = range.from - 1; i < range.to; i++) {
            var chapter = chapters[i], content = localBook.getChapterContent(Number(chapter.position));
            var raw = content && content.content && content.content.raw;
            if (raw === undefined || raw === null) raw = content && content.content && content.content[''];
            if (!raw || !cePlainText(raw)) { missing.push(i + 1); console.log('Bỏ qua mục ' + (i + 1) + ': chưa có nội dung gốc trên máy.'); continue; }
            console.log('Đang xử lý mục ' + (i + 1) + ': ' + ceTitle(chapter));
            ceEdit(String(raw), options); done++;
            console.log('Đã lưu mục ' + (i + 1) + '.');
        }
        var message = 'Đã biên tập/lấy lại từ bộ nhớ ' + done + ' chương. Bản gốc giữ nguyên.';
        if (missing.length) return Response.error(message + ' Chưa có nội dung mục: ' + missing.join(', ') + '. Tải/lưu các chương này rồi chạy lại.');
        return Response.success(message + ' Mở chương với extension này để đọc bản đã biên tập.');
    } catch (e) {
        return Response.error('Dừng sau ' + done + ' chương: ' + String(e.message || 'Có lỗi khi biên tập.') + ' Các chương đã lưu vẫn được giữ; có thể chạy lại khoảng này.');
    }
}
