load('common.js');
function execute() {
    var book = ceBook();
    if (!book || !book.id) return Response.error('Mở cài đặt extension từ truyện có bộ nhớ cần xuất để dùng chức năng này.');
    var count = ceExportMemory(String(book.id));
    if (!count) return Response.error('Truyện này chưa có tên/thuật ngữ nào trong bộ nhớ để xuất. Biên tập vài chương để tích lũy bộ nhớ trước.');
    return Response.success('Đã chép ' + count + ' tên/thuật ngữ vào bộ nhớ dùng chung. Mở truyện khác rồi chạy “Nhập bộ nhớ dùng chung” để thêm các mục này vào truyện đó.');
}
