/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.stories;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

import java.util.List;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.FeedFilterCounters;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/** When a batch of viewed stories stays on the phone instead of going to media/seen/. */
@RunWith(RobolectricTestRunner.class)
public class StorySeenTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.VIEW_STORIES_ANONYMOUSLY.resetToDefault();
        HookStatus.clear();
    }

    @Test
    public void theSwitchStartsOn() {
        assertTrue("picking the patch is the choice to use it", Settings.VIEW_STORIES_ANONYMOUSLY.get());
    }

    @Test
    public void withTheSwitchOnABatchIsHeldBackAndCounted() {
        FeedFilterCounters.snapshotAndClear();
        assertTrue(StorySeen.holdBack());
        List<String> report = FeedFilterCounters.report();
        assertTrue(report.toString(), report.toString().contains(StorySeen.ROUTE));
        assertTrue(report.toString(), report.toString().contains(StorySeen.HELD_BACK));
        assertTrue(HookStatus.missing(FamilyNames.STORY_SEEN).toString(), HookStatus.missing(FamilyNames.STORY_SEEN).isEmpty());
    }

    @Test
    public void offPausedOrNotReadyTheBatchGoesOut() {
        Settings.VIEW_STORIES_ANONYMOUSLY.save(false);
        assertFalse("off", StorySeen.holdBack());
        Settings.VIEW_STORIES_ANONYMOUSLY.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertFalse("paused", StorySeen.holdBack());
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> assertFalse("settings not ready", StorySeen.holdBack()));
        assertTrue("the control: on, the same batch is held back", StorySeen.holdBack());
    }
}
