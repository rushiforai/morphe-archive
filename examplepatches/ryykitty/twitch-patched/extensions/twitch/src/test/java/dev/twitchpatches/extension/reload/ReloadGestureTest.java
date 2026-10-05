package dev.twitchpatches.extension.reload;

import org.junit.Test;
import static org.junit.Assert.assertEquals;
import static dev.twitchpatches.extension.reload.ReloadGesture.Result.*;

public final class ReloadGestureTest {
    @Test public void oneTapHintsTwoQuickTapsReload() {
        ReloadGesture gesture = new ReloadGesture();
        Object source = new Object();
        assertEquals(HINT, gesture.tap(source, 100, true));
        assertEquals(RELOAD, gesture.tap(source, 500, true));
        assertEquals(IGNORE, gesture.tap(source, 550, true));
        assertEquals(HINT, gesture.tap(source, 1300, true));
        assertEquals(RELOAD, gesture.tap(source, 1400, true));
    }

    @Test public void slowTapStartsAnotherPair() {
        ReloadGesture gesture = new ReloadGesture();
        Object source = new Object();
        assertEquals(HINT, gesture.tap(source, 0, true));
        assertEquals(HINT, gesture.tap(source, 501, true));
        assertEquals(RELOAD, gesture.tap(source, 1001, true));
    }

    @Test public void raidOrSourceChangeCannotCompletePreviousPair() {
        ReloadGesture gesture = new ReloadGesture();
        assertEquals(HINT, gesture.tap(new Object(), 100, true));
        Object next = new Object();
        assertEquals(HINT, gesture.tap(next, 200, true));
        assertEquals(RELOAD, gesture.tap(next, 300, true));
    }

    @Test public void loadingAndPreferenceChangesCancelPendingTap() {
        ReloadGesture gesture = new ReloadGesture();
        Object source = new Object();
        assertEquals(HINT, gesture.tap(source, 100, true));
        assertEquals(IGNORE, gesture.tap(null, 150, true));
        assertEquals(HINT, gesture.tap(source, 200, true));
        assertEquals(IGNORE, gesture.tap(source, 250, false));
        assertEquals(HINT, gesture.tap(source, 300, true));
        gesture.reset();
        assertEquals(HINT, gesture.tap(source, 350, true));
    }
}
