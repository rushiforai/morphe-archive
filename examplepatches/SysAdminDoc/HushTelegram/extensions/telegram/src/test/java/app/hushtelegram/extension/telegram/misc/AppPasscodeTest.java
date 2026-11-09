/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowSystemClock;

import java.time.Duration;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AppPasscodeTest {
    private AppPasscodeForTests.Fake telegram;

    @Before public void setUp() {
        telegram = AppPasscodeForTests.use("2468");
    }

    @After public void tearDown() {
        AppPasscodeForTests.restore();
    }

    @Test public void onlyTheRightPasscodeMatches() {
        assertTrue(AppPasscode.isSet());
        assertTrue(AppPasscode.isPin());
        assertTrue(AppPasscode.matches("2468"));
        assertFalse(AppPasscode.matches("2469"));
        assertFalse("empty and missing are never a match", AppPasscode.matches("") || AppPasscode.matches(null));
        assertEquals("empty and missing never reach Telegram", 2, telegram.asked);
    }

    @Test public void noPasscodeMeansNotSet() {
        AppPasscodeForTests.use(null);
        assertFalse(AppPasscode.isSet());
        AppPasscodeForTests.use("a1b2");
        assertTrue(AppPasscode.isSet());
        assertFalse("a password isn't a PIN", AppPasscode.isPin());
    }

    @Test public void fiveWrongTriesWaitAMomentEvenForTheRightPasscode() {
        for (int i = 0; i < AppPasscode.MISSES; i++) assertFalse(AppPasscode.matches("0000"));
        assertEquals(AppPasscode.WAIT_MILLIS, AppPasscode.waitMillis());
        assertFalse("the wait holds the right one back too", AppPasscode.matches("2468"));
        assertEquals("and doesn't ask Telegram", AppPasscode.MISSES, telegram.asked);
        ShadowSystemClock.advanceBy(Duration.ofMillis(AppPasscode.WAIT_MILLIS + 1));
        assertEquals(0, AppPasscode.waitMillis());
        assertTrue(AppPasscode.matches("2468"));
    }

    @Test public void aRightPasscodeStartsTheCountAgain() {
        for (int i = 0; i < AppPasscode.MISSES - 1; i++) assertFalse(AppPasscode.matches("0000"));
        assertTrue(AppPasscode.matches("2468"));
        for (int i = 0; i < AppPasscode.MISSES - 1; i++) assertFalse(AppPasscode.matches("0000"));
        assertEquals("four wrong tries after a right one don't wait", 0, AppPasscode.waitMillis());
    }

    @Test public void telegramThatCantBeAskedCountsAsNoPasscodeAndNoMatch() {
        AppPasscode.telegram = new AppPasscode.Telegram() {
            @Override public boolean passcodeSet() { throw new IllegalStateException("changed"); }
            @Override public boolean passcodePin() { throw new IllegalStateException("changed"); }
            @Override public boolean passcodeMatches(String typed) { throw new IllegalStateException("changed"); }
        };
        assertFalse(AppPasscode.isSet());
        assertFalse(AppPasscode.isPin());
        assertFalse(AppPasscode.matches("2468"));
    }
}
