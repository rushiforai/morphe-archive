package app.morphed.extension.twitch.ui;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** Turning the phone while locked never unlocks; really leaving full screen does. */
public class LockRulesTest {
    @Test
    public void aMomentOutOfFullScreenWhileTurningKeepsTheLock() {
        assertFalse(LockRules.leftFullScreen(10_000, 10_000));
        assertFalse(LockRules.leftFullScreen(10_000, 10_000 + LockRules.LEFT_FULL_SCREEN_MS - 1));
    }

    @Test
    public void stayingOutOfFullScreenLetsGo() {
        assertTrue(LockRules.leftFullScreen(10_000, 10_000 + LockRules.LEFT_FULL_SCREEN_MS));
        assertFalse("not out of full screen at all", LockRules.leftFullScreen(0, 99_999));
    }
}
