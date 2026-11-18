package io.github.sabopura.morphe.extension.twitch.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class LockHoldTest {
    private final LockHold hold = new LockHold();

    @Test
    public void aTapOnlyShowsTheHint() {
        hold.press(5_000);
        assertEquals(LockHold.Outcome.HINT, hold.release(5_120));
        assertFalse(hold.pressed());
    }

    @Test
    public void aHoldOfASecondUnlocksWhileTheFingerIsStillDown() {
        hold.press(5_000);
        assertEquals(LockHold.Outcome.UNLOCK, hold.due(5_000 + LockHold.HOLD_MS));
        assertEquals("the lift after the unlock does nothing more", LockHold.Outcome.NOTHING, hold.release(6_300));
    }

    @Test
    public void liftingJustBeforeTheSecondDoesNotUnlock() {
        hold.press(5_000);
        assertEquals(LockHold.Outcome.HINT, hold.release(5_000 + LockHold.HOLD_MS - 1));
        assertEquals("its timer comes due after the lift", LockHold.Outcome.NOTHING, hold.due(5_000 + LockHold.HOLD_MS));
    }

    @Test
    public void aHoldUnlocksOnTheLiftWhenItsTimerIsLate() {
        hold.press(5_000);
        assertEquals(LockHold.Outcome.UNLOCK, hold.release(5_000 + LockHold.HOLD_MS + 40));
    }

    @Test
    public void slidingOffTheButtonIsNeitherATapNorAHold() {
        hold.press(5_000);
        hold.cancel();
        assertEquals(LockHold.Outcome.NOTHING, hold.due(5_000 + LockHold.HOLD_MS));
        assertEquals(LockHold.Outcome.NOTHING, hold.release(6_500));
    }

    @Test
    public void aTimerLeftFromAnEarlierTapDoesNotCutTheNextHoldShort() {
        hold.press(5_000);
        hold.release(5_100);
        hold.press(5_600);
        assertTrue(hold.pressed());
        assertEquals("the first tap's timer", LockHold.Outcome.NOTHING, hold.due(6_000));
        assertTrue(hold.pressed());
        assertEquals(LockHold.Outcome.UNLOCK, hold.due(6_600));
    }
}
