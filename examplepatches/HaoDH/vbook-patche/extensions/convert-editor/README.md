# DeepSeek – Biên tập truyện convert

Extension `translate` cho vBook. Đầu vào là truyện **đã convert sang tiếng Việt (QT/Hán Việt)**; đầu ra là bản biên tập tiếng Việt tự nhiên hơn. Đây không phải công cụ dịch lại từ nguyên văn tiếng Trung đã thất lạc.

## Cài và đọc ngay trong chương

1. Chép `vbook-convert-editor-1.1.1.zip` vào điện thoại hoặc cập nhật từ nguồn GitHub đã thêm. Trong phần quản lý tiện ích mở rộng của vBook, dùng chức năng nhập/cài extension từ tệp ZIP. Giữ nguyên ZIP, không giải nén trước khi chọn. Tên/vị trí nút có thể khác theo bản vBook.
2. Mở truyện convert, mở cài đặt dịch của **truyện đó**, chọn **DeepSeek – Biên tập truyện convert**.
3. Chọn nguồn **Việt convert (QT/Hán Việt)** và đích **Tiếng Việt – biên tập**. Không dùng đích **Tiếng Việt** thông thường. Bản 1.1.1 khai báo nguồn `vi`, đích riêng `qaa` với tên tiếng Việt; prompt vẫn yêu cầu biên tập tiếng Việt. Mã đích riêng tránh điều kiện bỏ qua cùng ngôn ngữ của vBook; không giả đầu vào là tiếng Trung.
4. Mở cài đặt extension từ truyện, nhập DeepSeek API key của bạn. Chọn model **DeepSeek Flash** hoặc **DeepSeek V4 Pro** và văn phong trong các bộ chọn của vBook. Flash là mặc định.
5. Có thể nhập yêu cầu văn phong, tên nhân vật/cảnh giới/thuật ngữ riêng cho truyện. Sau đó quay lại chương và bật dịch bằng extension đã chọn.

Extension chỉ xử lý nội dung chương. Mục lục, tên truyện, giới thiệu và kết quả tìm kiếm được giữ nguyên để tránh phát sinh các lần gọi API ngoài việc biên tập chương.

Chương đang mở chỉ chờ nội dung của chính nó; extension không tự biên tập các chương tiếp theo. Chương dài có thể cần nhiều lượt API. Đây không phải kết quả hiển thị tức thì hoặc dịch dạng streaming.

### Sửa lỗi báo thành công nhưng chưa thấy thay đổi — 1.1.1

vBook 1.2.9 có bước so sánh **ngôn ngữ cơ sở** của sách và đích trước khi gọi JavaScript. Mã `vi-convert` trong 1.0.0/1.1.0 bị chuẩn hóa về `vi`; khi đích cũng là `vi`, ứng dụng không gọi extension để biên tập nội dung đang đọc. Action A–B vẫn có thể chạy vì không đi qua điều kiện hiển thị này.

Sau khi cập nhật lên metadata version **3**:

1. Mở cài đặt dịch **của truyện**, chọn lại extension này.
2. Chọn đích **Tiếng Việt – biên tập**, không giữ đích Tiếng Việt cũ. Chọn nguồn Việt convert (QT/Hán Việt).
3. Bật dịch **nội dung chương**, trở lại trang đọc và **tải lại chương**. Nếu ứng dụng có lựa chọn hiện bản gốc/bản dịch, chọn bản dịch.
4. Có thể chạy action **Kiểm tra điều kiện ngôn ngữ** từ cài đặt extension của truyện. Action này không gọi DeepSeek, không mất token, chỉ hiển thị ngôn ngữ sách/nguồn/đích và hướng dẫn sửa.

Thông báo A–B thành công nghĩa là kết quả đã lưu riêng trong extension, **không có nghĩa sách gốc hoặc trang đang mở đã được thay thế**. Bản 1.1.1 không đổi prompt/cache identity từ 1.1.0, nên có thể dùng lại kết quả A–B đã lưu nếu model/văn phong/yêu cầu và cách chia đoạn khớp. Không cần biên tập trả phí lại toàn bộ trước khi thử tải lại chương với đích mới.

Giới hạn kiểm chứng: đã đối chiếu đường gọi và phép chuẩn hóa `Locale.getLanguage()` trong APK vBook 1.2.9 có sẵn tại project; chưa xác nhận trên thiết bị người dùng hoặc các bản vBook khác.

## Biên tập riêng từ chương A đến chương B

1. Tải/lưu nội dung các chương cần xử lý trước. API vBook chỉ cho extension đọc nội dung đã có trên máy; extension không tự tải các chương chưa lưu.
2. Mở cài đặt extension **từ truyện cần xử lý**, nhập **Từ mục chương A** và **Đến mục chương B**.
3. A/B là **thứ tự trong mục lục sau khi loại tiêu đề nhóm**, bắt đầu từ **1**, bao gồm cả hai đầu. Không lấy số trong tên chương. Nếu mục đầu là Lời tựa thì nó là mục 1.
4. Chọn **Biên tập khoảng chương A–B**. Kiểm tra tên chương đầu/cuối và tổng số chương trong phần mô tả, rồi bấm **Bắt đầu**.
5. Theo dõi nhật ký. Có thể dừng theo cơ chế action của vBook. Chạy lại cùng khoảng để tiếp tục dùng các đoạn đã lưu; nội dung thiếu hoặc lỗi được báo rõ.
6. Mở chương với chính extension, model, văn phong và yêu cầu đã dùng để đọc kết quả. **Không cần nhập một sách mới.**

Phần xử lý A–B chạy trong màn hình action của vBook; extension không tự tạo tác vụ nền độc lập hoặc tự mở màn hình đọc khi đang chạy.

## Cấu hình prompt như DeepSeek Translate — bản 1.1.0

Giữ nguyên tên extension và nguồn khi cập nhật ZIP để vBook có thể nhận diện bản cập nhật. Không gỡ bản cũ trước chỉ để cập nhật: gỡ extension sẽ xóa dữ liệu của nó. Nếu vBook báo tạo thêm một extension riêng, dừng và kiểm tra trước khi xóa bản cũ.

### 1. Prompt hệ thống biên tập

Đây là hướng dẫn chung cho tất cả truyện, có thể sửa toàn bộ trong cài đặt extension. Mặc định đã tối ưu **biên tập Việt convert → Việt tự nhiên**; không lấy nguyên prompt dịch Trung → Việt của extension mẫu vì đầu vào không có nguyên văn Trung Quốc.

Các biến được thay tự động tương tự DeepSeek Translate:

| Biến | Nội dung |
|---|---|
| `{source_language}` | tiếng Việt convert QT/Hán Việt |
| `{target_language}` | tiếng Việt tự nhiên |
| `{style_prompt}` | Prompt văn phong đang chọn |
| `{source_prompt}` | Hướng dẫn xử lý nội dung chương |
| `{custom_instruction}` | Yêu cầu riêng của truyện, hoặc yêu cầu mặc định nếu chưa đặt riêng |
| `{memory_prompt}` | Tên và thuật ngữ bạn nhập cho truyện; **không phải bộ nhớ do AI tự học** |

Giữ những biến bạn muốn áp dụng. Nếu xóa `{style_prompt}` thì lựa chọn văn phong không còn được đưa vào prompt; tương tự với yêu cầu và thuật ngữ. Quy ước trả JSON và giữ số đoạn được nối riêng tự động, vì extension cần định dạng này để kiểm tra và lưu kết quả.

Ví dụ prompt hệ thống có thể dán vào ô cấu hình:

```text
Bạn là biên tập viên tiểu thuyết tiếng Việt. Hãy biên tập {source_language} thành {target_language}.
Sửa cú pháp QT, trật tự từ và cách diễn đạt gượng; giữ nhịp kể, sắc thái nhân vật và đầy đủ thông tin.
Không thêm tình tiết, không tóm tắt, không suy đoán nguyên tác. Giữ nguyên tên Hán Việt, số liệu, cảnh giới và thuật ngữ. Chỉ sửa xưng hô khi có đủ ngữ cảnh.

{style_prompt}
{source_prompt}
{custom_instruction}
{memory_prompt}

Tự đối chiếu đủ ý và nhất quán tên trước khi trả kết quả; không in phần giải thích.
```

### 2. Prompt phong cách biên tập

Mở bảng **Prompt phong cách biên tập** trong cài đặt. Ba hàng mặc định được tạo khi mở cài đặt lần đầu:

- `natural`: Tự nhiên.
- `wuxia`: Kiếm hiệp / Tiên hiệp.
- `modern`: Hiện đại / Đô thị.

Để sửa phong cách có sẵn, sửa `value` của hàng tương ứng. Để thêm phong cách, để trống `bookId`, nhập `key` mới (ví dụ `cung-dau`) và `value` là prompt. Phong cách mới hiện trong bộ chọn văn phong của vBook khi mở lại bộ chọn. Prompt là văn bản thường, không cần JSON.

Ví dụ value cho `wuxia`:

```text
Giữ chất cổ phong vừa phải, tên chiêu thức, cảnh giới và pháp bảo dùng Hán Việt nhất quán. Câu kể và động từ phải tự nhiên, tránh lối “đối với ... mà nói”, “đem ... cho ...” nếu không cần thiết. Không hiện đại hóa lời thoại; không tự đổi ta/ngươi thành tôi/bạn. Không coi tu vi cao đồng nghĩa tuổi già.
```

Các prompt văn phong được dùng chung giữa các truyện; yêu cầu riêng từng truyện nằm ở ô riêng bên dưới. Không thêm API key vào prompt.

### 3. Yêu cầu riêng và tên / thuật ngữ theo truyện

Mở cài đặt extension **từ truyện** để thấy **Yêu cầu biên tập riêng cho truyện** và **Tên / thuật ngữ của truyện này**. Ví dụ:

```text
Yêu cầu riêng: Giữ ngôi kể thứ ba. Trong lời thoại giữ ta/ngươi nếu bản convert dùng như vậy. Nhân vật chưa rõ giới tính thì dùng tên hoặc cách nói trung tính. Không thay cách viết Lâm Phàm.

Tên / thuật ngữ: Lâm Phàm; Trúc Cơ; Kim Đan; Thanh Vân Tông — giữ nguyên các cách viết này.
```

Nếu chưa đặt riêng, dùng yêu cầu/thuật ngữ mặc định trong cài đặt chung. Các chỉ dẫn này chỉ giúp AI nhất quán, không bảo đảm AI luôn sửa đúng.

### Khi thay đổi prompt

**Tải lại chương đang đọc** để vBook gọi lại extension. Bộ nhớ riêng của extension sẽ phân biệt prompt mới (kể cả sửa value của văn phong) và không dùng nhầm kết quả cũ. Biên tập lại có thể phát sinh phí API. Xử lý A–B dùng đúng cấu hình prompt/model/văn phong đã chọn lúc bắt đầu.

Bản 1.1.0 thay prompt mặc định và khóa bộ nhớ; các kết quả tạo bằng 1.0.0 không được dùng lại cho prompt mới. API key, yêu cầu và thuật ngữ vẫn dùng các khóa cấu hình cũ của extension.

## Bộ nhớ và tính toàn vẹn

- Bản gốc của sách **không bị ghi đè**. Extension chỉ lưu bản biên tập riêng trong cơ sở dữ liệu của extension, theo từng truyện và đoạn văn.
- Khóa bộ nhớ bao gồm nội dung gốc, model, văn phong, chỉ dẫn, thuật ngữ và phiên bản prompt. Có kiểm tra nội dung chính xác để tránh nhầm khi hash trùng.
- Các đoạn đã lưu được dùng lại mà không cần thêm lượt API. Nếu vBook chia đoạn ở ranh giới khác, phần chưa khớp có thể phải gọi lại; không bảo đảm không tốn thêm token trong mọi kiểu chia nội dung của ứng dụng.
- Đổi prompt/thuật ngữ/model sẽ cần biên tập lại. **Tải lại chương** sau khi đổi để bỏ qua cache riêng của vBook; cache của ứng dụng không biết mọi thay đổi trong cấu hình extension.
- JSON lỗi, thiếu/thừa đoạn, đoạn trống và phản hồi bị cắt đều bị từ chối trước khi lưu nhóm đoạn đó. Các nhóm đã xử lý thành công trước đó vẫn được giữ.
- Gỡ extension sẽ xóa bộ nhớ biên tập của extension theo cơ chế vBook. Nó không xóa sách gốc.
- Không tự gọi thêm API để học tên hoặc phân tích nhân vật; yêu cầu và bảng thuật ngữ do người dùng nhập.

## Khóa API, chi phí và giới hạn

Khóa do bạn nhập tại máy, không nằm trong ZIP. Chỉ gửi tới `https://api.deepseek.com/chat/completions`; không có máy chủ trung gian. Khóa được lưu theo cơ chế cài đặt extension của vBook, không cam kết là kho khóa mã hóa. Đừng chia sẻ ảnh cài đặt có khóa.

Nội dung chương, yêu cầu và thuật ngữ liên quan được gửi tới DeepSeek. Dùng API có tính phí theo tài khoản của bạn; chọn khoảng A–B và bấm Bắt đầu là chủ động yêu cầu xử lý khoảng đó. Extension không nạp tiền, không tự gửi lại khi hết số dư, không tự xoay nhiều API key.

AI vẫn có thể sửa sai ý hoặc xưng hô. Không có nguyên văn Trung Quốc thì không thể bảo đảm khôi phục nghĩa đã mất trong bản convert. Nên thử một chương ngắn và đối chiếu trước khi chạy nhiều chương.

Đã kiểm tra bằng môi trường mô phỏng các API vBook, không dùng khóa thật hoặc gửi yêu cầu trả phí. **Chưa thử cài trên điện thoại/vBook thực tế.** Nếu ứng dụng không hiện nguồn Việt convert hoặc không gọi dịch, gửi ảnh màn hình cài đặt dịch và nhật ký; không gửi API key.

## Mã nguồn và kiểm tra

Không cần cài thư viện npm:

```text
node --test tests/editor.test.cjs
```

API extension tham khảo từ tài liệu chính thức: https://github.com/Darkrai9x/vbook-extensions/blob/master/extension-api.md

Mẫu DeepSeek chính thức: https://github.com/Darkrai9x/vbook-extensions/tree/master/deepseek-translate

DeepSeek models và API: https://api-docs.deepseek.com/quick_start/pricing/

Mã xử lý biên tập viết riêng cho extension này; không đóng gói lại mã/biểu tượng của extension mẫu. Không phải sản phẩm chính thức của vBook hoặc DeepSeek.
