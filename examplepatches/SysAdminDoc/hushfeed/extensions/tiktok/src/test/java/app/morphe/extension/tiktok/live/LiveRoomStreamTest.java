package app.morphe.extension.tiktok.live;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import app.morphe.extension.tiktok.download.LiveRecorder;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.LinkedHashMap;
import java.util.Map;

/** #37: choosing what to record from a room's own stream fields. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "en")
public class LiveRoomStreamTest {
    private static final String JSON = "{\"common\":{},\"data\":{"
            + "\"sd\":{\"main\":{\"flv\":\"https://p.example.com/sd.flv\",\"hls\":\"https://p.example.com/sd.m3u8\"}},"
            + "\"hd\":{\"main\":{\"flv\":\"https://p.example.com/hd.flv\",\"hls\":\"https://p.example.com/hd.m3u8\"}},"
            + "\"ao\":{\"main\":{\"flv\":\"https://p.example.com/ao.flv\"}},"
            + "\"origin\":{\"main\":{\"flv\":\"https://p.example.com/o.flv\",\"hls\":\"https://p.example.com/o.m3u8\"}}}}";

    @Test public void theBestFlvIsChosenAndAudioOnlyNever() {
        LiveRoomStream.Pick pick = LiveRoomStream.choose(JSON, null, null, null, null, "someone", "123");
        assertNull(pick.problem);
        assertEquals("https://p.example.com/o.flv", pick.target.url);
        assertEquals(LiveRecorder.Transport.FLV, pick.target.transport);
        assertEquals("origin", pick.target.quality);
        assertEquals("someone", pick.target.creator);
        assertEquals("123", pick.target.room);
    }

    @Test public void theQualityBeingWatchedIsChosenWhenTheStreamHasIt() {
        LiveRoomStream.Pick pick = LiveRoomStream.choose(JSON, null, null, null, "hd", null, null);
        assertEquals("https://p.example.com/hd.flv", pick.target.url);
        LiveRoomStream.Pick missing = LiveRoomStream.choose(JSON, null, null, null, "ld", null, null);
        assertEquals("a quality the stream lacks falls to the best", "origin", missing.target.quality);
    }

    /** #203: the LIVE recording quality choice, watching hd. */
    @Test public void theRecordingQualityChoiceOverridesTheQualityBeingWatched() {
        assertEquals("hd", LiveRoomStream.choose(JSON, null, null, null,
                LiveRoomStream.forRecording("room", "hd"), null, null).target.quality);
        assertEquals("origin", LiveRoomStream.choose(JSON, null, null, null,
                LiveRoomStream.forRecording("highest", "hd"), null, null).target.quality);
        LiveRoomStream.Pick lowest = LiveRoomStream.choose(JSON, null, null, null,
                LiveRoomStream.forRecording("lowest", "hd"), null, null);
        assertEquals("audio only is never the smallest", "sd", lowest.target.quality);
        assertEquals("https://p.example.com/sd.flv", lowest.target.url);
        assertNull("an unread choice records what's being watched, or the best",
                LiveRoomStream.forRecording(null, null));
    }

    private static final String ALL = "{\"data\":{"
            + "\"origin\":{\"main\":{\"flv\":\"https://p.example.com/origin.flv\"}},"
            + "\"uhd\":{\"main\":{\"flv\":\"https://p.example.com/uhd.flv\"}},"
            + "\"hd\":{\"main\":{\"flv\":\"https://p.example.com/hd.flv\"}},"
            + "\"sd\":{\"main\":{\"flv\":\"https://p.example.com/sd.flv\"}},"
            + "\"ld\":{\"main\":{\"flv\":\"https://p.example.com/ld.flv\"}},"
            + "\"ao\":{\"main\":{\"flv\":\"https://p.example.com/ao.flv\"}}}}";

    private static String preset(String json, String choice) {
        return LiveRoomStream.choose(json, null, null, null,
                LiveRoomStream.forRecording(choice, "ld"), null, null).target.quality;
    }

    private static String room(String... keys) {
        StringBuilder json = new StringBuilder("{\"data\":{");
        for (int i = 0; i < keys.length; i++) {
            if (i > 0) json.append(',');
            json.append('"').append(keys[i]).append("\":{\"main\":{\"flv\":\"https://p.example.com/")
                    .append(keys[i]).append(".flv\"}}");
        }
        return json.append("}}").toString();
    }

    /** #203: each of the room's own presets records that stream when the room has it. */
    @Test public void eachPresetRecordsItsOwnStream() {
        for (String key : new String[]{"origin", "uhd", "hd", "sd", "ld"}) {
            assertEquals(key, preset(ALL, key));
        }
    }

    @Test public void aMissingPresetFallsToTheNearestBelowThenAbove() {
        assertEquals("below first", "sd", preset(room("origin", "sd", "ld"), "hd"));
        assertEquals("the closest below, not the lowest", "hd", preset(room("origin", "hd", "ld"), "uhd"));
        assertEquals("nothing below, so the nearest above", "hd", preset(room("origin", "hd"), "ld"));
        assertEquals("only the top exists", "origin", preset(room("origin", "ao"), "sd"));
        assertEquals("only the bottom exists", "ld", preset(room("ld"), "origin"));
    }

    @Test public void aPresetNeverRecordsAudioOnly() {
        assertEquals("ld", preset(room("ao", "ld"), "hd"));
        LiveRoomStream.Pick onlyAudio = LiveRoomStream.choose(room("ao"), null, null, null,
                LiveRoomStream.forRecording("hd", null), null, null);
        assertNull(onlyAudio.target);
        assertNotNull(onlyAudio.problem);
    }

    @Test public void aPresetAlsoFallsBackOnHls() {
        Map<String, String> hls = new LinkedHashMap<>();
        hls.put("origin", "https://p.example.com/o.m3u8");
        hls.put("ld", "https://p.example.com/l.m3u8");
        LiveRoomStream.Pick pick = LiveRoomStream.choose(null, null, hls, null,
                LiveRoomStream.forRecording("sd", null), null, null);
        assertEquals(LiveRecorder.Transport.HLS, pick.target.transport);
        assertEquals("ld", pick.target.quality);
    }

    @Test public void lowestPrefersAKnownSmallStreamToAnUnknownKey() {
        Map<String, String> flv = new LinkedHashMap<>();
        flv.put("ld", "https://p.example.com/ld.flv");
        flv.put("xx", "https://p.example.com/xx.flv");
        flv.put("hd", "https://p.example.com/hd.flv");
        assertEquals("ld", LiveRoomStream.choose(null, flv, null, null, LiveRoomStream.LOWEST, null, null).target.quality);
        Map<String, String> unknownOnly = new LinkedHashMap<>();
        unknownOnly.put("xx", "https://p.example.com/xx.flv");
        assertEquals("xx", LiveRoomStream.choose(null, unknownOnly, null, null, LiveRoomStream.LOWEST, null, null).target.quality);
        Map<String, String> hls = new LinkedHashMap<>();
        hls.put("hd", "https://p.example.com/hd.m3u8");
        hls.put("ld", "https://p.example.com/ld.m3u8");
        LiveRoomStream.Pick hlsOnly = LiveRoomStream.choose(null, null, hls, null, LiveRoomStream.LOWEST, null, null);
        assertEquals(LiveRecorder.Transport.HLS, hlsOnly.target.transport);
        assertEquals("ld", hlsOnly.target.quality);
    }

    @Test public void hlsIsTheFallbackWhenThereIsNoFlv() {
        Map<String, String> hls = new LinkedHashMap<>();
        hls.put("sd", "https://p.example.com/a.m3u8");
        hls.put("hd", "https://p.example.com/b.m3u8");
        LiveRoomStream.Pick pick = LiveRoomStream.choose(null, null, hls, null, null, null, null);
        assertEquals(LiveRecorder.Transport.HLS, pick.target.transport);
        assertEquals("https://p.example.com/b.m3u8", pick.target.url);
        LiveRoomStream.Pick single = LiveRoomStream.choose(null, null, null, "https://p.example.com/one.m3u8", null, null, null);
        assertEquals("https://p.example.com/one.m3u8", single.target.url);
    }

    @Test public void theFlvMapIsUsedWhenTheJsonIsMissingOrBroken() {
        Map<String, String> flv = new LinkedHashMap<>();
        flv.put("sd", "https://p.example.com/x.flv");
        LiveRoomStream.Pick pick = LiveRoomStream.choose("{not json", flv, null, null, null, null, null);
        assertEquals("https://p.example.com/x.flv", pick.target.url);
    }

    @Test public void onlySecureAddressesAreChosenAndNothingIsAProblemNotACrash() {
        Map<String, String> flv = new LinkedHashMap<>();
        flv.put("hd", "http://p.example.com/plain.flv");
        flv.put("sd", null);
        LiveRoomStream.Pick pick = LiveRoomStream.choose(null, flv, null, null, null, null, null);
        assertNull(pick.target);
        assertNotNull(pick.problem);
        assertNotNull(LiveRoomStream.fromRoom(null, null).problem);
        assertNotNull(LiveRoomStream.fromRoom(new Object(), null).problem);
    }
}
