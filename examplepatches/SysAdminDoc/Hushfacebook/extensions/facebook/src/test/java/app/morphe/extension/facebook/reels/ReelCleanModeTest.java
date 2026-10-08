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
 * Always use Clean mode: with the switch on, each part of the Reels viewer that reads Facebook's
 * remembered Clean mode flag as it's made gets a yes, and each one is counted. A yes from Facebook
 * passes as it came. Off, paused, or before the settings are ready, Facebook's answer is kept.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReelCleanModeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.REEL_CLEAN_MODE.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.REEL_DECLUTTER + ":")) return line;
        }
        return null;
    }

    @Test
    public void onEveryPartStartsCleanAndIsCounted() {
        Settings.REEL_CLEAN_MODE.save(true);
        // The overlay, the footer and the unified player's controls read the flag as a boolean,
        // the video controls through Facebook's helper that boxes it.
        assertTrue("the overlay started with its buttons", ReelCleanMode.startClean(false));
        assertTrue("the footer started outside Clean mode", ReelCleanMode.startClean(false));
        assertTrue("the player controls started outside Clean mode", ReelCleanMode.startClean(false));
        assertSame("the boxed read wasn't turned into a yes", Boolean.TRUE, ReelCleanMode.startClean(Boolean.FALSE));
        assertEquals(FamilyNames.REEL_DECLUTTER + ": invoked 4, 1 found, 0 missing. Counted: "
                + ReelCleanMode.STARTED_CLEAN + " 4", statusLine());
    }

    @Test
    public void facebooksYesPassesAsItCame() {
        // An account with sticky Clean mode that left it on: nothing to change, nothing counted.
        Boolean facebooks = Boolean.TRUE;
        assertTrue(ReelCleanMode.startClean(true));
        assertSame(facebooks, ReelCleanMode.startClean(facebooks));
        Settings.REEL_CLEAN_MODE.save(true);
        assertTrue(ReelCleanMode.startClean(true));
        assertSame(facebooks, ReelCleanMode.startClean(facebooks));
        String line = statusLine();
        assertFalse("a yes Facebook gave was counted: " + line, line != null && line.contains("Counted"));
    }

    @Test
    public void offOrPausedFacebookDecides() {
        assertFalse("the switch doesn't start off", Settings.REEL_CLEAN_MODE.get());
        assertFalse("off, a reel started clean", ReelCleanMode.startClean(false));
        assertSame("off, the boxed read changed", Boolean.FALSE, ReelCleanMode.startClean(Boolean.FALSE));
        assertNull("off, a missing answer was filled in", ReelCleanMode.startClean((Boolean) null));

        Settings.REEL_CLEAN_MODE.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(reason);
            assertFalse("a Hushfacebook paused by " + reason + " started a reel clean", ReelCleanMode.startClean(false));
            assertSame("a Hushfacebook paused by " + reason + " changed the boxed read",
                    Boolean.FALSE, ReelCleanMode.startClean(Boolean.FALSE));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() ->
                assertFalse("a reel started clean before the settings were ready", ReelCleanMode.startClean(false)));

        String line = statusLine();
        assertFalse("an answer that left it to Facebook was counted: " + line, line != null && line.contains("Counted"));
        assertTrue("on again after the pause, the reel didn't start clean", ReelCleanMode.startClean(false));
    }

    @Test
    public void theSwitchNeedsNoRestartAndTravelsWithCleanUpReels() {
        assertFalse("a new reel reads the switch as it's made", Settings.REEL_CLEAN_MODE.rebootApp);
        assertTrue("Pause and the report don't know the switch",
                PatchFamily.REEL_DECLUTTER.switches.contains(Settings.REEL_CLEAN_MODE));
    }
}
