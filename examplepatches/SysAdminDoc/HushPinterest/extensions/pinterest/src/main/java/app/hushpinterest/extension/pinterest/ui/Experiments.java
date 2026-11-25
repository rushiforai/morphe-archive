/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * Features Pinterest has built and shows only to the accounts its servers put in an experiment
 * (#48). Pinterest asks one method for every experiment's group and checks the answer starts with
 * "enabled". The hook answers first for the experiments behind a HushPinterest switch, and only
 * while that switch is on. Off, paused or any other experiment, Pinterest's own answer stands.
 */
public final class Experiments {
    private Experiments() {}

    /** Pulling a pin you opened down closes it. */
    static final String PULL_TO_DISMISS = "android_closeup_pull_to_dismiss";
    /** Tapping someone else's profile photo on their profile opens it full size. */
    static final String PROFILE_PHOTO = "ce_android_enlarge_other_user_profile_pic";
    /** Videos play at the largest size Pinterest has instead of its usual cap. */
    static final String VIDEO_SIZE = "android_video_remove_track_selector_max_video_size";
    /** The group every check of these experiments looks for. */
    static final String ENABLED = "enabled";

    /**
     * Injected first thing in Pinterest's experiment group lookup, with the experiment's name. A
     * group answers for Pinterest; null lets Pinterest look the group up as usual.
     */
    public static String group(String experiment) {
        if (experiment == null) return null;
        switch (experiment) {
            case PULL_TO_DISMISS:
                return answer(FamilyNames.SWIPE_TO_CLOSE_PINS, Settings.SWIPE_TO_CLOSE_PINS);
            case PROFILE_PHOTO:
                return answer(FamilyNames.FULL_SIZE_PROFILE_PHOTOS, Settings.FULL_SIZE_PROFILE_PHOTOS);
            case VIDEO_SIZE:
                return answer(FamilyNames.BEST_VIDEO_QUALITY, Settings.BEST_VIDEO_QUALITY);
            default:
                return null;
        }
    }

    private static String answer(String family, app.hushpinterest.extension.shared.settings.BooleanSetting setting) {
        try {
            if (!UiHooks.enabled(family, setting)) return null;
            HookStatus.counted(family, "experiment answered");
            return ENABLED;
        } catch (Throwable failure) {
            HookStatus.threw(family, "experiment answer", failure);
            return null;
        }
    }
}
