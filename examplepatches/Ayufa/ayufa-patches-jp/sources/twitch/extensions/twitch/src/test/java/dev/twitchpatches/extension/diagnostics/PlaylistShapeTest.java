package dev.twitchpatches.extension.diagnostics;

import org.junit.Test;
import static org.junit.Assert.*;

public final class PlaylistShapeTest {
    @Test public void distinguishesNativeMediaNumberFromBroadcastNumbersAndUnnumberedAds() {
        String shape = PlaylistShape.summarize("#EXTM3U\n#EXT-X-VERSION:3\n#EXT-X-MEDIA-SEQUENCE:600\n" +
                "#EXT-X-TWITCH-LIVE-SEQUENCE:1200\n#EXTINF:2,private-title\nhttps://private.invalid/a?token=secret\n" +
                "#EXT-X-DISCONTINUITY\n#EXT-X-DATERANGE:ID=\"stitched-ad-private\"\n#EXTINF:2,ad\nad.ts\n" +
                "#EXT-X-TWITCH-LIVE-SEQUENCE:1204\n#EXTINF:2,\nb.ts\n#EXT-X-TWITCH-PREFETCH:future.ts\n");
        assertTrue(shape.contains("segments=3 live=2 hints=1 media=600 first=1200 last=1204"));
        assertTrue(shape.contains("boundaries=1 ads=true"));
        assertFalse(shape.contains("secret")); assertFalse(shape.contains("private")); assertFalse(shape.contains(".ts"));
    }

    @Test public void malformedOverflowAndOversizedDataAreCategoricalOnly() {
        assertEquals("unsupported body", PlaylistShape.summarize("not a playlist"));
        assertEquals("malformed structure", PlaylistShape.summarize("#EXTM3U\n#EXT-X-MEDIA-SEQUENCE:bad-secret\n"));
        assertEquals("malformed structure", PlaylistShape.summarize("#EXTM3U\n#EXT-X-MEDIA-SEQUENCE:9223372036854775807\n"));
        assertEquals("unsupported body", PlaylistShape.summarize("#EXTM3U" + "x".repeat(512 * 1024)));
    }
}
