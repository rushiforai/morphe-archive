# TADa Patches Setup & Development Guide

Đây là tài liệu hướng dẫn nhanh để quản lý, build và phát triển thêm các bản patch mới cho TADa Patches. TADa Patches là một bản fork từ TADa Patches và tuân thủ chặt chẽ giấy phép GPLv3.

## 1. Cách Build Bundle

Để tự build patch bundle từ source code (bao gồm file `patches.jar` và `patches-bundle.json`), hãy thực hiện các bước sau:

1. Đảm bảo bạn đã cài đặt Java 17.
2. Cần cấu hình `local.properties` với `sdk.dir` trỏ tới đường dẫn Android SDK của bạn.
3. Trong thư mục gốc của project (tada-patches), chạy lệnh:
   ```bash
   ./gradlew build
   ```
4. Nếu yêu cầu token GitHub Packages để tải dependencies của patcher framework (như `app.tada.patches` plugin), bạn cần set biến môi trường:
   ```bash
   export GITHUB_TOKEN=your_personal_access_token
   export GITHUB_ACTOR=your_github_username
   ./gradlew build
   ```
5. File đầu ra sẽ được tạo, đặc biệt là các file quan trọng cần thiết cho Manager như `patches-bundle.json`, `patches-list.json`.

## 2. Cách Publish Release

Để TADa Manager tải được bản cập nhật tự động, bạn cần publish các file đã build lên GitHub Releases:

1. Push mã nguồn lên repository `nobianh78/tada-patches`.
2. Tạo một GitHub Release mới (draft).
3. Đính kèm các file được sinh ra từ quá trình build (ít nhất là `patches-bundle.json` và file `.jar` tương ứng).
4. Publish release (đánh tag version ví dụ: `v1.47.0`).
5. (Lưu ý: Bạn cũng có thể tận dụng GitHub Actions đã có sẵn trong folder `.github/workflows/release.yml` để build và publish tự động mỗi khi đẩy tag mới).

## 3. Cách Thêm Patch Mới

TADa Patches (thừa kế kiến trúc từ TADa/ReVanced) cho phép bạn mở rộng bằng cách thêm patch mới cho các ứng dụng:

1. Xác định thư mục extension của ứng dụng mục tiêu (ví dụ: `extensions/youtube` hoặc `extensions/reddit`).
2. Tìm đến vị trí đặt source code của patch (ví dụ: `src/main/kotlin/app/tada/patches/...`).
3. Tạo một file `.kt` mới, khai báo class thừa kế framework `BytecodePatch`.
4. Gắn Annotation `@Patch(...)`:
   ```kotlin
   @Patch(
       name = "My Custom Patch",
       description = "Mô tả tính năng của patch mới cho TADa.",
       dependencies = [...]
   )
   class MyCustomPatch : BytecodePatch() {
       override fun execute(context: PatchContext) {
           // Thực hiện bytecode manipulation tại đây
       }
   }
   ```
5. Viết thêm `Fingerprint` (nhận dạng method/class trong file smali) tương ứng nếu cần.
6. Build lại project để công cụ tự động sinh lại file `patches-list.json` bao gồm patch mới của bạn.

Để cắm thêm tính năng/patch cho **một ứng dụng hoàn toàn mới** (không phải YouTube/Music/Reddit):
- Bạn cần tạo một Gradle module mới trong `extensions/` tương tự như `extensions/reddit`.
- Đăng ký package name của ứng dụng mới vào trong code `KnownApps.kt` của TADa Manager.

## 4. Checklist Tuân Thủ Giấy Phép GPLv3 & Quy định Rebrand

TADa Patches phải tuân thủ các quy định nghiêm ngặt từ GPLv3 (Section 7) dựa trên yêu cầu từ nguyên bản:

- [ ] **Giữ nguyên Copyright/License Headers:** Tuyệt đối không xóa hoặc thay đổi các header bản quyền (VD: `Copyright 2026 TADa.`) ở đầu các file source code.
- [ ] **Giữ nguyên các file `LICENSE` và `NOTICE`:** Các file này phải được giữ nguyên vẹn ở thư mục gốc.
- [ ] **Tôn trọng Name & Branding Restrictions (GPLv3 7c & 7e):** Bản thân tên gọi "TADa", "TADa Plus", v.v. không được dùng để đặt tên cho app/bundle của bạn. Ở đây chúng ta đã rebrand thành "TADa" để hợp lệ.
- [ ] **Attribution (Ghi nhận tác giả gốc):** `README.md` của repo này phải ghi rõ TADa Patches là một bản fork từ TADa Patches và để link trỏ về repo gốc.
- [ ] **Sửa đổi chuỗi hiển thị:** Chỉ chỉnh sửa (rebrand) các chuỗi văn bản (display strings) mà người dùng cuối nhìn thấy (thay từ "TADa" thành "TADa") để giữ cho app mang thương hiệu của bạn, nhưng KHÔNG sửa tên class, tên biến nội bộ hay package names của core logic để tránh lỗi tương thích.
- [ ] **Mã nguồn mở:** Các bản phát hành public của TADa Patches phải đi kèm với toàn bộ mã nguồn theo giấy phép tương đương.
