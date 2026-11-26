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
        api_key:{title:'DeepSeek API key',subtitle:'Dùng khi chọn model DeepSeek, và là nguồn dự phòng khi nguồn miễn phí hết hạn mức. Chỉ gọi api.deepseek.com. Không chia sẻ khóa API.',default:'',mode:'input',format:'text'},
        fallback_deepseek:{title:'Tự chuyển sang DeepSeek khi nguồn free lỗi',subtitle:'Khi nguồn miễn phí (Gemini, OpenRouter, Groq…) hết hạn mức hoặc lỗi, tự dùng DeepSeek Flash cho chương đó nếu đã nhập DeepSeek API key. Có phí DeepSeek cho lượt đó.',default:'true',mode:'toggle'},
        gemini_api_key:{title:'Gemini API key (miễn phí)',subtitle:'Lấy tại aistudio.google.com/apikey. Dùng khi chọn model Gemini. Lưu ý: dữ liệu bản free có thể được Google dùng để huấn luyện.',default:'',mode:'input',format:'text'},
        openrouter_api_key:{title:'OpenRouter API key',subtitle:'Lấy tại openrouter.ai/keys. Dùng khi chọn model OpenRouter.',default:'',mode:'input',format:'text'},
        openrouter_model:{title:'ID model OpenRouter',subtitle:'Ví dụ model miễn phí: deepseek/deepseek-chat-v3.1:free hoặc qwen/qwen3-coder:free. Dán đúng ID model từ openrouter.ai/models.',default:'',mode:'input',format:'text'},
        groq_api_key:{title:'Groq API key (miễn phí)',subtitle:'Lấy tại console.groq.com/keys. Dùng khi chọn model Groq.',default:'',mode:'input',format:'text'},
        groq_model:{title:'ID model Groq',subtitle:'Ví dụ: openai/gpt-oss-120b hoặc qwen/qwen3-32b. Xem danh sách tại console.groq.com/docs/models.',default:'openai/gpt-oss-120b',mode:'input',format:'text'},
        custom_base_url:{title:'Endpoint tùy chỉnh (OpenAI-compatible)',subtitle:'Dùng khi chọn model Tùy chỉnh. Nhập base URL (vd https://host/v1) hoặc đầy đủ .../chat/completions. Z.ai: https://api.z.ai/api/paas/v4',default:'',mode:'input',format:'text'},
        custom_api_key:{title:'API key cho endpoint tùy chỉnh',subtitle:'Khóa Bearer gửi tới endpoint tùy chỉnh ở trên.',default:'',mode:'input',format:'text'},
        custom_model:{title:'ID model cho endpoint tùy chỉnh',subtitle:'Ví dụ: glm-4.6-flash. Theo tài liệu của nhà cung cấp.',default:'',mode:'input',format:'text'},
        use_memory:{title:'Dùng bộ nhớ cục bộ',subtitle:'Áp dụng tên nhân vật, địa điểm, thuật ngữ đã lưu của từng truyện. Chỉ gửi các mục liên quan trong đoạn.',default:'true',mode:'toggle'},
        auto_memory:{title:'Tự ghi nhớ trong lúc biên tập',subtitle:'Lấy tối đa 8 tên/thuật ngữ từ chính lượt biên tập, không gọi thêm API riêng. Không tự sửa mục đã lưu.',default:'true',mode:'toggle'},
        system_prompt:{title:'Prompt hệ thống biên tập',subtitle:'Tùy chỉnh như DeepSeek Translate. Biến: {source_language}, {target_language}, {style_prompt}, {source_prompt}, {custom_instruction}, {memory_prompt}. Gửi nguyên chương; AI tự nối/tách đoạn theo ngữ cảnh. Quy ước JSON được thêm tự động.',default:ceDefaultSystemPrompt(),mode:'input',format:'text'},
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
