package app.template.extension.aare;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;

import org.junit.Test;

public class VoiceNoteMatchTest {
    private static final long T = 1_700_000_000_000L; // message time

    @Test
    public void notificationDurations() {
        assertEquals(5000, VoiceNoteMatch.statedMs("🎤 Messaggio vocale (0:05)"));
        assertEquals(754_000, VoiceNoteMatch.statedMs("Voice message (12:34)"));
        assertEquals(-1, VoiceNoteMatch.statedMs("Ciao (a casa)"));
        assertEquals(-1, VoiceNoteMatch.statedMs(null));
    }

    @Test
    public void onlyFilesSavedAroundTheMessageBestFirst() {
        long[] modified = {T + 3_000, T - 30_000, T + 2 * 3600_000L, T + 1_000, T - 10 * 60_000L, T + 500};
        long[] sizes = {100, 100, 100, 100, 100, 0};
        // 2 h after and 10 min before: out of the window; the empty file: never.
        assertEquals(Arrays.asList(3, 0, 1), VoiceNoteMatch.candidates(modified, sizes, T));
        assertEquals(Collections.emptyList(), VoiceNoteMatch.candidates(modified, sizes, 0));
    }

    @Test
    public void atMostThreeFilesAreChecked() {
        long[] modified = {T + 1, T + 2, T + 3, T + 4, T + 5};
        long[] sizes = {1, 1, 1, 1, 1};
        assertEquals(3, VoiceNoteMatch.candidates(modified, sizes, T).size());
    }

    @Test
    public void theLengthMustMatchSoASentVoiceNoteIsNeverPlayed() {
        assertTrue(VoiceNoteMatch.lengthMatches(5_400, 5_000));
        assertFalse(VoiceNoteMatch.lengthMatches(12_000, 5_000)); // another voice note
        assertFalse(VoiceNoteMatch.lengthMatches(-1, 5_000)); // unreadable: never
        assertTrue(VoiceNoteMatch.lengthMatches(-1, -1)); // no stated length: time only
    }

    /** A minimal Ogg Opus file: an OpusHead page, then a last page with [granule]. */
    private static byte[] ogg(int preSkip, long granule) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        { byte[] w = page(0); out.write(w, 0, w.length); }
        byte[] head = new byte[19];
        System.arraycopy("OpusHead".getBytes(StandardCharsets.US_ASCII), 0, head, 0, 8);
        head[8] = 1;
        head[9] = 1;
        head[10] = (byte) preSkip;
        head[11] = (byte) (preSkip >> 8);
        { byte[] w = head; out.write(w, 0, w.length); }
        { byte[] w = new byte[300]; out.write(w, 0, w.length); }
        { byte[] w = page(granule); out.write(w, 0, w.length); }
        { byte[] w = new byte[40]; out.write(w, 0, w.length); }
        return out.toByteArray();
    }

    private static byte[] page(long granule) {
        byte[] p = new byte[27];
        System.arraycopy("OggS".getBytes(StandardCharsets.US_ASCII), 0, p, 0, 4);
        for (int k = 0; k < 8; k++) p[6 + k] = (byte) (granule >> (8 * k));
        return p;
    }

    @Test
    public void oggOpusLength() {
        byte[] f = ogg(312, 312 + 5 * 48000L);
        assertEquals(5000, VoiceNoteMatch.oggOpusDurationMs(f, f));
        // Not Ogg Opus: unreadable.
        byte[] junk = new byte[500];
        assertEquals(-1, VoiceNoteMatch.oggOpusDurationMs(junk, junk));
    }
}
