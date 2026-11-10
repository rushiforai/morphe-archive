package app.morphed.extension.twitch.hls;

import org.junit.Test;

import app.morphed.extension.twitch.Playlists;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class MediaPlaylistTest {
    @Test
    public void parsesLivePlaylist() {
        MediaPlaylist playlist = MediaPlaylist.parse(Playlists.media("n", 100, "lll", false));

        assertEquals(100, playlist.mediaSequence);
        assertEquals(3, playlist.segments.size());
        assertEquals(102, playlist.segments.get(2).sequence);
        assertEquals(Playlists.segment("n", 101), playlist.segments.get(1).uri);
        assertEquals(Playlists.time(101), playlist.segments.get(1).programDateTime);
        assertFalse(playlist.hasAds());
        assertTrue(playlist.trailer.get(0).startsWith("#EXT-X-TWITCH-PREFETCH:"));
        assertTrue(playlist.header.contains("#EXT-X-TARGETDURATION:6"));
    }

    @Test
    public void marksStitchedAdSegments() {
        MediaPlaylist playlist = MediaPlaylist.parse(Playlists.media("n", 100, "llaa", true));

        assertTrue(playlist.hasAdTags);
        assertTrue(playlist.hasAdSegments());
        assertFalse(playlist.segments.get(1).isAd());
        assertTrue(playlist.segments.get(2).isAd());
        assertTrue(playlist.segments.get(2).discontinuity);
    }

    @Test
    public void markersWithoutAdSegments() {
        MediaPlaylist playlist = MediaPlaylist.parse(Playlists.media("n", 100, "lll", true));

        assertTrue(playlist.hasAds());
        assertFalse(playlist.hasAdSegments());
    }

    @Test
    public void untitledSegmentsAreNotAdsWhenNoSegmentIsTitledLive() {
        MediaPlaylist playlist = MediaPlaylist.parse("#EXTM3U\n#EXT-X-MEDIA-SEQUENCE:5\n#EXTINF:2.000,\nhttps://e/5.ts\n");

        assertFalse(playlist.segments.get(0).isAd());
    }

    @Test
    public void otherMarkersDoNotTurnSegmentsIntoAds() {
        String text = "#EXTM3U\n#EXT-X-MEDIA-SEQUENCE:5\n"
                + "#EXT-X-DATERANGE:ID=\"t\",CLASS=\"twitch-trigger\",START-DATE=\"2026-10-28T12:00:00Z\"\n"
                + "#EXTINF:2.000,live\nhttps://e/5.ts\n#EXTINF:2.000,\nhttps://e/6.ts\n";
        MediaPlaylist playlist = MediaPlaylist.parse(text);

        assertTrue(playlist.hasAdTags);
        assertFalse(playlist.hasAdSegments());
    }

    @Test
    public void untitledSegmentsBeforeAStitchedAdAreAds() {
        String text = "#EXTM3U\n#EXT-X-MEDIA-SEQUENCE:5\n" + Playlists.AD_DATERANGE + "\n"
                + "#EXTINF:2.000,live\nhttps://e/5.ts\n#EXTINF:2.000,Amazon|1\nhttps://e/6.ts\n";

        assertTrue(MediaPlaylist.parse(text).segments.get(1).isAd());
    }

    @Test
    public void playlistOfOnlyAdsIsAllAds() {
        MediaPlaylist playlist = MediaPlaylist.parse(Playlists.media("n", 100, "aa", true));

        assertTrue(playlist.segments.get(0).isAd());
        assertTrue(playlist.segments.get(1).isAd());
    }

    @Test
    public void initSegmentAppliesToEverySegment() {
        MediaPlaylist playlist = MediaPlaylist.parse(Playlists.withInitSegment(Playlists.media("n", 100, "lll", false), "n"));

        assertEquals(Playlists.map("n"), playlist.segments.get(0).map);
        assertEquals(Playlists.map("n"), playlist.segments.get(2).map);
        assertFalse(playlist.header.contains(Playlists.map("n")));
        assertFalse(playlist.segments.get(0).tags.contains(Playlists.map("n")));
    }

    @Test
    public void resolvesRelativeUrisAgainstThePlaylistUrl() {
        String text = "#EXTM3U\n#EXT-X-MAP:URI=\"init.mp4\"\n#EXTINF:2.000,live\nseg/1.mp4\n"
                + "#EXT-X-TWITCH-PREFETCH:seg/2.mp4\n";
        MediaPlaylist playlist = MediaPlaylist.parse(text, "https://w.example/v1/playlist/abc.m3u8");

        assertEquals("https://w.example/v1/playlist/seg/1.mp4", playlist.segments.get(0).uri);
        assertEquals("#EXT-X-MAP:URI=\"https://w.example/v1/playlist/init.mp4\"", playlist.segments.get(0).map);
        assertEquals("#EXT-X-TWITCH-PREFETCH:https://w.example/v1/playlist/seg/2.mp4", playlist.trailer.get(0));
    }

    @Test
    public void absoluteUrisAreKept() {
        MediaPlaylist playlist = MediaPlaylist.parse(Playlists.media("n", 100, "l", false), "https://other.example/x.m3u8");

        assertEquals(Playlists.segment("n", 100), playlist.segments.get(0).uri);
    }

    @Test
    public void adSegmentUrlPatternWins() {
        MediaPlaylist playlist = MediaPlaylist.parse("#EXTM3U\n#EXTINF:2.000,live\nhttps://e/adsquared/1.ts\n");

        assertTrue(playlist.segments.get(0).isAd());
    }

    @Test
    public void readsTwitchTimesLikeJavaTime() {
        java.util.Random random = new java.util.Random(7);
        String[] fractions = {"", ".4", ".43", ".434", ".4345", ".123456789"};
        for (int i = 0; i < 20_000; i++) {
            // 1900 to 2200, leap years and month ends included.
            long seconds = -2_208_988_800L + (long) (random.nextDouble() * 9_467_280_000L);
            String text = java.time.Instant.ofEpochSecond(seconds).toString().replace("Z", fractions[i % fractions.length] + "Z");
            long expected = java.time.OffsetDateTime.parse(text).toInstant().toEpochMilli();
            assertEquals(text, expected, MediaPlaylist.parseUtcTime(text));
            assertEquals(text, expected, MediaPlaylist.parseTime(text));
        }
    }

    @Test
    public void otherTimeFormatsStillWork() {
        // Not Twitch's own format: the general parser takes them.
        assertEquals(MediaPlaylist.UNKNOWN_TIME, MediaPlaylist.parseUtcTime("2026-11-09T11:25:59.434+02:00"));
        assertEquals(java.time.Instant.parse("2026-11-09T09:25:59.434Z").toEpochMilli(),
                MediaPlaylist.parseTime("2026-11-09T11:25:59.434+02:00"));
        // Impossible dates are refused, as by java.time.
        assertEquals(MediaPlaylist.UNKNOWN_TIME, MediaPlaylist.parseTime("2026-02-30T09:25:59.434Z"));
        assertEquals(MediaPlaylist.UNKNOWN_TIME, MediaPlaylist.parseTime("2026-11-09T24:00:00Z"));
        // java.time takes a decimal point without digits; the fast path leaves that one to it.
        assertEquals(MediaPlaylist.UNKNOWN_TIME, MediaPlaylist.parseUtcTime("2026-11-09T09:25:59.Z"));
        assertEquals(java.time.OffsetDateTime.parse("2026-11-09T09:25:59.Z").toInstant().toEpochMilli(),
                MediaPlaylist.parseTime("2026-11-09T09:25:59.Z"));
        assertEquals(MediaPlaylist.UNKNOWN_TIME, MediaPlaylist.parseTime("not a time"));
    }
}
