/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.stories;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The question first thing in the story viewer's seen sender: yes keeps a batch of viewed stories
 * on the phone, while the switch is on, and every other time the batch goes out as Facebook sends it.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class StorySeenTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.VIEW_STORIES_ANONYMOUSLY.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static String counterLine() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(StorySeen.ROUTE + ":")) return line;
        }
        return null;
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.STORY_SEEN + ":")) return line;
        }
        return null;
    }

    @Test
    public void theSwitchStartsOnAndKeepsEveryBatchBack() {
        assertTrue("the switch starts off", Settings.VIEW_STORIES_ANONYMOUSLY.get());
        for (int i = 0; i < 3; i++) assertTrue("batch " + (i + 1) + " was sent", StorySeen.holdBack());
        assertEquals(StorySeen.ROUTE + ": 3 lists, 3 items, 3 removed. Last reason: " + StorySeen.HELD_BACK
                + ". Removed: " + StorySeen.HELD_BACK + " 3", counterLine());
        assertEquals(FamilyNames.STORY_SEEN + ": invoked 3, 0 found, 0 missing", statusLine());
    }

    /** Off, the views go out, and the report still shows the sender asking, so the hook can be seen working. */
    @Test
    public void offTheViewsGoOutAndTheReportStillCountsThem() {
        Settings.VIEW_STORIES_ANONYMOUSLY.save(false);
        assertFalse(StorySeen.holdBack());
        assertEquals(StorySeen.ROUTE + ": 1 lists, 1 items, 0 removed", counterLine());
        assertEquals(FamilyNames.STORY_SEEN + ": invoked 1, 0 found, 0 missing", statusLine());
        Settings.VIEW_STORIES_ANONYMOUSLY.save(true);
        assertTrue("turning the switch back on didn't take effect at the next send", StorySeen.holdBack());
    }

    @Test
    public void pausedTheViewsGoOut() {
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(StorySeen.holdBack());
        PauseForTests.pause(HushfacebookPause.Reason.CRASH_LOOP);
        assertFalse(StorySeen.holdBack());
        PauseForTests.resume();
        assertTrue(StorySeen.holdBack());
    }
}
