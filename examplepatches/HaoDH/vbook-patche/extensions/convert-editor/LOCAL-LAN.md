# Dịch bằng model local trên PC qua wifi LAN

Chạy một model AI ngay trên PC, điện thoại cài vBook gọi tới PC qua **cùng mạng wifi**. Hoàn toàn **miễn phí**, **riêng tư** (nội dung không rời khỏi máy bạn), không giới hạn lượt. Bù lại chất lượng và tốc độ phụ thuộc cấu hình PC.

Extension đã có sẵn nguồn **PC local (LAN)** (bản 1.4.5) để làm việc này.

## 1. Chọn model

Khuyến nghị **Qwen3.5-9B** (bản GGUF Q4_K_M, ~5.7 GB): model đa năng, tiếng Việt tự nhiên, bám prompt biên tập tốt. Cần khoảng 6 GB VRAM để chạy nhanh trên GPU; không đủ VRAM thì llama.cpp vẫn chạy được một phần trên CPU nhưng chậm hơn.

Các model dịch chuyên như **Hunyuan-MT** chỉ hợp khi dịch thẳng từ bản Trung gốc, không hợp để biên tập lại bản Việt convert (sẽ không theo đúng định dạng). Cứ dùng Qwen3.5-9B cho luồng biên tập hiện tại.

## 2. Dựng server trên PC

### Cách A — llama.cpp (khuyến nghị nếu bạn đã có)

Mở PowerShell/CMD, chạy `llama-server` với cờ `--host 0.0.0.0` để mở ra LAN (mặc định chỉ nghe `127.0.0.1` thì điện thoại không vào được):

```
llama-server -m F:\LocalAI\models\Qwen3.5-9B\Qwen3.5-9B-Q4_K_M.gguf --host 0.0.0.0 --port 8080 -c 8192
```

- `-c 8192`: độ dài ngữ cảnh. Chương dài cần context lớn; nếu máy đủ RAM/VRAM có thể tăng `-c 16384`. Nếu vẫn bị cắt, extension tự chia đôi chương rồi biên tập từng nửa (bật sẵn ở ô *Tự chia nhỏ khi chương bị cắt*).
- Có GPU NVIDIA: thêm `-ngl 999` để đẩy toàn bộ lớp lên GPU cho nhanh.
- llama.cpp **không theo JSON mode**, nên trong extension **tắt** ô *Dùng JSON mode cho PC local (LAN)* (mặc định đã tắt).

Endpoint sẽ là `http://<IP-PC>:8080`.

### Cách B — Ollama

```
# Windows PowerShell: đặt biến rồi khởi động Ollama
setx OLLAMA_HOST "0.0.0.0:11434"
# đóng và mở lại Ollama, rồi tải/chạy model
ollama run qwen3.5:9b
```

Endpoint OpenAI của Ollama là `http://<IP-PC>:11434/v1` (nhớ có `/v1`). Ollama cần nhập **đúng tên model** (vd `qwen3.5:9b`) vào ô *ID model PC local (LAN)*.

## 3. Lấy địa chỉ IP của PC

Trong CMD gõ `ipconfig`, tìm dòng **IPv4 Address** của card wifi/ethernet đang dùng, ví dụ `192.168.1.10`. Đây là `<IP-PC>`.

## 4. Mở firewall Windows cho cổng

Mặc định Windows chặn kết nối vào. Mở cổng server (8080 cho llama.cpp, 11434 cho Ollama) — chạy **PowerShell với quyền Administrator**:

```
New-NetFirewallRule -DisplayName "LocalAI LAN" -Direction Inbound -Protocol TCP -LocalPort 8080 -Action Allow
```

(Đổi `8080` thành `11434` nếu dùng Ollama.) Hoặc làm thủ công: *Windows Defender Firewall → Advanced → Inbound Rules → New Rule → Port → TCP 8080 → Allow*.

## 5. Cấu hình trong vBook

1. Mở cài đặt extension, ở nguồn model chọn **PC local (LAN) – Ollama/llama.cpp**.
2. Điền các ô:
   - **Địa chỉ PC local (LAN)**: `http://192.168.1.10:8080` (llama.cpp) hoặc `http://192.168.1.10:11434/v1` (Ollama) — thay bằng IP thật của bạn.
   - **ID model PC local (LAN)**: llama.cpp nhập gì cũng được (vd `qwen`); Ollama nhập đúng tên (vd `qwen3.5:9b`).
   - **Dùng JSON mode cho PC local (LAN)**: để **tắt** cho llama.cpp.
   - **API key**: để trống (server local không cần).
   - **Thời gian chờ mỗi chương (giây)**: để trống dùng mặc định 600 giây; tăng nếu model chạy chậm trên CPU.
3. Trong cài đặt dịch của truyện, chọn nguồn **Việt convert (QT/Hán Việt)**, đích **Tiếng Việt – biên tập**, và model **PC local (LAN)**. Tải lại chương.

Mở **Nhật ký** của chương sẽ thấy dòng `Editor 1.4.5: nguồn PC local (LAN) [...]`.

## 6. Lưu ý

- **PC và điện thoại phải cùng một mạng wifi.** Nhiều router có chế độ *AP isolation* chặn thiết bị nói chuyện với nhau — nếu không kết nối được, kiểm tra mục này trong cài đặt router.
- PC phải **bật và chạy server** trong lúc dịch. Tắt máy thì điện thoại báo lỗi kết nối.
- Chậm là do phần cứng, không phải extension. Dùng GPU (`-ngl 999`), bản lượng tử nhỏ hơn, hoặc model nhỏ hơn để nhanh hơn.
- Nếu bật *Tự chuyển sang DeepSeek khi nguồn free lỗi* và có nhập DeepSeek key, khi PC không chạy extension sẽ tự dùng DeepSeek (tính phí). Tắt ô này nếu chỉ muốn chạy local.
- Dữ liệu chạy local **không gửi đi đâu cả**, phù hợp nội dung nhạy cảm.
