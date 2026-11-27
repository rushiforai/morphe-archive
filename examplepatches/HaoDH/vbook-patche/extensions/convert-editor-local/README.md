# Local AI – Biên tập truyện convert 1.0.1

Bản **chỉ chạy local** của extension biên tập truyện convert: dùng một model AI chạy ngay trên máy bạn (Ollama, llama.cpp, LM Studio), điện thoại gọi qua **wifi LAN**. **Miễn phí, riêng tư, không gọi dịch vụ ngoài và không có fallback trả phí** — nếu server local không kết nối được, extension báo lỗi rõ ràng chứ không âm thầm dùng API khác.

Đây là extension riêng, cài song song được với bản nhiều nguồn (`DeepSeek – Biên tập truyện convert`). Cấu hình và bộ nhớ của hai bản tách biệt.

## Cập nhật / cài trong vBook

1. Thêm hoặc làm mới nguồn: https://raw.githubusercontent.com/HaoDH/vbook-patche/main/extensions/plugin.json
2. Cài **Local AI – Biên tập truyện convert** (metadata version **2**).
3. Trong cài đặt dịch của truyện: nguồn **Việt convert (QT/Hán Việt)**, đích **Tiếng Việt – biên tập**, model **Local (PC qua LAN)**.

Đường dẫn ZIP cố định: https://raw.githubusercontent.com/HaoDH/vbook-patche/main/extensions/convert-editor-local.zip

## 1. Dựng server trên PC

Chọn một trong các cách (tất cả đều là API chuẩn OpenAI):

- **LM Studio:** tab Developer → nạp model (vd Qwen3.5-9B), bật **Start Server** và **"Serve on Local Network"**. Endpoint `http://IP-PC:1234/v1` (port có thể khác, xem log server).
- **llama.cpp:** `llama-server -m <model.gguf> --host 0.0.0.0 --port 8080 -ngl 999 -c 8192 -fa`. Endpoint `http://IP-PC:8080`.
- **Ollama:** đặt `OLLAMA_HOST=0.0.0.0` rồi `ollama run qwen3.5:9b`. Endpoint `http://IP-PC:11434/v1`.

Điểm quan trọng: server phải nghe **0.0.0.0** (không phải 127.0.0.1) thì điện thoại mới gọi được. Lấy IP máy bằng `ipconfig` (dòng IPv4). Mở firewall Windows cho cổng tương ứng:
`New-NetFirewallRule -DisplayName "LocalAI LAN" -Direction Inbound -Protocol TCP -LocalPort 8080 -Action Allow`

Kiểm tra nhanh: trên điện thoại cùng wifi mở trình duyệt vào `http://IP-PC:PORT/v1/models` — ra JSON là thông.

Model gợi ý cho máy có GPU ~10 GB: **Qwen3.5-9B Q4_K_M** (tiếng Việt tự nhiên, bám prompt tốt).

## 2. Cấu hình trong extension

Mở cài đặt extension:

- **Địa chỉ server model (IP:port):** vd `http://192.168.1.10:1234/v1` (LM Studio) hoặc `http://192.168.1.10:8080` (llama.cpp). Với LM Studio/Ollama cần có `/v1`; từ bản 1.0.1 nếu bạn chỉ nhập `IP:port` thì extension tự thêm `/v1`. Nếu server báo "Unexpected endpoint" trong log tức là thiếu `/v1`.
- **ID / tên model:** LM Studio/llama.cpp để trống hoặc `local-model`; Ollama nhập đúng tên (vd `qwen3.5:9b`).
- **Dùng JSON mode:** để **tắt** (llama.cpp/LM Studio thường không theo JSON mode).
- **API key:** để trống (server local không cần).
- **Thời gian chờ mỗi chương:** mặc định 600 giây; tăng nếu model chạy chậm trên CPU.

## Tính năng biên tập

Giống bản nhiều nguồn: gửi **nguyên chương trong một lượt** để AI đủ ngữ cảnh và tự sửa ngắt dòng; lưu toàn chương theo truyện (bảng `edited_chapters`); bộ nhớ tên nhân vật/địa điểm/thuật ngữ theo truyện và **xuất/nhập dùng chung** giữa các truyện; **phong cách theo thể loại** (kiếm hiệp, ngôn tình, cung đấu, huyền huyễn…); **glossary dùng chung** mọi truyện; **tự chia nhỏ** chương khi model trả kết quả bị cắt (context nhỏ), chia đôi rồi biên tập từng nửa trên cùng server. Có chức năng **biên tập khoảng chương A–B**.

Khác bản nhiều nguồn: chỉ một nguồn local, **không có DeepSeek và không fallback**. Lỗi kết nối server sẽ hiện trong Nhật ký (`Local Editor 1.0.1: server …`) thay vì tự dùng nguồn khác.

## Kiểm tra

```text
node --test tests/editor.test.cjs
```

Không phải sản phẩm chính thức của vBook, LM Studio, Ollama hay llama.cpp.
