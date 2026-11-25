package app.voidhack.extension.applemusic.lyrics;

import org.junit.Test;

import java.util.Arrays;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public final class LocalLrcMatcherTest {

    @Test
    public void filtersSupportedFolderFilesAndIgnoresAppleDouble() {
        assertTrue(LocalLrcMatcher.isSupportedFolderFile("YOASOBI - 夜に駆ける.lrc"));
        assertTrue(LocalLrcMatcher.isSupportedFolderFile("Song.LRC"));
        assertFalse(LocalLrcMatcher.isSupportedFolderFile("._YOASOBI - 夜に駆ける.lrc"));
        assertFalse(LocalLrcMatcher.isSupportedFolderFile("cover.jpg"));
        assertFalse(LocalLrcMatcher.isSupportedFolderFile("notes.txt"));
    }

    @Test
    public void matchesArtistDashTitleAndPrefersExactArtistOverBareTitle() {
        LrclibModels.TrackQuery query = new LrclibModels.TrackQuery(
                "1492578223", 1492578223L, 1L,
                "夜に駆ける", "YOASOBI", "THE BOOK", 261, false, false);

        LocalLrcMatcher.FolderEntry wrongArtist = new LocalLrcMatcher.FolderEntry(
                "doc1", "Other Artist - 夜に駆ける.lrc", "", "", 1L, 100L);
        LocalLrcMatcher.FolderEntry bareTitle = new LocalLrcMatcher.FolderEntry(
                "doc2", "夜に駆ける.lrc", "", "", 1L, 100L);
        LocalLrcMatcher.FolderEntry artistAndTitle = new LocalLrcMatcher.FolderEntry(
                "doc3", "YOASOBI - 夜に駆ける.lrc", "", "", 1L, 100L);

        List<LocalLrcMatcher.ScoredEntry> list = LocalLrcMatcher.shortlistByFilename(
                query, Arrays.asList(wrongArtist, bareTitle, artistAndTitle), 5);
        assertEquals(2, list.size());
        assertEquals("doc3", list.get(0).entry.docId);
        assertEquals("doc2", list.get(1).entry.docId);
    }

    @Test
    public void matchesTrackNumberedFilenameAndDirectoryHierarchy() {
        LrclibModels.TrackQuery query = new LrclibModels.TrackQuery(
                "100", 100L, 1L,
                "アイドル", "YOASOBI", "THE BOOK 3", 213, false, false);

        LocalLrcMatcher.FolderEntry nested = new LocalLrcMatcher.FolderEntry(
                "docNested", "01. アイドル.lrc", "THE BOOK 3", "YOASOBI", 1L, 200L);
        double score = LocalLrcMatcher.scoreFilename(query, nested);
        assertTrue("Expected strong score for Artist/Album/01. Title.lrc, got " + score, score >= 95.0);
    }

    @Test
    public void matchesByAdamIdFilenameDirectly() {
        LrclibModels.TrackQuery query = new LrclibModels.TrackQuery(
                "1492578223", 1492578223L, 1L,
                "夜に駆ける", "YOASOBI", "THE BOOK", 261, false, false);
        LocalLrcMatcher.FolderEntry byId = new LocalLrcMatcher.FolderEntry(
                "docId", "1492578223.lrc", "", "", 1L, 200L);
        assertTrue(LocalLrcMatcher.scoreFilename(query, byId) >= 190.0);
    }

    @Test
    public void rejectsWrongArtistTagAndMatchesArbitraryFilenameViaTags() {
        LrclibModels.TrackQuery query = new LrclibModels.TrackQuery(
                "200", 200L, 1L,
                "Hello", "Adele", "25", 295, false, false);

        LocalLrcMatcher.FolderEntry ambiguousFile = new LocalLrcMatcher.FolderEntry(
                "docWrong", "Hello.lrc", "", "", 1L, 200L);
        LocalLrcParser.LrcMetadata wrongArtistMeta = new LocalLrcParser.LrcMetadata(
                "Hello", "Lionel Richie", "Can't Slow Down", "en", 249, true);
        assertTrue(LocalLrcMatcher.scoreWithMetadata(query, ambiguousFile, wrongArtistMeta, false) < 0.0);

        LocalLrcMatcher.FolderEntry opaqueFile = new LocalLrcMatcher.FolderEntry(
                "docOpaque", "track_042.lrc", "", "", 1L, 200L);
        LocalLrcParser.LrcMetadata matchingMeta = new LocalLrcParser.LrcMetadata(
                "Hello", "Adele", "25", "en", 295, true);
        double tagScore = LocalLrcMatcher.scoreWithMetadata(query, opaqueFile, matchingMeta, false);
        assertTrue("Expected opaque filename with matching [ti:]/[ar:] tags to match, got " + tagScore,
                tagScore >= 100.0);
    }

    @Test
    public void prefersSyncedOverUnsyncedAndRespectsRequireSynced() {
        LrclibModels.TrackQuery query = new LrclibModels.TrackQuery(
                "300", 300L, 1L,
                "Lemon", "米津玄師", "STRAY SHEEP", 256, true, false);
        LocalLrcMatcher.FolderEntry file = new LocalLrcMatcher.FolderEntry(
                "doc", "米津玄師 - Lemon.lrc", "", "", 1L, 200L);

        LocalLrcParser.LrcMetadata unsynced = new LocalLrcParser.LrcMetadata(
                "Lemon", "米津玄師", "", "ja", 256, false);
        LocalLrcParser.LrcMetadata synced = new LocalLrcParser.LrcMetadata(
                "Lemon", "米津玄師", "", "ja", 256, true);

        double unsyncedScore = LocalLrcMatcher.scoreWithMetadata(query, file, unsynced, false);
        double syncedScore = LocalLrcMatcher.scoreWithMetadata(query, file, synced, false);
        assertTrue(unsyncedScore >= LocalLrcMatcher.MIN_MATCH_SCORE);
        assertTrue(syncedScore > unsyncedScore);
        assertTrue(LocalLrcMatcher.scoreWithMetadata(query, file, unsynced, true) < 0.0);
        assertTrue(LocalLrcMatcher.scoreWithMetadata(query, file, synced, true) >= LocalLrcMatcher.MIN_MATCH_SCORE);
    }

    @Test
    public void preservesNumericSongTitlesWhenStrippingTrackNumbers() {
        assertEquals("1999", LocalLrcMatcher.stripTrackNumberPrefix("1999"));
        assertEquals("夜に駆ける", LocalLrcMatcher.stripTrackNumberPrefix("01 - 夜に駆ける"));
        assertEquals("夜に駆ける", LocalLrcMatcher.stripTrackNumberPrefix("01. 夜に駆ける"));
        assertEquals("夜に駆ける", LocalLrcMatcher.stripTrackNumberPrefix("1-02 夜に駆ける"));
    }

    @Test
    public void matchesCompactSeparatorAndInnerTrackNumbers() {
        LrclibModels.TrackQuery query = new LrclibModels.TrackQuery(
                "400", 400L, 1L,
                "夜に駆ける", "YOASOBI", "THE BOOK", 261, false, false);

        LocalLrcMatcher.FolderEntry innerNum = new LocalLrcMatcher.FolderEntry(
                "d1", "YOASOBI - 01. 夜に駆ける.lrc", "", "", 1L, 100L);
        LocalLrcMatcher.FolderEntry compactDash = new LocalLrcMatcher.FolderEntry(
                "d2", "YOASOBI-夜に駆ける.lrc", "", "", 1L, 100L);
        LocalLrcMatcher.FolderEntry compactUnderscore = new LocalLrcMatcher.FolderEntry(
                "d3", "YOASOBI_夜に駆ける.lrc", "", "", 1L, 100L);

        assertTrue(LocalLrcMatcher.scoreFilename(query, innerNum) >= 95.0);
        assertTrue(LocalLrcMatcher.scoreFilename(query, compactDash) >= 95.0);
        assertTrue(LocalLrcMatcher.scoreFilename(query, compactUnderscore) >= 95.0);
    }
}
