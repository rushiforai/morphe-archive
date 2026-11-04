package app.wordfeudwordfinder.extension.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import app.wordfeudwordfinder.extension.core.WfError;
import app.wordfeudwordfinder.extension.play.MoveSubmitter.Result.Kind;
import org.junit.Test;

public class PlayStateTest {
    private static boolean can(PlayState p, long gen) {
        return p.canPlay(true, true, false, gen);
    }

    @Test
    public void enabledOnlyWithSelectionTurnAndIdleSubmitter() {
        PlayState p = new PlayState();
        assertTrue(p.canPlay(true, true, false, 0));
        assertFalse(p.canPlay(false, true, false, 0));
        assertFalse(p.canPlay(true, false, false, 0));
        assertFalse(p.canPlay(true, true, true, 0));
    }

    @Test
    public void disabledWhileSending() {
        PlayState p = new PlayState();
        assertTrue(p.begin());
        assertFalse(can(p, 0));
        assertFalse("no second request while one runs", p.begin());
    }

    @Test
    public void successClosesAndRefreshes() {
        PlayState p = new PlayState();
        p.begin();
        assertEquals(PlayState.Action.CLOSE_AND_REFRESH, p.onResult(Kind.SUCCESS, null, 5));
        assertTrue(can(p, 5));
    }

    @Test
    public void rejectedShowsMessageAndReenables() {
        PlayState p = new PlayState();
        p.begin();
        assertEquals(PlayState.Action.SHOW_REJECTED, p.onResult(Kind.REJECTED, null, 5));
        assertTrue(can(p, 5));
    }

    @Test
    public void otherErrorShowsPanelAndReenables() {
        PlayState p = new PlayState();
        p.begin();
        assertEquals(PlayState.Action.SHOW_ERROR, p.onResult(Kind.ERROR, WfError.mvServer("x"), 5));
        assertTrue(can(p, 5));
        p.begin();
        assertEquals(PlayState.Action.SHOW_ERROR, p.onResult(Kind.ERROR, WfError.mvSession(), 5));
        assertTrue(can(p, 5));
    }

    @Test
    public void mvNetBlocksUntilNextGamesDetail() {
        PlayState p = new PlayState();
        p.begin();
        assertEquals(PlayState.Action.SHOW_ERROR, p.onResult(Kind.ERROR, WfError.mvNet(), 7));
        assertTrue(p.blocked(7));
        assertFalse(can(p, 7)); // same games/detail count: still off (e.g. only a move response came in)
        assertFalse(p.begin());
        assertTrue(can(p, 8)); // a games/detail was processed after the error
        assertFalse(p.blocked(8));
        assertTrue(can(p, 7)); // cleared for good, also if an older count is passed later
    }

    @Test
    public void errorWithoutCodeCountsAsUnknownOutcome() {
        PlayState p = new PlayState();
        p.begin();
        assertEquals(PlayState.Action.SHOW_ERROR, p.onResult(Kind.ERROR, null, 1));
        assertFalse(can(p, 1));
        assertTrue(can(p, 2));
    }
}
