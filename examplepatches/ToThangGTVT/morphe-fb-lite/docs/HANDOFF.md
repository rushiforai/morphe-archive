# Ghi chú bàn giao: Facebook Lite (font trong feed, bài được tài trợ)

Tài liệu này dành cho người làm tiếp. Nó ghi lại những gì đã làm, những gì đã kiểm chứng,
những gì **chưa** kiểm chứng, và việc cần làm tiếp. Tất cả tên lớp bị làm rối (`X.0eF`, `X.C0KY`...)
là của **Facebook Lite 530.0.0.8.106** (arm64-v8a, APK từ APKMirror). Mỗi bản app mới, tên sẽ đổi.

## 1. Trạng thái hiện tại

v1.3.0 đã phát hành (thêm "Hide sponsored posts" cho bảng tin). Bản kế tiếp thêm "Morphe settings" (mục 11),
"Video download and auto next reel" (mục 12), bỏ qua quảng cáo trong Reels (mục 8) và sửa cỡ chữ feed (mục 4).

v1.2.0 đã phát hành (thêm "Use system font in feed"). Bản kế tiếp (chưa phát hành) thêm "Hide sponsored posts" (mục 8)
và sửa lỗi icon ô ☒ ở lần mở đầu tiên sau khi cài của v1.2.0 (mục 4, "Lần mở đầu tiên").

| Patch | Làm gì | Đã kiểm chứng |
| --- | --- | --- |
| Use system font | Chặn các file `.ttf/.otf` Meta tải về (`files/Optimistic_*.ttf`, `Instagram*`, `emoji_font.ttf`...) bằng cách thay mỗi file bằng một thư mục cùng tên | Có: vá bằng Morphe Manager, app chạy, không tải được font nào |
| Install beside Meta's apps | Đổi tên 2 permission dùng chung với Facebook/Messenger (`FB_APP_COMMUNICATION`, `receiver.permission.ACCESS`) để hết lỗi `INSTALL_FAILED_DUPLICATE_PERMISSION` | Có: cài được cạnh app khai báo cùng permission khác khoá ký, và trên OPPO có cài Facebook |

**Vấn đề còn lại:** trên OPPO CPH2825 (ColorOS, Android 16, font hệ thống là OPPO Sans),
phần **tin nhắn** dùng OPPO Sans, nhưng **feed vẫn hiện Roboto** (chữ hẹp, chữ `g` khác).
Patch "Use system font" không tác động tới feed. Đã sửa bằng patch mới **"Use system font in feed"** (mục 4), chưa phát hành.

## 2. Những gì đã kiểm chứng

### 2.1. Code chính của app không nằm trong `classes.dex`
- Dex chính chỉ có khoảng 850 lớp (bộ nạp). Phần còn lại nằm trong
  `assets/secondary-program-dex-jars/store-0.dex.spo`, nén bằng **Superpack** (định dạng riêng của Meta).
- Morphe **chỉ sửa được dex chính**. Không patch thẳng được code font/feed.
- File spo được giải nén lúc `ClientApplicationSplittedShell.attachBaseContext()`:
  - Android 10+ (megazip): ghi ra `/data/data/com.facebook.lite/dex/z-<sha>.zip` (chứa `classes.dex` + `classes2.dex`).
  - Android < 10: ghi ra `dex/prog-<hash>.dex`.
- Muốn lấy dex để đọc: dùng máy ảo image **Google APIs** (không phải Google Play) để `adb root`,
  mở app một lần rồi `adb pull /data/data/com.facebook.lite/dex/`.
- Loader chấp nhận dex **không nén**: bỏ dòng `.superpack_extension spo` trong `metadata.txt`, đặt
  `secondary-1.dex`, `secondary-2.dex` vào assets. Hash trong `metadata.txt` không được kiểm tra,
  chỉ dùng để đặt tên file (đổi hash là app tự giải nén lại). Cách này đã chạy (sửa dex trực tiếp, cài bằng
  APKLab), nhưng không đưa vào Morphe được vì phải phát tán dex của Meta.

### 2.2. Font hệ thống trên OPPO
Đã chạy app thử [research/font-test-app](../research/font-test-app) trên OPPO. **Tất cả** cách chọn font đều ra
**OPPO Sans**: TextView mặc định, `Typeface.DEFAULT`, `Typeface.create(DEFAULT, 400/700, false)`,
`create(DEFAULT, BOLD)`, `create("sans-serif")`, và cả `create("roboto")`.
`/system/etc/fonts.xml` trên máy map `sans-serif` → `SysFont-Regular.ttf` cho mọi weight.

**Kết luận:** feed **không** vẽ bằng font hệ thống của Android. Nếu nó dùng bất kỳ API Typeface nào kể trên thì đã ra OPPO Sans.

### 2.3. Không có code nào nạp file Roboto trực tiếp
Trong dex phụ không có chuỗi `/system/fonts`, `Roboto-Regular.ttf`... Các chỗ tạo Typeface từ file chỉ có
`X.0vN` (font Meta tải về, đã chặn) và `createFromAsset("fonts/...")` cho vài TextView.

## 3. Feed vẽ bằng "server font" (đã kiểm chứng)

Facebook Lite kế thừa engine J2ME (`com.moblica.common.xmob`). Server gửi **đường viền vector của từng ký tự**.
App tự vẽ các ký tự đó vào một atlas bitmap rồi `drawBitmap` từng ký tự ra màn hình. Font server gửi trông giống Roboto.

Các lớp liên quan (bản 530.0.0.8.106):

| Lớp | Vai trò |
| --- | --- |
| `X.0KY` (jadx: `C0KY`) | Giải mã dữ liệu font server. Kiểu mã hoá 1/2/3/4/5/6/8. Kiểu 7 = "client side fonts" nhưng ném `IllegalStateException("clientFontCreator cannot be null for client side fonts")` |
| `X.0eE` (`C06230eE`) | Cache ký tự: `A00(char)` → `X.1In` (atlas + rect), gọi rasterizer khi chưa có |
| `X.0eF` (`C06240eF`) | **Rasterizer**: `A03(byte[] glyphData, char c)` vẽ path vector vào atlas, trả `X.1In`. Bên ngoài chỉ dùng constructor `(LX/0e1;Lcom/moblica/common/xmob/ui/WindowManager;IIIIZZZ)V` và `A03([BC)LX/1In;` |
| `X.0e1`, `X.1Ik`, `X.1Im`, `X.1In`, `X.0eG` | Atlas: `0e1.A00` (atlas hiện tại), `0e1.A02` (lock), `1Ik.A01(w,h)` cấp ô, `1Ik.A00().A04` là Canvas của atlas |
| `X.1Ih` (`AbstractC22971Ih`, redex: `TextAreaDrawingHelper`) | Vẽ từng ký tự từ atlas ra màn hình |
| `X.0JP` (`FontCacheManager`), `X.0K5` (`FontFIFOCache`) | Cache font ra đĩa: `/sdcard/Android/data/com.facebook.lite/cache/font/` (file tên số, khoảng 30KB) |

Header dữ liệu ký tự: byte 0 = kiểu, byte 1 = độ rộng (signed). Nếu kiểu 8 thì bỏ 4 byte.
Nếu kiểu 3 hoặc 6 thì tiếp theo là `short` big-endian = chiều cao. Mặc định chiều cao = tham số thứ 3 của constructor.

Bằng chứng ủng hộ: chuỗi `"Error initializing font cache for offline feed items"`, `"Wait for font cache"`.
Khi đăng nhập, app gửi lên server các font đang cache và `pref_key_font_experiment_hash` / `pref_key_new_font_experiment_data`
(lớp `X.0GP`, `X.0JR`): server quyết định gửi font nào.

## 4. Hướng sửa: thay lớp `X.0eF` (class shadowing). **Đã chạy được trên OPPO**

Ý tưởng: đặt một lớp **cùng tên** `X.0eF` vào dex của APK (`classes3.dex`). Nó dùng lại cách cấp ô atlas
nhưng vẽ ký tự bằng `canvas.drawText` với font hệ thống, giữ nguyên kích thước ô server gửi
(nên dàn dòng không đổi). Mã nguồn: [research/glyph-rasterizer/src/X/ZZeF.java](../research/glyph-rasterizer/src/X/ZZeF.java).

Kết quả (OPPO CPH2825, 01/10/2026): chữ trong feed thành **OPPO Sans**, giữ được màu (atlas là mặt nạ alpha, app tô màu lúc vẽ),
icon vẫn đúng, dàn dòng không đổi.

### Thứ tự nạp lớp: phải nạp `X.0eF` sớm
- App cài ClassLoader riêng `X.09K` làm **parent** của PathClassLoader (`ClassLoader.parent` được set bằng reflection).
  Mọi lớp, kể cả lớp trong dex phụ, đều được define vào PathClassLoader (`DexFile.loadClass(name, A04)`).
- `09K.loadClass` chỉ tách tên framework sang parent. Lớp `X.*` đi vào `findClass`, duyệt `A02 = [slot 0, A08 (dex APK), A07, A03 (dex phụ)]`.
- **Nhưng `A02` là danh sách MRU** ("ClassLoaderWithDexPromotion"): tìm thấy lớp ở vị trí > 1 thì dex đó được đẩy lên vị trí 1.
  Dex phụ phục vụ hầu hết các lớp, nên nó nhanh chóng đứng trước dex APK và `X.0eF` gốc thắng.
  Đây là lý do bản thử trên máy ảo và bản thử đầu tiên trên OPPO không có tác dụng (không có probe nào).
- Cách sửa: gọi `Class.forName("X.0eF", false, loader)` ở **đầu `attachBaseContext`**, trước khi `09K` được cài và dex phụ được giải nén.
  Lúc đó chỉ có dex APK nên lớp thay thế được define vào PathClassLoader, các lần tìm sau dùng lại lớp đã nạp.
  Mã: [research/glyph-rasterizer/src/app/fblite/research/Preload.java](../research/glyph-rasterizer/src/app/fblite/research/Preload.java).
  (`getDeclaredMethods()` trong Preload báo `NoClassDefFoundError: X.1In` vì dex phụ chưa có. Lớp vẫn đã được define, không sao.)

### Icon và ký tự font hệ thống không có: dùng lại rasterizer gốc
- Icon là ký tự Private Use (`U+E000`...), kiểu 8, vẽ bằng vector. Vẽ bằng `drawText` sẽ ra ô ☒.
- Có ký tự thường cũng được server gửi thành mã PUA cấp động (ví dụ `ĩ` trong "nghĩ" là `U+E009`).
- Cách làm: ký tự là PUA/surrogate hoặc `!paint.hasGlyph(...)` thì gọi `A03` của `X.0eF` **gốc**. Lớp gốc được nạp lúc chạy từ dex phụ
  đã có trên máy (`09K.A0A.A02`, file `/data/user/0/com.facebook.lite/dex/z-<sha>.zip`) bằng một `PathClassLoader` riêng,
  parent của nó ẩn đúng tên `X.0eF` và chuyển mọi lớp khác về loader của app. Nên lớp gốc dùng chung `X.0e1`, `X.1In`...
  Không phát tán code của Meta.

### Cỡ chữ
- Font server là **Roboto**, em ≈ **0.755 × chiều cao ô** (so độ rộng server gửi với advance của Roboto: trung vị 0.755–0.764,
  dao động 0.73–0.85, đo ở cỡ 48 và 63).
- OPPO Sans ở cùng em có độ rộng trung bình gần bằng Roboto (trung vị 0.75), nhưng lệch từng ký tự. Dùng `textSize = 0.755 × h`,
  chỉ nén ngang ký tự rộng hơn ô, ký tự hẹp hơn thì căn giữa. Bản đầu dùng `0.82 × h` nên gần như ký tự nào cũng bị nén: chữ trông hẹp.
- Ascent/descent của OPPO Sans (928/244 trên 1000) giống Roboto, nên căn giữa theo chiều dọc khớp với ký tự vẽ bằng rasterizer gốc.
- Cờ `bold` = tham số boolean đầu tiên của constructor: đúng (tên trang, tiêu đề in đậm hiển thị đúng).

### Gỡ lỗi không cần logcat (ColorOS ẩn log của app)
- Probe ghi vào `/sdcard/Android/data/com.facebook.lite/cache/fblite-sysfont.txt` (đọc bằng `adb shell cat`): rasterizer được tạo,
  80 ký tự đầu (mã, kiểu, w, h, có chuyển sang bản gốc không), lỗi nạp lớp gốc.
- `cache/fblite-serif` có mặt thì vẽ bằng serif. `cache/fblite-scale` chứa số thực thì thay hệ số 0.755. Đổi xong thì force-stop và mở lại app.

### Patch "Use system font in feed" (đã làm, kiểm chứng trên OPPO 01/10/2026)
- Extension riêng [extensions/feedfont](../extensions/feedfont) (`feedfont.mpe`), để ai chỉ bật "Use system font" thì không có `X.0eF` thay thế trong APK.
  - `X/$0eF.java`: rasterizer thay thế. Java không đặt được tên lớp bắt đầu bằng số, nên mã nguồn dùng `X.$0eF`, `X.$0e1`...
    Task `releaseRenameObfuscatedClasses` trong [build.gradle.kts](../extensions/feedfont/build.gradle.kts) (AGP ScopedArtifacts + ASM `ClassRemapper`)
    bỏ dấu `$` sau `X/` trong tên lớp và mọi tham chiếu, nên `feedfont.mpe` chứa đúng `X.0eF` và tham chiếu `X.0e1`, `X.1In`...
  - `stub/`: stub compileOnly của các lớp atlas và `WindowManager` (không đóng gói). Module con của một extension nên plugin Morphe không biến nó thành extension.
  - `OriginalRasterizer`: nạp `X.0eF` gốc từ dex phụ (xem trên). `FeedFontPatch.loadRasterizer`: preload.
- Patch [UseSystemFontInFeedPatch.kt](../patches/src/main/kotlin/app/fblite/patches/font/UseSystemFontInFeedPatch.kt): gọi `loadRasterizer` ở index 0 của
  `attachBaseContext`. `compatibleWith` chỉ 530.0.0.8.106 (`COMPATIBILITY_FACEBOOK_LITE_530`), vì tên lớp khai cứng.
- Bản phát hành không có probe/serif/scale. Lỗi nạp lớp gốc ghi `Log.e("FbLiteFeedFont", ...)`, và khi có file
  `cache/fblite-feedfont-debug` thì ghi thêm vào `cache/fblite-feedfont.log` (xem được bằng adb trên ColorOS).

### Lần mở đầu tiên sau khi cài (lỗi của v1.2.0, đã sửa)
- Lần mở đầu tiên, app giải nén dex phụ thành `dex/prog-<hash>.dex` (một file mỗi dex, qua `09K.A3X`, file được đặt read-only rồi
  `DexFile.loadDex`). Từ lần sau là `dex/z-<sha>.zip` (megazip). Chọn đường nào phụ thuộc `shared_prefs/primary_dex_features.xml`
  (`C0D7.A05(ctx, 49)`, server gửi về). Không có file đó thì dùng `prog`.
- v1.2.0 trên máy mới cài: icon ô ☒. `OriginalRasterizer` cũ bỏ cuộc vĩnh viễn ở lần nạp thất bại đầu tiên và chỉ bắt `ClassNotFoundException`.
  Nguyên nhân cụ thể chưa tái hiện được (cần xoá dữ liệu app). Nghi nhất: lần nạp đầu chạy lúc file dex còn ghi được (Android 14+ từ chối).
- Sửa: lấy ứng viên từ cả `09K.A02` lẫn thư mục `dex/` (chỉ file read-only), bắt mọi lỗi, thử lại mỗi 2 giây (tối đa 30 lần),
  và khi chưa có bản gốc thì `A03` trả `null` (`X.0eE` không cache `null`, lần vẽ sau hỏi lại) thay vì vẽ ô ☒ rồi bị cache.
- Tái hiện trạng thái `prog` mà không mất đăng nhập: helper `DexReset` (mục 9) xoá `dex/` và `primary_dex_features.xml` lúc khởi động.
  Đã thử: cả `zip` và `prog` đều nạp được bản gốc ở lần thử đầu, icon đúng.

### Việc cần làm tiếp
1. Chưa kiểm tra: chế độ tối của Facebook Lite, Messenger trong app, comment, màn hình ngoài feed; chữ gạch chân (`underline`);
   hiệu năng (mở thêm một `PathClassLoader` trên file zip dex phụ, chỉ một lần mỗi tiến trình); Android < 10 (dex phụ là `prog-<hash>.dex`).
2. Mỗi bản Facebook Lite mới: tìm lại tên `X.0eF`, `X.0e1`, `X.1Ik`, `X.1Im`, `X.1In`, `X.0eG`, `X.0FD`, `X.09K` (field `A0A`, `A02`)
   trong dex phụ (mục 2.1), đổi tên file stub/nguồn và chuỗi trong `FeedFontPatch`/`OriginalRasterizer`, rồi đổi version trong `COMPATIBILITY_FACEBOOK_LITE_530`.
3. Mỗi extension đóng gói nguyên kotlin-stdlib (khoảng 1.100 lớp, 2,2 MB) do AGP 9 tự thêm. Có thể bỏ để APK nhẹ hơn.
4. Hướng khác nếu cần: (a) can thiệp lúc đăng nhập (bitmask khả năng `X.0JT.A09` trong `X.0GP`, hoặc font experiment hash)
   để server gửi kiểu 7 (client font). Rủi ro: gửi dữ liệu lạ lên server. (b) Hook native (LSPlant/Pine). Nặng và dễ vỡ.

## 5. Bẫy đã gặp
- **Morphe inline smali:** `attachBaseContext` có `.locals 31`, nên `p1` là `v32` và `invoke-static {p1}` báo NPE trong
  `InlineSmaliCompiler`. Phải dùng `invoke-static/range { p1 .. p1 }` (đã sửa ở v1.0.1).
- **APK Morphe xuất ra đã có `classes2.dex`.** Đè lên là crash `NoClassDefFoundError: X.0D7`. Dùng `classes3.dex`.
- **Lần đầu thêm nguồn** trong Morphe Manager khi CI chưa phát hành xong thì Manager lưu `patches-bundle.json` rỗng,
  báo "nguồn không tên, thiếu metadata". Xoá nguồn rồi thêm lại.
- **CI:** đẩy commit `feat:`/`fix:` lên `main` là semantic-release tự build `.mpp` và phát hành. Commit `docs:`/`chore:` không phát hành.
  Cần có nhánh `dev` (bước backmerge).
- Bản thử ký bằng debug key khác khoá Morphe Manager, nên phải gỡ app trước khi cài (mất đăng nhập).
  Các bản thử sau cùng ký bằng debug key của uber-apk-signer nên `adb install -r` giữ được đăng nhập.
- Máy ảo image Google Play không root được. Dùng image Google APIs. Image API 37 16k thỉnh thoảng tự tắt.
- Trên máy ảo `ro.debuggable=1` nhưng jdb không attach được vào Facebook Lite (handshake fail).

## 6. Build không cần GitHub token
Plugin Morphe và morphe-patcher nằm trên GitHub Packages (cần `gpr.user`/`gpr.key`). Không có token thì build từ mã nguồn
(`MorpheApp/morphe-patcher` tag `v1.14.1`, `MorpheApp/morphe-patches-gradle-plugin` bản 1.3.4) bằng JDK 21, chép jar + pom vào một repo Maven
thư mục (bỏ bước ký GPG), rồi build với init script đặt repo đó lên đầu `pluginManagement` và `dependencyResolutionManagement`:
```
./gradlew --init-script local-morphe.init.gradle.kts -Pgpr.user=x -Pgpr.key=x buildAndroid
```
Thử trên máy mà không mất đăng nhập: vá bằng `morphe-desktop ... patch --unsigned`, ký bằng uber-apk-signer (debug key), rồi `adb install -r`.

## 7. Dựng lại prototype
```
cd research/glyph-rasterizer
export ANDROID_HOME=~/Library/Android/sdk APKTOOL_JAR=/path/to/apktool_3.0.3.jar
./build.sh
UBER_APK_SIGNER_JAR=/path/to/uber-apk-signer-1.3.0.jar ./make-test-apk.sh /path/to/morphe-patched.apk
adb install -r out/test-aligned-debugSigned.apk   # lần đầu: adb uninstall com.facebook.lite trước
```
`make-test-apk.sh` thêm `classes3.dex` và chèn lệnh gọi `Preload.run(context)` vào đầu `attachBaseContext` trong `classes.dex`.

APK đã vá bằng Morphe lấy từ Morphe Manager (nút Save), hoặc tự vá trên máy tính bằng Morphe Desktop
(`morphe-desktop-*-all.jar` từ MorpheApp/morphe-desktop) với `.mpp` từ trang release của repo này:
```
java -jar morphe-desktop-1.18.0-all.jar patch -p patches-1.1.0.mpp -o morphe-patched.apk fblite.apk
```
APK gốc 530.0.0.8.106 có trên OPPO: `/sdcard/Download/com.facebook.lite_530.0.0.8.106-516601818_minAPI26(arm64-v8a)(nodpi)_apkmirror.com.apk`.

## 8. Patch "Hide sponsored posts" (kiểm chứng trên OPPO 01/10/2026)

### Feed trên client
- "Được tài trợ"/"Sponsored" là chữ server gửi. Code sắp xếp quảng cáo phía client ("CSO", `X.0fK`, `X.0ff`) là code chết, server tự chèn quảng cáo.
- Feed là container có id (`X.0gp.A1b`) **30001**. Một bài **không phải một phần tử con** mà là một dãy con liên tiếp cùng mã nhóm
  `X.0gp.A0v`: vạch ngăn (h=7), header, chữ, ảnh/video, hàng like/bình luận. Trước bài thường có một con h=1 mang metadata `X.0gs.A0K`
  (`X.1HZ`: `A09` = story_category `ORGANIC`/`ENGAGEMENT`, `A0B` = min_gap_index). Trước quảng cáo, con đó không có metadata.
- `fblite_feed.db` (cache feed offline) không lưu quảng cáo, nên không dùng để nhận diện được.
- Server cập nhật feed theo **chỉ số con** (`X.0hC.A04`: 1 = xoá, 2 = chèn, 3–6 = sửa), nên **không được xoá con**.
  Ẩn bằng `X.0gp.A2c` (renderer và hit test bỏ qua) và chiều cao `X.0gp.A0i = 0`. Danh sách feed xếp hàng theo chiều cao nên không để lại khoảng trống.

### Nhận diện không phụ thuộc ngôn ngữ
Header của quảng cáo: `A0v != 0 && X.0gp.A2X && X.0gp.A2k && X.0gs.A0M != null`. Đo trên 3 lần dump feed (125 con, 6 quảng cáo mỗi lần):
khớp đúng mọi header "Được tài trợ", không khớp bài thường nào. `A2X`/`A2k` một mình còn có ở media và ô "Bạn đang nghĩ gì?",
`A0M` một mình còn có ở ô đó và một vạch ngăn, nên phải kết hợp. Ẩn mọi con cùng `A0v` với header đó.
Bài thường chia sẻ lại ảnh chụp một quảng cáo vẫn hiện (đúng, vì đó là nội dung bài thường).

### Cài đặt
- Extension [extensions/hideads](../extensions/hideads) (`hideads.mpe`). `X/$1DY.java` thay `X.1DY` (bộ giải mã props, chỉ có hàm static, cha là Object):
  `A00`/`A01`/`A02` gọi bản gốc (nạp từ dex phụ bằng `OriginalClass`, cùng cách với rasterizer), `A03(BI)Z` tự làm (`(b & (1 << (i % 8))) != 0`, gọi 1121 chỗ).
  Sau `A02`, nếu container là feed hoặc con trực tiếp của feed thì `SponsoredPosts` quét feed và ẩn nhóm quảng cáo.
  Lỗi reflection thì tự tắt việc ẩn, app vẫn chạy. Nạp bản gốc thất bại thì không giải mã được feed (ném lỗi), nên phần nạp phải chắc.
- Patch [HideSponsoredPostsPatch.kt](../patches/src/main/kotlin/app/fblite/patches/ads/HideSponsoredPostsPatch.kt): preload `X.1DY` ở đầu `attachBaseContext`. Chỉ 530.0.0.8.106.
- Bước bỏ `$` dùng chung: [gradle/rename-obfuscated-classes.gradle.kts](../gradle/rename-obfuscated-classes.gradle.kts).
- Lớp thay thế chỉ được kế thừa Object/framework và không implement interface trong dex phụ, vì lúc preload dex phụ chưa có.

### Mỗi bản app mới
Tìm lại `X.1DY` (chuỗi đặc trưng: lớp abstract chỉ có `A00(0gn,0Fu,I)`, `A01(1Hr,0Fu,IZ)`, `A02(0gs,0Fu,IZ)`, `A03(BI)Z`), tên field
trong `SponsoredPosts` và id 30001, rồi chạy công cụ trace (mục 9) để kiểm tra lại quy tắc nhận diện.

## 9. Công cụ nghiên cứu
- [research/app-helpers](../research/app-helpers): các lớp gắn vào đầu `attachBaseContext` của bản thử (classes3.dex):
  `DexDump` (chép `dex/` ra `Android/data/.../cache/dexdump` để `adb pull`, tức là lấy dex phụ trên máy không root),
  `DexReset` (có `cache/fblite-reset-dex` thì xoá `dex/` và `primary_dex_features.xml`, tái hiện lần mở đầu mà không mất đăng nhập),
  `DbDump` (có `cache/fblite-dbdump` thì chép `databases/`), `FallbackProbe`/`PreloadProbe` (kiểm tra lớp nào thắng).
- [research/feed-ads](../research/feed-ads): trace `X.1DY`. Ghi `cache/fblite-ads.txt`. Tạo `cache/fblite-dump-feed` để dump mọi con của feed
  (id, y, h, nhóm, metadata, cờ, chữ), `cache/fblite-hide-ads` (có từ lúc mở app) để thử ẩn.
- Dex phụ đã giải nén giải ngược bằng jadx 1.5.x được (khoảng 12.600 lớp). `dexdump -d` cho các hàm jadx không giải được.

## 10. Thống kê chạy nền (đã nghiên cứu, chưa làm patch)
- 5 trong 8 thành phần thống kê trong manifest là khai báo thừa (lớp `analytics2.logger.legacy.uploader.*` không có trong dex nào,
  `LollipopUploadSafeService` rỗng).
- Chỉ đặt `android:enabled="false"` thì AppComponentManager (`X.07b`) bật lại ở lần mở đầu sau khi cài, trừ khi thêm
  `<meta-data android:name="default-state" android:value="false"/>`.
- `BackgroundAnalyticsUploadJobService`: app gọi `JobScheduler.schedule` (`X.0f2`) trên luồng chính, không bắt lỗi, nên tắt trong manifest sẽ crash
  (khi cờ server `4611708383937757184L` bật).
- Phần lớn thống kê đi qua kết nối chính tới server và gửi HTTP thẳng (`graph.facebook.com/logging_client_events`, `X.0f2.Ada`),
  không qua các thành phần này. Tắt chúng chỉ bớt việc thức dậy chạy nền.

## 11. Patch "Morphe settings" và cỡ chữ
- Màn hình cài đặt riêng `app.fblite.extension.settings.SettingsActivity` (dựng bằng code, theme Material sáng/tối theo hệ thống,
  tự chừa chỗ cho thanh hệ thống vì app target SDK 36 nên bị edge-to-edge). Mở bằng **nhấn giữ icon app** (static shortcut khai trong
  manifest của `MainActivity`, `res/xml/morphe_shortcuts.xml`). Menu "Cài đặt" của Facebook do server vẽ nên không chèn mục được.
- Lưu ở `shared_prefs/morphe_fblite_settings.xml`. Các extension khác đọc theo tên khoá (`MorpheSettings.VIDEO_DOWNLOAD`, `AUTO_NEXT_REEL`).
- **Cỡ chữ:** app gửi `fontScale` của application context lên server khi kết nối (`X.0JR`: `c0jt3.A03 = 09E.A01().getResources()...fontScale`),
  server dàn bố cục theo nó (thử bằng `settings put system font_scale 1.3`: chữ feed to ra, bố cục đúng). Nên patch bọc base context ở
  đầu `attachBaseContext` bằng `createConfigurationContext(fontScale = hệ thống × slider)`. Slider 80–150%, bước 1%, áp dụng khi mở lại app
  (nút "Áp dụng và mở lại" khởi động lại tiến trình).

## 4b. Cỡ chữ feed theo font của từng máy (sửa sau v1.3.0)
- Ô ký tự là độ rộng Roboto và **không nới được**: app đo chữ bằng `data[1]` (`X.0KY.A03`, kiểu 2 không có side bearing) và
  `X.1Ih.A00` co giãn ô atlas vào đúng ô đích. Font hệ thống rộng hơn Roboto thì phải ép ngang hoặc vẽ nhỏ lại.
- Nay `emPerBoxHeight()` tự đo: so `Typeface.DEFAULT` với `/system/fonts/Roboto-Regular.ttf` trên một câu mẫu Việt/Anh, lấy mức
  20% của tỉ lệ (80% ký tự vừa ô không ép). OPPO Sans: tỉ lệ 0,964, em 0,728. Máy dùng Roboto: giữ 0,755. Không có Roboto: giữ 0,755.
- Ký tự cần ép quá 20% (ví dụ `[ ]` của OPPO Sans: 0,7) hoặc ký hiệu rơi vào font emoji màu (`™ ® ©`, phát hiện bằng vẽ thử vào bitmap
  ARGB và tìm điểm ảnh có màu) thì dùng nét gốc của server.
- Kiểu 3/6 là ô cắt: `[2..3]` cao, `[4..5]` dịch dọc, `[6]`/`[7]` side bearing; vẽ theo toạ độ ô đầy đủ rồi dịch vào ô cắt.
  Chưa thấy feed dùng hai kiểu này.

## 12. Patch "Video download and auto next reel" (extension `extension`, gói `app.fblite.extension.video`)
- Mọi video (feed, Reels, toàn màn hình) là view gốc `com.facebook.lite.widget.video.FbVideoView` trong `MainActivity`
  (Reels: `X.1Kt` FBInlineVideoView trong `X.0zb` dọc, snap). `VideoFeatures` đăng ký ActivityLifecycleCallbacks, quét cửa sổ mỗi 500 ms.
  Field đọc từ đúng lớp `FbVideoView` vì `X.1Kt` có field trùng tên (`A0I`, `A0G`).
- **Tải video (đã thử trên OPPO):** nút nổi ở mép phải video đang phát (`A0G` là `MediaController.MediaPlayerControl`, `isPlaying()`).
  Link: `FBFullScreenVideoView.A05.A0G`, nếu không có thì `FbVideoView.A0F.A0c` (MP4 tải thẳng, ký sẵn, không cần cookie). Bỏ qua video live
  (`A0m`). Tải bằng `DownloadManager` vào `Movies/Facebook Lite/<videoId>.mp4`. API < 29 xin `WRITE_EXTERNAL_STORAGE`. Bản SD;
  HD nằm trong DASH (`A0F.A0Y`), cần ghép hình và tiếng (chưa làm).
- **Tự chuyển reel (CHƯA thử trên máy):** reel lặp lại phía client; khi hết, `FbVideoView` báo observer `X.1cF.AYK()` qua danh sách
  `X.1zU` (`FbVideoView.A0I`, `A02(X.1cF)` để đăng ký, giữ yếu nên phải giữ proxy). `AutoNextReel` gắn một `java.lang.reflect.Proxy`;
  khi `AYK` và reel nằm trong `X.0zb` dọc có snap, cao ≥ 80% pager: `next = X.0yb.A00(snap.A04, current + 1, 1)` rồi
  `pager.A08.A04(next)` (đúng lệnh mà vuốt gọi, có báo server). Server cũng có tính năng tự cuộn riêng (`video_autoscroll_*` trong
  VideoExtraConfig) nhưng chỉ chạy khi server gửi action id.
- Nghiên cứu: [research/reels-trace](../research/reels-trace) (cây view, video, pager, sự kiện observer, dump mục Reels).

## 8b. Quảng cáo trong Reels
- Mỗi mục `X.0z8` của pager Reels giữ cây component ở `A0B.A03`. Reel quảng cáo có **≥ 2 text component `X.0hW` mang cờ `X.0gp.A32`**,
  reel thường ≤ 1 (khoảng 9 quảng cáo và 60 reel thường trên một tài khoản ở Việt Nam, không nhầm; reel gắn link Shopee là reel thường).
- `SponsoredReels` (extension `hideads`, cài từ cùng patch "Hide sponsored posts") đặt `X.0z8.A0N = false` và `X.0gp.A2z = false`
  (không dừng lại khi vuốt, `X.0yb.A00` bỏ qua), cho cả danh sách của layout và của snap handler; nếu reel hiện tại là quảng cáo thì
  chuyển sang mục kế tiếp. Không xoá mục (danh sách cập nhật theo chỉ số).
- Log gỡ lỗi khi có `cache/fblite-hideads-debug`.

