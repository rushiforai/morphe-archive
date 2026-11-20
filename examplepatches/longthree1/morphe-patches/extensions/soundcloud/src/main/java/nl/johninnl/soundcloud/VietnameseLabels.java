package nl.johninnl.soundcloud;

import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/** Translates only known UI labels in section metadata, never track/user entities. */
public final class VietnameseLabels {
    private static final Map<String, String> LABELS;
    private static final Map<String, String> SYSTEM_PLAYLIST_LABELS;
    static {
        Map<String, String> labels = new HashMap<>();
        String[][] entries = {
            {"All", "Tất cả"}, {"Tracks", "Bài hát"}, {"Profiles", "Hồ sơ"},
            {"People", "Người dùng"}, {"Playlists", "Danh sách phát"},
            {"Albums", "Album"}, {"Stations", "Trạm phát"}, {"Users", "Người dùng"},
            {"Artists", "Nghệ sĩ"}, {"Audio", "Âm thanh"}, {"Music", "Âm nhạc"},
            {"Playlists & albums", "Danh sách phát & album"},
            {"Albums & playlists", "Album & danh sách phát"},
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
            {"All music genres", "Tất cả thể loại nhạc"},
            {"Artists to watch out for", "Nghệ sĩ đáng chú ý"},
            {"Curated by SoundCloud", "SoundCloud tuyển chọn"},
            {"New", "Mới"}, {"New!", "Mới!"}, {"Discover", "Khám phá"},
            {"Discover more", "Khám phá thêm"}, {"Made for you", "Dành riêng cho bạn"},
            {"Recommended for you", "Gợi ý cho bạn"}, {"Recommended", "Gợi ý"},
            {"Suggested for you", "Đề xuất cho bạn"}, {"Picked for you", "Chọn lọc cho bạn"},
            {"Hot for you", "Thịnh hành cho bạn"}, {"Hot For You", "Thịnh hành cho bạn"},
            {"Recently played", "Đã phát gần đây"}, {"Your listening history", "Lịch sử nghe"},
            {"Your likes", "Bài hát bạn thích"}, {"Your playlists", "Danh sách phát của bạn"},
            {"Your stations", "Trạm phát của bạn"}, {"Your uploads", "Bản tải lên của bạn"},
            {"Your albums", "Album của bạn"}, {"Your library", "Thư viện của bạn"},
            {"Your Collection", "Bộ sưu tập của bạn"}, {"Collection", "Bộ sưu tập"},
            {"Your mixes", "Bản phối của bạn"}, {"Mixes", "Bản phối"},
            {"New releases", "Mới phát hành"}, {"Latest releases", "Mới phát hành"},
            {"Fresh releases", "Mới phát hành"}, {"New releases for you", "Phát hành mới cho bạn"},
            {"Fresh tracks for you", "Bài hát mới cho bạn"},
            {"New music", "Nhạc mới"}, {"Popular tracks", "Bài hát phổ biến"},
            {"Popular playlists", "Danh sách phát phổ biến"}, {"Charts", "Bảng xếp hạng"},
            {"SoundCloud Charts", "Bảng xếp hạng SoundCloud"},
            {"Charts: Top 50", "Bảng xếp hạng: Top 50"},
            {"Charts: New & hot", "Bảng xếp hạng: Mới & Hot"},
            {"Top 50", "Top 50"}, {"Global Top 50", "Top 50 Toàn cầu"},
            {"Top 50: All music genres", "Top 50: Tất cả thể loại"},
            {"New & hot: All music genres", "Mới & Hot: Tất cả thể loại"},
            {"Trending", "Thịnh hành"}, {"Trending today", "Thịnh hành hôm nay"},
            {"Trending this week", "Thịnh hành tuần này"},
            {"Popular in the scenes you love", "Phổ biến trong dòng nhạc bạn yêu thích"},
            {"What's new on SoundCloud", "Có gì mới trên SoundCloud"},
            {"What’s new on SoundCloud", "Có gì mới trên SoundCloud"},
            {"Because you listened to", "Vì bạn đã nghe"},
            {"Related tracks", "Bài hát tương tự"}, {"More like this", "Nhạc tương tự"},
            {"Similar artists", "Nghệ sĩ tương tự"}, {"Artists you should know", "Nghệ sĩ nên khám phá"},
            {"Fans also like", "Người hâm mộ cũng thích"}, {"Fans also listened to", "Người hâm mộ cũng nghe"},
            {"From artists you follow", "Từ nghệ sĩ bạn theo dõi"},
            {"From your follows", "Từ người bạn theo dõi"},
            {"New from artists you follow", "Nhạc mới từ nghệ sĩ bạn theo dõi"},
            {"Liked by", "Được thích bởi"}, {"Liked By", "Được thích bởi"},
            {"Liked by you", "Được bạn thích"},
            {"Liked by your crew", "Được bạn bè thích"},
            {"Liked By Your Crew", "Được bạn bè thích"},
            {"Liked by your friends", "Được bạn bè thích"},
            {"Liked by people you follow", "Được thích bởi người bạn theo dõi"},
            {"Liked by people I follow", "Được thích bởi người tôi theo dõi"},
            {"Liked by artists you follow", "Được thích bởi nghệ sĩ bạn theo dõi"},
            {"Reposted by", "Được đăng lại bởi"}, {"Followed by", "Được theo dõi bởi"},
            {"Daily Drops", "Gợi ý mỗi ngày"}, {"Weekly Wave", "Làn sóng tuần này"},
            {"Play", "Phát"}, {"Play all", "Phát tất cả"}, {"Shuffle", "Trộn bài"},
            {"Follow", "Theo dõi"}, {"Following", "Đang theo dõi"},
            {"Like", "Thích"}, {"Liked", "Đã thích"}, {"Likes", "Lượt thích"},
            {"Repost", "Đăng lại"}, {"Reposted", "Đã đăng lại"}, {"Reposts", "Lượt đăng lại"},
            {"Comments", "Bình luận"}, {"Followers", "Người theo dõi"},
            {"Share", "Chia sẻ"}, {"Listen now", "Nghe ngay"},
            {"Listen again", "Nghe lại"}, {"Listen next", "Nghe tiếp"},
            {"Play next", "Phát kế tiếp"}, {"Add to queue", "Thêm vào hàng đợi"},
            {"Add to playlist", "Thêm vào danh sách phát"},
            {"Start station", "Mở trạm phát"}, {"Go to artist", "Tới trang nghệ sĩ"},
            {"View profile", "Xem hồ sơ"},
            {"Search", "Tìm kiếm"}, {"Search results", "Kết quả tìm kiếm"},
            {"Genres", "Thể loại"}, {"Moods", "Tâm trạng"}, {"Vibes", "Tâm trạng"},
            {"Subscriptions", "Gói đăng ký"}, {"More", "Thêm"},
            {"Featured", "Nổi bật"}, {"For you", "Dành cho bạn"},
            {"Liked tracks", "Bài hát đã thích"}, {"Offline Backup", "Sao lưu ngoại tuyến"},
            {"Listening history", "Lịch sử nghe"}, {"Downloads", "Đã tải về"},
            {"Uploads", "Bản tải lên"}, {"Library", "Thư viện"}, {"Feed", "Bảng tin"},
            {"Home", "Khám phá"}, {"Explore", "Khám phá"},
            {"Shortcuts", "Truy cập nhanh"}, {"Artist Shortcuts", "Lối tắt nghệ sĩ"},
            {"Artist stations", "Trạm nghệ sĩ"}, {"Track stations", "Trạm bài hát"},
            {"Recent", "Gần đây"}, {"Recently added", "Đã thêm gần đây"},
            {"Recently updated", "Đã cập nhật gần đây"}, {"Most played", "Nghe nhiều nhất"},
            {"Uploaded by you", "Do bạn tải lên"}, {"Created by you", "Do bạn tạo"},
            {"Saved", "Đã lưu"}, {"On Repeat", "Nghe lặp lại"}, {"On repeat", "Nghe lặp lại"},
            {"Throwback", "Hoài niệm"}, {"Throwbacks", "Nhạc hoài niệm"},
            {"Your Playback", "Nhìn lại năm của bạn"},
            {"First Fans", "Fan đầu tiên"}, {"First fans", "Fan đầu tiên"},
            {"Top Fans", "Fan hàng đầu"}, {"Top fans", "Fan hàng đầu"},
            {"Fan Support", "Fan ủng hộ"}, {"Behind this track", "Thông tin bài hát"},
            {"Top tracks", "Bài hát hàng đầu"}, {"Top artists", "Nghệ sĩ hàng đầu"},
            {"Top albums", "Album hàng đầu"}, {"Top playlists", "Danh sách phát hàng đầu"},
            {"Learn more", "Tìm hiểu thêm"}, {"More Info", "Thêm thông tin"},
            {"Start listening", "Bắt đầu nghe"}, {"Upgrade", "Nâng cấp"},
            {"Upgrade now", "Nâng cấp ngay"}, {"Try it free", "Dùng thử miễn phí"},
            {"Try Go+ free", "Dùng thử Go+ miễn phí"}, {"Get Go+", "Đăng ký Go+"},
            {"Get Artist Pro", "Đăng ký Artist Pro"}, {"Get Pro", "Đăng ký Pro"},
            {"No ads", "Không quảng cáo"}, {"Dismiss", "Bỏ qua"}, {"Not now", "Để sau"},
            {"Maybe later", "Để sau"}, {"Got it", "Hiểu rồi"},
            {"Get started", "Bắt đầu"}, {"Continue", "Tiếp tục"},
            {"Refresh", "Làm mới"}, {"Retry", "Thử lại"}, {"Undo", "Hoàn tác"},
            {"Clear", "Xóa"}, {"Filter", "Bộ lọc"}, {"Sort", "Sắp xếp"},
            {"Cancel", "Hủy"}, {"Save", "Lưu"}, {"Done", "Xong"}, {"Close", "Đóng"},
            {"Skip", "Bỏ qua"}, {"Next", "Tiếp"}, {"Back", "Quay lại"},
            {"Import your music", "Chuyển nhạc của bạn"},
            {"Transfer your library", "Chuyển thư viện nhạc"},
            {"Offline listening", "Nghe ngoại tuyến"},
            {"Ad-free listening", "Nghe không quảng cáo"},
            {"High quality audio", "Âm thanh chất lượng cao"},
            {"Genres & Moods", "Thể loại & Tâm trạng"},
            {"Moods & genres", "Tâm trạng & Thể loại"},
            {"Explore genres", "Khám phá thể loại"}, {"Browse genres", "Duyệt thể loại"},
            {"Top charts", "Bảng xếp hạng hàng đầu"}, {"New & hot", "Mới & Hot"},
            {"Trending & Hot", "Thịnh hành & Nổi bật"},
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
            {"Tracks & mixes", "Bài hát & bản phối"},
            {"Chill", "Thư giãn"}, {"Workout", "Tập luyện"}, {"Party", "Tiệc tùng"},
            {"Focus", "Tập trung"}, {"Study", "Học tập"}, {"Sleep", "Ngủ ngon"},
            {"Gaming", "Chơi game"}, {"Driving", "Lái xe"}, {"Romance", "Lãng mạn"},
            {"Feel Good", "Yêu đời"}, {"Happy", "Vui tươi"}, {"Sad", "Tâm trạng"},
            {"At Home", "Ở nhà"}, {"Cooking", "Nấu ăn"}, {"Meditation", "Thiền định"},
            {"Running", "Chạy bộ"}, {"Summer", "Mùa hè"}, {"Classical", "Cổ điển"},
            {"Soundtrack", "Nhạc phim"}, {"Audiobooks", "Sách nói"},
            {"Comedy", "Hài kịch"}, {"Storytelling", "Kể chuyện"},
            {"News & Politics", "Tin tức & Chính trị"}, {"Science", "Khoa học"},
            {"Technology", "Công nghệ"}, {"Business", "Kinh doanh"},
            {"Sports", "Thể thao"}, {"Religion & Spirituality", "Tôn giáo & Tâm linh"},
            {"Entertainment", "Giải trí"}, {"Learning", "Học hỏi"},
            {"Mutual", "Bạn chung"}, {"My tracks for sale", "Bài hát đang bán của tôi"},
            {"View in Collection", "Xem trong Bộ sưu tập"}
        };
        for (String[] entry : entries) {
            labels.put(entry[0], entry[1]);
            labels.putIfAbsent(entry[0].toLowerCase(Locale.ROOT), entry[1]);
        }
        LABELS = Collections.unmodifiableMap(labels);

        Map<String, String> sysPlaylists = new HashMap<>();
        String[][] sysEntries = {
            {"Liked by", "Được thích bởi"}, {"Liked By", "Được thích bởi"},
            {"Liked by your crew", "Được bạn bè thích"},
            {"Liked By Your Crew", "Được bạn bè thích"},
            {"Liked by your friends", "Được bạn bè thích"},
            {"Liked by people you follow", "Được thích bởi người bạn theo dõi"},
            {"Liked by artists you follow", "Được thích bởi nghệ sĩ bạn theo dõi"},
            {"Daily Drops", "Gợi ý mỗi ngày"}, {"Weekly Wave", "Làn sóng tuần này"},
            {"The Upload", "Bản phối Upload"}
        };
        for (String[] entry : sysEntries) {
            sysPlaylists.put(entry[0], entry[1]);
            sysPlaylists.putIfAbsent(entry[0].toLowerCase(Locale.ROOT), entry[1]);
        }
        SYSTEM_PLAYLIST_LABELS = Collections.unmodifiableMap(sysPlaylists);
    }

    public static String translate(String text) {
        return translateForLanguage(text, Locale.getDefault().getLanguage());
    }

    public static String translateChoice(String text) {
        return translateChoiceForLanguage(text, Locale.getDefault().getLanguage());
    }

    public static String translateSystemPlaylist(String text) {
        return translateSystemPlaylistForLanguage(text, Locale.getDefault().getLanguage());
    }

    static String translateChoiceForLanguage(String text, String language) {
        // Search tabs have a fixed, narrow width; keep the full phrase in section headers.
        if ("vi".equals(language) && text != null && "playlists".equalsIgnoreCase(text)) return "DS phát";
        return translateForLanguage(text, language);
    }

    static String translateSystemPlaylistForLanguage(String text, String language) {
        if (text == null || !"vi".equals(language)) return text;
        String exact = SYSTEM_PLAYLIST_LABELS.get(text);
        if (exact == null) exact = SYSTEM_PLAYLIST_LABELS.get(text.toLowerCase(Locale.ROOT));
        if (exact != null) return exact;
        String[][] prefixes = {
            {"Liked by: ", "Được thích bởi: "}, {"Liked By: ", "Được thích bởi: "},
            {"Liked by ", "Được thích bởi "}, {"Liked By ", "Được thích bởi "},
            {"Mixed for ", "Bản phối dành cho "}
        };
        for (String[] prefix : prefixes) {
            if (text.startsWith(prefix[0])) return prefix[1] + text.substring(prefix[0].length());
        }
        return text;
    }

    static String translateForLanguage(String text, String language) {
        if (text == null || !"vi".equals(language)) return text;
        String translated = LABELS.get(text);
        if (translated == null) translated = LABELS.get(text.toLowerCase(Locale.ROOT));
        if (translated != null) return translated;
        // These prefixes belong to section subtitles and reasons; preserve the artist/title suffix verbatim.
        String[][] prefixes = {
            {"Based on ", "Dựa trên "}, {"Because you listened to ", "Vì bạn đã nghe "},
            {"Because you follow ", "Vì bạn đang theo dõi "},
            {"Because you followed ", "Vì bạn đã theo dõi "},
            {"Mixed for ", "Bản phối dành cho "},
            {"Because you liked ", "Vì bạn đã thích "},
            {"Liked by: ", "Được thích bởi: "}, {"Liked By: ", "Được thích bởi: "},
            {"Liked by ", "Được thích bởi "}, {"Liked By ", "Được thích bởi "},
            {"Reposted by ", "Được đăng lại bởi "},
            {"Followed by ", "Được theo dõi bởi "},
            {"Popular with listeners of ", "Phổ biến với người nghe "},
            {"Popular with fans of ", "Phổ biến với fan của "},
            {"For fans of ", "Dành cho fan của "},
            {"Similar to ", "Tương tự với "},
            {"Inspired by ", "Lấy cảm hứng từ "},
            {"Featuring ", "Có sự góp mặt của "},
            {"Feat. ", "Góp mặt: "},
            {"Curated by ", "Tuyển chọn bởi "},
            {"Created by ", "Tạo bởi "},
            {"Playlist by ", "Danh sách phát của "},
            {"Station based on ", "Trạm phát dựa trên "},
            {"Trending in ", "Thịnh hành tại "},
            {"Top tracks in ", "Bài hát hàng đầu trong "},
            {"New in ", "Mới trong "},
            {"Best of ", "Tuyển tập hay nhất của "},
            {"Related tracks: ", "Bài hát tương tự: "},
            {"Recommended from ", "Gợi ý từ "},
            {"Artists like ", "Nghệ sĩ tương tự "},
            {"More from ", "Thêm từ "}, {"New from ", "Mới từ "},
            {"Latest tracks: ", "Bài hát mới nhất: "},
            {"Made for ", "Dành cho "}
        };
        for (String[] prefix : prefixes) {
            if (text.startsWith(prefix[0])) return prefix[1] + text.substring(prefix[0].length());
        }
        return text;
    }

    private VietnameseLabels() {}
}
