package app.morphe.extension.newx.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.List;

/**
 * Playlist fixtures mirror a real broadcast replay: a dynamically generated master playlist
 * whose rendition URIs are absolute paths with signed segments, and a VOD media playlist of
 * relative MPEG-TS chunk names.
 */
public class HlsPlaylistTest {
    private static final String MASTER_URL =
            "https://prod-fastly-p.video.pscp.tv/Transcoding/v1/hls/2lgqYmrLpBrQYr/"
                    + "non_transcode/pdxa/periscope-replays-public/"
                    + "master_dynamic_16651801980417122173.m3u8?type=replay";
    private static final String MASTER = "#EXTM3U\n"
            + "#EXT-X-DYNAMICALLY-GENERATED\n"
            + "#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=600000,RESOLUTION=568x320,"
            + "CODECS=\"avc1.64001e,mp4a.40.2\",FRAME-RATE=30.003\n"
            + "/b/Transcoding/v1/hls/2lgqYmrLpBrQYr/transcode/pdxa/periscope-replays-public/"
            + "TOKEN320/playlist_16651801980417122173.m3u8?type=replay\n"
            + "#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=8000000,RESOLUTION=1920x1080,"
            + "CODECS=\"avc1.64002a,mp4a.40.2\",FRAME-RATE=60.007\n"
            + "/b/Transcoding/v1/hls/2lgqYmrLpBrQYr/transcode/pdxa/periscope-replays-public/"
            + "TOKEN1080/playlist_16651801980417122173.m3u8?type=replay\n"
            + "#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1200000,RESOLUTION=848x480,"
            + "CODECS=\"avc1.64001f,mp4a.40.2\",FRAME-RATE=30.003\n"
            + "/b/Transcoding/v1/hls/2lgqYmrLpBrQYr/transcode/pdxa/periscope-replays-public/"
            + "TOKEN480/playlist_16651801980417122173.m3u8?type=replay\n";

    private static final String MEDIA_URL =
            "https://prod-fastly-p.video.pscp.tv/b/Transcoding/v1/hls/2lgqYmrLpBrQYr/"
                    + "transcode/pdxa/periscope-replays-public/TOKEN1080/"
                    + "playlist_16651801980417122173.m3u8?type=replay";
    private static final String MEDIA = "#EXTM3U\n"
            + "#EXT-X-PLAYLIST-TYPE:VOD\n"
            + "#EXT-X-TARGETDURATION:4\n"
            + "#EXT-X-VERSION:6\n"
            + "#EXT-X-INDEPENDENT-SEGMENTS\n"
            + "#EXT-X-MEDIA-SEQUENCE:0\n"
            + "#EXTINF:3.000,\n"
            + "chunk_1794941725102180535_0_b.ts\n"
            + "#EXTINF:3.000,\n"
            + "chunk_1794941725103298393_1_b.ts\n"
            + "#EXTINF:2.500,\n"
            + "chunk_1794941725103987379_2_b.ts\n"
            + "#EXT-X-ENDLIST\n";

    @Test
    public void hlsUrlsAreRecognisedByPathSuffix() {
        assertTrue(HlsPlaylist.isHlsUrl("https://video.twimg.com/ext_tw_video_broadcast/1/pl/playlist.m3u8"));
        assertTrue(HlsPlaylist.isHlsUrl("https://video.twimg.com/amplify_video/1/pl/stream.m3u8?tag=14"));
        assertTrue(HlsPlaylist.isHlsUrl("https://example.com/PLAYLIST.M3U8"));
        assertFalse(HlsPlaylist.isHlsUrl("https://video.twimg.com/vid/1280x720/high.mp4"));
        assertFalse(HlsPlaylist.isHlsUrl("https://example.com/pl.m3u8/extra"));
        assertFalse(HlsPlaylist.isHlsUrl(null));
    }

    @Test
    public void hlsVariantsAreRecognisedByContentTypeOrUrl() {
        assertTrue(HlsPlaylist.isHlsVariant("https://example.com/stream", "application/x-mpegURL"));
        assertTrue(HlsPlaylist.isHlsVariant("https://example.com/stream", "application/vnd.apple.mpegurl"));
        assertTrue(HlsPlaylist.isHlsVariant("https://example.com/pl.m3u8", null));
        assertFalse(HlsPlaylist.isHlsVariant("https://example.com/high.mp4", "video/mp4"));
        assertFalse(HlsPlaylist.isHlsVariant(null, "application/x-mpegURL"));
    }

    @Test
    public void playlistKindsAreDetected() {
        assertTrue(HlsPlaylist.isPlaylist(MASTER));
        assertTrue(HlsPlaylist.isMaster(MASTER));
        assertTrue(HlsPlaylist.isPlaylist(MEDIA));
        assertFalse(HlsPlaylist.isMaster(MEDIA));
        assertFalse(HlsPlaylist.isPlaylist("not a playlist"));
        assertFalse(HlsPlaylist.isPlaylist(null));
    }

    @Test
    public void masterRenditionsResolveAgainstTheMasterUrl() {
        List<HlsPlaylist.Rendition> renditions = HlsPlaylist.parseMaster(MASTER, MASTER_URL);

        assertEquals(3, renditions.size());
        assertEquals(600000, renditions.get(0).bandwidth);
        assertEquals("568x320", renditions.get(0).resolution);
        assertEquals(
                "https://prod-fastly-p.video.pscp.tv/b/Transcoding/v1/hls/2lgqYmrLpBrQYr/"
                        + "transcode/pdxa/periscope-replays-public/TOKEN320/"
                        + "playlist_16651801980417122173.m3u8?type=replay",
                renditions.get(0).url
        );
    }

    @Test
    public void bestRenditionIsTheHighestBandwidth() {
        HlsPlaylist.Rendition best =
                HlsPlaylist.bestRendition(HlsPlaylist.parseMaster(MASTER, MASTER_URL));

        assertEquals(8000000, best.bandwidth);
        assertEquals("1920x1080", best.resolution);
        assertTrue(best.url.contains("TOKEN1080"));
        assertNull(HlsPlaylist.bestRendition(HlsPlaylist.parseMaster("#EXTM3U\n", MASTER_URL)));
    }

    @Test
    public void mediaSegmentsResolveInOrderWithDuration() {
        HlsPlaylist.Media media = HlsPlaylist.parseMedia(MEDIA, MEDIA_URL);

        assertEquals(3, media.segmentUrls.size());
        assertEquals(
                "https://prod-fastly-p.video.pscp.tv/b/Transcoding/v1/hls/2lgqYmrLpBrQYr/"
                        + "transcode/pdxa/periscope-replays-public/TOKEN1080/"
                        + "chunk_1794941725102180535_0_b.ts",
                media.segmentUrls.get(0)
        );
        assertTrue(media.segmentUrls.get(2).endsWith("chunk_1794941725103987379_2_b.ts"));
        assertEquals(8.5, media.totalDurationSeconds, 0.001);
        assertTrue(media.hasEndList);
        assertFalse(media.hasInitSegment);
        assertFalse(media.encrypted);
    }

    @Test
    public void fragmentedMp4MediaIsFlagged() {
        String fragmented = "#EXTM3U\n"
                + "#EXT-X-MAP:URI=\"init.mp4\"\n"
                + "#EXTINF:4.000,\n"
                + "segment1.m4s\n"
                + "#EXT-X-ENDLIST\n";

        HlsPlaylist.Media media = HlsPlaylist.parseMedia(fragmented, MEDIA_URL);

        assertTrue(media.hasInitSegment);
        assertEquals(1, media.segmentUrls.size());
    }

    @Test
    public void encryptedMediaIsFlaggedUnlessMethodIsNone() {
        String encrypted = "#EXTM3U\n"
                + "#EXT-X-KEY:METHOD=AES-128,URI=\"https://example.com/key\",IV=0x0\n"
                + "#EXTINF:4.000,\n"
                + "chunk0.ts\n";
        String clear = "#EXTM3U\n"
                + "#EXT-X-KEY:METHOD=NONE\n"
                + "#EXTINF:4.000,\n"
                + "chunk0.ts\n";

        assertTrue(HlsPlaylist.parseMedia(encrypted, MEDIA_URL).encrypted);
        assertFalse(HlsPlaylist.parseMedia(clear, MEDIA_URL).encrypted);
    }

    @Test
    public void liveMediaHasNoEndList() {
        String live = "#EXTM3U\n"
                + "#EXT-X-MEDIA-SEQUENCE:42\n"
                + "#EXTINF:3.000,\n"
                + "chunk42.ts\n";

        HlsPlaylist.Media media = HlsPlaylist.parseMedia(live, MEDIA_URL);

        assertFalse(media.hasEndList);
        assertEquals(1, media.segmentUrls.size());
    }
}
