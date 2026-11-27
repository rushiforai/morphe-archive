package app.jimaku.extension.youtube;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assume.assumeTrue;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import app.jimaku.extension.gateway.Cancellation;

/**
 * Reads YouTube itself, for a run by hand: JIMAKU_LIVE_YOUTUBE=1. bWCkSOafQNc has only automatic
 * Japanese captions; h6fcK_fRYaI has uploaded tracks beside automatic English.
 */
public class LiveYouTubeTest {
    private final YouTube youtube = new YouTube(YouTube.ORIGIN, "21.16.256", 36, "16", 20_000);

    @Test
    public void readsAnAutomaticTrackWithEachWordsTiming() throws Exception {
        assumeTrue("1".equals(System.getenv("JIMAKU_LIVE_YOUTUBE")));
        TrackInfo info = youtube.tracks("bWCkSOafQNc", new Cancellation());
        assertNotNull(info);
        assertEquals("ja", info.language);
        assertTrue(info.source.automatic);
        assertFalse(info.live);
        JSONArray events = new JSONObject(youtube.captions(info, info.source, new Cancellation())).getJSONArray("events");
        int timed = 0;
        for (int i = 0; i < events.length(); i++) {
            JSONArray segs = events.getJSONObject(i).optJSONArray("segs");
            for (int j = 0; segs != null && j < segs.length(); j++) if (segs.getJSONObject(j).has("tOffsetMs")) timed++;
        }
        assertTrue("words with their timing: " + timed, timed > 10);
    }

    @Test
    public void readsUploadedTracksBesideAnAutomaticOne() throws Exception {
        assumeTrue("1".equals(System.getenv("JIMAKU_LIVE_YOUTUBE")));
        TrackInfo info = youtube.tracks("h6fcK_fRYaI", new Cancellation());
        assertNotNull(info);
        assertEquals("en", info.language);
        assertFalse(info.source.automatic);
        CaptionTrack german = info.uploadedIn("de");
        assertNotNull(german);
        assertFalse(CaptionLines.of(youtube.captions(info, german, new Cancellation())).isEmpty());
    }
}
