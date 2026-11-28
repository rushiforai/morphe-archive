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
        // and from there it goes by that backup's clock: its next segment follows at once, no new wait
        String after = Playlists.media("b", 98, "llll", false);
        assertTrue(stitcher.process(MediaPlaylist.parse(after), after, "backup").contains(Playlists.segment("b", 101)));
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

    @Test
    public void aLaggingBackupsClockDoesntLetTwitchsPlaylistReplay() {
        PlaylistStitcher stitcher = new PlaylistStitcher();
        String first = Playlists.media("n", 100, "llaa", true);
        stitcher.process(MediaPlaylist.parse(first), first, PlaylistStitcher.NATIVE);
        String b1 = Playlists.media("b1", 102, "llll", false); // one backup serves up to 105
        stitcher.process(MediaPlaylist.parse(b1), b1, "b1");
        for (int i = 0; i < 3; i++) { // another lags behind, and is let through after the wait
            String b2 = Playlists.media("b2", 96, "llll", false);
            stitcher.process(MediaPlaylist.parse(b2), b2, "b2");
        }
        String b2 = Playlists.media("b2", 97, "llll", false);
        stitcher.process(MediaPlaylist.parse(b2), b2, "b2");
        // Twitch's own playlist again: up to 105 was shown already, by the first backup
        String back = Playlists.media("n", 102, "llll", false);
        String out = stitcher.process(MediaPlaylist.parse(back), back, PlaylistStitcher.NATIVE);
        assertFalse("not played twice", out.contains(Playlists.segment("n", 104)));
    }

    @Test
    public void aLaggingBackupsClockIsForgottenWhenItsBreakEnds() {
        PlaylistStitcher stitcher = new PlaylistStitcher();
        String first = Playlists.media("n", 100, "llaa", true);
        stitcher.process(MediaPlaylist.parse(first), first, PlaylistStitcher.NATIVE);
        for (int i = 0; i < 3; i++) {
            String behind = Playlists.media("b", 96, "llll", false);
            stitcher.process(MediaPlaylist.parse(behind), behind, "backup");
        }
        String late = Playlists.media("b", 97, "llll", false);
        stitcher.process(MediaPlaylist.parse(late), late, "backup"); // let through: its clock at 100
        // the break ends: Twitch's own playlist takes over and plays on to 130
        for (long at = 101; at <= 127; at++) {
            String own = Playlists.media("n", at, "llll", false);
            MediaPlaylist parsed = MediaPlaylist.parse(own);
            if (stitcher.isRewriting() && stitcher.readyToHandBack(parsed)) stitcher.passThrough(parsed, own);
            else if (stitcher.isRewriting()) stitcher.process(parsed, own, PlaylistStitcher.NATIVE);
            else stitcher.passThrough(parsed, own);
        }
        // the next break, with the same backup: what Twitch's playlist already played isn't played again
        String ad = Playlists.media("n", 128, "llaa", true);
        stitcher.process(MediaPlaylist.parse(ad), ad, PlaylistStitcher.NATIVE);
        String again = Playlists.media("b", 120, "llll", false);
        String out = stitcher.process(MediaPlaylist.parse(again), again, "backup");
        assertFalse(out.contains(Playlists.segment("b", 121)));
    }
}
