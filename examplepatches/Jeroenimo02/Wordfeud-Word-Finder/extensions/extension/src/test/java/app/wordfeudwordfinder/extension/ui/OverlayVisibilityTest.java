package app.wordfeudwordfinder.extension.ui;

import static org.junit.Assert.*;

import app.wordfeudwordfinder.extension.core.WfError;
import app.wordfeudwordfinder.extension.game.GameState;
import java.util.Collections;
import org.junit.Test;

public class OverlayVisibilityTest {
    private static GameState st(boolean myTurn, boolean ended, WfError err) {
        return new GameState(1L, new char[15][15], Collections.<String>emptyList(), myTurn, ended, err);
    }

    @Test public void hiddenOnHome() {
        assertFalse(OverlayVisibility.fabVisible(null, st(true, false, null)));
    }
    // Changed (was hiddenForUnknownGame): a game route whose game is not in the GameStore yet (a new game, before
    // Wordfeud's next games/detail poll) shows the button; the overlay then says the game is loading.
    @Test public void visibleForGameNotYetInStore() {
        assertTrue(OverlayVisibility.fabVisible(1L, null));
    }
    @Test public void hiddenOnHomeWithoutState() {
        assertFalse(OverlayVisibility.fabVisible(null, null));
    }
    @Test public void hiddenWhenEnded() {
        assertFalse(OverlayVisibility.fabVisible(1L, st(true, true, null)));
    }
    @Test public void visibleWhenUnreadable() {
        assertTrue(OverlayVisibility.fabVisible(1L, st(false, false, WfError.gsData("x"))));
    }
    @Test public void hiddenWhenEndedAndUnreadable() {
        assertFalse(OverlayVisibility.fabVisible(1L, st(false, true, WfError.gsEvent("x"))));
    }
    @Test public void visibleWhenNotMyTurn() {
        assertTrue(OverlayVisibility.fabVisible(1L, st(false, false, null)));
    }
    @Test public void visibleWhenMyTurn() {
        assertTrue(OverlayVisibility.fabVisible(1L, st(true, false, null)));
    }
}
