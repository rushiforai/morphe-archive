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
    }
}
