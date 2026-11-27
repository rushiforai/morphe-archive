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
        translate_model:{title:'Model dịch mặc định (nguồn ưu tiên)',subtitle:'Nguồn dùng cho cả trình đọc và biên tập khoảng A–B. Nhập ID: deepseek-flash, deepseek-v4-pro, gemini-flash-lite, gemini-flash, openrouter-free, groq-free, cloudflare-free, custom, lan-local. Để trống = DeepSeek Flash (trả phí). Muốn ưu tiên free thì nhập gemini-flash-lite rồi nhập Gemini API key bên dưới.',default:'',mode:'input',format:'text'},
        api_key:{title:'DeepSeek API key',subtitle:'Dùng khi chọn model DeepSeek, và là nguồn dự phòng khi nguồn miễn phí hết hạn mức. Chỉ gọi api.deepseek.com. Không chia sẻ khóa API.',default:'',mode:'input',format:'text'},
        fallback_deepseek:{title:'Tự chuyển sang DeepSeek khi nguồn free hết hạn mức',subtitle:'Chỉ khi nguồn miễn phí hết hạn mức (429) hoặc quá tải (5xx) mới tự dùng DeepSeek Flash cho chương đó (cần DeepSeek API key, có phí lượt đó). Lỗi sai/thiếu API key (401/403) sẽ báo lỗi để bạn sửa, KHÔNG âm thầm tính phí DeepSeek.',default:'true',mode:'toggle'},
        auto_split:{title:'Tự chia nhỏ khi chương bị cắt',subtitle:'Khi model trả kết quả bị cắt vì chương quá dài, tự chia đôi chương và biên tập từng nửa rồi ghép lại, thay vì phải chuyển sang DeepSeek. Giữ nguyên nguồn đang dùng.',default:'true',mode:'toggle'},
        gemini_api_key:{title:'Gemini API key (miễn phí)',subtitle:'Lấy tại aistudio.google.com/apikey. Dùng khi chọn model Gemini. Lưu ý: dữ liệu bản free có thể được Google dùng để huấn luyện.',default:'',mode:'input',format:'text'},
        openrouter_api_key:{title:'OpenRouter API key',subtitle:'Lấy tại openrouter.ai/keys. Dùng khi chọn model OpenRouter.',default:'',mode:'input',format:'text'},
        openrouter_model:{title:'ID model OpenRouter',subtitle:'Ví dụ model miễn phí: deepseek/deepseek-chat-v3.1:free hoặc qwen/qwen3-coder:free. Dán đúng ID model từ openrouter.ai/models.',default:'',mode:'input',format:'text'},
        groq_api_key:{title:'Groq API key (miễn phí)',subtitle:'Lấy tại console.groq.com/keys. Dùng khi chọn model Groq.',default:'',mode:'input',format:'text'},
        groq_model:{title:'ID model Groq',subtitle:'Ví dụ: openai/gpt-oss-120b hoặc qwen/qwen3-32b. Xem danh sách tại console.groq.com/docs/models.',default:'openai/gpt-oss-120b',mode:'input',format:'text'},
        cloudflare_account_id:{title:'Cloudflare Account ID',subtitle:'Dùng khi chọn model Cloudflare Workers AI. Lấy ở dash.cloudflare.com (trang Workers & Pages). Endpoint được dựng từ ID này.',default:'',mode:'input',format:'text'},
        cloudflare_api_key:{title:'Cloudflare API token (miễn phí)',subtitle:'Token có quyền Workers AI, tạo ở dash.cloudflare.com/profile/api-tokens. Dùng khi chọn model Cloudflare.',default:'',mode:'input',format:'text'},
        cloudflare_model:{title:'ID model Cloudflare',subtitle:'Ví dụ: @cf/meta/llama-3.3-70b-instruct-fp8-fast, @cf/qwen/qwen2.5-coder-32b-instruct. Xem developers.cloudflare.com/workers-ai/models.',default:'@cf/meta/llama-3.3-70b-instruct-fp8-fast',mode:'input',format:'text'},
        custom_base_url:{title:'Endpoint tùy chỉnh (OpenAI-compatible)',subtitle:'Dùng khi chọn model Tùy chỉnh. Nhập base URL (vd https://host/v1) hoặc đầy đủ .../chat/completions. Z.ai: https://api.z.ai/api/paas/v4. Local llama.cpp: http://127.0.0.1:8080',default:'',mode:'input',format:'text'},
        custom_api_key:{title:'API key cho endpoint tùy chỉnh',subtitle:'Khóa Bearer gửi tới endpoint tùy chỉnh ở trên. Server local không cần key thì nhập ký tự bất kỳ (vd: local).',default:'',mode:'input',format:'text'},
        custom_model:{title:'ID model cho endpoint tùy chỉnh',subtitle:'Ví dụ: glm-4.6-flash, hoặc tên model đang chạy trên server local.',default:'',mode:'input',format:'text'},
        custom_json_mode:{title:'Dùng JSON mode cho nguồn Tùy chỉnh',subtitle:'Bật: gửi response_format JSON (hợp API lớn). Tắt khi dùng server local như llama.cpp hay model không hỗ trợ JSON mode, để tránh lỗi trả sai JSON.',default:'true',mode:'toggle'},
        lan_base_url:{title:'Địa chỉ PC local (LAN)',subtitle:'Dùng khi chọn model “PC local (LAN)”. Nhập IP:port của PC chạy model, vd http://192.168.1.10:8080 (llama.cpp) hoặc http://192.168.1.10:11434/v1 (Ollama). Điện thoại và PC phải cùng wifi.',default:'',mode:'input',format:'text'},
        lan_model:{title:'ID model PC local (LAN)',subtitle:'Tên model đang chạy trên PC. Với llama.cpp nhập gì cũng được (server bỏ qua). Với Ollama nhập đúng tên model, vd qwen3.5:9b.',default:'',mode:'input',format:'text'},
        lan_json_mode:{title:'Dùng JSON mode cho PC local (LAN)',subtitle:'Mặc định tắt vì llama.cpp thường không theo response_format. Bật nếu server local của bạn hỗ trợ JSON mode (một số bản Ollama).',default:'false',mode:'toggle'},
        lan_api_key:{title:'API key cho PC local (LAN) (nếu có)',subtitle:'Hầu hết server local không cần key, để trống là được. Chỉ nhập nếu bạn đặt API key cho server (vd llama-server --api-key).',default:'',mode:'input',format:'text'},
        request_timeout:{title:'Thời gian chờ mỗi chương (giây)',subtitle:'Để trống dùng mặc định: 600 giây cho PC local, 180 giây cho nguồn trên mạng. Tăng nếu model local chạy chậm trên CPU. Tối đa 1800.',default:'',mode:'input',format:'number'},
        use_memory:{title:'Dùng bộ nhớ cục bộ',subtitle:'Áp dụng tên nhân vật, địa điểm, thuật ngữ đã lưu của từng truyện. Chỉ gửi các mục liên quan trong đoạn.',default:'true',mode:'toggle'},
        auto_memory:{title:'Tự ghi nhớ trong lúc biên tập',subtitle:'Lấy tối đa 8 tên/thuật ngữ từ chính lượt biên tập, không gọi thêm API riêng. Không tự sửa mục đã lưu.',default:'true',mode:'toggle'},
        shared_glossary:{title:'Tên / thuật ngữ dùng chung (mọi truyện)',subtitle:'Áp dụng cho tất cả truyện. Ví dụ: cách xưng hô, tên riêng, thuật ngữ muốn thống nhất. Bản riêng của từng truyện ưu tiên hơn khi khác nhau.',default:'',mode:'input',format:'text'},
        ce_shared_memory:{title:'Bộ nhớ dùng chung (xuất/nhập giữa truyện)',subtitle:'Nơi chứa tên/thuật ngữ khi dùng chức năng Xuất/Nhập bộ nhớ dùng chung. Key dạng loại|tên (character/place/term). Có thể sửa hoặc xóa tại đây.',mode:'database'},
        system_prompt:{title:'Prompt hệ thống biên tập',subtitle:'Tùy chỉnh như DeepSeek Translate. Biến: {source_language}, {target_language}, {style_prompt}, {source_prompt}, {custom_instruction}, {memory_prompt}. Gửi nguyên chương; AI tự nối/tách đoạn theo ngữ cảnh. Quy ước JSON được thêm tự động.',default:ceDefaultSystemPrompt(),mode:'input',format:'text'},
        editing_prompts:{title:'Prompt phong cách biên tập',subtitle:'Dùng chung cho các truyện. Để trống bookId; key là ID phong cách (natural, wuxia, modern hoặc ID mới), value là prompt. Phong cách mới hiện trong bộ chọn.',mode:'database'},
        batch_model:{title:'Model cho biên tập khoảng A–B',subtitle:'Để trống: A–B tự theo model bạn đang dùng ở trình đọc (lần đọc gần nhất). Muốn ép riêng cho A–B thì nhập ID model: deepseek-flash, deepseek-v4-pro, gemini-flash-lite, gemini-flash, openrouter-free, groq-free, cloudflare-free, custom, lan-local.',default:'',mode:'input',format:'text'},
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
