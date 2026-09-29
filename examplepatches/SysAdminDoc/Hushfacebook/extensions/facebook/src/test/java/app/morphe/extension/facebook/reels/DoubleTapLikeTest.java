/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The hooks that keep a double tap on a reel or a video from liking it: while the switch is on,
 * the player's double-tap handler reads as absent, the heart has no handler to play for, the reel
 * like's lookup key comes back empty, a like whose source is a double tap isn't sent and a feed
 * attachment's own double tap is left unhandled. Everything else, and everything while the switch
 * is off or Hushfacebook is paused, goes through as Facebook handed it over.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class DoubleTapLikeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.TURN_OFF_DOUBLE_TAP_LIKE.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.DOUBLE_TAP_LIKE + ":")) return line;
        }
        return null;
    }

    /** The status line after [invoked] hook calls, [held] of them held back. */
    private static String status(int invoked, int held) {
        String line = FamilyNames.DOUBLE_TAP_LIKE + ": invoked " + invoked + ", 0 found, 0 missing";
        return held == 0 ? line : line + ". Counted: " + DoubleTapLike.HELD_BACK + " " + held;
    }

    @Test
    public void theSwitchStartsOnAndEveryHookHoldsTheDoubleTapBack() {
        assertTrue("the switch starts off", Settings.TURN_OFF_DOUBLE_TAP_LIKE.get());
        assertNull("the player's double-tap handler was handed over", DoubleTapLike.handler(new Object()));
        assertNull("the heart found its handler", DoubleTapLike.heart(new Object()));
        assertNull("the reel like's key was handed over", DoubleTapLike.likeKey("key"));
        assertTrue("a like from a double tap was sent", DoubleTapLike.holdBackLike(DoubleTapLike.DOUBLE_TAP));
        assertTrue("a feed attachment's double tap went ahead", DoubleTapLike.holdBackTap());
        // The heart's read comes before the handler's in the same double tap, so only the
        // handler's counts it.
        assertEquals(status(5, 4), statusLine());
    }

    @Test
    public void offEveryHookHandsBackWhatFacebookHandedIt() {
        Settings.TURN_OFF_DOUBLE_TAP_LIKE.save(false);
        Object handler = new Object();
        assertSame(handler, DoubleTapLike.handler(handler));
        assertSame(handler, DoubleTapLike.heart(handler));
        String key = "key";
        assertSame(key, DoubleTapLike.likeKey(key));
        assertFalse(DoubleTapLike.holdBackLike(DoubleTapLike.DOUBLE_TAP));
        assertFalse(DoubleTapLike.holdBackTap());
        assertEquals(status(5, 0), statusLine());
    }

    @Test
    public void pausedADoubleTapLikesAgain() {
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            Object handler = new Object();
            assertSame(reason.name(), handler, DoubleTapLike.handler(handler));
            assertSame(reason.name(), handler, DoubleTapLike.heart(handler));
            assertSame(reason.name(), "key", DoubleTapLike.likeKey("key"));
            assertFalse(reason.name(), DoubleTapLike.holdBackLike(DoubleTapLike.DOUBLE_TAP));
            assertFalse(reason.name(), DoubleTapLike.holdBackTap());
        }
        PauseForTests.resume();
        assertNull(DoubleTapLike.handler(new Object()));
        assertTrue(DoubleTapLike.holdBackLike(DoubleTapLike.DOUBLE_TAP));
    }

    /** The Like button, a reaction and every other source go to Facebook whatever the switch says. */
    @Test
    public void onlyALikeFromADoubleTapIsHeldBack() {
        for (String source : new String[] {"REACT_BUTTON", "Like", "double_tap", "DOUBLE_TAP_TO_LIKE", "", null}) {
            assertFalse(String.valueOf(source), DoubleTapLike.holdBackLike(source));
        }
        assertEquals(status(6, 0), statusLine());
        assertTrue(DoubleTapLike.holdBackLike(new String(DoubleTapLike.DOUBLE_TAP.toCharArray())));
        assertEquals(status(7, 1), statusLine());
    }

    /** No handler or no key is Facebook's own nothing-to-do, not a double tap held back. */
    @Test
    public void nothingToHandOverIsNotCounted() {
        assertNull(DoubleTapLike.handler(null));
        assertNull(DoubleTapLike.heart(null));
        assertNull(DoubleTapLike.likeKey(null));
        assertEquals(status(3, 0), statusLine());
    }

    /** Each double tap is counted, however many come, and a diagnostic clear starts over. */
    @Test
    public void everyDoubleTapIsCountedAndAClearStartsOver() {
        for (int i = 0; i < 3; i++) {
            DoubleTapLike.heart(new Object());
            DoubleTapLike.handler(new Object());
        }
        assertEquals(status(6, 3), statusLine());
        HookStatus.clear();
        DoubleTapLike.likeKey("key");
        assertEquals(status(1, 1), statusLine());
    }
}
