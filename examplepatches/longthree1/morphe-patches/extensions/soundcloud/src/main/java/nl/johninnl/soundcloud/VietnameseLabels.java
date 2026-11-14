package nl.johninnl.soundcloud;

import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/** Translates only known UI labels in section metadata, never track/user entities. */
public final class VietnameseLabels {
    private static final Map<String, String> LABELS;
    static {
        Map<String, String> labels = new HashMap<>();
        String[][] entries = {
            {"All", "Tất cả"}, {"Tracks", "Bài hát"}, {"Profiles", "Hồ sơ"},
            {"People", "Người dùng"}, {"Playlists", "Danh sách phát"},
            {"Albums", "Album"}, {"Stations", "Trạm phát"}, {"Users", "Người dùng"},
            {"Top Result", "Kết quả hàng đầu"}, {"Top result", "Kết quả hàng đầu"},
            {"Top results", "Kết quả hàng đầu"}, {"See all", "Xem tất cả"},
            {"View all", "Xem tất cả"}, {"Show all", "Hiện tất cả"},
            {"More of what you like", "Thêm nhạc bạn yêu thích"},
            {"We think you’ll like", "Có thể bạn sẽ thích"},
            {"We think you'll like", "Có thể bạn sẽ thích"},
            {"Trending by genre", "Thịnh hành theo thể loại"},
            {"Discover with Stations", "Khám phá qua trạm phát"},
            {"Your daily mixes", "Bản phối mỗi ngày"}, {"Selected for you", "Tuyển chọn cho bạn"},
            {"All genres", "Tất cả thể loại"}, {"ALL GENRES", "TẤT CẢ THỂ LOẠI"},
            {"Artists to watch out for", "Nghệ sĩ đáng chú ý"},
            {"Curated by SoundCloud", "SoundCloud tuyển chọn"},
            {"New", "Mới"}, {"New!", "Mới!"}, {"Discover", "Khám phá"},
            {"Discover more", "Khám phá thêm"}, {"Made for you", "Dành riêng cho bạn"},
            {"Recommended for you", "Gợi ý cho bạn"}, {"Recommended", "Gợi ý"},
            {"Recently played", "Đã phát gần đây"}, {"Your listening history", "Lịch sử nghe"},
            {"Your likes", "Bài hát bạn thích"}, {"Your playlists", "Danh sách phát của bạn"},
            {"Your stations", "Trạm phát của bạn"}, {"Your uploads", "Bản tải lên của bạn"},
            {"Your albums", "Album của bạn"}, {"Your library", "Thư viện của bạn"},
            {"New releases", "Mới phát hành"}, {"Latest releases", "Mới phát hành"},
            {"New music", "Nhạc mới"}, {"Popular tracks", "Bài hát phổ biến"},
            {"Popular playlists", "Danh sách phát phổ biến"}, {"Charts", "Bảng xếp hạng"},
            {"Top 50", "Top 50"}, {"Trending", "Thịnh hành"},
            {"Because you listened to", "Vì bạn đã nghe"},
            {"Related tracks", "Bài hát tương tự"}, {"More like this", "Nhạc tương tự"},
            {"Similar artists", "Nghệ sĩ tương tự"}, {"Artists you should know", "Nghệ sĩ nên khám phá"},
            {"Fans also like", "Người hâm mộ cũng thích"}, {"Fans also listened to", "Người hâm mộ cũng nghe"},
            {"From artists you follow", "Từ nghệ sĩ bạn theo dõi"},
            {"From your follows", "Từ người bạn theo dõi"},
            {"New from artists you follow", "Nhạc mới từ nghệ sĩ bạn theo dõi"},
            {"Daily Drops", "Gợi ý mỗi ngày"}, {"Weekly Wave", "Làn sóng tuần này"},
            {"Play", "Phát"}, {"Play all", "Phát tất cả"}, {"Shuffle", "Trộn bài"},
            {"Follow", "Theo dõi"}, {"Following", "Đang theo dõi"},
            {"Like", "Thích"}, {"Share", "Chia sẻ"}, {"Listen now", "Nghe ngay"},
            {"Listen again", "Nghe lại"}, {"Listen next", "Nghe tiếp"},
            {"Search", "Tìm kiếm"}, {"Search results", "Kết quả tìm kiếm"},
            {"Genres", "Thể loại"}, {"Moods", "Tâm trạng"},
            {"Subscriptions", "Gói đăng ký"}, {"More", "Thêm"},
            {"Featured", "Nổi bật"}, {"For you", "Dành cho bạn"},
            {"Liked tracks", "Bài hát đã thích"}, {"Offline Backup", "Sao lưu ngoại tuyến"},
            {"Listening history", "Lịch sử nghe"}, {"Downloads", "Đã tải về"},
            {"Uploads", "Bản tải lên"}, {"Library", "Thư viện"}, {"Feed", "Bảng tin"},
            {"Home", "Khám phá"}, {"Explore", "Khám phá"},
            {"Learn more", "Tìm hiểu thêm"}, {"More Info", "Thêm thông tin"},
            {"Start listening", "Bắt đầu nghe"}, {"Upgrade", "Nâng cấp"},
            {"Upgrade now", "Nâng cấp ngay"}, {"Try it free", "Dùng thử miễn phí"},
            {"Try Go+ free", "Dùng thử Go+ miễn phí"}, {"Get Go+", "Đăng ký Go+"},
            {"No ads", "Không quảng cáo"}, {"Dismiss", "Bỏ qua"}, {"Not now", "Để sau"},
            {"Got it", "Hiểu rồi"}, {"Get started", "Bắt đầu"}, {"Continue", "Tiếp tục"},
            {"Import your music", "Chuyển nhạc của bạn"},
            {"Transfer your library", "Chuyển thư viện nhạc"},
            {"Offline listening", "Nghe ngoại tuyến"},
            {"Ad-free listening", "Nghe không quảng cáo"},
            {"High quality audio", "Âm thanh chất lượng cao"},
            {"Genres & Moods", "Thể loại & Tâm trạng"},
            {"Moods & genres", "Tâm trạng & Thể loại"},
            {"Explore genres", "Khám phá thể loại"}, {"Browse genres", "Duyệt thể loại"},
            {"Top charts", "Bảng xếp hạng hàng đầu"}, {"New & hot", "Mới & Hot"},
            {"Buzzing", "Đang sốt"}, {"Fresh pressed", "Mới ra lò"},
            {"Spotlight", "Tiêu điểm"}, {"The Upload", "Bản phối Upload"},
            {"Mixed for you", "Phối dành cho bạn"},
            {"Curated playlists", "Danh sách phát tuyển chọn"},
            {"Featured playlists", "Danh sách phát nổi bật"},
            {"Recommended tracks", "Bài hát gợi ý"},
            {"Recommended playlists", "Danh sách phát gợi ý"},
            {"Recommended artists", "Nghệ sĩ gợi ý"},
            {"Recommended albums", "Album gợi ý"},
            {"Playlists for you", "Danh sách phát cho bạn"},
            {"Albums for you", "Album cho bạn"},
            {"Stations for you", "Trạm phát cho bạn"},
            {"Tracks for you", "Bài hát cho bạn"},
            {"Artists on the rise", "Nghệ sĩ đang nổi"},
            {"Emerging artists", "Nghệ sĩ mới nổi"},
            {"Trending playlists", "Danh sách phát thịnh hành"},
            {"Trending tracks", "Bài hát thịnh hành"},
            {"Trending albums", "Album thịnh hành"},
            {"Tracks & mixes", "Bài hát & bản phối"}
        };
        for (String[] entry : entries) {
            labels.put(entry[0], entry[1]);
            labels.putIfAbsent(entry[0].toLowerCase(Locale.ROOT), entry[1]);
        }
        LABELS = Collections.unmodifiableMap(labels);
    }

    public static String translate(String text) {
        return translateForLanguage(text, Locale.getDefault().getLanguage());
    }

    public static String translateChoice(String text) {
        return translateChoiceForLanguage(text, Locale.getDefault().getLanguage());
    }

    static String translateChoiceForLanguage(String text, String language) {
        // Search tabs have a fixed, narrow width; keep the full phrase in section headers.
        if ("vi".equals(language) && text != null && "playlists".equalsIgnoreCase(text)) return "DS phát";
        return translateForLanguage(text, language);
    }

    static String translateForLanguage(String text, String language) {
        if (text == null || !"vi".equals(language)) return text;
        String translated = LABELS.get(text);
        if (translated == null) translated = LABELS.get(text.toLowerCase(Locale.ROOT));
        if (translated != null) return translated;
        // These prefixes belong to section subtitles; preserve the artist/title suffix verbatim.
        String[][] prefixes = {
            {"Based on ", "Dựa trên "}, {"Because you listened to ", "Vì bạn đã nghe "},
            {"Because you follow ", "Vì bạn đang theo dõi "},
            {"Because you followed ", "Vì bạn đã theo dõi "},
            {"Mixed for ", "Bản phối dành cho "},
            {"Because you liked ", "Vì bạn đã thích "},
            {"Related tracks: ", "Bài hát tương tự: "},
            {"Recommended from ", "Gợi ý từ "},
            {"Artists like ", "Nghệ sĩ tương tự "},
            {"More from ", "Thêm từ "}, {"New from ", "Mới từ "}
        };
        for (String[] prefix : prefixes) {
            if (text.startsWith(prefix[0])) return prefix[1] + text.substring(prefix[0].length());
        }
        return text;
    }

    private VietnameseLabels() {}
}
