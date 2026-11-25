package app.morphed.extension.twitch.hls;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import app.morphed.extension.twitch.Playlists;

/** A backup whose clock lags the stream's: let through after a few polls, without playing its window again. */
public class LaggingBackupTest {
    @Test
    public void onlyItsNewestSegmentComesThroughAfterTheWait() {
        PlaylistStitcher stitcher = new PlaylistStitcher();
        // the break begins: the stream's own segments up to 101
        String first = Playlists.media("n", 100, "llaa", true);
        stitcher.process(MediaPlaylist.parse(first), first, PlaylistStitcher.NATIVE);
        // the backup's segments are all from before that moment, three polls running
        for (int i = 0; i < 3; i++) {
            String behind = Playlists.media("b", 96, "llll", false);
            stitcher.process(MediaPlaylist.parse(behind), behind, "backup");
        }
        String next = Playlists.media("b", 97, "llll", false);
        String out = stitcher.process(MediaPlaylist.parse(next), next, "backup");

        assertTrue("its newest, so playback goes on", out.contains(Playlists.segment("b", 100)));
        assertFalse("not its whole window (played already)", out.contains(Playlists.segment("b", 97)));
    }

    @Test
    public void aNewBreakStartsTheWaitToHandBackAgain() {
        PlaylistStitcher stitcher = new PlaylistStitcher();
        String ad = Playlists.media("n", 100, "llaa", true);
        stitcher.process(MediaPlaylist.parse(ad), ad, PlaylistStitcher.NATIVE);
        String clean = Playlists.media("x", 500, "llll", false); // nothing the player has: not ready
        for (int i = 0; i < PlaylistStitcher.HAND_BACK_MAX_WAITS - 2; i++) {
            assertFalse(stitcher.readyToHandBack(MediaPlaylist.parse(clean)));
        }
        String second = Playlists.media("n", 104, "llaa", true); // another break
        stitcher.process(MediaPlaylist.parse(second), second, PlaylistStitcher.NATIVE);
        for (int i = 0; i < 5; i++) {
            assertFalse("the wait counts from the new break", stitcher.readyToHandBack(MediaPlaylist.parse(clean)));
        }
    }
}
