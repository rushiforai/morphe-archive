package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.media.session.PlaybackState;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
public class D4PlaybackSelectionTest {
    private static RebuildClock.Observation paused(long position, long epoch, String source) {
        return new RebuildClock.Observation(position, 2, 1, 100, epoch, source, "fixture", "video");
    }

    @Test public void nativePauseJitterIsHeldUntilMatchingTinyHookOrEpochChange() {
        RebuildPlaybackSelection selection = new RebuildPlaybackSelection();
        assertEquals(1000, selection.select(paused(1000, 10, RebuildClock.OFFICIAL_PLAYER_QUERY), null, 1, false, 0));
        assertEquals(1000, selection.select(paused(1016, 10, RebuildClock.OFFICIAL_PLAYER_QUERY), null, 1, false, 0));
        assertEquals(1016, selection.select(paused(1016, 10, RebuildClock.OFFICIAL_PLAYER_QUERY), null, 1, true, 1016));
        assertEquals(1016, selection.select(paused(1001, 10, RebuildClock.OFFICIAL_PLAYER_QUERY), null, 1, true, 1002));
        assertEquals(1001, selection.select(paused(1001, 10, RebuildClock.OFFICIAL_PLAYER_QUERY), null, 2, false, 0));
        assertTrue(selection.paused());
    }

    @Test public void oldMediaAcknowledgementCannotUndoHookSeekAndSerialIsConsumedOnce() {
        RebuildPlaybackSelection selection = new RebuildPlaybackSelection();
        PlaybackState old = new PlaybackState.Builder().setState(2, 1000, 0, 100).build();
        PlaybackState newer = new PlaybackState.Builder().setState(2, 6500, 0, 200).build();
        assertEquals(1000, selection.select(paused(1000, 10, RebuildClock.FRESH_MEDIA_ESTIMATE), old, 1, false, 0));
        assertEquals(5000, selection.select(paused(1000, 10, RebuildClock.FRESH_MEDIA_ESTIMATE), old, 1, true, 5000));
        assertEquals(5000, selection.select(paused(1000, 10, RebuildClock.FRESH_MEDIA_ESTIMATE), old, 1, false, 0));
        assertEquals(5000, selection.select(paused(6400, 10, RebuildClock.FRESH_MEDIA_ESTIMATE), newer, 1, false, 0));
        assertEquals(6501, selection.select(paused(6501, 10, RebuildClock.FRESH_MEDIA_ESTIMATE), newer, 1, false, 0));
        assertFalse(selection.hasNewSeek(3));
        selection.consumeSeek(3);
        assertFalse(selection.hasNewSeek(3));
        assertTrue(selection.hasNewSeek(4));
        selection.consumeSeek(4);
        assertFalse(selection.hasNewSeek(4));
    }
}
