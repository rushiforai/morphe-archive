/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;

import com.facebook.common.util.TriState;

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
 * Tab bar at the bottom: with the switch on, every read of Facebook's own override answers YES,
 * whatever the account had, and is counted. Off or paused, each read keeps Facebook's answer.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class BottomTabBarTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.BOTTOM_TAB_BAR.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.BOTTOM_TAB_BAR + ":")) return line;
        }
        return null;
    }

    @Test
    public void onEveryAnswerIsYes() {
        Settings.BOTTOM_TAB_BAR.save(true);
        for (TriState facebooks : TriState.values()) {
            assertEquals("the override read " + facebooks, TriState.YES.ordinal(), BottomTabBar.override(facebooks.ordinal()));
        }
        assertEquals(FamilyNames.BOTTOM_TAB_BAR + ": invoked 3, 1 found, 0 missing. Counted: "
                + BottomTabBar.PUT_AT_BOTTOM + " 3", statusLine());
    }

    @Test
    public void offOrPausedFacebooksAnswerStays() {
        assertFalse("the switch doesn't start off", Settings.BOTTOM_TAB_BAR.get());
        for (TriState facebooks : TriState.values()) {
            assertEquals("off, the override read " + facebooks, facebooks.ordinal(), BottomTabBar.override(facebooks.ordinal()));
        }
        Settings.BOTTOM_TAB_BAR.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            assertEquals("a Hushfacebook paused by " + reason + " moved the tab bar",
                    TriState.NO.ordinal(), BottomTabBar.override(TriState.NO.ordinal()));
            PauseForTests.resume();
        }
        String line = statusLine();
        assertFalse("a read that kept Facebook's answer was counted: " + line, line != null && line.contains("Counted"));
    }

    @Test
    public void theSwitchIsOneThatAsksForARestart() {
        assertEquals(true, Settings.BOTTOM_TAB_BAR.rebootApp);
        assertNull("nothing asks before the switch changes", Settings.BOTTOM_TAB_BAR.userDialogMessage);
    }
}
