package nl.johninnl.deezer.lyrics;

import org.json.JSONArray;
import org.junit.Test;
import static org.junit.Assert.*;

public class DeezerLyricFormatTest {
    @Test public void pipeJsonUsesNativeCamelCaseMillisecondsAndIntervalDurations() throws Exception {
        LyricsPayload payload = LyricsPayload.normalize(7, false, null, "[00:17.11]Synthetic first\n[00:19.2]Synthetic next", 60);
        JSONArray json = new JSONArray(DeezerLyricFormat.pipeSyncJson(payload));
        assertEquals(2, json.length());
        assertEquals(17110, json.getJSONObject(0).getInt("milliseconds"));
        assertEquals(2090, json.getJSONObject(0).getInt("duration"));
        assertEquals("[00:17.110]", json.getJSONObject(0).getString("lrcTimestamp"));
        assertTrue(json.getJSONObject(0).isNull("lineTranslated"));
        assertArrayEquals(new int[]{17110,19200}, DeezerLyricFormat.times(payload));
        assertEquals("Synthetic first", DeezerLyricFormat.texts(payload)[0]);
    }
    @Test public void plainTextHasNoSyntheticSynchronization() {
        LyricsPayload payload = LyricsPayload.normalize(7, false, "First\n\nSecond", null, 60);
        assertNull(DeezerLyricFormat.pipeSyncJson(payload));
        assertArrayEquals(new int[]{-1,-1,-1}, DeezerLyricFormat.times(payload));
        assertArrayEquals(new String[]{"First","","Second"}, DeezerLyricFormat.texts(payload));
    }
    @Test public void emptyNativeSyncPayloadsDoNotAdvertiseLyrics() {
        assertFalse(DeezerLyricFormat.usableNativeSync(null));
        assertFalse(DeezerLyricFormat.usableNativeSync("null"));
        assertFalse(DeezerLyricFormat.usableNativeSync("[]"));
        assertFalse(DeezerLyricFormat.usableNativeSync("[{\"line\":\"  \"}]"));
        assertTrue(DeezerLyricFormat.usableNativeSync("[{\"line\":\"Synthetic line\"}]"));
    }
}
