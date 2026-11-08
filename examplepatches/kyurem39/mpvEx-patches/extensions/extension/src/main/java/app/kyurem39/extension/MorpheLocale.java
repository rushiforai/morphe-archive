package app.kyurem39.extension;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.widget.Toast;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Applies the language selected in the Morphe settings to an activity.
 *
 * <p>{@code applyOverrideConfiguration} is used instead of replacing the base context, because the
 * override keeps the theme the activity was created with. Should it be refused (it can only be
 * called before the activity touches its resources), the resources are updated in place instead,
 * which still localizes everything that is read after this point.
 *
 * <p>This class is called from injected {@code onCreate} methods, so it is written in Java to stay
 * independent of the app's shrunk Kotlin runtime.
 */
public final class MorpheLocale {
    private static final Map<String, String> TRANSLATIONS = new HashMap<>(845);

    private static final Pattern PATTERN_COLUMNS = Pattern.compile("^(\\d+)\\s+columns$");
    private static final Pattern PATTERN_ITEMS = Pattern.compile("^(\\d+)\\s+items$");
    private static final Pattern PATTERN_VIDEOS = Pattern.compile("^(\\d+)\\s+[Vv]ideos?$");
    private static final Pattern PATTERN_PLAYLISTS = Pattern.compile("^(\\d+)\\s+[Pp]laylists?$");
    private static final Pattern PATTERN_DELETE_ITEMS = Pattern.compile("^Delete\\s+(\\d+)\\s+(video|videos|folder|folders|playlist|playlists)\\?$");
    private static final Pattern PATTERN_REMOVE_RECENTS = Pattern.compile("^Remove\\s+(\\d+)\\s+(video|videos|playlist|playlists)\\s+from\\s+history\\?$");
    private static final Pattern PATTERN_REMOVE_PLAYLIST = Pattern.compile("^Remove\\s+(\\d+)\\s+(video|videos)\\s+from\\s+playlist\\?$");
    private static final Pattern PATTERN_FILE_INDEX = Pattern.compile("^File\\s+(\\d+)\\s+of\\s+(\\d+)$");
    private static final Pattern PATTERN_BYTES_PROGRESS = Pattern.compile("^(.+)\\s+of\\s+(.+\\s*(?:B|KB|MB|GB|TB))$");
    private static final Pattern PATTERN_ADDING_VIDEOS = Pattern.compile("^Adding\\s+(\\d+)\\s+videos?\\s+to\\s+playlist$");
    private static final Pattern PATTERN_VIDEOS_ADDED = Pattern.compile("^(\\d+)\\s+videos?\\s+added\\s+to\\s+\"(.+)\"$");
    private static final Pattern PATTERN_VIDEO_ADDED = Pattern.compile("^Video\\s+added\\s+to\\s+\"(.+)\"$");
    private static final Pattern PATTERN_SPEED_PLAYING = Pattern.compile("^(.+)x\\s+Speed\\s+Playing$");
    private static final Pattern PATTERN_CUSTOM_SECONDS = Pattern.compile("^Custom\\s*\\((.+)\\)$");
    private static final Pattern PATTERN_ONLINE_RESULTS = Pattern.compile("^Online\\s+Results\\s+\\((\\d+)\\)$");
    private static final Pattern PATTERN_SEASON = Pattern.compile("^Season\\s+(\\d+)$");
    private static final Pattern PATTERN_EPISODE = Pattern.compile("^Ep\\s+(\\d+)$");

    private static volatile Context appContext;

    static {
        initTranslationsPart1();
        initTranslationsPart2();
        initTranslationsPart3();
        initTranslationsPart4();
        initTranslationsPart5();
        initTranslationsPart6();
        initTranslationsPart7();
        initTranslationsPart8();
        initTranslationsPart9();
        initTranslationsPart10();
    }

    private static void initTranslationsPart1() {
        TRANSLATIONS.put("1 Playlist", "1 danh sách phát");
        TRANSLATIONS.put("1 Video", "1 video");
        TRANSLATIONS.put("A", "A");
        TRANSLATIONS.put("A new rendering backend", "Một công cụ kết xuất thử nghiệm mới");
        TRANSLATIONS.put("A+", "A+");
        TRANSLATIONS.put("A-Z", "A-Z");
        TRANSLATIONS.put("AB Loop", "Lặp đoạn A-B");
        TRANSLATIONS.put("ALLOW ACCESS", "CHO PHÉP TRUY CẬP");
        TRANSLATIONS.put("AMOLED Black Mode", "Chế độ đen AMOLED");
        TRANSLATIONS.put("About", "Giới thiệu");
        TRANSLATIONS.put("Acknowledgments, licenses", "Thông tin nhà phát triển, nguồn mở, bản quyền");
        TRANSLATIONS.put("Add", "Thêm");
        TRANSLATIONS.put("Add Connection", "Thêm kết nối");
        TRANSLATIONS.put("Add Custom Ratio (e.g. 16:9)", "Thêm tỷ lệ tự chọn (VD: 16:9)");
        TRANSLATIONS.put("Add Folder to Blacklist", "Thêm thư mục cần ẩn");
        TRANSLATIONS.put("Add M3U Playlist", "Thêm danh sách phát M3U");
        TRANSLATIONS.put("Add M3U Playlist from URL", "Thêm danh sách phát M3U từ liên kết");
        TRANSLATIONS.put("Add SMB, FTP, or WebDAV connections to browse network files", "Thêm kết nối SMB, FTP hoặc WebDAV để duyệt các tệp trên mạng");
        TRANSLATIONS.put("Add connection", "Thêm kết nối mạng mới");
        TRANSLATIONS.put("Add external audio tracks", "Thêm âm thanh ngoài");
        TRANSLATIONS.put("Add external subtitles", "Thêm phụ đề ngoài");
        TRANSLATIONS.put("Add from M3U/M3U8 URL", "Liên kết danh sách qua link URL");
        TRANSLATIONS.put("Add from URL", "Thêm từ liên kết URL");
        TRANSLATIONS.put("Add some video files to your device to see them here", "Thêm tệp video vào thiết bị để hiển thị tại đây");
        TRANSLATIONS.put("Add to Playlist", "Thêm vào danh sách phát");
        TRANSLATIONS.put("Add videos to get started", "Thêm video để bắt đầu");
        TRANSLATIONS.put("Adding 1 video to playlist", "Thêm 1 video vào danh sách phát");
        TRANSLATIONS.put("Adjust how much distance is covered per swipe", "Điều chỉnh quãng thời gian nhảy cho mỗi lần vuốt");
        TRANSLATIONS.put("Advanced", "Nâng cao");
        TRANSLATIONS.put("Advanced & About", "Nâng cao & Giới thiệu");
        TRANSLATIONS.put("Advanced Search Filters", "Bộ lọc tìm kiếm nâng cao");
        TRANSLATIONS.put("kyurem39's patches", "Bản vá kyurem39");
        TRANSLATIONS.put("Patches settings", "Cài đặt bản vá");
        TRANSLATIONS.put("All", "Tất cả");
        TRANSLATIONS.put("All (Selective Filtering)", "Tất cả (Lọc có chọn lọc)");
        TRANSLATIONS.put("All available buttons are in use.", "Tất cả các nút khả dụng đang được sử dụng.");
        TRANSLATIONS.put("All customized player control layouts will be reset to default positions", "Tất cả bố cục nút tùy chỉnh sẽ được đặt lại về vị trí mặc định ban đầu");
        TRANSLATIONS.put("Allow gestures in panels", "Cho phép cử chỉ khi đang mở các bảng cài đặt");
        TRANSLATIONS.put("Alpha", "Độ trong suốt (Alpha)");
        TRANSLATIONS.put("Already using latest version", "Đang sử dụng phiên bản mới nhất");
        TRANSLATIONS.put("Also delete original file(s)", "Đồng thời xóa (các) tệp gốc");
        TRANSLATIONS.put("Amber", "Hổ phách");
        TRANSLATIONS.put("Analyzing media file...", "Đang phân tích tệp phương tiện...");
        TRANSLATIONS.put("Anime4K Incompatibility", "Sự không tương thích Anime4K");
        TRANSLATIONS.put("Anime4K Presets", "Cấu hình sẵn Anime4K");
        TRANSLATIONS.put("Anime4K Variants", "Chế độ Anime4K");
        TRANSLATIONS.put("Anime4K upscaling (Experimental)", "Bộ lọc làm nét Anime4K (Thử nghiệm)");
        TRANSLATIONS.put("Anonymous/Guest Access", "Truy cập ẩn danh/Khách");
        TRANSLATIONS.put("Anonymous/Guest access", "Truy cập ẩn danh dạng Khách");
        TRANSLATIONS.put("App Theme", "Chủ đề ứng dụng");
        TRANSLATIONS.put("Appearance", "Giao diện");
        TRANSLATIONS.put("Are you sure you want to clear your playback history?", "Bạn chắc chắn muốn xóa lịch sử phát?");
        TRANSLATIONS.put("Are you sure you want to delete all downloaded subtitles? This action cannot be undone.", "Bạn có chắc chắn muốn xóa tất cả phụ đề đã tải xuống không? Thao tác này không thể hoàn tác.");
        TRANSLATIONS.put("Asc", "Tăng dần");
        TRANSLATIONS.put("Aspect Ratio", "Tỷ lệ khung hình");
        TRANSLATIONS.put("Audio", "Âm thanh");
        TRANSLATIONS.put("Audio channels", "Kênh đầu ra âm thanh");
        TRANSLATIONS.put("Audio delay", "Độ lệch âm thanh");
        TRANSLATIONS.put("Audio language(s) to be selected by default on a video with multiple audio streams, Two- or three-letter languages codes work. Multiple values can be delimited by comma.", "Mã ngôn ngữ âm thanh ưu tiên mặc định (Ví dụ: eng, jpn, vie). Hỗ trợ mã 2 hoặc 3 ký tự, cách nhau bằng dấu phẩy.");
        TRANSLATIONS.put("Audio track added", "Đã thêm thành công đường âm thanh");
        TRANSLATIONS.put("Auto", "Tự động");
        TRANSLATIONS.put("Auto Check for Updates", "Tự động kiểm tra cập nhật");
        TRANSLATIONS.put("Auto Detect", "Tự động nhận diện");
        TRANSLATIONS.put("Auto Picture-in-Picture", "Tự động bật Hình trong hình (PiP)");
        TRANSLATIONS.put("Auto Safe", "Tự động (An toàn)");
        TRANSLATIONS.put("Auto picture-in-picture", "Tự động bật hình-trong-hình");
        TRANSLATIONS.put("Auto selection", "Tự động nhận diện");
        TRANSLATIONS.put("Auto-scroll to last played", "Tự động cuộn đến video vừa xem");
        TRANSLATIONS.put("Automatically adjust audio volume to maintain consistent loudness levels", "Tự động điều chỉnh âm lượng để tránh âm lượng thay đổi đột ngột giữa các cảnh");
        TRANSLATIONS.put("Automatically enter PIP mode when pressing home or back", "Tự động vào chế độ PiP khi nhấn nút Home hoặc quay lại");
        TRANSLATIONS.put("Automatically load external subtitles with the same name.", "Tự động tìm và tải các tệp phụ đề ngoài có cùng tên với video.");
        TRANSLATIONS.put("Automatically load subtitles", "Tự động tải phụ đề");
        TRANSLATIONS.put("Automatically play next video when current ends", "Tự động phát video tiếp theo khi video hiện tại kết thúc");
        TRANSLATIONS.put("Automatically scroll to the last played video when opening video lists", "Tự động cuộn đến video được phát gần nhất khi mở danh sách video");
        TRANSLATIONS.put("Autoplay next video", "Tự động phát tiếp");
        TRANSLATIONS.put("Available", "Có sẵn trong máy");
        TRANSLATIONS.put("B", "B");
        TRANSLATIONS.put("B+", "B+");
        TRANSLATIONS.put("Back", "Quay lại");
        TRANSLATIONS.put("Background", "Màu nền");
        TRANSLATIONS.put("Background playback", "Phát video chạy nền");
        TRANSLATIONS.put("Backup & Restore", "Sao lưu & Khôi phục");
    }

    private static void initTranslationsPart2() {
        TRANSLATIONS.put("Balanced", "Cân bằng");
        TRANSLATIONS.put("Be rest assured, your privacy is our utmost priority, and we neither access your files for other purposes nor transfer or store them to our servers. They remain safe on your device.", "Hãy yên tâm, quyền riêng tư của bạn là ưu tiên hàng đầu của chúng tôi, và chúng tôi không truy cập tệp của bạn cho mục đích khác cũng như không chuyển hoặc lưu trữ chúng trên máy chủ của chúng tôi. Chúng vẫn an toàn trên thiết bị của bạn.");
        TRANSLATIONS.put("Biggest", "Lớn nhất");
        TRANSLATIONS.put("Blacklist", "Danh sách thư mục ẩn");
        TRANSLATIONS.put("Blue", "Xanh dương");
        TRANSLATIONS.put("Border", "Màu viền");
        TRANSLATIONS.put("Border size", "Kích thước viền chữ");
        TRANSLATIONS.put("Border style", "Kiểu viền chữ");
        TRANSLATIONS.put("Both", "Cả hai phụ đề");
        TRANSLATIONS.put("Bottom Left Controls", "Nút góc dưới bên trái");
        TRANSLATIONS.put("Bottom Overlay", "Hiện đè phía dưới");
        TRANSLATIONS.put("Bottom Right Controls", "Nút góc dưới bên phải");
        TRANSLATIONS.put("Brightness", "Độ sáng");
        TRANSLATIONS.put("Brightness gestures", "Cử chỉ điều chỉnh độ sáng");
        TRANSLATIONS.put("Browse", "Duyệt");
        TRANSLATIONS.put("C", "C");
        TRANSLATIONS.put("C+", "C+");
        TRANSLATIONS.put("CPU", "Dùng CPU");
        TRANSLATIONS.put("Cache", "Bộ nhớ đệm");
        TRANSLATIONS.put("Cache status. Buffer health, demuxer cache, seekable ranges.", "Trạng thái cache. Dung lượng lưu trữ tạm thời, cache của demuxer, khoảng thời gian tua nhanh.");
        TRANSLATIONS.put("Cancel", "Hủy");
        TRANSLATIONS.put("Cannot select the same folder", "Không thể chọn trùng thư mục");
        TRANSLATIONS.put("Cannot use Anime4K when gpu-next is enabled", "Không thể dùng Anime4K khi đang bật gpu-next");
        TRANSLATIONS.put("Catppuccin", "Catppuccin");
        TRANSLATIONS.put("Changing language…", "Đang thay đổi ngôn ngữ…");
        TRANSLATIONS.put("Check for Updates Now", "Kiểm tra cập nhật ngay");
        TRANSLATIONS.put("Check for updates now", "Tìm bản cập nhật mới ngay");
        TRANSLATIONS.put("Check on startup", "Kiểm tra khi khởi động");
        TRANSLATIONS.put("Choose Local M3U File", "Chọn tệp danh sách phát M3U cục bộ");
        TRANSLATIONS.put("Choose local M3U file", "Chọn tệp danh sách M3U trong máy");
        TRANSLATIONS.put("Clear", "Xóa");
        TRANSLATIONS.put("Clear Loop", "Xóa lặp");
        TRANSLATIONS.put("Clear Subtitle Downloads", "Xóa phụ đề đã tải");
        TRANSLATIONS.put("Clear all blacklisted folders", "Hiện lại toàn bộ các thư mục đã ẩn");
        TRANSLATIONS.put("Clear all blacklisted folders?", "Hiện lại tất cả thư mục?");
        TRANSLATIONS.put("Clear cached fonts", "Xóa cache phông chữ");
        TRANSLATIONS.put("Clear config cache", "Xóa cache cấu hình");
        TRANSLATIONS.put("Clear font directory", "Làm trống thư mục phông chữ");
        TRANSLATIONS.put("Clear playback history", "Xóa lịch sử đã phát");
        TRANSLATIONS.put("Clear the cached mpv.conf settings", "Xóa các cài đặt mpv.conf đã lưu tạm");
        TRANSLATIONS.put("Clear thumbnail cache", "Xóa cache hình ảnh nhỏ");
        TRANSLATIONS.put("Clear thumbnail cache?", "Xóa bộ nhớ đệm hình thu nhỏ?");
        TRANSLATIONS.put("Cleared cached fonts", "Đã xóa bộ nhớ đệm phông chữ");
        TRANSLATIONS.put("Cleared playback history", "Đã xóa sạch lịch sử phát");
        TRANSLATIONS.put("Close", "Đóng");
        TRANSLATIONS.put("Close after the end of playback", "Tắt trình phát sau khi phát hết video");
        TRANSLATIONS.put("Cloudflare", "Cloudflare");
        TRANSLATIONS.put("Collapse", "Thu gọn");
        TRANSLATIONS.put("Colors", "Tông màu phụ đề");
        TRANSLATIONS.put("Config cache cleared", "Đã xóa bộ nhớ đệm cấu hình");
        TRANSLATIONS.put("Configuration location, mpv.conf", "Nơi lưu cấu hình, chỉnh sửa tệp cấu hình");
        TRANSLATIONS.put("Confirm", "Xác nhận");
        TRANSLATIONS.put("Connect", "Kết nối");
        TRANSLATIONS.put("Connect automatically on app launch", "Tự động kết nối khi khởi động ứng dụng");
        TRANSLATIONS.put("Connecting", "Đang kết nối");
        TRANSLATIONS.put("Contrast", "Độ tương phản");
        TRANSLATIONS.put("Controls", "Bảng điều khiển");
        TRANSLATIONS.put("Copied to clipboard", "Đã sao chép vào khay nhớ tạm");
        TRANSLATIONS.put("Copy", "Sao chép");
        TRANSLATIONS.put("Copying", "Đang sao chép");
        TRANSLATIONS.put("Coral", "San hô");
        TRANSLATIONS.put("Cotton Candy", "Kẹo bông");
        TRANSLATIONS.put("Crash logs:", "Nhật ký chi tiết lỗi:");
        TRANSLATIONS.put("Count", "Số lượng");
        TRANSLATIONS.put("Create", "Tạo");
        TRANSLATIONS.put("Create Empty Playlist", "Tạo danh sách phát trống");
        TRANSLATIONS.put("Create New Folder", "Tạo thư mục mới");
        TRANSLATIONS.put("Create Playlist", "Tạo danh sách phát");
        TRANSLATIONS.put("Create a new blank playlist", "Tạo một danh sách phát trống mới");
        TRANSLATIONS.put("Create a playlist or add one from an m3u URL", "Tạo danh sách phát mới hoặc liên kết từ link URL M3U");
        TRANSLATIONS.put("Create empty playlist", "Tạo danh sách phát rỗng");
        TRANSLATIONS.put("Create folder", "Tạo thư mục");
        TRANSLATIONS.put("Create playlist", "Tạo mới danh sách phát");
        TRANSLATIONS.put("Create your first playlist above", "Tạo danh sách phát đầu tiên ở trên");
        TRANSLATIONS.put("Crop", "Cắt để lấp đầy");
        TRANSLATIONS.put("Current file", "Tệp hiện tại");
        TRANSLATIONS.put("Current keybindings. List of mapped keyboard shortcuts.", "Phím bấm hiện hành. Tổng hợp phím tắt đang hoạt động.");
        TRANSLATIONS.put("Custom", "Tự chọn");
        TRANSLATIONS.put("Custom Lua Buttons", "Nút bấm Lua tùy chỉnh");
        TRANSLATIONS.put("Custom skip duration", "Thời gian bỏ qua tùy chỉnh");
        TRANSLATIONS.put("Customize player button layout", "Tùy chỉnh vị trí nút trên giao diện trình phát");
    }

    private static void initTranslationsPart3() {
        TRANSLATIONS.put("Dark", "Tối");
        TRANSLATIONS.put("Dark mode, Material You", "Chế độ tối, màu động Material You");
        TRANSLATIONS.put("Database deleted successfully. Please restart the app.", "Đã xóa tệp dữ liệu ứng dụng thành công. Vui lòng mở lại ứng dụng.");
        TRANSLATIONS.put("Date", "Ngày");
        TRANSLATIONS.put("Days threshold for new video label", "Thời gian giới hạn nhãn video mới");
        TRANSLATIONS.put("Deband", "Khử sọc màu (Deband)");
        TRANSLATIONS.put("Debanding", "Khử sọc màu (Debanding)");
        TRANSLATIONS.put("Decoder", "Bộ giải mã");
        TRANSLATIONS.put("Decrease zoom", "Thu nhỏ");
        TRANSLATIONS.put("Default", "Mặc định");
        TRANSLATIONS.put("Default statistics page", "Màn hình xem thông tin kĩ thuật");
        TRANSLATIONS.put("Default, safe auto selection", "Mặc định hệ thống tự lựa chọn tối ưu");
        TRANSLATIONS.put("Delay", "Độ trễ");
        TRANSLATIONS.put("Delete", "Xóa bỏ");
        TRANSLATIONS.put("Delete all cached video thumbnails (will regenerate as you browse folders)", "Xóa toàn bộ hình thu nhỏ đã tạo (sẽ tự động tạo lại khi duyệt thư mục)");
        TRANSLATIONS.put("Delete all files in the current save location", "Xóa toàn bộ tệp trong thư mục lưu phụ đề tải về hiện tại");
        TRANSLATIONS.put("Deleted successfully", "Đã xóa thành công");
        TRANSLATIONS.put("Desc", "Giảm dần");
        TRANSLATIONS.put("Deselect All", "Bỏ chọn hết");
        TRANSLATIONS.put("Device Info", "Thông tin thiết bị");
        TRANSLATIONS.put("Disabled", "Đã tắt");
        TRANSLATIONS.put("Disabled. No overlay statistics.", "Đã tắt. Không hiển thị các thông số kĩ thuật.");
        TRANSLATIONS.put("Disconnect", "Ngắt kết nối");
        TRANSLATIONS.put("Display", "Cài đặt hiển thị");
        TRANSLATIONS.put("Display a \\\"New\\\" label on videos added within specified days that have never been played", "Hiển thị nhãn \\\"Mới\\\" trên các video được thêm gần đây và chưa từng phát");
        TRANSLATIONS.put("Display a \\\\\"New\\\\\" label on videos added within specified days that have never been played", "Hiển thị nhãn \\\\\"Mới\\\\\" trên các video được thêm gần đây và chưa từng phát");
        TRANSLATIONS.put("Display a \\\\\\\\\"New\\\\\\\\\" label on videos added within specified days that have never been played", "Hiển thị nhãn \\\\\\\\\"Mới\\\\\\\\\" trên các video được thêm gần đây và chưa từng phát");
        TRANSLATIONS.put("Display a \\\\\\\\\\\\\\\\\"New\\\\\\\\\\\\\\\\\" label on videos added within specified days that have never been played", "Hiển thị nhãn \\\\\\\\\\\\\\\\\"Mới\\\\\\\\\\\\\\\\\" trên các video được thêm gần đây và chưa từng phát");
        TRANSLATIONS.put("Display translated text with a delay. Original subtitles are shifted earlier to hide API latency.", "Đặt độ trễ hiển thị của bản dịch. Phụ đề gốc sẽ được hiển thị sớm hơn để che giấu độ trễ khi gọi API.");
        TRANSLATIONS.put("Display volume as percentage", "Hiển thị âm lượng bằng phần trăm");
        TRANSLATIONS.put("Donate", "Ủng hộ nhà phát triển");
        TRANSLATIONS.put("Done", "Xong");
        TRANSLATIONS.put("Done reordering", "Đã sắp xếp xong");
        TRANSLATIONS.put("Doom", "Doom");
        TRANSLATIONS.put("Double Tap Seek Area Width", "Chiều rộng vùng nhấn đúp để tua");
        TRANSLATIONS.put("Double tap", "Nhấn đúp");
        TRANSLATIONS.put("Double tap (center)", "Nhấn đúp (chính giữa)");
        TRANSLATIONS.put("Double tap (left)", "Nhấn đúp (bên trái)");
        TRANSLATIONS.put("Double tap (right)", "Nhấn đúp (bên phải)");
        TRANSLATIONS.put("Double tap seek area width", "Khu vực nhấn đúp tua phim");
        TRANSLATIONS.put("Double tap seek duration", "Thời gian tua khi nhấn đúp");
        TRANSLATIONS.put("Double tap, media controls", "Nhấn đúp màn hình, phím phương tiện");
        TRANSLATIONS.put("Downmix to mono", "Hòa âm thành kênh đơn (Mono)");
        TRANSLATIONS.put("Downmix to stereo", "Giữ nguyên hoặc chia thành 2 kênh (Stereo)");
        TRANSLATIONS.put("Dracula", "Dracula");
        TRANSLATIONS.put("Drag to reorder", "Kéo để sắp xếp lại");
        TRANSLATIONS.put("Drop zone is empty", "Vùng thả đang trống");
        TRANSLATIONS.put("Dump logs", "Xuất nhật ký log");
        TRANSLATIONS.put("Dumps and copies the logs to be shared with the developers", "Sao chép và xuất toàn bộ nhật ký ứng dụng để gửi cho nhà phát triển lỗi");
        TRANSLATIONS.put("Duration", "Thời lượng");
        TRANSLATIONS.put("Duration to skip forward on custom skip button", "Thời gian nhảy tiến khi nhấn nút bỏ qua tùy chỉnh");
        TRANSLATIONS.put("Dynamic", "Màu động");
        TRANSLATIONS.put("Dynamic Speed Overlay", "Lớp phủ tốc độ động");
        TRANSLATIONS.put("Dynamic speed overlay", "Lớp phủ điều chỉnh tốc độ");
        TRANSLATIONS.put("Edit", "Sửa");
        TRANSLATIONS.put("Edit Bottom Left", "Chỉnh sửa góc dưới bên trái");
        TRANSLATIONS.put("Edit Bottom Right", "Chỉnh sửa góc dưới bên phải");
        TRANSLATIONS.put("Edit Connection", "Sửa kết nối");
        TRANSLATIONS.put("Edit Portrait Bottom", "Chỉnh sửa phía dưới chế độ dọc");
        TRANSLATIONS.put("Edit Top Right", "Chỉnh sửa góc trên bên phải");
        TRANSLATIONS.put("Edit input.conf", "Chỉnh sửa input.conf");
        TRANSLATIONS.put("Edit mpv.conf", "Chỉnh sửa mpv.conf");
        TRANSLATIONS.put("Empty folder", "Thư mục trống");
        TRANSLATIONS.put("Enable Anime4K upscaling filter", "Bật công nghệ nâng cấp hình ảnh chất lượng cao Anime4K");
        TRANSLATIONS.put("Enable Anyway", "Vẫn bật");
        TRANSLATIONS.put("Enable Lua Scripts", "Bật tập lệnh Lua");
        TRANSLATIONS.put("Enable Lua scripts", "Bật sử dụng mã Script Lua");
        TRANSLATIONS.put("Enable Vulkan rendering on supported devices (may improve performance)", "Bật công cụ kết xuất Vulkan trên các thiết bị hỗ trợ (có thể giúp tăng hiệu năng)");
        TRANSLATIONS.put("Enable audio pitch correction", "Hiệu chỉnh cao độ âm thanh");
        TRANSLATIONS.put("Enable dynamic colors", "Tự động đổi màu theo hình nền hệ thống");
        TRANSLATIONS.put("Enable experimental or advanced features such as stats page and Anime4K upscaling", "Bật các tính năng nâng cao/thử nghiệm như trang thống kê chi tiết và bộ lọc làm nét Anime4K");
        TRANSLATIONS.put("Enable gpu-next?", "Bật gpu-next?");
        TRANSLATIONS.put("Enable it in Advanced Settings to track your playback history", "Bật tính năng này trong phần Cài đặt nâng cao để ghi nhớ video đã phát");
        TRANSLATIONS.put("Enable next/previous navigation", "Hiện phím Tiến/Lùi để chuyển video");
        TRANSLATIONS.put("Enabling gpu-next may cause purple screen issues during playback on some devices.", "Bật gpu-next có thể gây lỗi màn hình tím khi phát video trên một số dòng máy.");
        TRANSLATIONS.put("English", "Tiếng Anh");
        TRANSLATIONS.put("Enter URL", "Nhập URL");
        TRANSLATIONS.put("Enter custom hide time in milliseconds", "Nhập thời gian tự ẩn tùy chọn (mili-giây)");
        TRANSLATIONS.put("Enter custom seek duration in seconds (1-120)", "Nhập thời gian tua tùy chọn (1-120 giây)");
        TRANSLATIONS.put("Enter language codes separated by commas (e.g., eng,jpn,spa)", "Điền các mã ngôn ngữ viết tắt (ví dụ: vie, eng, jpn) phân cách bằng dấu phẩy");
        TRANSLATIONS.put("Enter the URL of an M3U playlist file", "Nhập địa chỉ liên kết tệp danh sách phát M3U");
    }

    private static void initTranslationsPart4() {
        TRANSLATIONS.put("Enter time", "Điền thời gian");
        TRANSLATIONS.put("Ep", "Tập");
        TRANSLATIONS.put("Error loading directory", "Lỗi khi tải thư mục");
        TRANSLATIONS.put("Error loading files", "Lỗi khi tải các tệp");
        TRANSLATIONS.put("Error loading subtitles", "Lỗi tải phụ đề");
        TRANSLATIONS.put("Existing Playlists", "Danh sách phát hiện có");
        TRANSLATIONS.put("Expand", "Mở rộng");
        TRANSLATIONS.put("Export Complete", "Xuất cấu hình hoàn tất");
        TRANSLATIONS.put("Export Settings", "Xuất cài đặt");
        TRANSLATIONS.put("Export complete", "Đã xuất cấu hình thành công");
        TRANSLATIONS.put("Export settings", "Xuất cài đặt");
        TRANSLATIONS.put("Export settings to an XML file", "Xuất toàn bộ cấu hình cài đặt ra tệp XML");
        TRANSLATIONS.put("Failed to create file", "Không thể tạo tệp");
        TRANSLATIONS.put("Failed to create folder", "Tạo thư mục thất bại");
        TRANSLATIONS.put("Failed to create screenshot", "Không thể chụp ảnh màn hình");
        TRANSLATIONS.put("Failed to delete", "Xóa thất bại");
        TRANSLATIONS.put("Failed to load audio file: Invalid URI", "Không thể tải tệp âm thanh: Địa chỉ URI không hợp lệ");
        TRANSLATIONS.put("Failed to load subtitle", "Không thể tải tệp phụ đề lên trình phát");
        TRANSLATIONS.put("Fast", "Nhanh");
        TRANSLATIONS.put("Fetch Offset", "Thời gian lệch hiển thị");
        TRANSLATIONS.put("Fields", "Trường");
        TRANSLATIONS.put("File Browser", "Trình duyệt tệp");
        TRANSLATIONS.put("File Management", "Quản lý tệp");
        TRANSLATIONS.put("Files processed", "Số tệp đã xử lý");
        TRANSLATIONS.put("Filter Presets", "Bộ lọc cài sẵn");
        TRANSLATIONS.put("Filter presets", "Tùy chọn cấu hình sẵn");
        TRANSLATIONS.put("Filters", "Các bộ lọc hình ảnh");
        TRANSLATIONS.put("Fit Screen", "Vừa khít màn hình");
        TRANSLATIONS.put("Fix Crash (Delete Database)", "Khắc phục (Xóa cơ sở dữ liệu)");
        TRANSLATIONS.put("Folder", "Thư mục");
        TRANSLATIONS.put("Folder Grid", "Lưới thư mục");
        TRANSLATIONS.put("Folder Grid Columns (Landscape)", "Số cột lưới thư mục (Ngang)");
        TRANSLATIONS.put("Folder Grid Columns (Portrait)", "Số cột lưới thư mục (Dọc)");
        TRANSLATIONS.put("Folder Size", "Dung lượng thư mục");
        TRANSLATIONS.put("Folder View", "Chế độ thư mục");
        TRANSLATIONS.put("Folder already exists", "Thư mục đã tồn tại");
        TRANSLATIONS.put("Folder name", "Tên thư mục");
        TRANSLATIONS.put("Folder name cannot be empty", "Tên thư mục không được để trống");
        TRANSLATIONS.put("Folder(s) blacklisted", "Đã thêm vào danh sách ẩn thành công");
        TRANSLATIONS.put("Folders", "Thư mục");
        TRANSLATIONS.put("Font", "Phông chữ");
        TRANSLATIONS.put("Font size", "Kích thước chữ");
        TRANSLATIONS.put("Fonts directory", "Thư mục phông chữ");
        TRANSLATIONS.put("Force override ASS/SSA subtitle formatting", "Ép buộc ghi đè kiểu định dạng của phụ đề ASS/SSA bằng cài đặt cá nhân");
        TRANSLATIONS.put("Forest", "Rừng xanh");
        TRANSLATIONS.put("Frame Navigation", "Xem phim theo từng khung hình");
        TRANSLATIONS.put("Frame timing. Decode/render times, scaler info.", "Thời gian dựng hình. Thời gian giải mã, xử lý ảnh, thông tin bộ co giãn (scaler).");
        TRANSLATIONS.put("Frame: ", "Khung hình:");
        TRANSLATIONS.put("Framerate", "Tốc độ khung hình");
        TRANSLATIONS.put("Free", "Tự do");
        TRANSLATIONS.put("Full Name", "Tên đầy đủ");
        TRANSLATIONS.put("GPU", "Dùng GPU");
        TRANSLATIONS.put("Gamma", "Độ sáng tối hình (Gamma)");
        TRANSLATIONS.put("General", "Cài đặt chung");
        TRANSLATIONS.put("Generate thumbnails for network streams (May increase data usage on mobile networks)", "Tự động tạo hình thu nhỏ cho các luồng mạng (Có thể tốn dữ liệu di động)");
        TRANSLATIONS.put("Generated by mpvEx using MediaInfoLib", "Được tạo bởi mpvEx sử dụng MediaInfoLib");
        TRANSLATIONS.put("Gestures", "Cài đặt cử chỉ");
        TRANSLATIONS.put("GitHub", "GitHub");
        TRANSLATIONS.put("Go back", "Quay lại");
        TRANSLATIONS.put("Go to internal storage", "Đi tới bộ nhớ trong");
        TRANSLATIONS.put("Got it", "Đã hiểu");
        TRANSLATIONS.put("Grain", "Nhiễu hạt tạo bóng");
        TRANSLATIONS.put("Green", "Xanh lá");
        TRANSLATIONS.put("Green Apple", "Táo xanh");
        TRANSLATIONS.put("Grid", "Lưới");
        TRANSLATIONS.put("Grid Columns", "Số cột Grid");
        TRANSLATIONS.put("Grid Columns (Landscape)", "Số cột lưới (Ngang)");
        TRANSLATIONS.put("Grid Columns (Portrait)", "Số cột lưới (Dọc)");
        TRANSLATIONS.put("Gruvbox", "Gruvbox");
        TRANSLATIONS.put("Hardware decoding, pixel format, debanding", "Giải mã phần cứng, định dạng pixel, khử sọc màu");
        TRANSLATIONS.put("Hearing-impaired friendly", "Hỗ trợ khiếm thính (SDH)");
        TRANSLATIONS.put("Height", "Chiều cao");
        TRANSLATIONS.put("Hello world", "Xin chào thế giới");
        TRANSLATIONS.put("Helps in debugging but may hinder performance", "Thu nhập nhiều thông tin lỗi hơn, nhưng có thể làm giảm hiệu năng phát");
        TRANSLATIONS.put("Hide player buttons background", "Ẩn nền các nút điều khiển");
        TRANSLATIONS.put("Hide player control time", "Ẩn mốc thời gian trên bảng điều khiển");
        TRANSLATIONS.put("Hide the background of all player control buttons", "Ẩn nền của tất cả các nút điều khiển trên trình phát");
        TRANSLATIONS.put("High", "Chất lượng cao");
        TRANSLATIONS.put("History", "Lịch sử");
        TRANSLATIONS.put("Hold for multi - x speed", "Nhấn giữ để tăng nhanh tốc độ phát");
        TRANSLATIONS.put("Home", "Trang chủ");
    }

    private static void initTranslationsPart5() {
        TRANSLATIONS.put("Horizontal swipe sensitivity", "Độ nhạy vuốt ngang");
        TRANSLATIONS.put("Horizontal swipe to seek", "Vuốt ngang để tua");
        TRANSLATIONS.put("Host/IP Address", "Địa chỉ Host/IP");
        TRANSLATIONS.put("Host/IP address", "Địa chỉ Host/IP");
        TRANSLATIONS.put("However, due to a change in security policy, apps built for Android 11 and above now require additional permission to continue accessing the same.", "Tuy nhiên, do thay đổi trong chính sách bảo mật, các ứng dụng được xây dựng cho Android 11 trở lên hiện yêu cầu thêm quyền để tiếp tục truy cập các tệp đó.");
        TRANSLATIONS.put("Hue", "Tông màu sắc");
        TRANSLATIONS.put("Icons Legend", "Chú giải biểu tượng");
        TRANSLATIONS.put("If you experience purple screens, try to disable opengl-pbo in Advanced settings (mpv.conf):", "Nếu bạn bị lỗi màn hình tím, hãy thử tắt opengl-pbo trong Cài đặt nâng cao (mpv.conf):");
        TRANSLATIONS.put("Ignore", "Bỏ qua");
        TRANSLATIONS.put("Import Complete", "Nhập cấu hình hoàn tất");
        TRANSLATIONS.put("Import Settings", "Nhập cài đặt");
        TRANSLATIONS.put("Import a playlist from a web URL", "Nhập danh sách phát từ một liên kết web");
        TRANSLATIONS.put("Import complete", "Đã nạp cài đặt thành công");
        TRANSLATIONS.put("Import settings", "Nhập cài đặt");
        TRANSLATIONS.put("Import settings from an XML file", "Nhập cấu hình cài đặt từ tệp XML");
        TRANSLATIONS.put("Include subtitles in snapshot", "Chụp kèm phụ đề lên ảnh");
        TRANSLATIONS.put("Increase zoom", "Phóng to");
        TRANSLATIONS.put("Info", "Chi tiết");
        TRANSLATIONS.put("Install", "Cài đặt ứng dụng");
        TRANSLATIONS.put("Interface Language", "Ngôn ngữ giao diện");
        TRANSLATIONS.put("Invalid", "Không hợp lệ");
        TRANSLATIONS.put("Invalid URL", "URL không hợp lệ");
        TRANSLATIONS.put("Invalid URL protocol", "Giao thức URL không hợp lệ");
        TRANSLATIONS.put("Invalid subtitle file format", "Không đúng định dạng tệp phụ đề");
        TRANSLATIONS.put("Invert Selection", "Đảo ngược lựa chọn");
        TRANSLATIONS.put("Iterations", "Số bước xử lý");
        TRANSLATIONS.put("Kanagawa", "Kanagawa");
        TRANSLATIONS.put("Keep screen on when paused", "Giữ màn hình luôn sáng khi tạm dừng");
        TRANSLATIONS.put("Ko-fi", "Qua Ko-fi");
        TRANSLATIONS.put("Landscape", "Xoay ngang");
        TRANSLATIONS.put("Landscape Controls", "Điều khiển chế độ ngang");
        TRANSLATIONS.put("Largest", "Lớn nhất");
        TRANSLATIONS.put("Lavender", "Oải hương");
        TRANSLATIONS.put("Layout", "Bố cục");
        TRANSLATIONS.put("Libraries", "Các thư viện nguồn mở");
        TRANSLATIONS.put("Light", "Sáng");
        TRANSLATIONS.put("List", "Danh sách");
        TRANSLATIONS.put("Load Lua scripts from configuration directory", "Tải các tập lệnh Lua từ thư mục cấu hình");
        TRANSLATIONS.put("Loading detailed information...", "Đang tải thông tin chi tiết...");
        TRANSLATIONS.put("Loading detailed information…", "Đang tải thông số chi tiết của tệp…");
        TRANSLATIONS.put("Loading folders…", "Đang tải cấu trúc thư mục…");
        TRANSLATIONS.put("Loading…", "Đang tải…");
        TRANSLATIONS.put("Local", "Cục bộ");
        TRANSLATIONS.put("Local Network", "Mạng cục bộ");
        TRANSLATIONS.put("Logging", "Nhật ký ghi lỗi");
        TRANSLATIONS.put("Long press to reorder items. Tap the '-' icon to remove them.", "Nhấn giữ để sắp xếp lại các mục. Nhấn biểu tượng '-' để xóa.");
        TRANSLATIONS.put("Longest", "Dài nhất");
        TRANSLATIONS.put("M3U", "M3U");
        TRANSLATIONS.put("M3U Playlist added successfully", "Đã thêm danh sách phát M3U thành công");
        TRANSLATIONS.put("M3U playlist added successfully", "Đã liên kết danh sách M3U thành công");
        TRANSLATIONS.put("MPV Configuration", "Cấu hình MPV");
        TRANSLATIONS.put("MPV Profile", "Cấu hình MPV");
        TRANSLATIONS.put("MPV directory ready ✓", "Thư mục MPV đã sẵn sàng ✓");
        TRANSLATIONS.put("Make default speed", "Lưu tốc độ mặc định này");
        TRANSLATIONS.put("Manage Lua Scripts", "Quản lý các tập lệnh Lua");
        TRANSLATIONS.put("Manage Lua scripts", "Quản lý kịch bản Script Lua");
        TRANSLATIONS.put("Manage custom player buttons with Lua code", "Quản lý các nút bấm tùy chỉnh của trình phát bằng mã Lua");
        TRANSLATIONS.put("Manage enabled Lua scripts", "Quản lý và bật/tắt các tập lệnh Lua");
        TRANSLATIONS.put("Manage folder blacklist", "Ẩn/hiện thư mục khỏi danh sách trình duyệt");
        TRANSLATIONS.put("Material You", "Màu động Material You");
        TRANSLATIONS.put("May fix black screens on some video codecs, can also improve performance at the cost of quality", "Có thể khắc phục lỗi màn hình đen trên một số loại codec, đồng thời tăng hiệu năng (chất lượng hình ảnh có thể giảm nhẹ)");
        TRANSLATIONS.put("Media Info", "Thông tin phương tiện");
        TRANSLATIONS.put("Media Playback", "Trình điều khiển phim nhạc");
        TRANSLATIONS.put("Media Settings", "Cài đặt phương tiện");
        TRANSLATIONS.put("Media controls", "Phím phương tiện");
        TRANSLATIONS.put("Media playback controls", "Các nút điều khiển nhạc ngoài màn hình khóa/thông báo");
        TRANSLATIONS.put("Midnight", "Nửa đêm");
        TRANSLATIONS.put("Milliseconds", "Mili giây");
        TRANSLATIONS.put("Miscellaneous", "Thiết lập khác");
        TRANSLATIONS.put("Mocha", "Mocha");
        TRANSLATIONS.put("Mono", "Đơn kênh (Mono)");
        TRANSLATIONS.put("Monochrome", "Đơn sắc");
        TRANSLATIONS.put("More", "Chức năng khác");
        TRANSLATIONS.put("Move", "Di chuyển");
        TRANSLATIONS.put("Moved to Private Space", "Đã di chuyển vào Không gian riêng tư");
        TRANSLATIONS.put("Moving", "Đang di chuyển");
        TRANSLATIONS.put("Moving to private space…", "Đang di chuyển vào không gian riêng tư…");
        TRANSLATIONS.put("NEW", "MỚI");
        TRANSLATIONS.put("Name", "Tên kết nối");
        TRANSLATIONS.put("Name cannot be empty", "Tên không được để trống");
    }

    private static void initTranslationsPart6() {
        TRANSLATIONS.put("Name cannot contain / or \\\\", "Tên không được chứa ký tự / hoặc \\\\");
        TRANSLATIONS.put("Name cannot contain / or \\\\\\\\", "Tên không được chứa ký tự / hoặc \\\\\\\\");
        TRANSLATIONS.put("Name cannot contain / or \\\\\\\\\\\\\\\\", "Tên không được chứa ký tự / hoặc \\\\\\\\\\\\\\\\");
        TRANSLATIONS.put("Name cannot contain / or \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\", "Tên không được chứa ký tự / hoặc \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
        TRANSLATIONS.put("Network", "Mạng");
        TRANSLATIONS.put("Network connection not found", "Không tìm thấy kết nối mạng");
        TRANSLATIONS.put("New name", "Tên mới");
        TRANSLATIONS.put("Newest", "Mới nhất");
        TRANSLATIONS.put("Next", "Bài tiếp");
        TRANSLATIONS.put("Next Frame", "Khung hình tiếp theo");
        TRANSLATIONS.put("No blacklisted folders", "Không có thư mục nào bị ẩn");
        TRANSLATIONS.put("No folders found", "Không có thư mục khả dụng nào");
        TRANSLATIONS.put("No folders or supported files", "Không có thư mục hoặc tệp được hỗ trợ nào");
        TRANSLATIONS.put("No folders or videos match your search query", "Không có thư mục hoặc video nào khớp với từ khóa tìm kiếm");
        TRANSLATIONS.put("No network connections", "Không có kết nối mạng");
        TRANSLATIONS.put("No playlists found", "Không tìm thấy danh sách phát nào");
        TRANSLATIONS.put("No playlists yet", "Chưa có danh sách phát nào");
        TRANSLATIONS.put("No recently played videos", "Không có video đã phát gần đây");
        TRANSLATIONS.put("No results found", "Không tìm thấy kết quả");
        TRANSLATIONS.put("No settings found", "Không tìm thấy cài đặt nào");
        TRANSLATIONS.put("No storage devices found", "Không tìm thấy thiết bị lưu trữ nào");
        TRANSLATIONS.put("No storage location set", "Chưa đặt vị trí lưu trữ");
        TRANSLATIONS.put("No subfolders", "Không có thư mục con");
        TRANSLATIONS.put("No video folders found", "Không tìm thấy thư mục video nào");
        TRANSLATIONS.put("No videos in playlist", "Không có video nào trong danh sách");
        TRANSLATIONS.put("No videos in this folder", "Không có video nào trong thư mục này");
        TRANSLATIONS.put("None", "Tắt");
        TRANSLATIONS.put("Nord", "Nord");
        TRANSLATIONS.put("Not available for 4K/8K video", "Không khả dụng cho video 4K/8K");
        TRANSLATIONS.put("Not set (using system fonts)", "Chưa thiết lập (Đang dùng phông chữ hệ thống)");
        TRANSLATIONS.put("Not set (will use video default)", "Chưa thiết lập (Dùng mặc định của tệp video)");
        TRANSLATIONS.put("Not supported (requires Android 13+ with Vulkan 1.3)", "Không hỗ trợ (Yêu cầu Android 13+ và Vulkan 1.3)");
        TRANSLATIONS.put("Now Playing", "Đang phát");
        TRANSLATIONS.put("OK", "OK");
        TRANSLATIONS.put("OR", "HOẶC");
        TRANSLATIONS.put("Ocean", "Đại dương");
        TRANSLATIONS.put("Off", "Tắt");
        TRANSLATIONS.put("Oldest", "Cũ nhất");
        TRANSLATIONS.put("On Android 13 and above, this permission allows the app to read video files from your device's storage, including Downloads, Movies, and DCIM folders.", "Trên Android 13 trở lên, quyền này cho phép ứng dụng đọc các tệp video từ bộ nhớ của thiết bị, bao gồm các thư mục Tải xuống, Phim và DCIM.");
        TRANSLATIONS.put("On Android 13 and above, this permission allows the app to read video files from your device\\'s storage, including Downloads, Movies, and DCIM folders.", "Trên Android 13 trở lên, quyền này cho phép ứng dụng đọc các tệp video từ bộ nhớ của thiết bị, bao gồm các thư mục Tải xuống, Phim và DCIM.");
        TRANSLATIONS.put("On Android 13 and above, this permission allows the app to read video files from your device\\\\'s storage, including Downloads, Movies, and DCIM folders.", "Trên Android 13 trở lên, quyền này cho phép ứng dụng đọc các tệp video từ bộ nhớ của thiết bị, bao gồm các thư mục Tải xuống, Phim và DCIM.");
        TRANSLATIONS.put("On Android 13 and above, this permission allows the app to read video files from your device\\\\\\\\'s storage, including Downloads, Movies, and DCIM folders.", "Trên Android 13 trở lên, quyền này cho phép ứng dụng đọc các tệp video từ bộ nhớ của thiết bị, bao gồm các thư mục Tải xuống, Phim và DCIM.");
        TRANSLATIONS.put("On Android 13 and above, this permission allows the app to read video files from your device\\\\\\\\\\\\\\\\'s storage, including Downloads, Movies, and DCIM folders.", "Trên Android 13 trở lên, quyền này cho phép ứng dụng đọc các tệp video từ bộ nhớ của thiết bị, bao gồm các thư mục Tải xuống, Phim và DCIM.");
        TRANSLATIONS.put("Online Subtitle Search", "Tìm phụ đề trực tuyến");
        TRANSLATIONS.put("Online Subtitle Search…", "Tìm kiếm phụ đề trực tuyến…");
        TRANSLATIONS.put("Only available on Android 12 and above", "Chỉ hỗ trợ từ Android 12 trở lên");
        TRANSLATIONS.put("Only show subtitles optimized for hearing impaired", "Chỉ hiển thị phụ đề tối ưu cho người khiếm thính");
        TRANSLATIONS.put("Oops", "Úi chà, ứng dụng gặp sự cố");
        TRANSLATIONS.put("Opaque box", "Hộp chữ mờ");
        TRANSLATIONS.put("Open File", "Mở tệp");
        TRANSLATIONS.put("Open Link", "Mở liên kết");
        TRANSLATIONS.put("Open file", "Mở tập tệp tin");
        TRANSLATIONS.put("Open link", "Mở địa chỉ đường dẫn");
        TRANSLATIONS.put("Operation cancelled", "Thao tác đã bị hủy bỏ");
        TRANSLATIONS.put("Operation completed successfully!", "Thao tác hoàn thành thành công!");
        TRANSLATIONS.put("Orientation", "Xoay màn hình");
        TRANSLATIONS.put("Orientation, gestures and controls", "Hướng xoay, cử chỉ điều khiển và giao diện trình phát");
        TRANSLATIONS.put("Outline and shadow", "Viền ngoài và bóng đổ");
        TRANSLATIONS.put("Overall progress", "Tiến trình tổng thể");
        TRANSLATIONS.put("Override ASS/SSA subtitles", "Ghi đè phụ đề ASS/SSA");
        TRANSLATIONS.put("Overview. CPU/GPU usage, A/V sync, dropped frames, clock speed.", "Thông tin chung. Hiệu suất CPU/GPU, đồng bộ hình/tiếng, số khung hình drop, xung nhịp.");
        TRANSLATIONS.put("Pan & Zoom", "Thu phóng & Di chuyển");
        TRANSLATIONS.put("Panel opacity", "Độ mờ bảng điều khiển");
        TRANSLATIONS.put("Password", "Mật khẩu tài khoản");
        TRANSLATIONS.put("Paste", "Dán");
        TRANSLATIONS.put("Path", "Đường dẫn");
        TRANSLATIONS.put("PayPal", "Qua PayPal");
        TRANSLATIONS.put("Pick configuration storage location", "Chọn nơi lưu thư mục cấu hình");
        TRANSLATIONS.put("Pick time", "Đặt giờ tắt");
        TRANSLATIONS.put("Pinch to zoom", "Bóp/Thu phóng hai ngón tay");
        TRANSLATIONS.put("Play", "Phát");
        TRANSLATIONS.put("Play Link", "Phát liên kết");
        TRANSLATIONS.put("Play recently played or first video", "Phát video đã xem gần đây hoặc video đầu tiên");
        TRANSLATIONS.put("Play/Pause", "Phát/Tạm dừng");
        TRANSLATIONS.put("Playback & Controls", "Phát lại & Điều khiển");
        TRANSLATIONS.put("Playback Speed", "Tốc độ phát");
        TRANSLATIONS.put("Player", "Trình phát");
        TRANSLATIONS.put("Player Layout", "Bố cục trình phát");
        TRANSLATIONS.put("Playing", "Đang phát");
        TRANSLATIONS.put("Playlist", "Danh sách phát");
    }

    private static void initTranslationsPart7() {
        TRANSLATIONS.put("Playlist Name", "Tên danh sách phát");
        TRANSLATIONS.put("Playlist Options", "Tùy chọn danh sách phát");
        TRANSLATIONS.put("Playlist URL", "URL danh sách phát");
        TRANSLATIONS.put("Playlist created successfully", "Tạo danh sách phát thành công");
        TRANSLATIONS.put("Playlist name", "Tên danh sách phát");
        TRANSLATIONS.put("Playlist refreshed successfully", "Làm mới danh sách phát thành công");
        TRANSLATIONS.put("Playlists", "Danh sách phát");
        TRANSLATIONS.put("Please know that this permission is only used for the auto-discovery of media/subtitle files on your device and will not allow us to access the private data files stored by other apps in any way.", "Xin lưu ý rằng quyền này chỉ được sử dụng để tự động tìm kiếm các tệp phương tiện/phụ đề trên thiết bị của bạn và sẽ không cho phép chúng tôi truy cập các tệp dữ liệu riêng tư do ứng dụng khác lưu trữ dưới bất kỳ hình thức nào.");
        TRANSLATIONS.put("Please restart the app for all changes to take effect.", "Vui lòng khởi động lại ứng dụng để các thay đổi có hiệu lực.");
        TRANSLATIONS.put("Please wait while we search your device", "Vui lòng đợi trong khi chúng tôi tìm kiếm thiết bị của bạn");
        TRANSLATIONS.put("Please wait while we update the interface", "Vui lòng đợi trong khi chúng tôi cập nhật giao diện");
        TRANSLATIONS.put("Port", "Cổng");
        TRANSLATIONS.put("Portrait", "Xoay dọc");
        TRANSLATIONS.put("Portrait Bottom Controls", "Nút phía dưới khi xoay dọc");
        TRANSLATIONS.put("Portrait Controls", "Điều khiển chế độ dọc");
        TRANSLATIONS.put("Position", "Vị trí hiển thị");
        TRANSLATIONS.put("Preferences", "Cài đặt tùy chọn");
        TRANSLATIONS.put("Preferred Encodings", "Bảng mã ưu tiên");
        TRANSLATIONS.put("Preferred Formats", "Định dạng ưu tiên");
        TRANSLATIONS.put("Preferred languages", "Ngôn ngữ ưu tiên");
        TRANSLATIONS.put("Preferred languages, audio channels, pitch correction", "Ngôn ngữ ưu tiên, kênh âm thanh, hiệu chỉnh cao độ");
        TRANSLATIONS.put("Preferred languages, fonts and search", "Ngôn ngữ ưu tiên, phông chữ và tìm kiếm phụ đề");
        TRANSLATIONS.put("Presets", "Thiết lập sẵn");
        TRANSLATIONS.put("Prevents the audio from becoming high-pitched at faster speeds and low-pitched at slower speeds", "Giữ cao độ giọng nói tự nhiên khi tăng hoặc giảm tốc độ phát");
        TRANSLATIONS.put("Preview", "Xem trước");
        TRANSLATIONS.put("Previous", "Bài trước");
        TRANSLATIONS.put("Previous Frame", "Khung hình trước");
        TRANSLATIONS.put("Primary subtitle", "Phụ đề chính");
        TRANSLATIONS.put("Progress Bar", "Thanh tiến trình");
        TRANSLATIONS.put("Protocol", "Giao thức");
        TRANSLATIONS.put("Quick Presets", "Đặt nhanh");
        TRANSLATIONS.put("Range", "Phạm vi khử");
        TRANSLATIONS.put("Recently Played", "Xem gần đây");
        TRANSLATIONS.put("Recently Played is disabled", "Lịch sử xem phim đang tắt");
        TRANSLATIONS.put("Recently played", "Phát gần đây");
        TRANSLATIONS.put("Recents", "Gần đây");
        TRANSLATIONS.put("Red", "Đỏ");
        TRANSLATIONS.put("Reduce player animation", "Giảm bớt hiệu ứng chuyển cảnh");
        TRANSLATIONS.put("Refresh M3U playlist", "Cập nhật làm mới danh sách M3U");
        TRANSLATIONS.put("Reload fonts", "Tải lại danh sách phông");
        TRANSLATIONS.put("Remember display brightness", "Nhớ độ sáng màn hình đã chỉnh");
        TRANSLATIONS.put("Remove", "Xóa");
        TRANSLATIONS.put("Remove all cached subtitle fonts", "Xóa tất cả phông chữ phụ đề đã lưu trong bộ nhớ đệm");
        TRANSLATIONS.put("Remove from Playlist", "Xóa khỏi danh sách");
        TRANSLATIONS.put("Rename", "Đổi tên");
        TRANSLATIONS.put("Rename Playlist", "Đổi tên danh sách");
        TRANSLATIONS.put("Rename playlist", "Đổi tên danh sách");
        TRANSLATIONS.put("Renamed successfully", "Đã đổi tên thành công");
        TRANSLATIONS.put("Reorder playlist", "Sắp xếp lại danh sách phát");
        TRANSLATIONS.put("Replace Original", "Thay thế bản gốc");
        TRANSLATIONS.put("Reset", "Đặt lại");
        TRANSLATIONS.put("Reset layout?", "Đặt lại bố cục trình phát?");
        TRANSLATIONS.put("Reset to default", "Đặt lại về mặc định");
        TRANSLATIONS.put("Reset to default font", "Khôi phục về phông chữ mặc định");
        TRANSLATIONS.put("Reset to default?", "Đặt lại về mặc định?");
        TRANSLATIONS.put("Resolution", "Độ phân giải");
        TRANSLATIONS.put("Restart the app", "Khởi động lại ứng dụng");
        TRANSLATIONS.put("Reverse landscape", "Xoay ngang ngược");
        TRANSLATIONS.put("Reverse portrait", "Xoay dọc ngược");
        TRANSLATIONS.put("Reversed Stereo", "Đảo chiều Stereo");
        TRANSLATIONS.put("Rose Gold", "Vàng hồng");
        TRANSLATIONS.put("Rosé Pine", "Rosé Pine");
        TRANSLATIONS.put("Sapphire", "Sapphire");
        TRANSLATIONS.put("Saturation", "Độ bão hòa màu");
        TRANSLATIONS.put("Save", "Lưu");
        TRANSLATIONS.put("Save position on quit", "Lưu vị trí phát khi thoát");
        TRANSLATIONS.put("Scale", "Tỷ lệ phóng");
        TRANSLATIONS.put("Scale by window", "Thu phóng theo kích thước cửa sổ");
        TRANSLATIONS.put("Scale subtitles by window size and use video margins", "Co giãn cỡ phụ đề dựa theo kích cỡ khung hình và dùng lề video");
        TRANSLATIONS.put("Scanning for videos…", "Đang quét tìm video…");
        TRANSLATIONS.put("Search", "Tìm kiếm");
        TRANSLATIONS.put("Search and download subtitles from Online sources", "Tìm kiếm và tải phụ đề từ các nguồn trực tuyến");
        TRANSLATIONS.put("Search folders and videos…", "Tìm kiếm thư mục và video…");
        TRANSLATIONS.put("Search in all storage volumes…", "Tìm kiếm trong toàn bộ bộ nhớ…");
        TRANSLATIONS.put("Search playlists…", "Tìm kiếm danh sách phát…");
        TRANSLATIONS.put("Search settings…", "Tìm kiếm cài đặt…");
        TRANSLATIONS.put("Search videos", "Tìm kiếm video");
        TRANSLATIONS.put("Search videos…", "Tìm kiếm video…");
        TRANSLATIONS.put("Searching all storage volumes…", "Đang tìm kiếm trên toàn bộ bộ nhớ…");
        TRANSLATIONS.put("Searching…", "Đang tìm kiếm…");
    }

    private static void initTranslationsPart8() {
        TRANSLATIONS.put("Season", "Mùa");
        TRANSLATIONS.put("Secondary subtitle", "Phụ đề phụ");
        TRANSLATIONS.put("Seconds", "Giây");
        TRANSLATIONS.put("Seek", "Tua video");
        TRANSLATIONS.put("Seekbar Style", "Kiểu thanh tua");
        TRANSLATIONS.put("Seeking", "Điều khiển tua");
        TRANSLATIONS.put("Select", "Chọn");
        TRANSLATIONS.put("Select All", "Chọn tất cả");
        TRANSLATIONS.put("Select Folder", "Chọn thư mục");
        TRANSLATIONS.put("Select Subtitle", "Chọn phụ đề");
        TRANSLATIONS.put("Select a storage location", "Chọn một vị trí lưu trữ");
        TRANSLATIONS.put("Select folder/s", "Chọn một hoặc nhiều thư mục");
        TRANSLATIONS.put("Selected (long press to reorder)", "Đã chọn mục (Nhấn giữ kéo thả để xếp lại)");
        TRANSLATIONS.put("Selection options", "Tùy chọn thao tác nhiều mục");
        TRANSLATIONS.put("Sensor landscape", "Ngang theo cảm biến");
        TRANSLATIONS.put("Sensor portrait", "Dọc theo cảm biến");
        TRANSLATIONS.put("Separator", "Phân cách");
        TRANSLATIONS.put("Set as default", "Đặt làm mặc định");
        TRANSLATIONS.put("Settings", "Cài đặt");
        TRANSLATIONS.put("Shadow offset", "Độ lệch bóng đổ");
        TRANSLATIONS.put("Share", "Chia sẻ");
        TRANSLATIONS.put("Share crash logs", "Chia sẻ log lỗi");
        TRANSLATIONS.put("Sharpness", "Độ sắc nét hình");
        TRANSLATIONS.put("Shortest", "Ngắn nhất");
        TRANSLATIONS.put("Show advance overlay for speed control during long press and swipe", "Hiển thị lớp phủ nâng cao để kiểm soát tốc độ khi nhấn giữ và vuốt");
        TRANSLATIONS.put("Show full folder and video names without truncation", "Hiển thị tên đầy đủ của thư mục và video không bị cắt ngắn");
        TRANSLATIONS.put("Show full names", "Hiển thị tên đầy đủ");
        TRANSLATIONS.put("Show label for new unplayed videos", "Hiển thị nhãn cho video mới chưa phát");
        TRANSLATIONS.put("Show loading circle", "Hiển thị vòng quay tải dữ liệu");
        TRANSLATIONS.put("Show navigation bar with controls", "Hiện thanh điều khiển hệ thống cùng bảng nút bấm");
        TRANSLATIONS.put("Show network thumbnails (Experimental)", "Hiện hình thu nhỏ qua mạng (Thử nghiệm)");
        TRANSLATIONS.put("Show next/previous buttons for all videos in folder", "Hiển thị các nút kế tiếp/trước đó cho tất cả video trong thư mục");
        TRANSLATIONS.put("Show ripple when double tap seeking", "Nháy sáng màn hình khi nhấn đúp để tua");
        TRANSLATIONS.put("Show seek time", "Hiển thị số giây tua nhanh");
        TRANSLATIONS.put("Show system status bar with controls", "Hiện thanh trạng thái hệ thống cùng điều khiển");
        TRANSLATIONS.put("Single tap (center)", "Nhấn một lần (chính giữa)");
        TRANSLATIONS.put("Size", "Dung lượng");
        TRANSLATIONS.put("Slate", "Phiến đá");
        TRANSLATIONS.put("Sleep timer", "Hẹn giờ tắt");
        TRANSLATIONS.put("Sleep timer ended", "Đã đến giờ tắt ứng dụng");
        TRANSLATIONS.put("Slide to Unlock", "Vuốt để mở khóa");
        TRANSLATIONS.put("Slide to unlock", "Trượt để mở khóa");
        TRANSLATIONS.put("Smallest", "Nhỏ nhất");
        TRANSLATIONS.put("Some filters may not work on your current video driver", "Lưu ý: Một số bộ lọc có thể không hoạt động trên card màn hình hiện tại");
        TRANSLATIONS.put("Sort", "Sắp xếp");
        TRANSLATIONS.put("Sort & View Options", "Tùy chọn sắp xếp & hiển thị");
        TRANSLATIONS.put("Sort by", "Sắp xếp theo");
        TRANSLATIONS.put("Sound heard", "Đã nghe thấy tiếng âm thanh");
        TRANSLATIONS.put("Sound spotted", "Nhận biết thấy có âm thanh");
        TRANSLATIONS.put("Source Language", "Ngôn ngữ nguồn");
        TRANSLATIONS.put("Speed", "Tốc độ hiển thị");
        TRANSLATIONS.put("Stereo", "Song kênh (Stereo)");
        TRANSLATIONS.put("Storage Access Required", "Yêu cầu quyền truy cập bộ nhớ");
        TRANSLATIONS.put("Strawberry", "Dâu tây");
        TRANSLATIONS.put("Stream Link", "Phát qua liên kết");
        TRANSLATIONS.put("Stream URL", "Đường dẫn luồng phát");
        TRANSLATIONS.put("Stretch", "Giãn hết màn hình");
        TRANSLATIONS.put("Subtitle", "Phụ đề");
        TRANSLATIONS.put("Subtitle Indicator", "Chỉ báo phụ đề");
        TRANSLATIONS.put("Subtitle Languages", "Ngôn ngữ phụ đề tải về");
        TRANSLATIONS.put("Subtitle Save Location", "Thư mục lưu phụ đề");
        TRANSLATIONS.put("Subtitle Search provided by", "Tìm kiếm phụ đề cung cấp bởi");
        TRANSLATIONS.put("Subtitle Sources", "Nguồn phụ đề");
        TRANSLATIONS.put("Subtitle Translation", "Dịch phụ đề");
        TRANSLATIONS.put("Subtitle delay", "Độ lệch phụ đề");
        TRANSLATIONS.put("Subtitle downloads cleared", "Đã xóa sạch phụ đề đã tải");
        TRANSLATIONS.put("Subtitles", "Phụ đề");
        TRANSLATIONS.put("Subtitles settings", "Cài đặt hiển thị phụ đề");
        TRANSLATIONS.put("Sunset", "Hoàng hôn");
        TRANSLATIONS.put("Support the developer on Ko-fi", "Ủng hộ qua cổng quyên góp Ko-fi");
        TRANSLATIONS.put("Support the developer on PayPal", "Ủng hộ qua cổng thanh toán PayPal");
        TRANSLATIONS.put("Supports .m3u and .m3u8 formats", "Tương thích tốt định dạng tệp .m3u và .m3u8");
        TRANSLATIONS.put("Swap left and right channels", "Tráo hai bên tai trái phải cho nhau");
        TRANSLATIONS.put("Swap volume and brightness slider", "Đổi bên thanh âm lượng và độ sáng");
        TRANSLATIONS.put("Swipe left or right on screen to seek forward or backward", "Vuốt sang trái hoặc phải trên màn hình để tua lùi hoặc tua tiến");
        TRANSLATIONS.put("Switch to Grid View", "Chuyển sang chế độ lưới");
        TRANSLATIONS.put("Switch to List View", "Chuyển sang chế độ danh sách");
        TRANSLATIONS.put("System", "Hệ thống");
        TRANSLATIONS.put("System Picker", "Trình chọn của hệ thống");
        TRANSLATIONS.put("Take Screenshot", "Chụp ảnh màn hình");
    }

    private static void initTranslationsPart9() {
        TRANSLATIONS.put("Tako", "Tako");
        TRANSLATIONS.put("Tap buttons from the 'Available Palette' below", "Nhấn các nút từ bảng chọn bên dưới");
        TRANSLATIONS.put("Tap the button below to add folders you want to hide from the folder list", "Ấn vào nút bên dưới để chọn các thư mục bạn muốn ẩn đi không hiện ngoài màn hình chính");
        TRANSLATIONS.put("Tap thumbnail to select", "Chạm vào hình thu nhỏ để chọn");
        TRANSLATIONS.put("Tap to edit configuration", "Chạm để chỉnh sửa cấu hình");
        TRANSLATIONS.put("Target Language", "Ngôn ngữ đích");
        TRANSLATIONS.put("Text", "Màu chữ");
        TRANSLATIONS.put("Text seen", "Đã nhìn thấy phụ đề");
        TRANSLATIONS.put("The permission is used exclusively for:", "Quyền này chỉ được sử dụng cho:");
        TRANSLATIONS.put("Theme", "Chủ đề");
        TRANSLATIONS.put("This action cannot be undone. The selected item will be permanently deleted.", "Thao tác này không thể hoàn tác. Mục đã chọn sẽ bị xóa vĩnh viễn.");
        TRANSLATIONS.put("This action cannot be undone. The selected items will be permanently deleted.", "Thao tác này không thể hoàn tác. Các mục đã chọn sẽ bị xóa vĩnh viễn.");
        TRANSLATIONS.put("This crash appears to be database-related. Try deleting the database to fix it.", "Lỗi crash này có khả năng do xung đột tệp dữ liệu. Vui lòng bấm xóa để khắc phục.");
        TRANSLATIONS.put("This folder contains no files or directories", "Thư mục này không chứa tệp hoặc thư mục nào");
        TRANSLATIONS.put("This folder contains no videos or subfolders", "Thư mục này không chứa video hoặc thư mục con nào");
        TRANSLATIONS.put("This permission allows the app to read media files from your device's storage to play videos and audio.", "Quyền này cho phép ứng dụng đọc các tệp phương tiện từ bộ nhớ thiết bị của bạn để phát video và âm thanh.");
        TRANSLATIONS.put("This permission allows the app to read media files from your device\\'s storage to play videos and audio.", "Quyền này cho phép ứng dụng đọc các tệp phương tiện từ bộ nhớ thiết bị của bạn để phát video và âm thanh.");
        TRANSLATIONS.put("This permission allows the app to read media files from your device\\\\'s storage to play videos and audio.", "Quyền này cho phép ứng dụng đọc các tệp phương tiện từ bộ nhớ thiết bị của bạn để phát video và âm thanh.");
        TRANSLATIONS.put("This permission allows the app to read media files from your device\\\\\\\\'s storage to play videos and audio.", "Quyền này cho phép ứng dụng đọc các tệp phương tiện từ bộ nhớ thiết bị của bạn để phát video và âm thanh.");
        TRANSLATIONS.put("This permission allows the app to read media files from your device\\\\\\\\\\\\\\\\'s storage to play videos and audio.", "Quyền này cho phép ứng dụng đọc các tệp phương tiện từ bộ nhớ thiết bị của bạn để phát video và âm thanh.");
        TRANSLATIONS.put("This will clear all your previous media\\'s playback positions, selected subtitles and audio tracks along with their delays and speeds", "Thao tác này sẽ xóa tất cả tiến trình video đã xem, các kênh âm thanh/phụ đề và cài đặt tốc độ liên quan");
        TRANSLATIONS.put("This will clear all your previous media\\\\'s playback positions, selected subtitles and audio tracks along with their delays and speeds", "Thao tác này sẽ xóa tất cả tiến trình video đã xem, các kênh âm thanh/phụ đề và cài đặt tốc độ liên quan");
        TRANSLATIONS.put("This will clear all your previous media\\\\\\\\'s playback positions, selected subtitles and audio tracks along with their delays and speeds", "Thao tác này sẽ xóa tất cả tiến trình video đã xem, các kênh âm thanh/phụ đề và cài đặt tốc độ liên quan");
        TRANSLATIONS.put("This will clear all your previous media\\\\\\\\\\\\\\\\'s playback positions, selected subtitles and audio tracks along with their delays and speeds", "Thao tác này sẽ xóa tất cả tiến trình video đã xem, các kênh âm thanh/phụ đề và cài đặt tốc độ liên quan");
        TRANSLATIONS.put("This will delete cached thumbnails from storage and memory.", "Thao tác này sẽ xóa hình thu nhỏ đã lưu trong bộ nhớ đệm.");
        TRANSLATIONS.put("This will permanently delete the original file(s) from your device storage.\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\nThis action cannot be undone.", "Thao tác này sẽ xóa vĩnh viễn (các) tệp gốc khỏi bộ nhớ thiết bị của bạn.\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\nThao tác này không thể hoàn tác.");
        TRANSLATIONS.put("This will permanently delete the original file(s) from your device storage.\\\\\\\\n\\\\\\\\nThis action cannot be undone.", "Thao tác này sẽ xóa vĩnh viễn (các) tệp gốc khỏi bộ nhớ thiết bị của bạn.\\\\\\\\n\\\\\\\\nThao tác này không thể hoàn tác.");
        TRANSLATIONS.put("This will permanently delete the original file(s) from your device storage.\\\\n\\\\nThis action cannot be undone.", "Thao tác này sẽ xóa vĩnh viễn (các) tệp gốc khỏi bộ nhớ thiết bị của bạn.\\\\n\\\\nThao tác này không thể hoàn tác.");
        TRANSLATIONS.put("This will permanently delete the original file(s) from your device storage.\\n\\nThis action cannot be undone.", "Thao tác này sẽ xóa vĩnh viễn (các) tệp gốc khỏi bộ nhớ thiết bị của bạn.\\n\\nThao tác này không thể hoàn tác.");
        TRANSLATIONS.put("This will remove all folders from the blacklist. You can add them back later.", "Tất cả các thư mục trong danh sách đen sẽ được khôi phục hiển thị bình thường ở màn hình chính.");
        TRANSLATIONS.put("This will reset the controls in this region to their default configuration.", "Thao tác này sẽ đặt lại các nút điều khiển trong khu vực này về mặc định.");
        TRANSLATIONS.put("Threshold", "Ngưỡng lọc");
        TRANSLATIONS.put("Thumbnail", "Hình thu nhỏ");
        TRANSLATIONS.put("Thumbnail cache cleared", "Đã xóa bộ nhớ đệm hình thu nhỏ");
        TRANSLATIONS.put("Tidal", "Tidal");
        TRANSLATIONS.put("Timestamp: ", "Mốc thời gian:");
        TRANSLATIONS.put("Title", "Tên");
        TRANSLATIONS.put("Toggle menu", "Bật/tắt menu");
        TRANSLATIONS.put("Tokyo Night", "Đêm Tokyo");
        TRANSLATIONS.put("Top Overlay", "Hiện đè phía trên");
        TRANSLATIONS.put("Top Right Controls", "Nút góc trên bên phải");
        TRANSLATIONS.put("Total Duration", "Tổng thời lượng");
        TRANSLATIONS.put("Total Videos", "Tổng số video");
        TRANSLATIONS.put("Total size", "Tổng dung lượng");
        TRANSLATIONS.put("Track and display recently played videos and playlists", "Ghi nhớ và hiển thị danh sách các tệp, luồng mạng đã phát gần đây");
        TRANSLATIONS.put("Track list. Details of video, audio and subtitle tracks.", "Danh sách đường truyền. Chi tiết các luồng tiếng, hình và phụ đề đang mở.");
        TRANSLATIONS.put("Translation", "Dịch thuật");
        TRANSLATIONS.put("Translation Style", "Bố cục hiển thị dịch");
        TRANSLATIONS.put("Tree", "Cây");
        TRANSLATIONS.put("Tree View", "Chế độ cây");
        TRANSLATIONS.put("Try a different search term", "Thử tìm kiếm với từ khóa khác");
        TRANSLATIONS.put("Try hardware decoding", "Thử giải mã bằng phần cứng");
        TRANSLATIONS.put("Typography", "Cỡ chữ & Phông nền");
        TRANSLATIONS.put("UI & Appearance", "Giao diện & Hiển thị");
        TRANSLATIONS.put("UPI", "Qua cổng UPI");
        TRANSLATIONS.put("URL copied to clipboard", "Đã sao chép liên kết vào khay nhớ tạm");
        TRANSLATIONS.put("Unknown Video", "Video không xác định");
        TRANSLATIONS.put("Unknown error", "Lỗi không xác định");
        TRANSLATIONS.put("Unsaved changes", "Thay đổi chưa được lưu");
        TRANSLATIONS.put("Updates", "Cập nhật");
        TRANSLATIONS.put("Use HTTPS (Secure Connection)", "Sử dụng giao thức HTTPS (Bảo mật)");
        TRANSLATIONS.put("Use HTTPS (secure connection)", "Sử dụng kết nối bảo mật HTTPS");
        TRANSLATIONS.put("Use Interface Language", "Sử dụng ngôn ngữ giao diện");
        TRANSLATIONS.put("Use Vulkan", "Sử dụng Vulkan");
        TRANSLATIONS.put("Use YUV420P pixel format", "Sử dụng định dạng pixel YUV420P");
        TRANSLATIONS.put("Use a single tap in the center for gestures (like play/pause) instead of a double tap.", "Sử dụng một lần chạm ở chính giữa để kích hoạt cử chỉ (như phát/tạm dừng) thay vì phải nhấn đúp.");
        TRANSLATIONS.put("Use gpu-next", "Sử dụng gpu-next");
        TRANSLATIONS.put("Use precise seeking", "Tua video chính xác tuyệt đối (Tốn CPU hơn)");
        TRANSLATIONS.put("Use pure black background for dark themes", "Sử dụng nền đen tuyền cho chủ đề tối");
        TRANSLATIONS.put("Use single tap for center gesture", "Sử dụng nhấn một lần cho khu vực giữa");
        TRANSLATIONS.put("Use translate.googleapis.com to translate subtitles", "Sử dụng translate.googleapis.com để dịch phụ đề");
        TRANSLATIONS.put("Username", "Tên đăng nhập");
        TRANSLATIONS.put("Valid URL", "URL hợp lệ");
        TRANSLATIONS.put("Value too big", "Số nhập quá lớn");
        TRANSLATIONS.put("Value too small", "Số nhập quá nhỏ");
        TRANSLATIONS.put("Verbose logging", "Nhật ký lỗi chi tiết");
        TRANSLATIONS.put("Vertical Flip", "Lật dọc");
        TRANSLATIONS.put("Video Grid", "Lưới video");
        TRANSLATIONS.put("Video Grid Columns (Landscape)", "Số cột lưới video (Ngang)");
        TRANSLATIONS.put("Video Grid Columns (Portrait)", "Số cột lưới video (Dọc)");
        TRANSLATIONS.put("Video Thumbnails", "Ảnh thu nhỏ video");
    }

    private static void initTranslationsPart10() {
        TRANSLATIONS.put("Video URL", "URL video");
        TRANSLATIONS.put("Video Zoom", "Độ phóng to hình ảnh");
        TRANSLATIONS.put("Video settings", "Cài đặt hình ảnh video");
        TRANSLATIONS.put("Videos", "Video");
        TRANSLATIONS.put("Videos you add to this folder will appear here", "Các video bạn thêm vào thư mục này sẽ hiển thị tại đây");
        TRANSLATIONS.put("Videos you play will appear here", "Video bạn phát sẽ hiển thị tại đây");
        TRANSLATIONS.put("Vietnamese", "Tiếng Việt");
        TRANSLATIONS.put("View", "Giao diện cử chỉ");
        TRANSLATIONS.put("View Mode", "Chế độ xem");
        TRANSLATIONS.put("View Options", "Tùy chọn hiển thị");
        TRANSLATIONS.put("Violet", "Tím violet");
        TRANSLATIONS.put("Voice heard", "Đã nghe thấy tiếng thoại");
        TRANSLATIONS.put("Volume boost cap", "Giới hạn khuếch đại âm lượng");
        TRANSLATIONS.put("Volume gestures", "Cử chỉ điều chỉnh âm lượng");
        TRANSLATIONS.put("Volume normalization", "Bình thường hóa âm lượng");
        TRANSLATIONS.put("Watched threshold", "Ngưỡng tính là đã xem");
        TRANSLATIONS.put("When enabled, tapping on thumbnails enters selection mode. When disabled, tapping thumbnails plays the video.", "Khi bật, chạm vào hình thu nhỏ sẽ vào chế độ chọn nhiều. Khi tắt, chạm hình thu nhỏ sẽ bắt đầu phát video.");
        TRANSLATIONS.put("Why do I see this?", "Tại sao tôi thấy thông báo này?");
        TRANSLATIONS.put("Why this permission is needed", "Tại sao cần quyền này");
        TRANSLATIONS.put("Width", "Chiều rộng");
        TRANSLATIONS.put("Yin Yang", "Âm Dương");
        TRANSLATIONS.put("Yotsuba", "Yotsuba");
        TRANSLATIONS.put("You can bind custom actions to media controls in input.conf using the following key codes:\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\nPrevious: PREV\\\\\\\\\\\\\\\\nPlay/Pause: PLAYPAUSE\\\\\\\\\\\\\\\\nNext: NEXT", "Bạn có thể gán hành động tùy chỉnh cho phím điều khiển nhạc/video trong tệp input.conf bằng các mã:\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\nBài trước: PREV\\\\\\\\\\\\\\\\nPhát/Tạm dừng: PLAYPAUSE\\\\\\\\\\\\\\\\nBài tiếp: NEXT");
        TRANSLATIONS.put("You can bind custom actions to media controls in input.conf using the following key codes:\\\\\\\\n\\\\\\\\nPrevious: PREV\\\\\\\\nPlay/Pause: PLAYPAUSE\\\\\\\\nNext: NEXT", "Bạn có thể gán hành động tùy chỉnh cho phím điều khiển nhạc/video trong tệp input.conf bằng các mã:\\\\\\\\n\\\\\\\\nBài trước: PREV\\\\\\\\nPhát/Tạm dừng: PLAYPAUSE\\\\\\\\nBài tiếp: NEXT");
        TRANSLATIONS.put("You can bind custom actions to media controls in input.conf using the following key codes:\\\\n\\\\nPrevious: PREV\\\\nPlay/Pause: PLAYPAUSE\\\\nNext: NEXT", "Bạn có thể gán hành động tùy chỉnh cho phím điều khiển nhạc/video trong tệp input.conf bằng các mã:\\\\n\\\\nBài trước: PREV\\\\nPhát/Tạm dừng: PLAYPAUSE\\\\nBài tiếp: NEXT");
        TRANSLATIONS.put("You can bind custom actions to media controls in input.conf using the following key codes:\\n\\nPrevious: PREV\\nPlay/Pause: PLAYPAUSE\\nNext: NEXT", "Bạn có thể gán hành động tùy chỉnh cho phím điều khiển nhạc/video trong tệp input.conf bằng các mã:\\n\\nBài trước: PREV\\nPhát/Tạm dừng: PLAYPAUSE\\nBài tiếp: NEXT");
        TRANSLATIONS.put("You can bind custom actions to these gestures in input.conf using the following key codes:\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\nLeft: MBTN_LEFT_DBL\\\\\\\\\\\\\\\\nCenter: MBTN_MID_DBL\\\\\\\\\\\\\\\\nRight: MBTN_RIGHT_DBL", "Bạn có thể gán các hành động tùy chỉnh cho cử chỉ này trong tệp input.conf bằng các mã phím:\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\nTrái: MBTN_LEFT_DBL\\\\\\\\\\\\\\\\nGiữa: MBTN_MID_DBL\\\\\\\\\\\\\\\\nPhải: MBTN_RIGHT_DBL");
        TRANSLATIONS.put("You can bind custom actions to these gestures in input.conf using the following key codes:\\\\\\\\n\\\\\\\\nLeft: MBTN_LEFT_DBL\\\\\\\\nCenter: MBTN_MID_DBL\\\\\\\\nRight: MBTN_RIGHT_DBL", "Bạn có thể gán các hành động tùy chỉnh cho cử chỉ này trong tệp input.conf bằng các mã phím:\\\\\\\\n\\\\\\\\nTrái: MBTN_LEFT_DBL\\\\\\\\nGiữa: MBTN_MID_DBL\\\\\\\\nPhải: MBTN_RIGHT_DBL");
        TRANSLATIONS.put("You can bind custom actions to these gestures in input.conf using the following key codes:\\\\n\\\\nLeft: MBTN_LEFT_DBL\\\\nCenter: MBTN_MID_DBL\\\\nRight: MBTN_RIGHT_DBL", "Bạn có thể gán các hành động tùy chỉnh cho cử chỉ này trong tệp input.conf bằng các mã phím:\\\\n\\\\nTrái: MBTN_LEFT_DBL\\\\nGiữa: MBTN_MID_DBL\\\\nPhải: MBTN_RIGHT_DBL");
        TRANSLATIONS.put("You can bind custom actions to these gestures in input.conf using the following key codes:\\n\\nLeft: MBTN_LEFT_DBL\\nCenter: MBTN_MID_DBL\\nRight: MBTN_RIGHT_DBL", "Bạn có thể gán các hành động tùy chỉnh cho cử chỉ này trong tệp input.conf bằng các mã phím:\\n\\nTrái: MBTN_LEFT_DBL\\nGiữa: MBTN_MID_DBL\\nPhải: MBTN_RIGHT_DBL");
        TRANSLATIONS.put("Z-A", "Z-A");
        TRANSLATIONS.put("eng,jpn,spa", "vie,eng,jpn");
        TRANSLATIONS.put("file", "tệp");
        TRANSLATIONS.put("files", "tệp");
        TRANSLATIONS.put("folder", "thư mục");
        TRANSLATIONS.put("folders", "thư mục");
        TRANSLATIONS.put("gpu-next is incompatible with Anime4K shaders. When Anime4K is enabled, the app will automatically use the legacy \\'gpu\\' backend for shader compatibility.", "gpu-next không tương thích với shader của Anime4K. Khi bật Anime4K, trình phát sẽ tự động chuyển về bộ giải mã gốc \\'gpu\\'.");
        TRANSLATIONS.put("gpu-next is incompatible with Anime4K shaders. When Anime4K is enabled, the app will automatically use the legacy \\\\'gpu\\\\' backend for shader compatibility.", "gpu-next không tương thích với shader của Anime4K. Khi bật Anime4K, trình phát sẽ tự động chuyển về bộ giải mã gốc \\\\'gpu\\\\'.");
        TRANSLATIONS.put("gpu-next is incompatible with Anime4K shaders. When Anime4K is enabled, the app will automatically use the legacy \\\\\\\\'gpu\\\\\\\\' backend for shader compatibility.", "gpu-next không tương thích với shader của Anime4K. Khi bật Anime4K, trình phát sẽ tự động chuyển về bộ giải mã gốc \\\\\\\\'gpu\\\\\\\\'.");
        TRANSLATIONS.put("gpu-next is incompatible with Anime4K shaders. When Anime4K is enabled, the app will automatically use the legacy \\\\\\\\\\\\\\\\'gpu\\\\\\\\\\\\\\\\' backend for shader compatibility.", "gpu-next không tương thích với shader của Anime4K. Khi bật Anime4K, trình phát sẽ tự động chuyển về bộ giải mã gốc \\\\\\\\\\\\\\\\'gpu\\\\\\\\\\\\\\\\'.");
        TRANSLATIONS.put("item", "mục");
        TRANSLATIONS.put("items", "mục");
        TRANSLATIONS.put("mpvEx has always required storage access permission as it's essential for the app to find all media and subtitle files on your device, including the ones that are not supported by the system.", "mpvEx luôn yêu cầu quyền truy cập bộ nhớ vì đó là điều cần thiết để ứng dụng tìm tất cả các tệp phương tiện và phụ đề trên thiết bị của bạn, bao gồm cả những tệp không được hệ thống hỗ trợ.");
        TRANSLATIONS.put("mpvEx has always required storage access permission as it\\'s essential for the app to find all media and subtitle files on your device, including the ones that are not supported by the system.", "mpvEx luôn yêu cầu quyền truy cập bộ nhớ vì đó là điều cần thiết để ứng dụng tìm tất cả các tệp phương tiện và phụ đề trên thiết bị của bạn, bao gồm cả những tệp không được hệ thống hỗ trợ.");
        TRANSLATIONS.put("mpvEx has always required storage access permission as it\\\\'s essential for the app to find all media and subtitle files on your device, including the ones that are not supported by the system.", "mpvEx luôn yêu cầu quyền truy cập bộ nhớ vì đó là điều cần thiết để ứng dụng tìm tất cả các tệp phương tiện và phụ đề trên thiết bị của bạn, bao gồm cả những tệp không được hệ thống hỗ trợ.");
        TRANSLATIONS.put("mpvEx has always required storage access permission as it\\\\\\\\'s essential for the app to find all media and subtitle files on your device, including the ones that are not supported by the system.", "mpvEx luôn yêu cầu quyền truy cập bộ nhớ vì đó là điều cần thiết để ứng dụng tìm tất cả các tệp phương tiện và phụ đề trên thiết bị của bạn, bao gồm cả những tệp không được hệ thống hỗ trợ.");
        TRANSLATIONS.put("mpvEx has always required storage access permission as it\\\\\\\\\\\\\\\\'s essential for the app to find all media and subtitle files on your device, including the ones that are not supported by the system.", "mpvEx luôn yêu cầu quyền truy cập bộ nhớ vì đó là điều cần thiết để ứng dụng tìm tất cả các tệp phương tiện và phụ đề trên thiết bị của bạn, bao gồm cả những tệp không được hệ thống hỗ trợ.");
        TRANSLATIONS.put("mpvEx is an open source project. You can review the source code and verify how permissions are used by visiting our GitHub repository at:", "mpvEx là một dự án nguồn mở. Bạn có thể xem mã nguồn và xác minh cách sử dụng quyền bằng cách truy cập kho lưu trữ GitHub của chúng tôi tại:");
        TRANSLATIONS.put("mpvEx needs access to your video files to provide its core functionality as a media player.", "mpvEx cần quyền truy cập vào các tệp video của bạn để cung cấp tính năng cốt lõi là trình phát phương tiện.");
        TRANSLATIONS.put("mpvEx requires \"All file access\" permission to discover media and subtitles on your device due to a change in security policy in Android 11 and later versions.", "mpvEx cần quyền \"Truy cập vào tất cả các tệp\" để tìm kiếm phương tiện và phụ đề trên thiết bị của bạn do thay đổi chính sách bảo mật trong Android 11 trở lên.");
        TRANSLATIONS.put("mpvEx requires \"Photos and videos\" permission to access and play your video files stored on your device.", "mpvEx cần quyền truy cập \"Ảnh và video\" để truy cập và phát các tệp video được lưu trữ trên thiết bị của bạn.");
        TRANSLATIONS.put("mpvEx requires \"Storage\" permission to access and play your media files stored on your device.", "mpvEx cần quyền truy cập \"Bộ nhớ\" để truy cập và phát các tệp phương tiện được lưu trữ trên thiết bị của bạn.");
        TRANSLATIONS.put("mpvEx requires \\\"All file access\\\" permission to discover media and subtitles on your device due to a change in security policy in Android 11 and later versions.", "mpvEx cần quyền \\\"Truy cập vào tất cả các tệp\\\" để tìm kiếm phương tiện và phụ đề trên thiết bị của bạn do thay đổi chính sách bảo mật trong Android 11 trở lên.");
        TRANSLATIONS.put("mpvEx requires \\\"Photos and videos\\\" permission to access and play your video files stored on your device.", "mpvEx cần quyền truy cập \\\"Ảnh và video\\\" để truy cập và phát các tệp video được lưu trữ trên thiết bị của bạn.");
        TRANSLATIONS.put("mpvEx requires \\\"Storage\\\" permission to access and play your media files stored on your device.", "mpvEx cần quyền truy cập \\\"Bộ nhớ\\\" để truy cập và phát các tệp phương tiện được lưu trữ trên thiết bị của bạn.");
        TRANSLATIONS.put("mpvEx requires \\\\\"All file access\\\\\" permission to discover media and subtitles on your device due to a change in security policy in Android 11 and later versions.", "mpvEx cần quyền \\\\\"Truy cập vào tất cả các tệp\\\\\" để tìm kiếm phương tiện và phụ đề trên thiết bị của bạn do thay đổi chính sách bảo mật trong Android 11 trở lên.");
        TRANSLATIONS.put("mpvEx requires \\\\\"Photos and videos\\\\\" permission to access and play your video files stored on your device.", "mpvEx cần quyền truy cập \\\\\"Ảnh và video\\\\\" để truy cập và phát các tệp video được lưu trữ trên thiết bị của bạn.");
        TRANSLATIONS.put("mpvEx requires \\\\\"Storage\\\\\" permission to access and play your media files stored on your device.", "mpvEx cần quyền truy cập \\\\\"Bộ nhớ\\\\\" để truy cập và phát các tệp phương tiện được lưu trữ trên thiết bị của bạn.");
        TRANSLATIONS.put("mpvEx requires \\\\\\\\\"All file access\\\\\\\\\" permission to discover media and subtitles on your device due to a change in security policy in Android 11 and later versions.", "mpvEx cần quyền \\\\\\\\\"Truy cập vào tất cả các tệp\\\\\\\\\" để tìm kiếm phương tiện và phụ đề trên thiết bị của bạn do thay đổi chính sách bảo mật trong Android 11 trở lên.");
        TRANSLATIONS.put("mpvEx requires \\\\\\\\\"Photos and videos\\\\\\\\\" permission to access and play your video files stored on your device.", "mpvEx cần quyền truy cập \\\\\\\\\"Ảnh và video\\\\\\\\\" để truy cập và phát các tệp video được lưu trữ trên thiết bị của bạn.");
        TRANSLATIONS.put("mpvEx requires \\\\\\\\\"Storage\\\\\\\\\" permission to access and play your media files stored on your device.", "mpvEx cần quyền truy cập \\\\\\\\\"Bộ nhớ\\\\\\\\\" để truy cập và phát các tệp phương tiện được lưu trữ trên thiết bị của bạn.");
        TRANSLATIONS.put("mpvEx requires \\\\\\\\\\\\\\\\\"All file access\\\\\\\\\\\\\\\\\" permission to discover media and subtitles on your device due to a change in security policy in Android 11 and later versions.", "mpvEx cần quyền \\\\\\\\\\\\\\\\\"Truy cập vào tất cả các tệp\\\\\\\\\\\\\\\\\" để tìm kiếm phương tiện và phụ đề trên thiết bị của bạn do thay đổi chính sách bảo mật trong Android 11 trở lên.");
        TRANSLATIONS.put("mpvEx requires \\\\\\\\\\\\\\\\\"Photos and videos\\\\\\\\\\\\\\\\\" permission to access and play your video files stored on your device.", "mpvEx cần quyền truy cập \\\\\\\\\\\\\\\\\"Ảnh và video\\\\\\\\\\\\\\\\\" để truy cập và phát các tệp video được lưu trữ trên thiết bị của bạn.");
        TRANSLATIONS.put("mpvEx requires \\\\\\\\\\\\\\\\\"Storage\\\\\\\\\\\\\\\\\" permission to access and play your media files stored on your device.", "mpvEx cần quyền truy cập \\\\\\\\\\\\\\\\\"Bộ nhớ\\\\\\\\\\\\\\\\\" để truy cập và phát các tệp phương tiện được lưu trữ trên thiết bị của bạn.");
        TRANSLATIONS.put("ms", "ms");
        TRANSLATIONS.put("no results", "Không có kết quả");
        TRANSLATIONS.put("playlist", "danh sách phát");
        TRANSLATIONS.put("playlists", "danh sách phát");
        TRANSLATIONS.put("video", "video");
        TRANSLATIONS.put("videos", "video");
        TRANSLATIONS.put("• Discovering and displaying your video files\n• Playing media content\n• Loading subtitle files", "• Tìm kiếm và hiển thị các tệp video của bạn\n• Phát nội dung phương tiện\n• Tải các tệp phụ đề");
        TRANSLATIONS.put("• Discovering and displaying your video files\\\\\\\\\\\\\\\\n• Playing media content\\\\\\\\\\\\\\\\n• Loading subtitle files", "• Tìm kiếm và hiển thị các tệp video của bạn\\\\\\\\\\\\\\\\n• Phát nội dung phương tiện\\\\\\\\\\\\\\\\n• Tải các tệp phụ đề");
        TRANSLATIONS.put("• Discovering and displaying your video files\\\\\\\\n• Playing media content\\\\\\\\n• Loading subtitle files", "• Tìm kiếm và hiển thị các tệp video của bạn\\\\\\\\n• Phát nội dung phương tiện\\\\\\\\n• Tải các tệp phụ đề");
        TRANSLATIONS.put("• Discovering and displaying your video files\\\\n• Playing media content\\\\n• Loading subtitle files", "• Tìm kiếm và hiển thị các tệp video của bạn\\\\n• Phát nội dung phương tiện\\\\n• Tải các tệp phụ đề");
        TRANSLATIONS.put("• Discovering and displaying your video files\\n• Playing media content\\n• Loading subtitle files", "• Tìm kiếm và hiển thị các tệp video của bạn\\n• Phát nội dung phương tiện\\n• Tải các tệp phụ đề");
    }

    private MorpheLocale() {
    }

    public static void setContext(Context context) {
        if (context != null) {
            appContext = context.getApplicationContext();
        }
    }

    public static boolean isEnabled() {
        Context ctx = appContext;
        if (ctx == null) {
            try {
                android.app.Application app = (android.app.Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
                if (app != null) {
                    ctx = app.getApplicationContext();
                    appContext = ctx;
                }
            } catch (Throwable ignored) {
            }
        }
        if (ctx != null) {
            return MorphePrefs.isVietnameseEnabled(ctx);
        }
        Activity act = MorpheHook.currentActivity();
        if (act != null) {
            setContext(act);
            return MorphePrefs.isVietnameseEnabled(act);
        }
        return false;
    }

    /**
     * Intercepts Toast.makeText calls to translate toast messages dynamically.
     */
    public static Toast makeToast(Context context, CharSequence text, int duration) {
        if (context != null && appContext == null) {
            setContext(context);
        }
        if (text != null) {
            text = localize(text.toString());
        }
        return Toast.makeText(context, text, duration);
    }

    public static Toast makeText(Context context, CharSequence text, int duration) {
        return makeToast(context, text, duration);
    }

    /**
     * Translates the given string literal to Vietnamese if Vietnamese interface is enabled.
     */
    public static String localize(String text) {
        if (text == null || !isEnabled()) {
            return text;
        }

        // Folder name "Download" must remain unchanged regardless of language setting
        if ("Download".equalsIgnoreCase(text) || "Downloads".equalsIgnoreCase(text)) {
            return text;
        }

        // 1. Direct dictionary match
        String translation = TRANSLATIONS.get(text);
        if (translation != null) {
            return translation;
        }

        // 2. Pattern and prefix matching for dynamic UI / Toast text
        return matchDynamicPattern(text);
    }

    private static String matchDynamicPattern(String text) {
        if (text.endsWith(" columns")) {
            Matcher m = PATTERN_COLUMNS.matcher(text);
            if (m.matches()) return m.group(1) + " cột";
        }
        if (text.endsWith(" items")) {
            Matcher m = PATTERN_ITEMS.matcher(text);
            if (m.matches()) return m.group(1) + " mục";
        }
        if (text.endsWith(" saved") && !text.contains("\n")) {
            return "Đã lưu " + text.substring(0, text.length() - 6);
        }

        Matcher mVideos = PATTERN_VIDEOS.matcher(text);
        if (mVideos.matches()) {
            return mVideos.group(1) + " video";
        }

        Matcher mPlaylists = PATTERN_PLAYLISTS.matcher(text);
        if (mPlaylists.matches()) {
            return mPlaylists.group(1) + " danh sách phát";
        }

        Matcher mDelete = PATTERN_DELETE_ITEMS.matcher(text);
        if (mDelete.matches()) {
            String count = mDelete.group(1);
            String item = mDelete.group(2);
            String itemVi = item.contains("video") ? "video" : (item.contains("folder") ? "thư mục" : "danh sách phát");
            return "Xóa " + count + " " + itemVi + "?";
        }

        Matcher mRemoveRecents = PATTERN_REMOVE_RECENTS.matcher(text);
        if (mRemoveRecents.matches()) {
            String count = mRemoveRecents.group(1);
            String item = mRemoveRecents.group(2);
            String itemVi = item.contains("video") ? "video" : "danh sách phát";
            return "Xóa " + count + " " + itemVi + " khỏi lịch sử?";
        }

        Matcher mRemovePlaylist = PATTERN_REMOVE_PLAYLIST.matcher(text);
        if (mRemovePlaylist.matches()) {
            return "Xóa " + mRemovePlaylist.group(1) + " video khỏi danh sách phát?";
        }

        if (text.startsWith("The selected ") && text.endsWith(" will not be deleted.")) {
            return "Các mục đã chọn sẽ bị loại khỏi danh sách phát. Tệp gốc sẽ không bị xóa.";
        }

        if (text.startsWith("This will remove the selected ") && text.endsWith(" will not be deleted.")) {
            return "Thao tác này sẽ xóa mục đã chọn khỏi danh sách xem gần đây. Các tệp gốc sẽ không bị xóa.";
        }

        if (text.startsWith("Search in ") && (text.endsWith("...") || text.endsWith("…"))) {
            int endIdx = text.endsWith("...") ? text.length() - 3 : text.length() - 1;
            String folder = text.substring(10, endIdx);
            return "Tìm kiếm trong " + folder + "…";
        }

        if (text.startsWith("Path: ")) return "Đường dẫn: " + text.substring(6);
        if (text.startsWith("User: ")) return "Người dùng: " + text.substring(6);
        if (text.startsWith("Error: ")) return "Lỗi: " + text.substring(7);

        Matcher mFileIndex = PATTERN_FILE_INDEX.matcher(text);
        if (mFileIndex.matches()) {
            return "Tệp " + mFileIndex.group(1) + " / " + mFileIndex.group(2);
        }

        Matcher mBytes = PATTERN_BYTES_PROGRESS.matcher(text);
        if (mBytes.matches()) {
            return mBytes.group(1) + " / " + mBytes.group(2);
        }

        Matcher mAdding = PATTERN_ADDING_VIDEOS.matcher(text);
        if (mAdding.matches()) {
            return "Thêm " + mAdding.group(1) + " video vào danh sách phát";
        }

        Matcher mVideosAdded = PATTERN_VIDEOS_ADDED.matcher(text);
        if (mVideosAdded.matches()) {
            return "Đã thêm " + mVideosAdded.group(1) + " video vào \"" + mVideosAdded.group(2) + "\"";
        }

        Matcher mVideoAdded = PATTERN_VIDEO_ADDED.matcher(text);
        if (mVideoAdded.matches()) {
            return "Đã thêm video vào \"" + mVideoAdded.group(1) + "\"";
        }

        Matcher mSpeed = PATTERN_SPEED_PLAYING.matcher(text);
        if (mSpeed.matches()) {
            return "Đang phát tốc độ " + mSpeed.group(1) + "x";
        }

        if (text.startsWith("Failed to create playlist: ")) return "Tạo danh sách phát thất bại: " + text.substring(27);
        if (text.startsWith("Failed to add M3U playlist: ")) return "Thêm danh sách phát M3U thất bại: " + text.substring(28);
        if (text.startsWith("Failed to delete: ")) return "Xóa thất bại: " + text.substring(18);
        if (text.startsWith("Failed to rename: ")) return "Đổi tên thất bại: " + text.substring(18);
        if (text.startsWith("Failed to save: ")) return "Lưu thất bại: " + text.substring(16);
        if (text.startsWith("Failed to clear: ")) return "Xóa thất bại: " + text.substring(17);
        if (text.startsWith("Failed to share: ")) return "Chia sẻ thất bại: " + text.substring(17);
        if (text.startsWith("Failed to load audio: ")) return "Lỗi tải âm thanh: " + text.substring(22);

        if (text.startsWith("Successfully exported ")) {
            return "Đã xuất thành công " + text.substring(22).replace(" items!", " mục!");
        }
        if (text.startsWith("Successfully imported: ")) {
            return "Đã nhập thành công: " + text.substring(23);
        }
        if (text.startsWith("Media Info - ")) {
            return "Thông tin phương tiện - " + text.substring(13);
        }

        Matcher mCustom = PATTERN_CUSTOM_SECONDS.matcher(text);
        if (mCustom.matches()) {
            return "Tùy chọn (" + mCustom.group(1) + ")";
        }

        if (text.startsWith("Current: ")) return "Hiện tại: " + text.substring(9);

        Matcher mOnline = PATTERN_ONLINE_RESULTS.matcher(text);
        if (mOnline.matches()) return "Kết quả trực tuyến (" + mOnline.group(1) + ")";

        Matcher mSeason = PATTERN_SEASON.matcher(text);
        if (mSeason.matches()) return "Mùa " + mSeason.group(1);

        Matcher mEpisode = PATTERN_EPISODE.matcher(text);
        if (mEpisode.matches()) return "Tập " + mEpisode.group(1);

        return text;
    }

    /**
     * Overrides the activity's configuration with Vietnamese if enabled, or English if disabled.
     */
    public static void overrideConfiguration(Activity activity) {
        if (activity == null) {
            return;
        }

        setContext(activity);

        boolean enabled = MorphePrefs.isVietnameseEnabled(activity);
        Locale locale = enabled ? new Locale("vi", "VN") : Locale.ENGLISH;
        Locale.setDefault(locale);

        Configuration config = new Configuration(activity.getResources().getConfiguration());
        config.setLocale(locale);

        try {
            activity.applyOverrideConfiguration(config);
        } catch (IllegalStateException e) {
            Resources res = activity.getResources();
            res.updateConfiguration(config, res.getDisplayMetrics());
        }

        try {
            Resources appRes = activity.getApplicationContext().getResources();
            Configuration appConfig = new Configuration(appRes.getConfiguration());
            appConfig.setLocale(locale);
            appRes.updateConfiguration(appConfig, appRes.getDisplayMetrics());
        } catch (Throwable ignored) {
        }
    }
}
