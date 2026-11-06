/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-05.
 * Written by lavinhoque33, 2026-11-05.
 */
package app.morphe.extension.youtube.patches.general.offline;

import org.junit.Test;
import java.util.List;
import app.morphe.extension.youtube.patches.general.offline.OfflineCaptionChoices.Track;
import static org.junit.Assert.*;

public class OfflineBatchSubtitlesTest {
    private static Track track(String key, String language, String kind, String translation) {
        return new Track(key, language, kind, translation, key, "url");
    }

    @Test public void exactTrackWinsThenSameLanguageOtherKind() {
        Track manual = track(".en", "en", "", "");
        Track automatic = track("a.en", "en", "asr", "");
        assertEquals(List.of(manual), OfflineBatchSubtitles.match(List.of(manual), List.of(automatic, manual)));
        assertEquals(List.of(automatic), OfflineBatchSubtitles.match(List.of(manual), List.of(automatic)));
        assertTrue(OfflineBatchSubtitles.match(List.of(manual), List.of(track(".fr", "fr", "", ""))).isEmpty());
    }

    @Test public void translationsNeverMatchAndDuplicateLanguagesAreNotDownloadedTwice() {
        Track nativeTrack = track(".en", "en", "", "");
        Track translated = track("translate:en", "fr", "translated", "en");
        assertTrue(OfflineBatchSubtitles.match(List.of(translated), List.of(nativeTrack)).isEmpty());
        assertTrue(OfflineBatchSubtitles.match(List.of(nativeTrack), List.of(translated)).isEmpty());
        assertEquals(1, OfflineBatchSubtitles.match(List.of(nativeTrack, nativeTrack), List.of(nativeTrack)).size());
    }

    @Test public void firstRateLimitOpensCircuitAndSummaryCountsFailures() {
        OfflineBatchSubtitles counts = new OfflineBatchSubtitles();
        assertTrue(counts.shouldResolve(true));
        assertFalse(counts.shouldResolve(false));
        counts.finished(3, 1, true);
        assertFalse(counts.shouldResolve(true));
        counts.finished(2, 0, false);
        assertEquals(1, counts.saved);
        assertEquals(4, counts.skipped);
        assertEquals(List.of("revanced_offline_batch_subtitles_saved", "revanced_offline_batch_subtitles_skipped",
                "revanced_offline_batch_subtitles_limited"), counts.summaryKeys());
    }

    @Test public void rememberedNativeKeysRetainTheirLanguage() {
        assertEquals("en", OfflineBatchSubtitles.languageOf(".en"));
        assertEquals("en-US", OfflineBatchSubtitles.languageOf("a.en-US"));
        assertEquals("fr", OfflineBatchSubtitles.languageOf("fr:asr"));
        assertEquals("", OfflineBatchSubtitles.languageOf("translate:en"));
    }

    @Test public void metadataRateLimitOpensTheBatchCircuitWithoutFailingTheVideo() throws Exception {
        OfflineBatchSubtitles counts = new OfflineBatchSubtitles();
        OfflineCaptions.checkPlayerStatus(200);
        counts.metadataResolved(false);
        assertTrue(counts.shouldResolve(true));
        try {
            OfflineCaptions.checkPlayerStatus(429);
            fail("Caption metadata HTTP 429 must retain its rate-limit type");
        } catch (OfflineCaptions.RateLimitException expected) {
            counts.metadataResolved(true);
        }
        counts.finished(2, 0, false);
        counts.metadataResolved(false);
        assertFalse(counts.shouldResolve(true));
        assertTrue(counts.summaryKeys().contains("revanced_offline_batch_subtitles_limited"));
        assertEquals(2, counts.skipped);
    }

    @Test public void ordinaryMetadataErrorsAreNotClassifiedAsRateLimits() {
        try {
            OfflineCaptions.checkPlayerStatus(503);
            fail("Non-success metadata status must remain an I/O error");
        } catch (java.io.IOException expected) {
            assertFalse(expected instanceof OfflineCaptions.RateLimitException);
        }
    }
}
