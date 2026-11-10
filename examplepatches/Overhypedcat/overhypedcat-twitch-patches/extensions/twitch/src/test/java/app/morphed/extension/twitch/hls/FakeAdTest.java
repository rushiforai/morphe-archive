package app.morphed.extension.twitch.hls;

import org.junit.Test;

import app.morphed.extension.twitch.Playlists;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

public class FakeAdTest {
    @Test
    public void newestSegmentsBecomeAStitchedAd() {
        MediaPlaylist playlist = MediaPlaylist.parse(FakeAd.inject(Playlists.media("n", 100, "llll", false), 2));

        assertTrue(playlist.hasStitchedAdTags);
        assertFalse(playlist.segments.get(0).isAd());
        assertFalse(playlist.segments.get(1).isAd());
        assertTrue(playlist.segments.get(2).isAd());
        assertTrue(playlist.segments.get(3).isAd());
    }

    @Test
    public void looksLikeARealAdToTheBlocker() {
        String text = FakeAd.inject(Playlists.media("n", 100, "llll", false), 4);

        assertTrue(AdMarkers.hasAdTags(text));
        assertEquals(4, MediaPlaylist.parse(text).segments.stream().filter(MediaPlaylist.Segment::isAd).count());
        // Nothing unknown for E1 to complain about.
        assertTrue(AdMarkers.suspiciousMarkers(Playlists.media("n", 100, "llll", false)).isEmpty());
    }

    @Test
    public void playlistWithoutLiveSegmentsIsLeftAlone() {
        String text = "#EXTM3U\n#EXT-X-VERSION:3\n";
        assertSame(text, FakeAd.inject(text, 3));
    }
}
