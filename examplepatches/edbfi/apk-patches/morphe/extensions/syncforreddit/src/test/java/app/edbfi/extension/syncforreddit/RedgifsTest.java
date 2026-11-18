// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import com.google.android.exoplayer2.upstream.DataSource;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.json.JSONException;
import org.junit.Test;

public class RedgifsTest {
    @Test
    public void readsTheGifIdFromTheAppsUrl() {
        assertEquals("trainedmodestseagull",
                Redgifs.gifId("https://api.redgifs.com/v2/gifs/trainedmodestseagull?user-addr=1.2.3.4&user-agent=x"));
        assertEquals("abc", Redgifs.gifId("https://api.redgifs.com/v2/gifs/abc"));
        assertEquals("bothprivatepigeon", Redgifs.gifId("https://api.redgifs.com/v2/gifs/BothPrivatePigeon?user-addr=x"));
    }

    @Test
    public void rejectsOtherPaths() {
        assertNull(Redgifs.gifId("https://api.redgifs.com/v2/gifs/"));
        assertNull(Redgifs.gifId("https://api.redgifs.com/v2/gifs/../auth?x"));
        assertNull(Redgifs.gifId("https://api.redgifs.com/info"));
    }

    @Test
    public void ownsOnlyTheAppsRedgifsRequests() {
        assertTrue(Redgifs.handles("https://api.redgifs.com/v2/oauth/client"));
        assertTrue(Redgifs.handles("https://api.redgifs.com/info"));
        assertTrue(Redgifs.handles("https://api.redgifs.com/v2/gifs/abc?user-addr=x"));
        assertFalse(Redgifs.handles("https://media.redgifs.com/Abc.mp4"));
        assertFalse(Redgifs.handles("https://oauth.reddit.com/r/pics"));
    }

    private static final String AUTOPLAY = "https://ap.syncforreddit.com/image?url=redgifs-";

    private static Redgifs.Gifs answering(int status, String body, List<String> asked) {
        return id -> {
            asked.add(id);
            return new Http.Reply(status, body.getBytes(StandardCharsets.UTF_8), new HashMap<>());
        };
    }

    @Test
    public void readsTheAutoplayId() {
        assertEquals("bothprivatepigeon", Redgifs.autoplayId(AUTOPLAY + "BothPrivatePigeon"));
        assertNull(Redgifs.autoplayId(AUTOPLAY));
        assertNull(Redgifs.autoplayId(AUTOPLAY + "x/../y"));
        assertNull(Redgifs.autoplayId("https://ap.syncforreddit.com/image?url=gfycat-Abc"));
    }

    @Test
    public void playsTheHdVideoAndLooksItUpOnce() throws Exception {
        List<String> asked = new ArrayList<>();
        String body = "{\"gif\":{\"urls\":{\"hd\":\"https://media.redgifs.com/PlaysOnce.mp4\","
                + "\"sd\":\"https://media.redgifs.com/PlaysOnce-mobile.mp4\"}}}";
        Redgifs.Gifs gifs = answering(200, body, asked);
        assertEquals("https://media.redgifs.com/PlaysOnce.mp4", Redgifs.video(AUTOPLAY + "PlaysOnce", gifs));
        assertEquals("https://media.redgifs.com/PlaysOnce.mp4", Redgifs.video(AUTOPLAY + "playsonce", gifs));
        assertEquals(List.of("playsonce"), asked);
    }

    @Test
    public void fallsBackToTheSdVideo() throws Exception {
        String body = "{\"gif\":{\"urls\":{\"sd\":\"https://media.redgifs.com/OnlySd-mobile.mp4\"}}}";
        assertEquals("https://media.redgifs.com/OnlySd-mobile.mp4",
                Redgifs.video(AUTOPLAY + "OnlySd", answering(200, body, new ArrayList<>())));
    }

    @Test
    public void refusesMissingOrForeignVideos() {
        String[] bodies = {
            "{\"gif\":{\"urls\":{\"hd\":\"https://evil.example/x.mp4\"}}}",
            "{\"gif\":{\"urls\":{\"hd\":\"http://media.redgifs.com/x.mp4\"}}}",
            "{\"gif\":{\"urls\":{}}}",
        };
        int n = 0;
        for (String body : bodies) {
            try {
                Redgifs.video(AUTOPLAY + "Refused" + n++, answering(200, body, new ArrayList<>()));
                fail("Expected a failure for " + body);
            } catch (Exception expected) {
                // A failed video stays a still.
            }
        }
        try {
            Redgifs.video(AUTOPLAY + "Missing", answering(404, "", new ArrayList<>()));
            fail("Expected a failure for a missing gif");
        } catch (Exception expected) {
            // As above.
        }
    }

    @Test
    public void skipsAJsonNullHdVideo() throws Exception {
        String body = "{\"gif\":{\"urls\":{\"hd\":null,\"sd\":\"https://media.redgifs.com/NullHd-mobile.mp4\"}}}";
        assertEquals("https://media.redgifs.com/NullHd-mobile.mp4",
                Redgifs.video(AUTOPLAY + "NullHd", answering(200, body, new ArrayList<>())));
    }

    @Test
    public void opensOtherVideosAsTheyAre() throws Exception {
        List<String> asked = new ArrayList<>();
        assertNull(Redgifs.resolve("https://v.redd.it/abc/HLSPlaylist.m3u8", answering(200, "{}", asked)));
        assertTrue(asked.isEmpty());
    }

    @Test
    public void neverOpensTheImageServer() {
        List<String> asked = new ArrayList<>();
        try {
            Redgifs.resolve("https://ap.syncforreddit.com/image?url=gfycat-Abc", answering(200, "{}", asked));
            fail("Expected a FileNotFoundException");
        } catch (IOException expected) {
            assertTrue(expected instanceof FileNotFoundException);
        }
        assertTrue(asked.isEmpty());
    }

    @Test
    public void turnsEveryAutoplayFailureIntoAnIoException() {
        try {
            Redgifs.resolve(AUTOPLAY + "BadJson", answering(200, "not json", new ArrayList<>()));
            fail("Expected an IOException");
        } catch (IOException expected) {
            // Not tried again by the player.
            assertTrue(expected instanceof FileNotFoundException);
            assertTrue(expected.getCause() instanceof JSONException);
        }
    }

    @Test
    public void leavesTheAppsVideoSourcesAloneWhenOff() {
        DataSource.Factory upstream = () -> null;
        assertSame(upstream, Redgifs.autoplay(upstream));
    }

    @Test
    public void resolvesAnAutoplayUrl() throws Exception {
        String body = "{\"gif\":{\"urls\":{\"hd\":\"https://media.redgifs.com/Resolved.mp4\"}}}";
        assertEquals("https://media.redgifs.com/Resolved.mp4", Redgifs.resolve(AUTOPLAY + "Resolved", answering(200, body, new ArrayList<>())));
    }

    @Test
    public void passesALostConnectionOnForThePlayerToRetry() {
        IOException offline = new IOException("offline");
        try {
            Redgifs.resolve(AUTOPLAY + "Offline", id -> {
                throw offline;
            });
            fail("Expected an IOException");
        } catch (IOException expected) {
            assertSame(offline, expected);
        }
    }
}
