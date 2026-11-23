package app.voidhack.extension.applemusic.lyrics;

import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

public final class LrclibMatcherTest {

    @Test
    public void stripsEditionAndFeaturingSuffixes() {
        assertEquals("夜に駆ける", LrclibMatcher.stripEditions("夜に駆ける (2023 Remaster)"));
        assertEquals("Blinding Lights", LrclibMatcher.stripEditions("Blinding Lights - Radio Edit"));
        assertEquals("Idol", LrclibMatcher.stripEditions("Idol (feat. Someone) [Deluxe Edition]"));
        assertEquals("YOASOBI", LrclibMatcher.primaryArtist("YOASOBI, Ayase & ikura"));
    }

    @Test
    public void prefersWordSyncedAndCloseDurationOverPlainOrMismatchedVariant() {
        LrclibModels.TrackQuery query = new LrclibModels.TrackQuery(
                "123", 123L, 1L, "夜に駆ける", "YOASOBI", "THE BOOK", 261, false, false);

        LrclibModels.SearchSummary liveWrong = new LrclibModels.SearchSummary(
                10L, "夜に駆ける (Live)", "YOASOBI", "Live", 262.0, false, true, true, true, true, null);
        LrclibModels.SearchSummary plainOnly = new LrclibModels.SearchSummary(
                11L, "夜に駆ける", "YOASOBI", "THE BOOK", 261.0, false, false, true, false, false, null);
        LrclibModels.SearchSummary syncedLine = new LrclibModels.SearchSummary(
                12L, "夜に駆ける", "YOASOBI", "THE BOOK", 261.0, false, false, true, true, false, null);
        LrclibModels.SearchSummary wordSynced = new LrclibModels.SearchSummary(
                13L, "夜に駆ける", "YOASOBI", "THE BOOK", 261.0, false, true, true, true, true, null);

        LrclibModels.SearchSummary best = LrclibMatcher.pickBest(
                query, Arrays.asList(liveWrong, plainOnly, syncedLine, wordSynced), false, true, true);
        assertNotNull(best);
        assertEquals(13L, best.id);
    }

    @Test
    public void rejectsPlainWhenRequireSyncedIsTrue() {
        LrclibModels.TrackQuery query = new LrclibModels.TrackQuery(
                "456", 456L, 1L, "Bohemian Rhapsody", "Queen", "A Night at the Opera", 355, true, false);
        LrclibModels.SearchSummary plain = new LrclibModels.SearchSummary(
                20L, "Bohemian Rhapsody", "Queen", "A Night at the Opera", 355.0, false, false, true, false, false, null);

        LrclibModels.SearchSummary best = LrclibMatcher.pickBest(
                query, Collections.singletonList(plain), true, true, true);
        assertNull(best);
    }

    @Test
    public void rejectsFarDurationMismatchForSyncedLyrics() {
        LrclibModels.TrackQuery query = new LrclibModels.TrackQuery(
                "789", 789L, 1L, "Song", "Artist", "", 240, false, false);
        LrclibModels.SearchSummary tvSize = new LrclibModels.SearchSummary(
                30L, "Song", "Artist", "", 90.0, false, true, true, true, true, null);

        LrclibModels.SearchSummary best = LrclibMatcher.pickBest(
                query, Collections.singletonList(tvSize), true, true, true);
        assertNull(best);
    }

    @Test
    public void parsesRetryAfterWithUpTo30PercentJitter() {
        assertEquals(5000L, LrclibMatcher.parseRetryAfterMillis("5", 0.0));
        assertEquals(6500L, LrclibMatcher.parseRetryAfterMillis("5", 1.0));
        assertEquals(1000L, LrclibMatcher.parseRetryAfterMillis(null, 0.0));
        assertTrue(LrclibMatcher.parseRetryAfterMillis("invalid", 0.5) >= 1000L);
        assertEquals(390000L, LrclibMatcher.parseRetryAfterMillis("999", 1.0));
    }
}
