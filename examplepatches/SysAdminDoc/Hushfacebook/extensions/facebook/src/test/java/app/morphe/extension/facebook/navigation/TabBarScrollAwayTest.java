/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

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
import app.morphe.extension.facebook.settings.PatchFamily;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Hide the tab bar while scrolling: with the switch on, Facebook's check of whether the bar at the
 * bottom slides away answers yes, every time it's asked, and each yes is counted. Off, paused, or
 * before the settings are ready, it answers no, so Facebook goes on to its own server settings.
 * The slide itself is Facebook's code, which this check turns on.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TabBarScrollAwayTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.TAB_BAR_SCROLL_AWAY.resetToDefault();
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
    public void onTheBarSlidesAwayEachTimeFacebookAsks() {
        Settings.TAB_BAR_SCROLL_AWAY.save(true);
        // The start, the floating button and the mini player each ask.
        for (int asked = 0; asked < 3; asked++) {
            assertTrue("the check answered no with the switch on", TabBarScrollAway.slidesAway());
        }
        assertEquals(FamilyNames.BOTTOM_TAB_BAR + ": invoked 3, 1 found, 0 missing. Counted: "
                + TabBarScrollAway.SLIDES_AWAY + " 3", statusLine());
    }

    @Test
    public void theSwitchWorksWithoutTabBarAtTheBottomsOwnSwitch() {
        // Accounts Facebook gives the bar at the bottom don't need the other switch.
        assertFalse(Settings.BOTTOM_TAB_BAR.get());
        Settings.TAB_BAR_SCROLL_AWAY.save(true);
        assertTrue("the slide waited for Tab bar at the bottom's switch", TabBarScrollAway.slidesAway());
    }

    @Test
    public void offOrPausedFacebookDecides() {
        assertFalse("the switch doesn't start off", Settings.TAB_BAR_SCROLL_AWAY.get());
        assertFalse("off, the bar slid away", TabBarScrollAway.slidesAway());

        Settings.TAB_BAR_SCROLL_AWAY.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(reason);
            assertFalse("a Hushfacebook paused by " + reason + " slid the bar away", TabBarScrollAway.slidesAway());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() ->
                assertFalse("the bar slid away before the settings were ready", TabBarScrollAway.slidesAway()));

        String line = statusLine();
        assertFalse("an answer that left it to Facebook was counted: " + line, line != null && line.contains("Counted"));
        assertTrue("on again after the pause, the bar didn't slide away", TabBarScrollAway.slidesAway());
    }

    @Test
    public void theSwitchAsksForARestartAndTravelsWithTheBarsFamily() {
        assertEquals(true, Settings.TAB_BAR_SCROLL_AWAY.rebootApp);
        assertNull("nothing asks before the switch changes", Settings.TAB_BAR_SCROLL_AWAY.userDialogMessage);
        assertTrue("Pause and the report don't know the switch",
                PatchFamily.BOTTOM_TAB_BAR.switches.contains(Settings.TAB_BAR_SCROLL_AWAY));
    }
}
