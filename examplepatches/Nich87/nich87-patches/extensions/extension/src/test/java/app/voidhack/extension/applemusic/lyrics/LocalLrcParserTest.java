package app.voidhack.extension.applemusic.lyrics;

import org.junit.Test;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

public final class LocalLrcParserTest {

    @Test
    public void decodesUtf8BomShiftJisAndUtf16AndRejectsBinary() {
        String sample = "[ti:夜に駆ける]\n[00:01.00]沈むように溶けてゆくように\n";

        byte[] utf8 = sample.getBytes(StandardCharsets.UTF_8);
        byte[] utf8Bom = new byte[utf8.length + 3];
        utf8Bom[0] = (byte) 0xEF;
        utf8Bom[1] = (byte) 0xBB;
        utf8Bom[2] = (byte) 0xBF;
        System.arraycopy(utf8, 0, utf8Bom, 3, utf8.length);
        LocalLrcParser.DecodedText decUtf8Bom = LocalLrcParser.decodeBytes(utf8Bom);
        assertNotNull(decUtf8Bom);
        assertEquals("UTF-8", decUtf8Bom.charsetName);
        assertEquals(sample, decUtf8Bom.text);

        byte[] sjis = sample.getBytes(Charset.forName("windows-31j"));
        LocalLrcParser.DecodedText decSjis = LocalLrcParser.decodeBytes(sjis);
        assertNotNull(decSjis);
        assertEquals(sample, decSjis.text);

        byte[] utf16lePayload = sample.getBytes(StandardCharsets.UTF_16LE);
        byte[] utf16leBom = new byte[utf16lePayload.length + 2];
        utf16leBom[0] = (byte) 0xFF;
        utf16leBom[1] = (byte) 0xFE;
        System.arraycopy(utf16lePayload, 0, utf16leBom, 2, utf16lePayload.length);
        LocalLrcParser.DecodedText decUtf16 = LocalLrcParser.decodeBytes(utf16leBom);
        assertNotNull(decUtf16);
        assertEquals("UTF-16LE", decUtf16.charsetName);
        assertEquals(sample, decUtf16.text);

        byte[] binary = new byte[]{0x00, 0x01, 0x02, 0x7F, (byte) 0x89, 0x50, 0x4E, 0x47};
        assertNull(LocalLrcParser.decodeBytes(binary));
    }

    @Test
    public void preparesSyncedLineLocalLrcWithMetadataAndOffset() {
        String lrc = "[ti:夜に駆ける]\n"
                + "[ar:YOASOBI]\n"
                + "[al:THE BOOK]\n"
                + "[la:ja]\n"
                + "[length:04:21]\n"
                + "[00:04.88]沈むように溶けてゆくように\n"
                + "[00:08.50]二人だけの空が広がる夜に\n";

        LocalLrcParser.LrcMetadata meta = LocalLrcParser.parseMetadata(lrc);
        assertEquals("夜に駆ける", meta.title);
        assertEquals("YOASOBI", meta.artist);
        assertEquals("THE BOOK", meta.album);
        assertEquals("ja", meta.language);
        assertEquals(261, meta.durationSec);
        assertTrue(meta.hasSyncedTimestamps);

        LrclibParser.PreparedRecord prep = LocalLrcParser.prepareLocalLrc(lrc, 0, true, false);
        assertEquals(LrclibModels.LyricsSource.LOCAL_LINE, prep.sourceType);
        assertNotNull(prep.parsed);
        assertEquals(2, prep.parsed.lines.size());

        LrclibParser.TtmlResult ttml = LrclibParser.renderPrepared(prep, 200, "en", null);
        assertEquals(LrclibModels.LyricsSource.LOCAL_LINE, ttml.sourceType);
        assertNotNull(ttml.ttml);
        assertTrue(ttml.ttml.contains("itunes:timing=\"Line\""));
        assertTrue(ttml.ttml.contains("xml:lang=\"ja\""));
        assertTrue(ttml.ttml.contains("<p begin=\"00:05.080\" end=\"00:08.700\""));
    }

    @Test
    public void preparesWordSyncedEnhancedAndInlineBracketLocalLrc() {
        String inlineBracket = "[00:10.00]さ[00:10.30]よ[00:10.60]な[00:10.90]ら[00:11.50]\n"
                + "[00:13.00]また会おう[00:15.20]\n";

        LrclibParser.PreparedRecord wordPrep = LocalLrcParser.prepareLocalLrc(inlineBracket, 60, true, false);
        assertEquals(LrclibModels.LyricsSource.LOCAL_WORD, wordPrep.sourceType);
        LrclibParser.TtmlResult wordTtml = LrclibParser.renderPrepared(wordPrep, 0, "ja", null);
        assertEquals(LrclibModels.LyricsSource.LOCAL_WORD, wordTtml.sourceType);
        assertTrue(wordTtml.ttml.contains("itunes:timing=\"Word\""));
        assertTrue(wordTtml.ttml.contains("<span begin=\"00:10.000\" end=\"00:10.300\">さ</span>"
                + "<span begin=\"00:10.300\" end=\"00:10.600\">よ</span>"
                + "<span begin=\"00:10.600\" end=\"00:10.900\">な</span>"
                + "<span begin=\"00:10.900\" end=\"00:11.500\">ら</span>"));
        assertTrue(wordTtml.ttml.contains("<p begin=\"00:13.000\" end=\"00:15.200\""));
        assertTrue(wordTtml.ttml.contains(">また会おう</span>"));

        // When word sync is disabled, inline tags must still be cleanly stripped into line-synced text.
        LrclibParser.PreparedRecord linePrep = LocalLrcParser.prepareLocalLrc(inlineBracket, 60, false, false);
        assertEquals(LrclibModels.LyricsSource.LOCAL_LINE, linePrep.sourceType);
        LrclibParser.TtmlResult lineTtml = LrclibParser.renderPrepared(linePrep, 0, "ja", null);
        assertTrue(lineTtml.ttml.contains("<p begin=\"00:10.000\" end=\"00:11.500\" ttm:agent=\"v1\" itunes:key=\"L1\">さよなら</p>"));
        assertTrue(lineTtml.ttml.contains("<p begin=\"00:13.000\" end=\"00:15.200\" ttm:agent=\"v1\" itunes:key=\"L2\">また会おう</p>"));
    }

    @Test
    public void preparesUnsyncedLocalLrcWithHeadersAndStanzas() {
        String unsyncedLrc = "[ti:Example Song]\n"
                + "[ar:Example Artist]\n"
                + "[by:User]\n"
                + "\n"
                + "[Verse 1]\n"
                + "First line of lyrics\n"
                + "Second line of lyrics\n"
                + "\n"
                + "[Chorus]\n"
                + "Chorus line\n";

        LocalLrcParser.LrcMetadata meta = LocalLrcParser.parseMetadata(unsyncedLrc);
        assertEquals("Example Song", meta.title);
        assertEquals("Example Artist", meta.artist);
        assertFalse(meta.hasSyncedTimestamps);

        LrclibParser.PreparedRecord prep = LocalLrcParser.prepareLocalLrc(unsyncedLrc, 180, true, false);
        assertEquals(LrclibModels.LyricsSource.LOCAL_PLAIN, prep.sourceType);
        LrclibParser.TtmlResult ttml = LrclibParser.renderPrepared(prep, 0, "en", null);
        assertEquals(LrclibModels.LyricsSource.LOCAL_PLAIN, ttml.sourceType);
        assertTrue(ttml.ttml.contains("itunes:timing=\"None\""));
        assertFalse(ttml.ttml.contains("Example Artist"));
        assertTrue(ttml.ttml.contains("[Verse 1]"));
        assertTrue(ttml.ttml.contains("[Chorus]"));
        assertTrue(ttml.ttml.contains("</div><div>"));
    }

    @Test
    public void canForceSyncedLrcIntoUnsyncedPlainMode() {
        String syncedLrc = "[ti:Test]\n"
                + "[00:01.00][00:20.00]Chorus\n"
                + "[00:10.00]Verse line\n";

        LrclibParser.PreparedRecord prep = LocalLrcParser.prepareLocalLrc(syncedLrc, 60, true, true);
        assertEquals(LrclibModels.LyricsSource.LOCAL_PLAIN, prep.sourceType);
        LrclibParser.TtmlResult ttml = LrclibParser.renderPrepared(prep, 0, "en", null);
        assertEquals(LrclibModels.LyricsSource.LOCAL_PLAIN, ttml.sourceType);
        assertTrue(ttml.ttml.contains("itunes:timing=\"None\""));
        assertTrue(ttml.ttml.contains("itunes:key=\"L1\">Chorus</p>"));
        assertTrue(ttml.ttml.contains("itunes:key=\"L2\">Verse line</p>"));
        assertTrue(ttml.ttml.contains("itunes:key=\"L3\">Chorus</p>"));
    }

    @Test
    public void preparesPlainPastedJapaneseLyricsWithoutTimestamps() {
        String pasted = "夜空に光る星を見上げて\r\n"
                + "静かな風が頬をなでる\r\n"
                + "\r\n"
                + "明日もきっと歩けるから\r\n";

        LocalLrcParser.LrcMetadata meta = LocalLrcParser.parseMetadata(pasted);
        assertFalse(meta.hasSyncedTimestamps);
        assertFalse(meta.hasAnyTag());

        LrclibParser.PreparedRecord prep = LocalLrcParser.prepareLocalLrc(pasted, 210, true, false);
        assertEquals(LrclibModels.LyricsSource.LOCAL_PLAIN, prep.sourceType);
        assertNotNull(prep.parsed);
        assertEquals(3, prep.parsed.lines.size());

        LrclibParser.TtmlResult ttml = LrclibParser.renderPrepared(prep, 0, "ja", null);
        assertEquals(LrclibModels.LyricsSource.LOCAL_PLAIN, ttml.sourceType);
        assertNotNull(ttml.ttml);
        assertTrue(ttml.ttml.contains("itunes:timing=\"None\""));
        assertTrue(ttml.ttml.contains("夜空に光る星を見上げて"));
        assertTrue(ttml.ttml.contains("明日もきっと歩けるから"));
    }
}
