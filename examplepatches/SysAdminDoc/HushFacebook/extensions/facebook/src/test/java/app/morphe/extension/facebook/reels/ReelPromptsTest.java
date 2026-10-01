/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

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
 * Hide reel interest prompts: with the switch on, a reel the predicate would give the prompt is
 * answered as one without, and counted; a reel without one keeps Facebook's no. Off or paused,
 * Facebook's yes stands.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReelPromptsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_REEL_PROMPTS.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.REEL_PROMPTS + ":")) return line;
        }
        return null;
    }

    @Test
    public void thePromptIsAnsweredAwayAndNoPromptStaysNo() {
        assertTrue("the switch doesn't start on", Settings.HIDE_REEL_PROMPTS.get());
        assertFalse("a reel kept its prompt", ReelPrompts.keep(true));
        assertFalse("a reel without a prompt got one", ReelPrompts.keep(false));
        assertEquals(FamilyNames.REEL_PROMPTS + ": invoked 2, 1 found, 0 missing. Counted: "
                + ReelPrompts.HIDDEN + " 1", statusLine());
    }

    @Test
    public void offOrPausedThePromptStays() {
        Settings.HIDE_REEL_PROMPTS.save(false);
        assertTrue(ReelPrompts.keep(true));
        assertFalse(ReelPrompts.keep(false));
        Settings.HIDE_REEL_PROMPTS.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            assertTrue("a Hushfacebook paused by " + reason + " hid a reel's prompt", ReelPrompts.keep(true));
            PauseForTests.resume();
        }
    }

    /** The patch hands Facebook's answer over as an int, since a boolean method may return one. */
    @Test
    public void thePatchsIntEntryReadsNonZeroAsYes() {
        assertFalse("a reel's prompt handed over as 1 stayed", ReelPrompts.keep(1));
        assertFalse(ReelPrompts.keep(0));
        Settings.HIDE_REEL_PROMPTS.save(false);
        assertTrue("with the switch off, 1 lost Facebook's yes", ReelPrompts.keep(1));
        assertFalse(ReelPrompts.keep(0));
    }
}
