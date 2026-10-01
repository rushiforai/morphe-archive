/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
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
 * Hide post prompts: with the switch on, a story the bumper predicate says has a bumper is answered
 * as one without, and counted; a story without one keeps Facebook's no. Off or paused, Facebook's
 * yes stands.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PostPromptsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_POST_PROMPTS.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.POST_PROMPTS + ":")) return line;
        }
        return null;
    }

    @Test
    public void aBumperIsAnsweredAwayAndNoBumperStaysNo() {
        assertTrue("the switch doesn't start on", Settings.HIDE_POST_PROMPTS.get());
        assertFalse("a post kept its bumper", PostPrompts.keep(true));
        assertFalse("a post without a bumper got one", PostPrompts.keep(false));
        assertEquals(FamilyNames.POST_PROMPTS + ": invoked 2, 1 found, 0 missing. Counted: "
                + PostPrompts.HIDDEN + " 1", statusLine());
    }

    @Test
    public void offOrPausedTheBumperStays() {
        Settings.HIDE_POST_PROMPTS.save(false);
        assertTrue(PostPrompts.keep(true));
        assertFalse(PostPrompts.keep(false));
        Settings.HIDE_POST_PROMPTS.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            assertTrue("a Hushfacebook paused by " + reason + " hid a bumper", PostPrompts.keep(true));
            PauseForTests.resume();
        }
    }

    /** The patch hands Facebook's answer over as an int, since a boolean method may return one. */
    @Test
    public void thePatchsIntEntryReadsNonZeroAsYes() {
        assertFalse("a bumper handed over as 1 stayed", PostPrompts.keep(1));
        assertFalse(PostPrompts.keep(0));
        Settings.HIDE_POST_PROMPTS.save(false);
        assertTrue("with the switch off, 1 lost Facebook's yes", PostPrompts.keep(1));
        assertFalse(PostPrompts.keep(0));
    }
}
