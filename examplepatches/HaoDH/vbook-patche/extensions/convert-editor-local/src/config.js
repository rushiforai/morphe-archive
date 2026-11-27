load('common.js');
function execute() {
    var book = ceBook(), id = book && book.id ? String(book.id) : '';
    var instructionsKey = id ? 'instructions_' + id : 'instructions';
    var glossaryKey = id ? 'glossary_' + id : 'glossary';
    for (var style in CE_STYLES) {
        if (!Object.prototype.hasOwnProperty.call(CE_STYLES, style)) continue;
        if (localDatabase.get('', CE_PROMPT_TABLE, style) === null || localDatabase.get('', CE_PROMPT_TABLE, style) === undefined)
            localDatabase.upsert('', CE_PROMPT_TABLE, style, CE_STYLES[style]);
    }
    var config = {
        local_base_url:{title:'Địa chỉ server model (IP:port)',subtitle:'Server chạy trên máy bạn. LM Studio: http://IP-PC:1234/v1 (bật “Serve on Local Network”). llama.cpp: http://IP-PC:8080 (chạy --host 0.0.0.0). Ollama: http://IP-PC:11434/v1. Điện thoại và PC phải cùng wifi. Lấy IP bằng ipconfig.',default:'',mode:'input',format:'text'},
        local_model:{title:'ID / tên model',subtitle:'Tên model đang chạy trên server. LM Studio/llama.cpp có thể để “local-model” hoặc để trống (server dùng model đang nạp). Ollama nhập đúng tên, vd qwen3.5:9b.',default:'',mode:'input',format:'text'},
        local_json_mode:{title:'Dùng JSON mode',subtitle:'Mặc định tắt vì llama.cpp/LM Studio thường không theo response_format. Bật nếu server của bạn hỗ trợ JSON mode (vài bản Ollama).',default:'false',mode:'toggle'},
        local_api_key:{title:'API key (nếu server yêu cầu)',subtitle:'Phần lớn server local không cần key — để trống là được. Chỉ nhập nếu bạn đặt API key cho server (vd llama-server --api-key).',default:'',mode:'input',format:'text'},
        request_timeout:{title:'Thời gian chờ mỗi chương (giây)',subtitle:'Để trống dùng mặc định 600 giây. Tăng nếu model chạy chậm trên CPU. Tối đa 1800.',default:'',mode:'input',format:'number'},
        auto_split:{title:'Tự chia nhỏ khi chương bị cắt',subtitle:'Khi model trả kết quả bị cắt vì chương quá dài (context nhỏ), tự chia đôi chương và biên tập từng nửa trên cùng server rồi ghép lại.',default:'true',mode:'toggle'},
        use_memory:{title:'Dùng bộ nhớ cục bộ',subtitle:'Áp dụng tên nhân vật, địa điểm, thuật ngữ đã lưu của từng truyện. Chỉ gửi các mục liên quan trong đoạn.',default:'true',mode:'toggle'},
        auto_memory:{title:'Tự ghi nhớ trong lúc biên tập',subtitle:'Lấy tối đa 8 tên/thuật ngữ từ chính lượt biên tập, không gọi thêm lượt riêng. Không tự sửa mục đã lưu.',default:'true',mode:'toggle'},
        shared_glossary:{title:'Tên / thuật ngữ dùng chung (mọi truyện)',subtitle:'Áp dụng cho tất cả truyện. Ví dụ: cách xưng hô, tên riêng, thuật ngữ muốn thống nhất. Bản riêng của từng truyện ưu tiên hơn khi khác nhau.',default:'',mode:'input',format:'text'},
        ce_shared_memory:{title:'Bộ nhớ dùng chung (xuất/nhập giữa truyện)',subtitle:'Nơi chứa tên/thuật ngữ khi dùng chức năng Xuất/Nhập bộ nhớ dùng chung. Key dạng loại|tên (character/place/term). Có thể sửa hoặc xóa tại đây.',mode:'database'},
        system_prompt:{title:'Prompt hệ thống biên tập',subtitle:'Biến: {source_language}, {target_language}, {style_prompt}, {source_prompt}, {custom_instruction}, {memory_prompt}. Gửi nguyên chương; AI tự nối/tách đoạn theo ngữ cảnh. Quy ước JSON được thêm tự động.',default:ceDefaultSystemPrompt(),mode:'input',format:'text'},
        editing_prompts:{title:'Prompt phong cách biên tập',subtitle:'Dùng chung cho các truyện. Để trống bookId; key là ID phong cách (natural, wuxia, modern hoặc ID mới), value là prompt. Phong cách mới hiện trong bộ chọn.',mode:'database'},
        chapter_from:{title:'Từ mục chương A',subtitle:'Số thứ tự trong mục lục, bắt đầu từ 1; không phải số ghi trong tên chương.',default:'1',mode:'input',format:'number'},
        chapter_to:{title:'Đến mục chương B',subtitle:'Bao gồm cả A và B. Chỉ chạy khi bấm Bắt đầu trong chức năng biên tập khoảng chương.',default:'1',mode:'input',format:'number'}
    };
    config[instructionsKey] = {title:id?'Yêu cầu biên tập riêng cho truyện':'Yêu cầu biên tập mặc định',subtitle:'Ví dụ: giữ ta/ngươi, không đổi tên nhân vật. Đổi yêu cầu: tải lại chương để bỏ cache của vBook.',default:'',mode:'input',format:'text'};
    config[glossaryKey] = {title:id?'Tên / thuật ngữ của truyện này':'Tên / thuật ngữ mặc định',subtitle:'Yêu cầu thủ công ưu tiên hơn mục học tự động. Có thể ghi cách xưng hô hoặc tên cần giữ.',default:'',mode:'input',format:'text'};
    if (id) {
        config.ce_characters = {title:'Bộ nhớ nhân vật của truyện',subtitle:'Key: tên/biệt danh trong bản convert; value: cách viết muốn giữ. Tự học không ghi đè mục đã có.',mode:'database'};
        config.ce_places = {title:'Bộ nhớ địa điểm của truyện',subtitle:'Key: tên trong bản convert; value: cách viết chuẩn. Mỗi truyện lưu riêng.',mode:'database'};
        config.ce_terms = {title:'Bộ nhớ thuật ngữ / tổ chức',subtitle:'Cảnh giới, công pháp, tông môn… Key: tên gốc; value: cách viết muốn dùng.',mode:'database'};
        config['memory_revision_' + id] = {title:'Phiên bản bộ nhớ của truyện',subtitle:'Mặc định 1. Sau khi sửa tên thủ công, tăng số này nếu muốn biên tập lại cả các đoạn đã lưu; có thể tốn API. Sau đó tải lại chương.',default:'1',mode:'input',format:'number'};
    }
    return Response.success(config);
}
