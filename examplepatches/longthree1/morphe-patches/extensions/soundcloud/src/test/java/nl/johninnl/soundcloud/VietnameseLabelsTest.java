package nl.johninnl.soundcloud;

import org.junit.Test;
import static org.junit.Assert.*;

public class VietnameseLabelsTest {
    @Test public void translatesOnlyVietnameseUiLabels() {
        assertEquals("Thịnh hành theo thể loại", VietnameseLabels.translateForLanguage("Trending by genre", "vi"));
        assertEquals("Trending by genre", VietnameseLabels.translateForLanguage("Trending by genre", "en"));
        assertEquals("Trending by genre", VietnameseLabels.translateForLanguage("Trending by genre", "de"));
        assertNull(VietnameseLabels.translateForLanguage(null, "vi"));
    }

    @Test public void preservesUnrecognizedContentAndSuffixes() {
        assertEquals("Hell of a Night", VietnameseLabels.translateForLanguage("Hell of a Night", "vi"));
        assertEquals("Dựa trên Travis Scott", VietnameseLabels.translateForLanguage("Based on Travis Scott", "vi"));
        assertEquals("Bài hát tương tự: My TRACK", VietnameseLabels.translateForLanguage("Related tracks: My TRACK", "vi"));
        assertEquals("Dựa trên Based on Me", VietnameseLabels.translateForLanguage("Based on Based on Me", "vi"));
        assertEquals("Bản phối dành cho Tên Người Nghe", VietnameseLabels.translateForLanguage("Mixed for Tên Người Nghe", "vi"));
        assertEquals("Vì bạn đang theo dõi Travis Scott", VietnameseLabels.translateForLanguage("Because you follow Travis Scott", "vi"));
        assertEquals("Được thích bởi Travis Scott", VietnameseLabels.translateForLanguage("Liked by Travis Scott", "vi"));
        assertEquals("Được thích bởi Travis Scott", VietnameseLabels.translateForLanguage("Liked By Travis Scott", "vi"));
        assertEquals("Được thích bởi", VietnameseLabels.translateForLanguage("Liked By", "vi"));
        assertEquals("Phổ biến với người nghe Billie Eilish", VietnameseLabels.translateForLanguage("Popular with listeners of Billie Eilish", "vi"));
    }

    @Test public void translatesSystemPlaylistTitlesSafely() {
        assertEquals("Được thích bởi Travis Scott", VietnameseLabels.translateSystemPlaylistForLanguage("Liked by Travis Scott", "vi"));
        assertEquals("Được thích bởi: Travis Scott", VietnameseLabels.translateSystemPlaylistForLanguage("Liked By: Travis Scott", "vi"));
        assertEquals("Được thích bởi", VietnameseLabels.translateSystemPlaylistForLanguage("Liked By", "vi"));
        assertEquals("Gợi ý mỗi ngày", VietnameseLabels.translateSystemPlaylistForLanguage("Daily Drops", "vi"));
        // Normal user/artist playlist titles must never be altered
        assertEquals("Home", VietnameseLabels.translateSystemPlaylistForLanguage("Home", "vi"));
        assertEquals("All", VietnameseLabels.translateSystemPlaylistForLanguage("All", "vi"));
        assertEquals("Road trip", VietnameseLabels.translateSystemPlaylistForLanguage("Road trip", "vi"));
    }

    @Test public void translatesSearchTabsAndActions() {
        assertEquals("Tất cả", VietnameseLabels.translateForLanguage("All", "vi"));
        assertEquals("Bài hát", VietnameseLabels.translateForLanguage("Tracks", "vi"));
        assertEquals("Hồ sơ", VietnameseLabels.translateForLanguage("Profiles", "vi"));
        assertEquals("Xem tất cả", VietnameseLabels.translateForLanguage("See all", "vi"));
        assertEquals("Tất cả thể loại", VietnameseLabels.translateForLanguage("All Genres", "vi"));
        assertEquals("DS phát", VietnameseLabels.translateChoiceForLanguage("Playlists", "vi"));
        assertEquals("DS phát", VietnameseLabels.translateChoiceForLanguage("PLAYLISTS", "vi"));
        assertEquals("Danh sách phát", VietnameseLabels.translateForLanguage("Playlists", "vi"));
        assertEquals("Playlists", VietnameseLabels.translateChoiceForLanguage("Playlists", "en"));
        assertEquals("Tìm hiểu thêm", VietnameseLabels.translateForLanguage("Learn more", "vi"));
        assertEquals("Bắt đầu nghe", VietnameseLabels.translateForLanguage("Start listening", "vi"));
        assertEquals("Bài hát đã thích", VietnameseLabels.translateForLanguage("Liked tracks", "vi"));
        assertEquals("Thể loại & Tâm trạng", VietnameseLabels.translateForLanguage("Genres & Moods", "vi"));
        assertEquals("Bạn chung", VietnameseLabels.translateForLanguage("Mutual", "vi"));
        assertEquals("Bài hát đang bán của tôi", VietnameseLabels.translateForLanguage("My tracks for sale", "vi"));
        assertEquals("Xem trong Bộ sưu tập", VietnameseLabels.translateForLanguage("View in Collection", "vi"));
    }
}
