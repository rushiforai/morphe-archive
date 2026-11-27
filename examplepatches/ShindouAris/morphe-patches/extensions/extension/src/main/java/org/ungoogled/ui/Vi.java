package org.ungoogled.ui;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Vietnamese for the mod's own screens. The mod writes its texts in English; when the app's language (Maps' own
 * language setting, or the phone's) is Vietnamese, [t] gives the Vietnamese for an English text that is listed
 * here, and the English text itself for any that is not.
 */
public final class Vi {
    private Vi() {
    }

    private static final Map<String, String> VI = new HashMap<>();

    private static void p(String en, String vi) {
        VI.put(en, vi);
    }

    static {
        // Pages and rows.
        p("Customization", "Tùy chỉnh");
        p("Power Saving Options", "Tùy chọn tiết kiệm pin");
        p("Speeding chime", "Chuông cảnh báo quá tốc độ");
        p("UI", "Giao diện");
        p("Hide Telemetry", "Ẩn dữ liệu theo dõi");
        p("Misc Features", "Tính năng khác");
        p("Close", "Đóng");
        p("Cancel", "Hủy");
        p("Off", "Tắt");
        p("On", "Bật");
        p(" & ", " và ");
        p("Restarting Maps to apply", "Đang khởi động lại Maps để áp dụng");

        // UI.
        p("Rectangle Shapes", "Hình chữ nhật");
        p("Changes circle & oval icons to squares & rectangles", "Đổi biểu tượng tròn và bầu dục thành vuông và chữ nhật");
        p("Black theme", "Giao diện đen");
        p("Choosing a theme in Maps settings turns this off", "Chọn giao diện trong cài đặt Maps sẽ tắt mục này");
        p("Light map", "Bản đồ sáng");
        p("Keeps the map light when menus are dark", "Giữ bản đồ sáng khi menu tối");
        p("120 refresh rate", "Tần số quét 120");

        // Hide telemetry.
        p("Sponsored content", "Nội dung được tài trợ");
        p("Hide sponsored content", "Ẩn nội dung được tài trợ");
        p("Removes promoted pins & sponsored search results", "Xóa ghim quảng cáo và kết quả tìm kiếm được tài trợ");
        p("Explore sheet", "Bảng Khám phá");
        p("Hide explore sheet", "Ẩn bảng Khám phá");
        p("Bottom tabs", "Thanh tab dưới");
        p("Hide bottom tabs", "Ẩn thanh tab dưới");
        p("Suggestions", "Gợi ý");
        p("Hide suggestions", "Ẩn gợi ý");
        p("Hide AI", "Ẩn AI");

        // Misc.
        p("Zoom controls in navigation", "Nút thu phóng khi dẫn đường");
        p("Better offline maps", "Bản đồ ngoại tuyến tốt hơn");
        p("Location source", "Nguồn vị trí");
        p("Android location API", "API vị trí Android");
        p("Google Play Services or microG", "Google Play Services hoặc microG");
        p("Map region", "Khu vực bản đồ");
        p("Automatic", "Tự động");
        p("Automatic (your SIM's country)", "Tự động (quốc gia của SIM)");
        p("Follow playing media", "Theo dõi nhạc đang phát");
        p("Not on a root mount install", "Không có trên bản cài root mount");
        p("Needs notification access", "Cần quyền truy cập thông báo");
        p("Media apps in navigation", "Ứng dụng nhạc khi dẫn đường");
        p("All, the one playing first", "Tất cả, ưu tiên ứng dụng đang phát");

        // Speeding chime.
        p("Past the speed limit", "Vượt tốc độ giới hạn");
        p("When the speedometer turns red", "Khi đồng hồ tốc độ chuyển đỏ");
        p("10 mph or 20 km/h over the limit", "Vượt giới hạn 10 mph hoặc 20 km/h");

        // Power saving.
        p("Power saving mode", "Chế độ tiết kiệm pin");
        p("Enables the power saving mode from pixels for all devices", "Bật chế độ tiết kiệm pin của Pixel cho mọi thiết bị");
        p("Open without locking", "Mở không cần khóa");
        p("A button in navigation opens the power saving screen", "Một nút khi dẫn đường mở màn hình tiết kiệm pin");
        p("Auto-switch when idle", "Tự chuyển khi không dùng");
        p("After 15 seconds", "Sau 15 giây");
        p("After 30 seconds", "Sau 30 giây");
        p("After 1 minute", "Sau 1 phút");
        p("After 2 minutes", "Sau 2 phút");
        p("After ", "Sau ");
        p(" seconds", " giây");
        p("Normal screen near turns", "Màn hình thường khi gần chỗ rẽ");
        p("Back after 30 seconds", "Quay lại sau 30 giây");
        p("Back after 1 minute", "Quay lại sau 1 phút");
        p("Back after 2 minutes", "Quay lại sau 2 phút");
        p("Back after 5 minutes", "Quay lại sau 5 phút");
        p(" m before a turn, ", " m trước chỗ rẽ, ");
        p("back after ", "quay lại sau ");
        p("Speedometer", "Đồng hồ tốc độ");
        p("Your speed and the speed limit on the power saving screen", "Tốc độ của bạn và giới hạn tốc độ trên màn hình tiết kiệm pin");
        p("Lower frame rate", "Giảm tốc độ khung hình");
        p("While navigating", "Khi dẫn đường");
        p("Everywhere", "Mọi nơi");
        p(": 15 fps and 30 Hz, as on the power saving screen", ": 15 fps và 30 Hz, như trên màn hình tiết kiệm pin");
        p("Power saving theme", "Giao diện tiết kiệm pin");
        p("While navigating: the power saving screen's black map", "Khi dẫn đường: bản đồ đen của màn hình tiết kiệm pin");
        p("Everywhere: the power saving screen's black map, roads only, no place names",
                "Mọi nơi: bản đồ đen của màn hình tiết kiệm pin, chỉ có đường, không có tên địa điểm");

        // Android Auto.
        p("Request Waze Mod permission", "Yêu cầu quyền Waze Mod");
        p("Lets Maps read speed, speed limit and alerts from Waze Mod, for the overlay on Android Auto",
                "Cho Maps đọc tốc độ, giới hạn tốc độ và cảnh báo từ Waze Mod để hiện lớp phủ trên Android Auto");
        p("Waze Mod with the Data API is not installed", "Chưa cài Waze Mod có Data API");
        p("Request xADAS permission", "Yêu cầu quyền xADAS");
        p("Maps is already allowed in xADAS", "Maps đã được cấp quyền trong xADAS");
        p("Allow Maps in xADAS: open its notification or Settings", "Hãy cho phép Maps trong xADAS: mở thông báo hoặc Cài đặt của xADAS");
        p("Turn on sharing with other apps in xADAS Pro Settings first", "Hãy bật chia sẻ với ứng dụng khác trong Cài đặt xADAS Pro trước");
        p("Maps is turned off in xADAS Settings", "Maps đang bị tắt trong Cài đặt xADAS");
        p("Distance to the vehicle ahead. In xADAS Pro turn on sharing with other apps, then allow Maps",
                "Khoảng cách tới xe phía trước. Trong xADAS Pro bật chia sẻ với ứng dụng khác, rồi cho phép Maps");
        p("xADAS is not installed", "Chưa cài xADAS");
        p("Waze Mod", "Waze Mod");
        p("Allowed", "Đã cấp quyền");
        p("Not allowed yet", "Chưa cấp quyền");
        p("Not allowed, or sharing is off in xADAS Pro", "Chưa cấp quyền, hoặc xADAS Pro đang tắt chia sẻ");
        p("Not installed", "Chưa cài");
        p("Could not check", "Không kiểm tra được");
        p("Style", "Kiểu");
        p("Position", "Vị trí");
        p("Size", "Cỡ");
        p("Speed dial beside the sign", "Đồng hồ tốc độ cạnh biển báo");
        p("Small speed badge on the sign", "Huy hiệu tốc độ nhỏ trên biển báo");
        p("Signs only", "Chỉ biển báo");
        p("Left, beside Maps' buttons", "Bên trái, cạnh các nút của Maps");
        p("Top right", "Góc trên bên phải");
        p("Allow Maps to read Waze Mod data", "Cho phép Maps đọc dữ liệu Waze Mod");
        p("Tap to open Waze Mod's permission screen", "Chạm để mở màn hình cấp quyền của Waze Mod");
        p("Open the phone to let Maps read Waze Mod data", "Mở điện thoại để cho phép Maps đọc dữ liệu Waze Mod");
    }

    /** Whether the app's language is Vietnamese. */
    public static boolean on() {
        return "vi".equals(Locale.getDefault().getLanguage());
    }

    /** [english] in Vietnamese when the app's language is Vietnamese and it is listed here; else [english]. */
    public static String t(String english) {
        if (english == null || !on()) return english;
        String vi = VI.get(english);
        return vi != null ? vi : english;
    }

    /** [t] of each. A new array, or [english] itself when the language is not Vietnamese. */
    public static String[] t(String[] english) {
        if (!on()) return english;
        String[] out = new String[english.length];
        for (int i = 0; i < out.length; i++) out[i] = t(english[i]);
        return out;
    }
}
