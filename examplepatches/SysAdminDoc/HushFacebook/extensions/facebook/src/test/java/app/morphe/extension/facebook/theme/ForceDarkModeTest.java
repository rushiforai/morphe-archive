/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
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
 * Force dark mode (#64): with the switch on, the controller's light answer comes back dark, and
 * DarkMode keeps the dark one, so the themes see dark mode on. Off, paused or not in the build,
 * Facebook's answer stays, and a build without the patch doesn't count or read anything.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ForceDarkModeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
        ForceDarkMode.inBuildForTests = true;
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.FORCE_DARK_MODE.resetToDefault();
        ForceDarkMode.inBuildForTests = null;
        DarkMode.answer(true);
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.FORCE_DARK_MODE + ":")) return line;
        }
        return null;
    }

    @Test
    public void onALightAnswerComesBackDarkAndIsKeptDark() {
        Settings.FORCE_DARK_MODE.save(true);
        assertTrue("the controller answered light", DarkMode.answer(false));
        assertTrue("the themes see dark mode on", DarkMode.on());
        assertTrue("a dark answer stays dark", DarkMode.answer(true));
        assertEquals(FamilyNames.FORCE_DARK_MODE + ": invoked 2, 1 found, 0 missing. Counted: "
                + ForceDarkMode.FORCED + " 1", statusLine());
    }

    @Test
    public void offOrPausedFacebooksAnswerStays() {
        assertFalse("the switch doesn't start off", Settings.FORCE_DARK_MODE.get());
        assertFalse("off, a light answer was turned dark", DarkMode.answer(false));
        assertFalse(DarkMode.on());
        assertTrue("off, a dark answer was changed", DarkMode.answer(true));
        Settings.FORCE_DARK_MODE.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            assertFalse("a Hushfacebook paused by " + reason + " forced dark mode", DarkMode.answer(false));
            PauseForTests.resume();
        }
        String line = statusLine();
        assertFalse("an answer left as Facebook gave it was counted: " + line, line != null && line.contains("Counted"));
    }

    /** A theme hooks the controller too, so a build without Force dark mode reaches here with the switch on from a backup. */
    @Test
    public void aBuildWithoutThePatchLeavesTheAnswerAndReportsNothing() {
        ForceDarkMode.inBuildForTests = false;
        Settings.FORCE_DARK_MODE.save(true);
        assertFalse(DarkMode.answer(false));
        assertNull("a build without the patch reported on it", statusLine());
    }

    @Test
    public void theSwitchIsOneThatAsksForARestart() {
        assertEquals(true, Settings.FORCE_DARK_MODE.rebootApp);
        assertNull("nothing asks before the switch changes", Settings.FORCE_DARK_MODE.userDialogMessage);
    }
}
