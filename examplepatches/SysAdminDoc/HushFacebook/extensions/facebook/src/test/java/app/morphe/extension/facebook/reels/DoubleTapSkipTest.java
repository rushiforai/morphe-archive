/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/** Double tap to skip (#225): when Facebook's own double-tap skip test is answered on. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class DoubleTapSkipTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        HookStatus.clear();
        PauseForTests.resume();
        Settings.DOUBLE_TAP_SKIP.resetToDefault();
    }

    @Test
    public void theSwitchStartsOffAndLeavesFacebooksAnswer() {
        assertFalse(DoubleTapSkip.flag(false));
        assertTrue("an account Facebook already gave the skip keeps it", DoubleTapSkip.flag(true));
    }

    @Test
    public void onTurnsTheSkipOn() {
        Settings.DOUBLE_TAP_SKIP.save(true);
        assertTrue(DoubleTapSkip.flag(false));
        assertTrue(DoubleTapSkip.flag(true));
    }

    @Test
    public void pausedLeavesFacebooksAnswer() {
        Settings.DOUBLE_TAP_SKIP.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(DoubleTapSkip.flag(false));
        assertTrue(DoubleTapSkip.flag(true));
    }
}
