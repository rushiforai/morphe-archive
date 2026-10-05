package dev.twitchpatches.extension.ads.hls;

import org.junit.Test;
import java.net.URI;
import static org.junit.Assert.*;

public final class HlsPlaylistTest {
    private static final String BASE = "https://video-weaver.test.hls.ttvnw.net/live/main.m3u8";

    @Test public void discontinuityStopsNumberingAdSegments() {
        HlsPlaylist playlist = HlsPlaylist.parse("#EXTM3U\n#EXT-X-TWITCH-LIVE-SEQUENCE:42\n" +
                "#EXTINF:2,live\na.ts\n#EXT-X-DISCONTINUITY\n#EXT-X-DATERANGE:ID=\"stitched-ad-x\"\n" +
                "#EXTINF:2,ad\nb.ts\n#EXT-X-TWITCH-LIVE-SEQUENCE:45\n#EXTINF:2,live\nc.ts\n", BASE);
        assertTrue(playlist.supported);
        assertTrue(playlist.ads);
        assertEquals(Long.valueOf(42), playlist.segments.get(0).liveSequence);
        assertNull(playlist.segments.get(1).liveSequence);
        assertEquals(Long.valueOf(45), playlist.segments.get(2).liveSequence);
        assertEquals("https://video-weaver.test.hls.ttvnw.net/live/a.ts", playlist.segments.get(0).uri);
    }

    @Test public void malformedEncryptedAndPartialBodiesStayUnsupported() {
        for (String body : new String[] {"not hls", "#EXTM3U\n#EXTINF:NaN,\nx.ts\n",
                "#EXTM3U\n#EXT-X-KEY:METHOD=AES-128,URI=\"key\"\n",
                "#EXTM3U\n#EXT-X-BYTERANGE:20@0\n", "#EXTM3U\n#EXT-X-PART:DURATION=1,URI=\"x\"\n",
                "#EXTM3U\n#EXT-X-DATERANGE:ID=\"unfinished\n#EXTINF:2,\nx.ts\n"}) {
            if (body.contains("unfinished")) {
                try { HlsPlaylist.attributes("ID=\"unfinished"); fail(); }
                catch (IllegalArgumentException expected) { }
            } else assertFalse(body, HlsPlaylist.parse(body, BASE).supported);
        }
    }

    @Test public void quotedCodecAttributesAndAudioRenditionsParse() {
        HlsPlaylist master = HlsPlaylist.parse("#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=9000000," +
                "RESOLUTION=1920x1080,FRAME-RATE=60,CODECS=\"avc1.64002A,mp4a.40.2\"\n1080.m3u8\n" +
                "#EXT-X-STREAM-INF:BANDWIDTH=120000,CODECS=\"mp4a.40.2\"\naudio.m3u8\n", BASE);
        assertTrue(master.supported);
        assertEquals("avc1", master.variants.get(0).codec);
        assertEquals(0, master.variants.get(1).height);
    }

    @Test public void hostBoundariesRejectCredentialsAndForeignOrigins() {
        for (String url : new String[] {"https://ttvnw.net.evil.test/a", "https://evilttvnw.net/a",
                "http://usher.ttvnw.net/a", "https://user:password@usher.ttvnw.net/a", "https://usher.ttvnw.net:8443/a"})
            assertFalse(HlsPlaylist.twitchUri(URI.create(url)));
        assertTrue(HlsPlaylist.twitchUri(URI.create("https://usher.ttvnw.net/a")));
        assertFalse(HlsPlaylist.parse("#EXTM3U\n#EXTINF:2,\nhttps://evil.test/x.ts\n", BASE).supported);
    }

    @Test public void exactQualityBeforeLowerNeverChangesCodec() {
        String prefix = "#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=9000000,RESOLUTION=1920x1080,FRAME-RATE=60,CODECS=\"avc1.64002A\"\n";
        Variant original = HlsPlaylist.parse(prefix + "main.m3u8\n", BASE).variants.get(0);
        HlsPlaylist backup = HlsPlaylist.parse("#EXTM3U\n" +
                "#EXT-X-STREAM-INF:BANDWIDTH=15000000,RESOLUTION=2560x1440,FRAME-RATE=60,CODECS=\"hvc1.1.6\"\nhevc.m3u8\n" +
                "#EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720,FRAME-RATE=60,CODECS=\"avc1.64001F\"\n720.m3u8\n", BASE);
        assertNull(Variant.match(backup.variants, original, false));
        assertEquals(720, Variant.match(backup.variants, original, true).height);
        assertNull(Variant.match(backup.variants, HlsPlaylist.parse(prefix.replace("avc1.64002A", "av01.0.08M.08") +
                "av1.m3u8\n", BASE).variants.get(0), true));
    }

    @Test public void twitchLookaheadCarriesBroadcastNumbersWithoutBecomingPlayableSegments() {
        HlsPlaylist playlist = HlsPlaylist.parse("#EXTM3U\n#EXT-X-VERSION:3\n#EXT-X-MEDIA-SEQUENCE:7262\n" +
                "#EXT-X-TARGETDURATION:6\n#EXT-X-TWITCH-LIVE-SEQUENCE:7262\n#EXTINF:2,live\na.ts\n" +
                "#EXTINF:2,live\nb.ts\n#EXT-X-TWITCH-PREFETCH:c.ts\n#EXT-X-TWITCH-PREFETCH:d.ts\n", BASE);
        assertTrue(playlist.supported); assertEquals(3, playlist.version); assertEquals(7262, playlist.mediaSequence);
        assertEquals(2, playlist.segments.size()); assertEquals(2, playlist.hints.size());
        assertEquals(Long.valueOf(7264), playlist.hints.get(0).liveSequence);
        assertEquals(Long.valueOf(7265), playlist.hints.get(1).liveSequence);
    }

    @Test public void adLookaheadAfterDiscontinuityHasNoTrustedLiveNumber() {
        HlsPlaylist playlist = HlsPlaylist.parse("#EXTM3U\n#EXT-X-TWITCH-LIVE-SEQUENCE:80\n" +
                "#EXTINF:2,live\na.ts\n#EXT-X-DISCONTINUITY\n#EXT-X-TWITCH-PREFETCH:ad.ts\n", BASE);
        assertTrue(playlist.supported); assertNull(playlist.hints.get(0).liveSequence);
    }
}
