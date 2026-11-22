package app.morphed.extension.twitch.ui;

import static org.junit.Assert.assertEquals;
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

    @Test
    public void aFailureIsTriedAgainAfterAPause() {
        assertEquals("never failed", 0, LockRules.pauseLeft(0, 0, 5));
        assertEquals(1, LockRules.pauseLeft(10_000, 1, 10_000 + 3000 - 1));
        assertEquals("never off for good", 0, LockRules.pauseLeft(10_000, 1, 10_000 + 3000));
        assertEquals("a clock gone back doesn't hold it off", 0, LockRules.pauseLeft(10_000, 1, 9_000));
    }

    @Test
    public void aFailureThatKeepsComingBackPausesLonger() {
        assertEquals(3000, LockRules.failurePause(1));
        assertEquals(10_000, LockRules.failurePause(2));
        assertEquals(30_000, LockRules.failurePause(3));
        assertEquals("at most", 30_000, LockRules.failurePause(50));
        assertEquals(3000, LockRules.failurePause(0));
    }

    @Test
    public void theNativePlayersControlsTakeOurParts() {
        java.util.List<String> nativeControls = java.util.Arrays.asList(
                "androidx.constraintlayout.widget.ConstraintLayout", "android.view.ViewGroup");
        assertTrue("Twitch 31.8's native player_overlay", ControlsLayout.takesFreeChildren(nativeControls));
        assertTrue("a subclass of one", ControlsLayout.takesFreeChildren(java.util.Arrays.asList(
                "tv.twitch.SomeOverlay", "android.widget.FrameLayout", "android.view.ViewGroup")));
        assertTrue(ControlsLayout.takesFreeChildren(java.util.Arrays.asList("android.widget.RelativeLayout")));
        assertFalse("a row would push the player's buttons along", ControlsLayout.takesFreeChildren(
                java.util.Arrays.asList("android.widget.LinearLayout", "android.view.ViewGroup")));
        assertFalse(ControlsLayout.takesFreeChildren(java.util.Collections.emptyList()));
    }
}
