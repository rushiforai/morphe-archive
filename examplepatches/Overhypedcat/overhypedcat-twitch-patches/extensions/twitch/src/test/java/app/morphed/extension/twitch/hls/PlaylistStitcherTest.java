package app.morphed.extension.twitch.hls;

import org.junit.Test;

import app.morphed.extension.twitch.Playlists;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

public class PlaylistStitcherTest {
    private final PlaylistStitcher stitcher = new PlaylistStitcher();

    private String process(String text, String source) {
        return stitcher.process(MediaPlaylist.parse(text), text, source);
    }

    @Test
    public void passesCleanPlaylistThroughUntouched() {
        String text = Playlists.media("n", 100, "llll", false);

        assertSame(text, process(text, PlaylistStitcher.NATIVE));
        assertFalse(stitcher.isRewriting());
    }

    @Test
    public void stripsAdSegmentsAndMarkers() {
        process(Playlists.media("n", 100, "llll", false), PlaylistStitcher.NATIVE);
        String out = process(Playlists.media("n", 102, "llaa", true), PlaylistStitcher.NATIVE);

        assertTrue(out.contains("#EXT-X-MEDIA-SEQUENCE:102\n"));
        assertTrue(out.contains(Playlists.segment("n", 103)));
        assertFalse(out.contains("/ads/"));
        assertFalse(out.contains("stitched-ad"));
        assertFalse(out.contains("#EXT-X-TWITCH-PREFETCH"));
        assertTrue(stitcher.isRewriting());
    }

    @Test
    public void liveContentAfterAdsContinuesTheSequence() {
        process(Playlists.media("n", 100, "llll", false), PlaylistStitcher.NATIVE);
        process(Playlists.media("n", 102, "llaa", true), PlaylistStitcher.NATIVE);
        String out = process(Playlists.media("n", 104, "aall", true), PlaylistStitcher.NATIVE);

        assertTrue(out.contains("#EXT-X-MEDIA-SEQUENCE:104\n"));
        assertTrue(out.contains("#EXT-X-DISCONTINUITY\n#EXT-X-PROGRAM-DATE-TIME"));
        int first = out.indexOf(Playlists.segment("n", 106));
        int second = out.indexOf(Playlists.segment("n", 107));
        assertTrue(first > 0 && second > first);
    }

    @Test
    public void discontinuitySequenceCountsDiscontinuitiesThatSlidOut() {
        process(Playlists.media("n", 100, "llll", false), PlaylistStitcher.NATIVE);
        process(Playlists.media("n", 102, "llaa", true), PlaylistStitcher.NATIVE);
        process(Playlists.media("n", 104, "aall", true), PlaylistStitcher.NATIVE);
        String out = process(Playlists.media("n", 108, "ll", false), PlaylistStitcher.NATIVE);

        assertTrue(out.contains("#EXT-X-MEDIA-SEQUENCE:106\n"));
        assertTrue(out.contains("#EXT-X-DISCONTINUITY-SEQUENCE:1\n"));
        assertFalse(out.contains("#EXT-X-DISCONTINUITY\n"));
    }

    @Test
    public void switchingToBackupSkipsContentAlreadyPlayed() {
        process(Playlists.media("n", 100, "llll", false), PlaylistStitcher.NATIVE);
        // Backup has different segment URLs but covers the same moments in time.
        String out = process(Playlists.media("b", 101, "llll", false), "backup:popout");

        assertTrue(out.contains("#EXT-X-MEDIA-SEQUENCE:104\n"));
        assertTrue(out.contains("#EXT-X-DISCONTINUITY\n"));
        assertTrue(out.contains(Playlists.segment("b", 104)));
        assertFalse(out.contains(Playlists.segment("b", 103)));
    }

    @Test
    public void keepsBackupSequenceStableAcrossPolls() {
        process(Playlists.media("n", 100, "llll", false), PlaylistStitcher.NATIVE);
        process(Playlists.media("b", 101, "llll", false), "backup:popout");
        String out = process(Playlists.media("b", 102, "llll", false), "backup:popout");

        assertTrue(out.contains("#EXT-X-MEDIA-SEQUENCE:104\n"));
        assertTrue(out.contains(Playlists.segment("b", 104)));
        assertTrue(out.contains(Playlists.segment("b", 105)));
    }

    @Test
    public void repeatsLastPlaylistWhenNothingNewIsPlayable() {
        process(Playlists.media("n", 100, "llll", false), PlaylistStitcher.NATIVE);
        String stripped = process(Playlists.media("n", 102, "llaa", true), PlaylistStitcher.NATIVE);
        String out = process(Playlists.media("n", 104, "aaaa", true), PlaylistStitcher.NATIVE);

        assertEquals(stripped, out);
    }

    @Test
    public void initSegmentSurvivesWhenItsFirstSegmentIsSkipped() {
        process(Playlists.withInitSegment(Playlists.media("n", 100, "llll", false), "n"), PlaylistStitcher.NATIVE);
        // The backup's first segments overlap what was played and are skipped, but its init segment is still needed.
        String out = process(Playlists.withInitSegment(Playlists.media("b", 101, "llll", false), "b"), "backup:popout");

        int map = out.indexOf(Playlists.map("b"));
        int segment = out.indexOf(Playlists.segment("b", 104));
        assertTrue(map > 0 && map < segment);
        assertFalse(out.contains(Playlists.map("n")));
    }

    @Test
    public void initSegmentIsRepeatedWhenSwitchingBackToNative() {
        process(Playlists.withInitSegment(Playlists.media("n", 100, "llll", false), "n"), PlaylistStitcher.NATIVE);
        process(Playlists.withInitSegment(Playlists.media("b", 101, "llll", false), "b"), "backup:popout");
        String out = process(Playlists.withInitSegment(Playlists.media("n", 103, "llll", false), "n"), PlaylistStitcher.NATIVE);

        assertTrue(out.contains(Playlists.map("n")));
        assertTrue(out.indexOf(Playlists.map("n")) < out.indexOf(Playlists.segment("n", 105)));
    }

    @Test
    public void lateClockDoesNotStallForever() {
        process(Playlists.media("n", 100, "llll", false), PlaylistStitcher.NATIVE);
        // A backup whose timestamps lag far behind: every segment looks already played.
        String lagging = Playlists.media("b", 50, "llll", false);
        String first = process(lagging, "backup:autoplay");
        process(lagging, "backup:autoplay");
        process(lagging, "backup:autoplay");
        String out = process(lagging, "backup:autoplay");

        assertFalse(first.contains(Playlists.segment("b", 53)));
        assertTrue(out.contains(Playlists.segment("b", 53)));
    }

    @Test
    public void keepsPrefetchWhenRewrittenPlaylistIsClean() {
        process(Playlists.media("n", 100, "llll", false), PlaylistStitcher.NATIVE);
        process(Playlists.media("n", 102, "llaa", true), PlaylistStitcher.NATIVE);
        String out = process(Playlists.media("n", 106, "llll", false), PlaylistStitcher.NATIVE);

        assertTrue(out.contains("#EXT-X-TWITCH-PREFETCH:"));
    }
}
