package app.morphed.extension.twitch.hls;

import org.junit.Test;

import app.morphed.extension.twitch.Playlists;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class MasterPlaylistTest {
    @Test
    public void parsesVariants() {
        MasterPlaylist master = MasterPlaylist.parse(Playlists.master("https://w.example/a.m3u8", "https://w.example/b.m3u8"));

        assertEquals(2, master.variants.size());
        assertEquals("1920x1080", master.variants.get(0).resolution);
        assertEquals("60.000", master.variants.get(0).frameRate);
        assertEquals("avc1.64002A,mp4a.40.2", master.variants.get(0).codecs);
        assertEquals("https://w.example/b.m3u8", master.variants.get(1).url);
    }

    @Test
    public void findsVariantIgnoringQuery() {
        MasterPlaylist master = MasterPlaylist.parse(Playlists.master("https://w.example/a.m3u8?x=1"));
        assertEquals("1920x1080", master.byUrl("https://w.example/a.m3u8?y=2").resolution);
        assertNull(master.byUrl("https://w.example/other.m3u8"));
    }

    @Test
    public void prefersSameResolutionAndFrameRate() {
        MasterPlaylist master = MasterPlaylist.parse("#EXTM3U\n"
                + "#EXT-X-STREAM-INF:RESOLUTION=1280x720,FRAME-RATE=30.000\nhttps://b/720p30.m3u8\n"
                + "#EXT-X-STREAM-INF:RESOLUTION=1280x720,FRAME-RATE=60.000\nhttps://b/720p60.m3u8\n");
        MasterPlaylist.Variant target = MasterPlaylist.parse(
                "#EXT-X-STREAM-INF:RESOLUTION=1280x720,FRAME-RATE=60\nhttps://a/720p60.m3u8\n").variants.get(0);

        assertEquals("https://b/720p60.m3u8", master.closestTo(target).url);
    }

    @Test
    public void fallsBackToClosestPixelCount() {
        MasterPlaylist master = MasterPlaylist.parse("#EXTM3U\n"
                + "#EXT-X-STREAM-INF:RESOLUTION=640x360\nhttps://b/360p.m3u8\n"
                + "#EXT-X-STREAM-INF:RESOLUTION=1280x720\nhttps://b/720p.m3u8\n");
        MasterPlaylist.Variant target = MasterPlaylist.parse(
                "#EXT-X-STREAM-INF:RESOLUTION=1920x1080\nhttps://a/1080p.m3u8\n").variants.get(0);

        assertEquals("https://b/720p.m3u8", master.closestTo(target).url);
    }

    @Test
    public void audioOnlyMatchesAudioOnly() {
        MasterPlaylist master = MasterPlaylist.parse("#EXTM3U\n"
                + "#EXT-X-STREAM-INF:RESOLUTION=640x360\nhttps://b/360p.m3u8\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=160000,CODECS=\"mp4a.40.2\"\nhttps://b/audio.m3u8\n");
        MasterPlaylist.Variant target = MasterPlaylist.parse(
                "#EXT-X-STREAM-INF:BANDWIDTH=160000\nhttps://a/audio.m3u8\n").variants.get(0);

        assertEquals("https://b/audio.m3u8", master.closestTo(target).url);
    }
}
