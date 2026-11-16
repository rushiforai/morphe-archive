package app.morphed.extension.twitch.patches;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Test;

public class WatchingTest {
    private static final String LIVE = "#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=1\nhttps://a.playlist.ttvnw.net/v1/playlist/X1.m3u8?t=1\n"
            + "#EXT-X-STREAM-INF:BANDWIDTH=2\nhttps://a.playlist.ttvnw.net/v1/playlist/X2.m3u8\n";

    @After
    public void reset() {
        Watching.setNowForTest(-1);
    }

    @Test
    public void theOpenedStreamIsWatchedWhileItsPlaylistsAreAskedFor() {
        Watching.setNowForTest(1_000);
        Watching.opened("https://usher.ttvnw.net/api/v2/channel/hls/a.m3u8", LIVE);
        assertTrue(Watching.active());
        Watching.setNowForTest(6_000);
        Watching.request("https://a.playlist.ttvnw.net/v1/playlist/X2.m3u8?p=9");
        Watching.setNowForTest(12_000);
        assertTrue("asked 6 s ago", Watching.active());
        Watching.request("https://b.playlist.ttvnw.net/v1/playlist/PREVIEW.m3u8"); // a preview's poll
        Watching.setNowForTest(20_000);
        assertFalse("left: nothing asked for it in 14 s", Watching.active());
    }

    @Test
    public void aPastBroadcastIsWatchedWhileItsVideoPiecesAreAskedFor() {
        Watching.setNowForTest(1_000);
        Watching.opened("https://usher.ttvnw.net/vod/v2/123.m3u8",
                "#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=1\nhttps://d1.cloudfront.net/abc_123/chunked/index-dvr.m3u8\n");
        Watching.setNowForTest(30_000);
        Watching.request("https://d1.cloudfront.net/abc_123/chunked/42.ts");
        Watching.setNowForTest(31_000);
        assertTrue(Watching.active());
        Watching.request("https://d1.cloudfront.net/other_456/chunked/1.ts");
        Watching.setNowForTest(40_000);
        assertFalse(Watching.active());
    }
}
