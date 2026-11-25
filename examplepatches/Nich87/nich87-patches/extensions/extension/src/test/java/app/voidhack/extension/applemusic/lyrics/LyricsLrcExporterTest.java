package app.voidhack.extension.applemusic.lyrics;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public final class LyricsLrcExporterTest {
    private static final String TTML_NS = "http://www.w3.org/ns/ttml";
    private static final String APPLE_NS = "http://music.apple.com/lyric-ttml-internal";
    private static final String TTM_NS = "http://www.w3.org/ns/ttml#metadata";

    @Test
    public void exportsWordSyncedTtmlToEnhancedAndLineLrcAndRoundTrips() {
        String ttml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                + "<tt xmlns=\"" + TTML_NS + "\" xmlns:ttm=\"" + TTM_NS + "\" xmlns:itunes=\"" + APPLE_NS + "\" "
                + "itunes:timing=\"Word\" xml:lang=\"ja\">"
                + "<body dur=\"04:21.000\"><div>"
                + "<p begin=\"00:04.880\" end=\"00:08.140\" itunes:key=\"L1\">"
                + "<span begin=\"00:04.880\" end=\"00:06.320\">「さよなら」</span>"
                + "<span begin=\"00:06.320\" end=\"00:08.140\">だけだった</span>"
                + "</p>"
                + "<p begin=\"00:12.000\" end=\"00:14.500\" itunes:key=\"L2\">"
                + "<span begin=\"00:12.000\" end=\"00:13.000\">Hello</span> "
                + "<span begin=\"00:13.000\" end=\"00:14.500\">world</span>"
                + "</p>"
                + "</div></body></tt>";

        LrclibModels.TrackQuery query = new LrclibModels.TrackQuery(
                "1492578223", 1492578223L, 1L, "夜に駆ける", "YOASOBI", "THE BOOK", 261, true, false);

        LyricsLrcExporter.Capabilities caps = LyricsLrcExporter.inspect(ttml);
        assertTrue(caps.hasLineTiming);
        assertTrue(caps.hasWordTiming);
        assertEquals(2, caps.lineCount);
        assertEquals(LyricsLrcExporter.Format.LINE_SYNCED, caps.defaultFormat());

        String wordLrc = LyricsLrcExporter.export(ttml, query, LyricsLrcExporter.Format.WORD_SYNCED);
        assertTrue(wordLrc.contains("[ti:夜に駆ける]"));
        assertTrue(wordLrc.contains("[ar:YOASOBI]"));
        assertTrue(wordLrc.contains("[al:THE BOOK]"));
        assertTrue(wordLrc.contains("[length:04:21]"));
        assertTrue(wordLrc.contains("[la:ja]"));
        assertTrue(wordLrc.contains("[00:04.88]<00:04.88>「さよなら」<00:06.32>だけだった<00:08.14>"));
        assertTrue(wordLrc.contains("[00:12.00]<00:12.00>Hello <00:13.00>world<00:14.50>"));

        // Round-trip the exported Enhanced LRC back into LocalLrcParser -> must preserve word timings cleanly.
        LrclibParser.PreparedRecord roundTrip = LocalLrcParser.prepareLocalLrc(wordLrc, 261, true, false);
        assertEquals(LrclibModels.LyricsSource.LOCAL_WORD, roundTrip.sourceType);
        assertNotNull(roundTrip.parsed);
        assertEquals(2, roundTrip.parsed.lines.size());
        assertEquals("「さよなら」だけだった", roundTrip.parsed.lines.get(0).text);
        assertEquals("Hello world", roundTrip.parsed.lines.get(1).text);
        assertEquals(2, roundTrip.parsed.lines.get(0).words.size());
        assertEquals(4880, roundTrip.parsed.lines.get(0).words.get(0).startMs);
        assertEquals(8140, roundTrip.parsed.lines.get(0).endMs);

        // Standard line-synced LRC includes empty end-boundary for the >2s instrumental gap and final line.
        String lineLrc = LyricsLrcExporter.export(ttml, query, LyricsLrcExporter.Format.LINE_SYNCED);
        assertTrue(lineLrc.contains("[00:04.88]「さよなら」だけだった\n[00:08.14]\n"));
        assertTrue(lineLrc.contains("[00:12.00]Hello world\n[00:14.50]\n"));
        assertFalse(lineLrc.contains("<00:"));
    }

    @Test
    public void exportsUnsyncedTtmlWithStanzaBreaks() {
        String ttml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                + "<tt xmlns=\"" + TTML_NS + "\" xmlns:itunes=\"" + APPLE_NS + "\" "
                + "itunes:timing=\"None\" xml:lang=\"en\">"
                + "<body dur=\"03:00.000\">"
                + "<div><p itunes:key=\"L1\">Verse line 1</p><p itunes:key=\"L2\">Verse line 2</p></div>"
                + "<div><p itunes:key=\"L3\">Chorus line 1</p></div>"
                + "</body></tt>";
        LrclibModels.TrackQuery query = new LrclibModels.TrackQuery(
                "1", 1L, 1L, "Test Song", "Test Artist", "", 180, true, false);

        LyricsLrcExporter.Capabilities caps = LyricsLrcExporter.inspect(ttml);
        assertFalse(caps.hasLineTiming);
        assertFalse(caps.hasWordTiming);
        assertEquals(LyricsLrcExporter.Format.UNSYNCED, caps.defaultFormat());

        String exported = LyricsLrcExporter.export(ttml, query, LyricsLrcExporter.Format.LINE_SYNCED);
        assertTrue(exported.contains("[ti:Test Song]\n[ar:Test Artist]\n[length:03:00]\n[la:en]\n\n"));
        assertTrue(exported.contains("Verse line 1\nVerse line 2\n\nChorus line 1\n"));
    }

    @Test
    public void exportsBackingVocalsAndSanitizesSuggestedFileNames() {
        String ttml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                + "<tt xmlns=\"" + TTML_NS + "\" xmlns:ttm=\"" + TTM_NS + "\" xmlns:itunes=\"" + APPLE_NS + "\" "
                + "itunes:timing=\"Line\" xml:lang=\"en\">"
                + "<body dur=\"01:00.000\"><div>"
                + "<p begin=\"00:01.000\" end=\"00:03.000\">Main vocal"
                + "<span ttm:role=\"x-bg\" begin=\"00:02.000\" end=\"00:03.500\">Ooh yeah</span>"
                + "</p></div></body></tt>";
        LrclibModels.TrackQuery query = new LrclibModels.TrackQuery(
                "2", 2L, 1L, "A/B: C?*", "Artist \"One\"", "", 60, true, false);

        String lineLrc = LyricsLrcExporter.export(ttml, query, LyricsLrcExporter.Format.LINE_SYNCED);
        assertTrue(lineLrc.contains("[00:01.00]Main vocal"));
        assertTrue(lineLrc.contains("[00:02.00](Ooh yeah)"));
        assertEquals("Artist _One_ - A_B_ C_.lrc", LyricsLrcExporter.suggestFileName(query));
    }
}
