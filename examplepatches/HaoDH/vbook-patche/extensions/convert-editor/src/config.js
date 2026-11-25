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
        api_key:{title:'DeepSeek API key',subtitle:'Chỉ gọi api.deepseek.com. Không chia sẻ khóa API.',default:'',mode:'input',format:'text'},
        system_prompt:{title:'Prompt hệ thống biên tập',subtitle:'Tùy chỉnh như DeepSeek Translate. Biến: {source_language}, {target_language}, {style_prompt}, {source_prompt}, {custom_instruction}, {memory_prompt}. Quy ước JSON được thêm tự động.',default:ceDefaultSystemPrompt(),mode:'input',format:'text'},
        editing_prompts:{title:'Prompt phong cách biên tập',subtitle:'Dùng chung cho các truyện. Để trống bookId; key là ID phong cách (natural, wuxia, modern hoặc ID mới), value là prompt. Phong cách mới hiện trong bộ chọn.',mode:'database'},
        chapter_from:{title:'Từ mục chương A',subtitle:'Số thứ tự trong mục lục, bắt đầu từ 1; không phải số ghi trong tên chương.',default:'1',mode:'input',format:'number'},
        chapter_to:{title:'Đến mục chương B',subtitle:'Bao gồm cả A và B. Chỉ chạy khi bấm Bắt đầu trong chức năng biên tập khoảng chương.',default:'1',mode:'input',format:'number'}
    };
    config[instructionsKey] = {title:id?'Yêu cầu biên tập riêng cho truyện':'Yêu cầu biên tập mặc định',subtitle:'Ví dụ: giữ ta/ngươi, không đổi tên nhân vật. Đổi yêu cầu: tải lại chương để bỏ cache của vBook.',default:'',mode:'input',format:'text'};
    config[glossaryKey] = {title:id?'Tên / thuật ngữ của truyện này':'Tên / thuật ngữ mặc định',subtitle:'Nhập tên, cảnh giới, cách xưng hô cần giữ thống nhất; không tự học thêm bằng API.',default:'',mode:'input',format:'text'};
    return Response.success(config);
}
