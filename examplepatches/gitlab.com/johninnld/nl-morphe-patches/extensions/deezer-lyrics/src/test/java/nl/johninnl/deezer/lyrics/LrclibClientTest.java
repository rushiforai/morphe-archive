package nl.johninnl.deezer.lyrics;

import org.json.JSONObject;
import org.junit.Test;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import static org.junit.Assert.*;

public class LrclibClientTest {
    private static TrackSignature track() { return new TrackSignature("native-opaque-id", "Choosin' Texas", "Ella Langley", "Album", 231); }
    private static JSONObject record() throws Exception {
        return new JSONObject().put("id", 7).put("trackName", "Choosin’ Texas").put("artistName", "Ella Langley")
                .put("albumName", "-").put("duration", 231).put("instrumental", false)
                .put("plainLyrics", "Synthetic test line").put("syncedLyrics", "[00:17.11]Synthetic test line")
                .put("lyricsfile", "this YAML is deliberately ignored").put("hasWordSync", true);
    }

    @Test public void signaturePreservesTheApostropheAndNeverTransmitsNativeIdentity() throws Exception {
        String query = track().query();
        assertTrue(query.contains("track_name=Choosin%27+Texas"));
        assertFalse(query.contains("native-opaque-id"));
        assertTrue(URLDecoder.decode(query, StandardCharsets.UTF_8.name()).contains("Choosin' Texas"));
    }

    @Test public void matchingRecordMapsLrcAndIgnoresTheDistinctYamlFormat() throws Exception {
        LyricsPayload p = LrclibClient.decode(track(), record().toString());
        assertNotNull(p);
        assertEquals(17110, p.lines.get(0).startMs);
        assertTrue(p.synchronizedLines());
        assertTrue(p.attribution().contains("LRCLIB"));
    }

    @Test public void wrongArtistEditAlbumAndDurationNeverBecomeAvailable() throws Exception {
        assertNull(LrclibClient.decode(track(), record().put("artistName", "Someone else").toString()));
        assertNull(LrclibClient.decode(track(), record().put("trackName", "Choosin' Texas (Live)").toString()));
        assertNull(LrclibClient.decode(track(), record().put("albumName", "Conflicting Album").toString()));
        assertNull(LrclibClient.decode(track(), record().put("duration", 233.01).toString()));
        assertNotNull(LrclibClient.decode(track(), record().put("duration", 233).toString()));
    }

    @Test public void missingInstrumentalOrEmptyPayloadIsNotAvailability() throws Exception {
        assertNull(LrclibClient.decode(track(), record().put("instrumental", true).toString()));
        JSONObject missing = record(); missing.remove("instrumental");
        assertNull(LrclibClient.decode(track(), missing.toString()));
        assertNull(LrclibClient.decode(track(), record().put("plainLyrics", JSONObject.NULL).put("syncedLyrics", JSONObject.NULL).toString()));
    }

    @Test public void reportedMeesSalomeMetadataMatchesRegardlessOfWordSyncFlag() throws Exception {
        String[][] examples = {
            {"31883328", "Into The Light", "Into The Light", "226", "226"},
            {"29786423", "Just Thoughts", "Big Thoughts Like Elephants", "211", "210"},
            {"1", "All Of You", "All Of You / Beyond Us", "299", "299"},
            {"12766888", "Fool's Paradise", "Fool's Paradise", "248", "248"}
        };
        for (String[] sample : examples) {
            TrackSignature track = TrackSignature.fromMillis("local-" + sample[0], sample[1], "Mees Salomé",
                    sample[2], Long.parseLong(sample[4]) * 1000);
            assertNotNull(track);
            JSONObject body = new JSONObject().put("id", Long.parseLong(sample[0])).put("trackName", sample[1])
                    .put("artistName", "Mees Salomé").put("albumName", sample[2])
                    .put("duration", Integer.parseInt(sample[3])).put("instrumental", false)
                    .put("plainLyrics", "Synthetic line").put("syncedLyrics", "[00:01.00]Synthetic line");
            for (boolean wordSync : new boolean[]{false, true}) {
                LyricsPayload payload = LrclibClient.decode(track, body.put("hasWordSync", wordSync).toString());
                assertNotNull(sample[1], payload);
                assertTrue(payload.synchronizedLines());
                assertEquals(1000, payload.lines.get(0).startMs);
            }
        }
    }

    @Test public void retryAfterHasNoShortCapAndAddsOnlyPositiveJitter() {
        assertEquals(120000, LrclibClient.retryDelay("120", 0, 0, 30000));
        assertEquals(156000, LrclibClient.retryDelay("120", 0, 1, 30000));
        assertEquals(3600000, LrclibClient.retryDelay("3600", 0, 0, 30000));
        assertEquals(120000, LrclibClient.retryDelay("Thu, 01 Jan 1970 00:02:00 GMT", 0, 0, 30000));
        assertEquals(30000, LrclibClient.retryDelay("not a time", 0, 0, 30000));
    }
}
