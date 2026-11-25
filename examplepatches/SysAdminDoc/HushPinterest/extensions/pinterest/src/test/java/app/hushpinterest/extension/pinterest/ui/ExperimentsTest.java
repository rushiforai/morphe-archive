/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/**
 * #48: Pinterest's experiment lookup asks the hook first. Each HushPinterest switch answers
 * "enabled" for its own experiment only while it's on, and every other experiment gets nothing.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ExperimentsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.SWIPE_TO_CLOSE_PINS.resetToDefault();
        Settings.FULL_SIZE_PROFILE_PHOTOS.resetToDefault();
        Settings.BEST_VIDEO_QUALITY.resetToDefault();
        HookStatus.clear();
    }

    private static String line(String family) {
        for (String line : HookStatus.report()) {
            if (line.startsWith(family + ":")) return line;
        }
        return "";
    }

    @Test public void offToStartPinterestKeepsEveryAnswer() {
        assertNull(Experiments.group("android_closeup_pull_to_dismiss"));
        assertNull(Experiments.group("ce_android_enlarge_other_user_profile_pic"));
    }

    @Test public void eachSwitchAnswersOnlyForItsOwnExperiment() {
        Settings.SWIPE_TO_CLOSE_PINS.save(true);
        assertEquals("enabled", Experiments.group("android_closeup_pull_to_dismiss"));
        assertNull(Experiments.group("ce_android_enlarge_other_user_profile_pic"));
        assertTrue(line(FamilyNames.SWIPE_TO_CLOSE_PINS), line(FamilyNames.SWIPE_TO_CLOSE_PINS).contains("experiment answered"));

        Settings.SWIPE_TO_CLOSE_PINS.save(false);
        Settings.FULL_SIZE_PROFILE_PHOTOS.save(true);
        assertNull(Experiments.group("android_closeup_pull_to_dismiss"));
        assertEquals("enabled", Experiments.group("ce_android_enlarge_other_user_profile_pic"));
    }

    @Test public void everyOtherExperimentIsLeftToPinterest() {
        Settings.SWIPE_TO_CLOSE_PINS.save(true);
        Settings.FULL_SIZE_PROFILE_PHOTOS.save(true);
        assertNull(Experiments.group(null));
        assertNull(Experiments.group(""));
        assertNull(Experiments.group("android_closeup_pull_to_dismiss_v2"));
        assertNull(Experiments.group("android_video_remove_track_selector_max_video_size"));
    }

    @Test public void bestVideoQualityAnswersOnlyForTheVideoSizeExperiment() {
        Settings.BEST_VIDEO_QUALITY.save(true);
        assertEquals("enabled", Experiments.group("android_video_remove_track_selector_max_video_size"));
        assertNull(Experiments.group("android_closeup_pull_to_dismiss"));
        assertNull(Experiments.group("ce_android_enlarge_other_user_profile_pic"));
        assertTrue(line(FamilyNames.BEST_VIDEO_QUALITY), line(FamilyNames.BEST_VIDEO_QUALITY).contains("experiment answered"));
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertNull("paused, Pinterest's own answer", Experiments.group("android_video_remove_track_selector_max_video_size"));
    }

    @Test public void pausedPinterestKeepsEveryAnswer() {
        Settings.SWIPE_TO_CLOSE_PINS.save(true);
        Settings.FULL_SIZE_PROFILE_PHOTOS.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertNull(Experiments.group("android_closeup_pull_to_dismiss"));
        assertNull(Experiments.group("ce_android_enlarge_other_user_profile_pic"));
    }
}
