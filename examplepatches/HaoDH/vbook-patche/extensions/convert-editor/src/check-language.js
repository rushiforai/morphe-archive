load('common.js');
function execute() {
    var book = ceBook();
    if (!book || !book.id) return Response.error('Mở cài đặt extension từ truyện đang đọc để kiểm tra.');
    var from = ceConfig('translate_from_language', ''), to = ceConfig('translate_to_language', '');
    var summary = 'Ngôn ngữ sách: ' + String(book.language || '(chưa xác định)') +
        '. Nguồn đã chọn: ' + (from || '(tự động/chưa chọn)') + '. Đích đã chọn: ' + (to || '(chưa chọn)') + '.';
    console.log(summary);
    if (to !== 'qaa') return Response.error(summary + '\nVào cài đặt dịch của truyện, chọn extension này và đích “Tiếng Việt – biên tập”. Không chọn “Tiếng Việt” thông thường. Sau đó tải lại chương.');
    return Response.success(summary + '\nĐích biên tập đã chọn đúng. Bật dịch nội dung chương bằng extension này và tải lại chương. Kết quả A–B chỉ lưu riêng, không ghi đè truyện gốc. Nếu vẫn không đổi, kiểm tra xem trang đọc đang hiển thị bản gốc hay bản dịch.');
}
