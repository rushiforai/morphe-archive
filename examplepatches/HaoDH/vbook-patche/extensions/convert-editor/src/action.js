load('common.js');
function execute() {
    var book = ceBook();
    if (!book || !book.id) return Response.success({});
    var description;
    try {
        var chapters = ceChapters(), range = ceRange(chapters);
        description = 'Mục ' + range.from + ': ' + ceTitle(chapters[range.from - 1]) + '\nĐến mục ' + range.to + ': ' + ceTitle(chapters[range.to - 1]) +
            '\nTổng ' + (range.to - range.from + 1) + ' chương. Gửi nguyên từng chương; AI tự sửa ngắt dòng. Có phí DeepSeek cho chương chưa lưu. Có thể dừng và chạy lại; bản gốc giữ nguyên.';
    } catch (e) { description = String(e.message); }
    return Response.success({
        check_language:{name:'Kiểm tra điều kiện ngôn ngữ',description:'Không gọi API, không mất token. Kiểm tra ngôn ngữ sách và ngôn ngữ đích để biết vì sao chương chưa hiển thị bản biên tập.',script:'check-language.js'},
        edit_range:{name:'Biên tập khoảng chương A–B',description:description,script:'batch.js'},
        export_memory:{name:'Xuất bộ nhớ dùng chung',description:'Chép tên nhân vật, địa điểm, thuật ngữ đã học của truyện này vào bộ nhớ dùng chung, để nhập sang truyện khác (vd truyện cùng bộ/cùng tác giả). Không gọi API.',script:'export-memory.js'},
        import_memory:{name:'Nhập bộ nhớ dùng chung',description:'Thêm các mục trong bộ nhớ dùng chung vào truyện đang mở, không ghi đè mục đã có. Không gọi API.',script:'import-memory.js'}
    });
}
