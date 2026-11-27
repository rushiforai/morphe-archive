load('common.js');
function execute() {
    var book = ceBook();
    if (!book || !book.id) return Response.error('Mở cài đặt extension từ truyện cần nhập bộ nhớ để dùng chức năng này.');
    var r = ceImportMemory(String(book.id));
    if (!r.added && !r.skipped) return Response.error('Bộ nhớ dùng chung đang trống. Mở truyện nguồn và chạy “Xuất bộ nhớ dùng chung” trước.');
    var message = 'Đã thêm ' + r.added + ' mục mới vào bộ nhớ truyện này';
    if (r.skipped) message += ', bỏ qua ' + r.skipped + ' mục đã có';
    message += '. Muốn áp dụng cho cả chương đã lưu thì tăng “Phiên bản bộ nhớ của truyện” rồi tải lại chương.';
    return Response.success(message);
}
