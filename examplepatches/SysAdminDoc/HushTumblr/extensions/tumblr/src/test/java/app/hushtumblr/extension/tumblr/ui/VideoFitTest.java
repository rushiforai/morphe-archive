/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.EnumSet;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/** #19: a tall video opened full screen filled the screen's height and lost its sides. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class VideoFitTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        Settings.FIT_FULL_SCREEN_VIDEOS.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
    }

    @After public void restore() {
        Settings.FIT_FULL_SCREEN_VIDEOS.resetToDefault();
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        HookStatus.clear();
    }

    @Test public void theSwitchStartsOffAndTumblrsAnswerStands() {
        assertFalse(Settings.FIT_FULL_SCREEN_VIDEOS.defaultValue);
        assertTrue(VideoFit.fillsHeight(true));
        assertFalse(VideoFit.fillsHeight(false));
    }

    @Test public void withTheSwitchOnATallVideoIsFittedWhole() {
        Settings.FIT_FULL_SCREEN_VIDEOS.save(true);
        assertFalse(VideoFit.fillsHeight(true));
    }

    @Test public void aVideoTumblrAlreadyFitsStaysFitted() {
        Settings.FIT_FULL_SCREEN_VIDEOS.save(true);
        assertFalse(VideoFit.fillsHeight(false));
    }

    @Test public void withoutTheHookInTheBuildTumblrsAnswerStands() {
        Settings.FIT_FULL_SCREEN_VIDEOS.save(true);
        PatchFamilyForTests.capabilities(EnumSet.complementOf(EnumSet.of(PatchFamily.Capability.FULL_SCREEN_VIDEO_FIT)));
        assertTrue(VideoFit.fillsHeight(true));
    }

    @Test public void aPauseLeavesTumblrsAnswerAndKeepsTheSwitch() {
        Settings.FIT_FULL_SCREEN_VIDEOS.save(true);
        for (HushTumblrPause.Reason reason : HushTumblrPause.Reason.values()) {
            if (reason == HushTumblrPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertTrue(reason.name(), VideoFit.fillsHeight(true));
            assertTrue(reason.name(), Settings.FIT_FULL_SCREEN_VIDEOS.savedValue());
            PauseForTests.resume();
        }
        assertFalse(VideoFit.fillsHeight(true));
    }

    @Test public void beforeTheSettingsAreReadyTumblrsAnswerStands() {
        Settings.FIT_FULL_SCREEN_VIDEOS.save(true);
        SettingsContextRule.withoutContext(() -> assertTrue(VideoFit.fillsHeight(true)));
    }
}
