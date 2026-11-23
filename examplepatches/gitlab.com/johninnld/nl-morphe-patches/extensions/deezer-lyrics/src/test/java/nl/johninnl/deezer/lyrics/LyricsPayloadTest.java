package nl.johninnl.deezer.lyrics;

import org.junit.Test;
import static org.junit.Assert.*;

public class LyricsPayloadTest {
    @Test public void fractionsMultipleTagsOrderingAndBlankGapsHaveMillisecondMeaning() {
        LyricsPayload p = LyricsPayload.normalize(7, false, null,
                "[ar:Synthetic artist]\n[00:17.11]First\n[00:03.2][00:40:005]Repeated\n[00:20.111]\n[00:17.110]First", 60);
        assertNotNull(p);
        assertTrue(p.synchronizedLines());
        assertEquals(4, p.lines.size());
        assertEquals(3200, p.lines.get(0).startMs);
        assertEquals(17110, p.lines.get(1).startMs);
        assertEquals(20111, p.lines.get(1).endMs);
        assertEquals("", p.lines.get(2).text);
        assertEquals(40005, p.lines.get(3).startMs);
        assertEquals(60000, p.lines.get(3).endMs);
        assertEquals("lrclib:7", p.providerIdentity());
    }

    @Test public void malformedTimingRetainsPlainTextWithoutInventingSynchronization() {
        for (String lrc : new String[]{"[00:99.10]Bad", "[00:01.00]Good\n[broken]Bad", "[99:00.00]Out of range",
                "[offset:500]\n[00:01.00]Offset", "[00:01.00]Good\nUntimed line"}) {
            LyricsPayload p = LyricsPayload.normalize(9, false, "Known plain\r\nSecond line", lrc, 120);
            assertNotNull(p);
            assertEquals("Known plain\nSecond line", p.plainText);
            assertFalse(p.synchronizedLines());
        }
    }

    @Test public void plainPayloadCanContainMetadataButDoesNotRenderTags() {
        LyricsPayload p = LyricsPayload.normalize(3, false, "[ti:Synthetic]\n[offset:0]\n\ufeffOne\r\n\r\nTwo", null, 60);
        assertEquals("One\n\nTwo", p.plainText);
        assertFalse(p.synchronizedLines());
    }

    @Test public void duetLinesAtTheSameTimeMergeWithoutLosingWords() {
        LyricsPayload p = LyricsPayload.normalize(4, false, null,
                "[00:01.0]<00:01.0>Voice one\n[00:01.000]Voice two\n[00:02.0]End", 3);
        assertEquals(2, p.lines.size());
        assertEquals("Voice one\nVoice two", p.lines.get(0).text);
        assertEquals(2000, p.lines.get(0).endMs);
    }

    @Test public void instrumentalEmptyAndMetadataOnlyCannotAdvertiseLyrics() {
        assertNull(LyricsPayload.normalize(1, true, "Ignored", "[00:01.0]Ignored", 60));
        assertNull(LyricsPayload.normalize(1, false, " \n ", "[ar:Only metadata]\n[00:00.00]", 60));
        assertNull(LyricsPayload.normalize(0, false, "Words", null, 60));
        assertNull(LyricsPayload.normalize(1, false, "Words", null, Double.NaN));
    }
}
