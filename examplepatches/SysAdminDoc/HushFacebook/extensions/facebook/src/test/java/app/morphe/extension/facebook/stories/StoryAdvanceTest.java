/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.stories;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class StoryAdvanceTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void clearCounts() {
        HookStatus.clear();
        // The patch is in Morphe Manager's default selection with its switch off; these tests run with it on.
        Settings.BLOCK_STORY_AUTO_ADVANCE.save(true);
    }

    @After public void restore() {
        PauseForTests.resume();
        Settings.BLOCK_STORY_AUTO_ADVANCE.resetToDefault();
        Settings.LOOP_STORIES.resetToDefault();
        HookStatus.clear();
    }

    @Test public void switchAndPauseLeaveFacebooksTimingAlone() {
        assertTrue(StoryAdvance.waitForTap());
        Settings.BLOCK_STORY_AUTO_ADVANCE.save(false);
        assertFalse(StoryAdvance.waitForTap());
        Settings.BLOCK_STORY_AUTO_ADVANCE.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(StoryAdvance.waitForTap());
    }

    @Test public void loopStartsAHeldStoryAgainAndCountsIt() {
        assertFalse("Loop stories starts off", StoryAdvance.loop());
        Settings.LOOP_STORIES.save(true);
        assertTrue(StoryAdvance.loop());
        assertTrue(line().contains("Counted: " + StoryAdvance.LOOPED + " 1"));
    }

    @Test public void loopNeedsStopStoryAutoAdvanceAndStopsWhilePaused() {
        Settings.LOOP_STORIES.save(true);
        Settings.BLOCK_STORY_AUTO_ADVANCE.save(false);
        assertFalse(StoryAdvance.loop());
        Settings.BLOCK_STORY_AUTO_ADVANCE.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(StoryAdvance.loop());
        PauseForTests.resume();
        Settings.LOOP_STORIES.save(false);
        assertFalse(StoryAdvance.loop());
        assertFalse(line().contains(StoryAdvance.LOOPED));
    }

    /** The diagnostic report's line for the patch, or empty when it has none. */
    private static String line() {
        List<String> report = HookStatus.report();
        for (String line : report) if (line.startsWith(FamilyNames.STORY_AUTO_ADVANCE)) return line;
        return "";
    }
}
