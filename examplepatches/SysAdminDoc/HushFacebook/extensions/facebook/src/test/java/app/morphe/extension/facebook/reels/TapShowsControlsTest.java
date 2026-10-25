/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import static org.junit.Assert.assertEquals;
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

/** Tap shows the controls (#225): when a reel tap gets the controls in place of the pause, and how long they stay. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TapShowsControlsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        HookStatus.clear();
        PauseForTests.resume();
        Settings.TAP_SHOWS_CONTROLS.resetToDefault();
    }

    @Test
    public void theSwitchStartsOffAndLeavesFacebooksAnswers() {
        assertFalse(TapShowsControls.showControls(false));
        assertTrue("an account Facebook already gave the controls keeps them", TapShowsControls.showControls(true));
        assertEquals(1000L, TapShowsControls.hideDelay(1000L));
        assertEquals(1000, TapShowsControls.hideDelay(1000));
        assertTrue("the unified player keeps skipping its hide", TapShowsControls.skipHide(true));
        assertFalse(TapShowsControls.skipHide(false));
    }

    @Test
    public void onShowsTheControlsAndKeepsThemUpLonger() {
        Settings.TAP_SHOWS_CONTROLS.save(true);
        assertTrue(TapShowsControls.showControls(false));
        assertTrue(TapShowsControls.showControls(true));
        assertEquals(TapShowsControls.HIDE_AFTER_MS, TapShowsControls.hideDelay(1000L));
        assertEquals(TapShowsControls.HIDE_AFTER_MS, TapShowsControls.hideDelay(1000));
        assertFalse("the unified player hides the controls on its own", TapShowsControls.skipHide(true));
        assertFalse(TapShowsControls.skipHide(false));
    }

    @Test
    public void aLongerWaitOfFacebooksStays() {
        Settings.TAP_SHOWS_CONTROLS.save(true);
        assertEquals(5000L, TapShowsControls.hideDelay(5000L));
        assertEquals(5000, TapShowsControls.hideDelay(5000));
    }

    @Test
    public void pausedLeavesFacebooksAnswers() {
        Settings.TAP_SHOWS_CONTROLS.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(TapShowsControls.showControls(false));
        assertTrue(TapShowsControls.showControls(true));
        assertEquals(1000L, TapShowsControls.hideDelay(1000L));
        assertEquals(1000, TapShowsControls.hideDelay(1000));
        assertTrue(TapShowsControls.skipHide(true));
    }
}
