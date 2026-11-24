package app.voidhack.extension.applemusic.lyrics;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

public final class LrclibParserTest {

    @Test
    public void parsesEnglishWordSyncedLyricsfileWithExternalSpaces() {
        String yaml = "version: '1.0'\n"
                + "metadata:\n"
                + "  title: 'Test Track'\n"
                + "  artist: 'Test Artist'\n"
                + "  duration_ms: 185000\n"
                + "  language: 'en'\n"
                + "lines:\n"
                + "  - text: 'Same don''t & <story>'\n"
                + "    start_ms: 1200\n"
                + "    end_ms: 4500\n"
                + "    words:\n"
                + "      - text: 'Same '\n"
                + "        start_ms: 1200\n"
                + "        end_ms: 1800\n"
                + "      - text: 'don''t '\n"
                + "        start_ms: 1800\n"
                + "      - text: '& '\n"
                + "        start_ms: 2600\n"
                + "        end_ms: 3000\n"
                + "      - text: '<story>'\n"
                + "        start_ms: 3000\n"
                + "        end_ms: 4500\n";

        LrclibModels.LyricsRecord rec = new LrclibModels.LyricsRecord(
                8138092L, "Test Track", "Test Artist", "", 185.0, false, true, null, null, yaml);

        LrclibParser.TtmlResult res = LrclibParser.buildTtml(rec, 185, true, true, 0, "ja");
        assertEquals(LrclibModels.LyricsSource.LRCLIB_WORD, res.sourceType);
        assertTrue(res.hasWordTiming);
        assertEquals(1, res.lineCount);
        assertNotNull(res.ttml);
        assertTrue(res.ttml.contains("itunes:timing=\"Word\""));
        assertTrue(res.ttml.contains("xml:lang=\"en\""));
        assertTrue(res.ttml.contains("<body dur=\"03:05.000\">"));
        assertTrue(res.ttml.contains("<ttm:agent type=\"person\" xml:id=\"v1\"/>"));
        assertTrue(res.ttml.contains(
                "<span begin=\"00:01.200\" end=\"00:01.800\">Same</span> "
                        + "<span begin=\"00:01.800\" end=\"00:02.600\">don&apos;t</span> "
                        + "<span begin=\"00:02.600\" end=\"00:03.000\">&amp;</span> "
                        + "<span begin=\"00:03.000\" end=\"00:04.500\">&lt;story&gt;</span>"));
    }

    @Test
    public void usesWordTimingFromLrclibWithIndentlessYamlSequences() {
        String yaml = "version: '1.0'\n"
                + "lines:\n"
                + "- text: First line\n"
                + "  start_ms: 1000\n"
                + "  words:\n"
                + "  - text: 'First '\n"
                + "    start_ms: 1000\n"
                + "  - text: line\n"
                + "    start_ms: 1700\n"
                + "  end_ms: 2300\n"
                + "- text: Second line\n"
                + "  start_ms: 3000\n"
                + "  end_ms: 4200\n"
                + "  words:\n"
                + "  - text: 'Second '\n"
                + "    start_ms: 3000\n"
                + "  - text: line\n"
                + "    start_ms: 3800\n";
        String lrc = "[00:01.00]First line\n[00:03.00]Second line";
        LrclibModels.LyricsRecord rec = new LrclibModels.LyricsRecord(
                1L, "Test Track", "Test Artist", "", 10.0, false, true, null, lrc, yaml);

        LrclibParser.TtmlResult res = LrclibParser.buildTtml(rec, 10, true, true, 0, "en");
        assertEquals(LrclibModels.LyricsSource.LRCLIB_WORD, res.sourceType);
        assertEquals(2, res.lineCount);
        assertTrue(res.ttml.contains("<span begin=\"00:01.000\" end=\"00:01.700\">First</span> "
                + "<span begin=\"00:01.700\" end=\"00:02.300\">line</span>"));
        assertTrue(res.ttml.contains("<span begin=\"00:03.000\" end=\"00:03.800\">Second</span> "
                + "<span begin=\"00:03.800\" end=\"00:04.200\">line</span>"));
    }

    @Test
    public void parsesJapaneseWordSyncedLyricsfileWithoutInsertingSpaces() {
        String yaml = "version: '1.0'\n"
                + "metadata:\n"
                + "  duration_ms: 261000\n"
                + "  language: 'ja'\n"
                + "lines:\n"
                + "  - text: '「さよなら」だけだった'\n"
                + "    start_ms: 4880\n"
                + "    end_ms: 8140\n"
                + "    words:\n"
                + "      - text: '「さよなら」'\n"
                + "        start_ms: 4880\n"
                + "        end_ms: 6320\n"
                + "      - text: 'だけだった'\n"
                + "        start_ms: 6320\n"
                + "        end_ms: 8140\n";

        LrclibModels.LyricsRecord rec = new LrclibModels.LyricsRecord(
                1001L, "夜に駆ける", "YOASOBI", "", 261.0, false, true, null, null, yaml);

        LrclibParser.TtmlResult res = LrclibParser.buildTtml(rec, 261, true, true, 0, "en");
        assertEquals(LrclibModels.LyricsSource.LRCLIB_WORD, res.sourceType);
        assertTrue(res.ttml.contains(
                "<span begin=\"00:04.880\" end=\"00:06.320\">「さよなら」</span>"
                        + "<span begin=\"00:06.320\" end=\"00:08.140\">だけだった</span>"));
    }

    @Test
    public void downgradesWordSyncToLineWhenDisabled() {
        String yaml = "version: '1.0'\n"
                + "lines:\n"
                + "  - text: 'Hello world'\n"
                + "    start_ms: 1000\n"
                + "    end_ms: 3000\n"
                + "    words:\n"
                + "      - text: 'Hello '\n"
                + "        start_ms: 1000\n"
                + "        end_ms: 2000\n"
                + "      - text: 'world'\n"
                + "        start_ms: 2000\n"
                + "        end_ms: 3000\n";
        LrclibModels.LyricsRecord rec = new LrclibModels.LyricsRecord(
                2L, "T", "A", "", 10.0, false, true, null, null, yaml);

        LrclibParser.TtmlResult res = LrclibParser.buildTtml(rec, 10, false, true, 0, "en");
        assertEquals(LrclibModels.LyricsSource.LRCLIB_LINE, res.sourceType);
        assertFalse(res.hasWordTiming);
        assertTrue(res.ttml.contains("itunes:timing=\"Line\""));
        assertFalse(res.ttml.contains("<span"));
    }

    @Test
    public void parsesLrcMultiTimestampEmptyBoundaryAndOffset() {
        String lrc = "[ti:Example]\n"
                + "[offset:100]\n"
                + "[00:10.00][00:30.00]Chorus line\n"
                + "[00:15.00] \n"
                + "[00:25.00]Second verse\n";

        LrclibModels.LyricsRecord rec = new LrclibModels.LyricsRecord(
                3L, "Example", "Artist", "", 60.0, false, false, null, lrc, null);

        // LRC [offset:100] shifts earlier by 100ms; user offset +250ms shifts later by 250ms -> net +150ms.
        LrclibParser.TtmlResult res = LrclibParser.buildTtml(rec, 60, true, true, 250, "en");
        assertEquals(LrclibModels.LyricsSource.LRCLIB_LINE, res.sourceType);
        assertEquals(3, res.lineCount);
        // First line: 10000 - 100 + 250 = 10150, ended by empty boundary at 15000 - 100 + 250 = 15150.
        assertTrue(res.ttml.contains("<p begin=\"00:10.150\" end=\"00:15.150\" ttm:agent=\"v1\" itunes:key=\"L1\">Chorus line</p>"));
        // Empty boundary line itself must NOT become a <p>, leaving a clean gap from 15.150 to 25.150.
        assertTrue(res.ttml.contains("<p begin=\"00:25.150\" end=\"00:30.150\" ttm:agent=\"v1\" itunes:key=\"L2\">Second verse</p>"));
        assertTrue(res.ttml.contains("<p begin=\"00:30.150\" end=\"01:00.250\" ttm:agent=\"v1\" itunes:key=\"L3\">Chorus line</p>"));
    }

    @Test
    public void parsesEnhancedLrcInlineWordTimestamps() {
        String lrc = "[00:05.00]<00:05.00>Hello <00:05.80>beautiful <00:06.90>world\n"
                + "[00:08.50] \n";
        LrclibModels.LyricsRecord rec = new LrclibModels.LyricsRecord(
                4L, "Enh", "Artist", "", 30.0, false, false, null, lrc, null);

        LrclibParser.TtmlResult res = LrclibParser.buildTtml(rec, 30, true, true, 0, "en");
        assertEquals(LrclibModels.LyricsSource.LRCLIB_WORD, res.sourceType);
        assertTrue(res.ttml.contains("<span begin=\"00:05.000\" end=\"00:05.800\">Hello</span> "));
        assertTrue(res.ttml.contains("<span begin=\"00:05.800\" end=\"00:06.900\">beautiful</span> "));
        assertTrue(res.ttml.contains("<span begin=\"00:06.900\" end=\"00:08.500\">world</span>"));
    }

    @Test
    public void clampsNegativeOffsetAndOutOfBoundsWords() {
        String yaml = "version: '1.0'\n"
                + "lines:\n"
                + "  - text: 'Intro'\n"
                + "    start_ms: 300\n"
                + "    end_ms: 800\n"
                + "    words:\n"
                + "      - text: 'Intro'\n"
                + "        start_ms: 200\n"
                + "        end_ms: 950\n";
        LrclibModels.LyricsRecord rec = new LrclibModels.LyricsRecord(
                5L, "T", "A", "", 10.0, false, true, null, null, yaml);

        LrclibParser.TtmlResult res = LrclibParser.buildTtml(rec, 10, true, true, -500, "en");
        assertEquals(LrclibModels.LyricsSource.LRCLIB_WORD, res.sourceType);
        assertTrue(res.ttml.contains("<p begin=\"00:00.000\" end=\"00:00.300\""));
        assertTrue(res.ttml.contains("<span begin=\"00:00.000\" end=\"00:00.300\">Intro</span>"));
    }

    @Test
    public void parsesPlainMultiSectionAndRespectsAllowPlainFalse() {
        String plain = "Verse 1 line 1\nVerse 1 line 2\n\nChorus line 1\n";
        LrclibModels.LyricsRecord rec = new LrclibModels.LyricsRecord(
                6L, "Plain", "Artist", "", 120.0, false, false, plain, null, null);

        LrclibParser.TtmlResult allowed = LrclibParser.buildTtml(rec, 120, true, true, 0, "en");
        assertEquals(LrclibModels.LyricsSource.LRCLIB_PLAIN, allowed.sourceType);
        assertEquals(3, allowed.lineCount);
        assertTrue(allowed.ttml.contains("itunes:timing=\"None\""));
        assertTrue(allowed.ttml.contains("<div><p ttm:agent=\"v1\" itunes:key=\"L1\">Verse 1 line 1</p>"
                + "<p ttm:agent=\"v1\" itunes:key=\"L2\">Verse 1 line 2</p></div>"
                + "<div><p ttm:agent=\"v1\" itunes:key=\"L3\">Chorus line 1</p></div>"));

        LrclibParser.TtmlResult blocked = LrclibParser.buildTtml(rec, 120, true, false, 0, "en");
        assertEquals(LrclibModels.LyricsSource.NONE, blocked.sourceType);
        assertNull(blocked.ttml);
    }

    @Test
    public void parsesPlainOnlyLyricsfileYamlBlock() {
        String yaml = "version: '1.0'\n"
                + "metadata:\n"
                + "  duration_ms: 355000\n"
                + "  language: 'en'\n"
                + "lines: []\n"
                + "plain: |-\n"
                + "  Is this the real life?\n"
                + "  Is this just fantasy?\n";
        LrclibModels.LyricsRecord rec = new LrclibModels.LyricsRecord(
                7L, "Bohemian Rhapsody", "Queen", "", 355.0, false, false, null, null, yaml);

        LrclibParser.TtmlResult res = LrclibParser.buildTtml(rec, 355, true, true, 0, "ja");
        assertEquals(LrclibModels.LyricsSource.LRCLIB_PLAIN, res.sourceType);
        assertEquals(2, res.lineCount);
        assertTrue(res.ttml.contains("Is this the real life?"));
        assertTrue(res.ttml.contains("Is this just fantasy?"));
    }

    @Test
    public void handlesInstrumentalRecord() {
        LrclibModels.LyricsRecord rec = new LrclibModels.LyricsRecord(
                8L, "Inst", "Artist", "", 200.0, true, false, null, null, null);
        LrclibParser.TtmlResult res = LrclibParser.buildTtml(rec, 200, true, true, 0, "en");
        assertEquals(LrclibModels.LyricsSource.LRCLIB_INSTRUMENTAL, res.sourceType);
        assertNull(res.ttml);
    }
}
