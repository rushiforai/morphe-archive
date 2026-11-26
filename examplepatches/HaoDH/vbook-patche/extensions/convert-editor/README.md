# DeepSeek – Biên tập truyện convert 1.4.2

Biên tập truyện **đã convert sang tiếng Việt (QT/Hán Việt)** thành tiếng Việt tự nhiên. Bản 1.3.0 gửi **nguyên chương trong một yêu cầu** để AI có đủ ngữ cảnh và tự sửa xuống dòng, như khi dán toàn văn lên web. Không chia nhóm đoạn, không gắn ID, không buộc số đoạn kết quả bằng bản gốc.

## Cập nhật trong vBook

1. Thêm hoặc làm mới nguồn: https://raw.githubusercontent.com/HaoDH/vbook-patche/main/extensions/plugin.json
2. Cập nhật **DeepSeek – Biên tập truyện convert** lên metadata version **11**, tương ứng **1.4.2**. Không gỡ extension để cập nhật.
3. Mở cài đặt extension, giữ/nhập DeepSeek API key. Trong cài đặt dịch của truyện chọn nguồn **Việt convert (QT/Hán Việt)** và đích **Tiếng Việt – biên tập**.
4. Tải lại chương. Nhật ký mới có dòng **Editor 1.4.2: nguồn … [model]; gửi nguyên chương … ký tự** hoặc dùng lại toàn chương đã lưu.

Đường dẫn ZIP trong nguồn giữ cố định để các lần cập nhật dùng cùng định danh:
https://raw.githubusercontent.com/HaoDH/vbook-patche/main/extensions/convert-editor.zip

Nếu cần ZIP thủ công: `vbook-convert-editor-1.4.2.zip`. Cài từ nguồn cố định là cách nên dùng để cập nhật về sau. Bản ZIP/đường dẫn cũ có thể là định danh riêng; cấu hình và bộ nhớ không tự chuyển giữa hai định danh. Giữ nguyên nguồn hiện tại nếu đã dùng đường dẫn cố định.

## Cách biên tập nguyên chương

- Gửi toàn văn nhận được, giữ các dòng gốc làm ngữ cảnh. Không nối dòng bằng quy tắc chữ thường/độ dài trước khi AI đọc.
- Prompt yêu cầu AI nối những dòng ngắt giữa câu, tên, cụm từ; tự tách đoạn kể và lượt thoại hợp lý. Không tóm tắt, bỏ ý, thêm tình tiết hoặc dồn cả chương thành một đoạn.
- Ví dụ `tu vi` xuống dòng `từ nguyên anh trung kỳ` được yêu cầu biên tập liền mạch. Cách dùng “kỳ/kì” tùy văn phong; extension không ép đổi chính tả này bằng mã.
- Kết quả là một trường JSON `text` chứa toàn bộ chương, được tự do thay đổi số đoạn. Xuống dòng trong kết quả được giữ để đọc. JSON chỉ là vỏ truyền dữ liệu, không phải yêu cầu giữ cấu trúc đoạn của bản gốc.
- Manifest đặt `max_length: 0`, `max_line: 0` để tắt giới hạn chia nhỏ của vBook. Đã đối chiếu đường xử lý trong APK 1.2.9; các bản ứng dụng khác vẫn cần kiểm tra trên thiết bị.
- Một chương chưa lưu bình thường dùng một yêu cầu DeepSeek. Extension không tự thử lại hoặc chia nhỏ nếu API trả lỗi/chương bị cắt. Giới hạn đầu ra đặt 65.536 token, timeout 180 giây; chương quá dài vẫn có thể vượt giới hạn API hoặc thời gian chờ.

AI có thể sửa sai hoặc bỏ ý dù phản hồi kết thúc bình thường; đây không phải phép kiểm chứng đầy đủ nội dung. Extension từ chối JSON sai, kết quả rỗng, phản hồi bị cắt và kết quả ngắn bất thường dưới 20% độ dài đầu vào với chương từ 1.000 ký tự. Không còn kiểm tra bằng số đoạn.

## Biên tập riêng khoảng A–B

1. Tải/lưu nội dung các chương trên máy trước. Extension không tự tải chương qua mạng.
2. Mở cài đặt extension **từ truyện**, đặt **Từ mục chương A** và **Đến mục chương B**.
3. A/B là thứ tự mục lục sau khi loại tiêu đề nhóm, bắt đầu từ 1, bao gồm cả hai đầu; không lấy số trong tên chương.
4. Chọn **Biên tập khoảng chương A–B**, kiểm tra tên chương đầu/cuối rồi bấm Bắt đầu.
5. Mỗi chương được gửi riêng nguyên chương. Sau khi thành công, mở chương bằng cùng extension/model/văn phong để đọc bản đã lưu.

Nếu dừng ở giữa khoảng, chương đã lưu vẫn giữ và được dùng lại khi chạy tiếp. Chương đang lỗi không có kết quả hoàn chỉnh để lưu. Không có bộ lập lịch nền hoặc tự biên tập các chương tiếp theo khi chỉ đọc một chương.

## Nhiều nguồn AI để tối ưu chi phí (mới ở 1.4.2)

Bản 1.4.2 thêm lựa chọn nguồn AI ngoài DeepSeek, chọn ngay trong **bộ chọn model** của truyện. Tất cả đều dùng chuẩn OpenAI chat-completions nên chỉ khác endpoint, API key và ID model.

| Model trong bộ chọn | Nguồn | Chi phí | Hạn mức tham khảo | Ghi chú |
|---|---|---|---|---|
| DeepSeek Flash | api.deepseek.com | Trả phí, rẻ (mặc định) | — | Như trước |
| DeepSeek V4 Pro | api.deepseek.com | Trả phí, đắt hơn | — | Chất lượng cao hơn |
| Gemini Flash-Lite (miễn phí) | Google AI Studio | Miễn phí | ~500 lượt/ngày | Dữ liệu bản free có thể được Google dùng để huấn luyện |
| Gemini Flash (miễn phí) | Google AI Studio | Miễn phí | rất ít lượt/ngày | Chất lượng hơn Lite |
| OpenRouter (model free) | openrouter.ai | Miễn phí | ~50 lượt/ngày | Nhập ID model `:free` vào ô OpenRouter |
| Groq (miễn phí) | groq.com | Miễn phí | token/ngày | Nhanh; nhập ID model vào ô Groq |
| Tùy chỉnh | tự nhập | Tùy nguồn | — | Nhập endpoint + key + model (vd Z.ai GLM) |

Các con số hạn mức lấy từ trang tổng hợp bên thứ ba (tháng 9–11/2026) và có thể thay đổi; kiểm tra lại với trang chính thức của từng nhà cung cấp.

**Cấu hình:** mở cài đặt extension, nhập API key cho nguồn muốn dùng (ô DeepSeek, Gemini, OpenRouter, Groq hoặc Tùy chỉnh), rồi trong cài đặt dịch của truyện chọn model tương ứng.

**Thử lại trước khi chuyển nguồn (1.4.2):** nguồn miễn phí hay báo tạm quá tải (ví dụ Gemini trả HTTP 503 “high demand”). Extension thử lại chính nguồn đó tối đa 3 lần trước khi nghĩ tới DeepSeek, nên lỗi 503 chốc lát không còn làm nó âm thầm nhảy sang DeepSeek.

**Tự chuyển về DeepSeek:** bật sẵn ở ô *“Tự chuyển sang DeepSeek khi nguồn free lỗi”*. Chỉ khi nguồn miễn phí thật sự hết hạn mức (HTTP 429), sai/thiếu khóa, hoặc vẫn quá tải sau khi thử lại, extension mới dùng **DeepSeek Flash** cho đúng chương đó nếu đã nhập DeepSeek API key (lượt đó tính phí DeepSeek). Không bao giờ gọi lặp DeepSeek→DeepSeek nên không tính phí hai lần. Tắt ô này nếu chỉ muốn dùng nguồn miễn phí và chấp nhận báo lỗi khi hết hạn mức.

**Cache theo nguồn:** chương biên tập bằng nguồn/model nào thì lưu riêng theo nguồn đó. Đổi sang model khác sẽ biên tập lại (có thể tốn hạn mức/phí); đổi về đúng model cũ thì dùng lại bản đã lưu.

**Vì sao vẫn thấy gọi DeepSeek khi đã chọn Gemini?** Mở **Nhật ký** của chương: mỗi lần biên tập có dòng `Editor 1.4.2: nguồn <tên nguồn> [<model>]…`. Nếu thấy `Nguồn Gemini lỗi: … Tự chuyển sang DeepSeek` thì nghĩa là Gemini lỗi (thiếu key trong ô **Gemini API key**, hết hạn mức, hoặc quá tải). Kiểm tra: đã dán Gemini key vào đúng ô Gemini chưa, và trong cài đặt dịch của truyện đã chọn đúng model **Gemini Flash-Lite** chưa (không phải chọn ở extension khác).

## Prompt và bộ nhớ tên

Giữ các cấu hình đã có: API key, model, văn phong, yêu cầu riêng và thuật ngữ từng truyện. **DeepSeek Flash** là mặc định, ngoài ra có **DeepSeek V4 Pro** và các nguồn miễn phí ở bảng trên. Với DeepSeek, thinking được tắt để ưu tiên tốc độ; các nguồn khác không gửi tham số riêng của DeepSeek.

Prompt hệ thống có các biến:

| Biến | Nội dung |
|---|---|
| `{source_language}` | Tiếng Việt convert QT/Hán Việt |
| `{target_language}` | Tiếng Việt tự nhiên |
| `{style_prompt}` | Prompt văn phong đang chọn |
| `{source_prompt}` | Hướng dẫn biên tập toàn bộ nguyên chương |
| `{custom_instruction}` | Yêu cầu riêng của truyện hoặc yêu cầu mặc định |
| `{memory_prompt}` | Tên/thuật ngữ người dùng nhập thủ công |

Quy tắc gửi toàn chương và sửa ngắt dòng được nối riêng, áp dụng cả khi đã lưu prompt cũ. Nếu prompt riêng còn yêu cầu giữ số đoạn/đánh ID, nên xóa yêu cầu đó hoặc để trống ô prompt để dùng mặc định mới.

Bảng **Prompt phong cách biên tập** dùng chung, có `natural`, `wuxia`, `modern`. Thêm phong cách bằng key riêng và value là hướng dẫn; để trống bookId. Sửa prompt/model/văn phong sẽ cần biên tập lại chương; tải lại chương sau khi sửa.

Mở cài đặt extension từ truyện để xem ba bảng **nhân vật**, **địa điểm**, **thuật ngữ/tổ chức**. Key là tên trong nguồn, value là cách viết muốn giữ. Mỗi truyện lưu riêng. Tự học lấy tối đa 8 tên trong chính phản hồi biên tập, không gọi API phân tích riêng, chỉ nhận tên có trong cả đầu vào và đầu ra và không ghi đè mục đã lưu. Giới hạn tự học 200 mục mỗi bảng; mỗi yêu cầu chỉ đưa tối đa 16 mục liên quan/khoảng 1.500 ký tự vào prompt.

Có thể tắt tự học hoặc tắt dùng bộ nhớ. Tự học không làm hết hiệu lực các chương đã lưu. Sau khi sửa tên thủ công, tăng **Phiên bản bộ nhớ của truyện** nếu muốn biên tập lại cả chương đã lưu; có thể tốn API.

## Cache, dữ liệu và chi phí

- Bản gốc không bị ghi đè. Kết quả lưu riêng theo truyện, toàn văn đầu vào, model và prompt trong bảng `edited_chapters`.
- **Cache từng đoạn của 1.2.x không dùng cho chế độ nguyên chương.** Các bảng cũ không bị xóa, nhưng chương cần biên tập lại một lần để AI có ngữ cảnh toàn chương và sửa lại bố cục. Việc này có phí API.
- API key và bộ nhớ tên được giữ khi cập nhật cùng đường dẫn cố định. Gỡ extension sẽ xóa dữ liệu riêng theo cơ chế vBook.
- Cache dùng chung cho trang đọc và A–B khi toàn văn sau chuẩn hóa khớp. Cách ứng dụng cung cấp/chia nội dung khác nhau có thể làm giảm khả năng dùng lại.
- Chỉ gửi trực tiếp tới endpoint của nguồn đang chọn (`api.deepseek.com`, `generativelanguage.googleapis.com`, `openrouter.ai`, `api.groq.com` hoặc endpoint tùy chỉnh bạn nhập), không qua máy chủ trung gian. Mỗi khóa chỉ gửi tới đúng nguồn của nó. Khóa nằm trong cấu hình vBook, không có trong ZIP; không cam kết là kho khóa mã hóa.
- Nguồn miễn phí có thể dùng dữ liệu gửi lên để huấn luyện (rõ nhất là bản free của Gemini). Cân nhắc trước khi gửi nội dung nhạy cảm; muốn riêng tư hơn thì dùng DeepSeek trả phí.
- Nội dung chương và hướng dẫn/tên liên quan được gửi tới DeepSeek. API tính phí theo tài khoản của bạn; ít lượt gọi hơn không bảo đảm một tỷ lệ tiết kiệm cố định.

## Kiểm tra

Không cần thư viện npm:

```text
node --test tests/editor.test.cjs
```

21 kiểm thử cho luồng nguyên chương, bố cục đầu ra tự do, chương 153 dòng dài hơn 12.000 ký tự vẫn một lượt, cache/model/prompt, bộ nhớ tên, cấu hình một tầng, ngôn ngữ và A–B. Kiểm tra thêm với `core.js` lấy từ APK vBook 1.2.9 bằng cầu nối mô phỏng: API key hiện được, gửi toàn chương và giữ xuống dòng trong kết quả. Chưa gọi API trả phí hoặc xác nhận trực tiếp trên điện thoại; chưa đánh giá chất lượng biên tập bằng phản hồi AI thật.

Tài liệu vBook: https://github.com/Darkrai9x/vbook-extensions/blob/master/extension-api.md
DeepSeek Chat Completions: https://api-docs.deepseek.com/api/create-chat-completion/

Không phải sản phẩm chính thức của vBook hoặc DeepSeek.
