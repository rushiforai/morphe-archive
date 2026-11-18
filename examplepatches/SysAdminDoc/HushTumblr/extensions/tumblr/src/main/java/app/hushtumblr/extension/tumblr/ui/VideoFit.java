/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Fit full-screen videos. Tumblr's full-screen player sizes any video narrower than 4:5 to the
 * height of the screen, so one that's wider than the screen's own shape loses its left and right
 * edges. A 9:16 video on a 1080 by 2340 phone comes out 1316 pixels wide and loses 118 on each
 * side. Videos of any other shape are fitted whole, over a blurred copy of their poster.
 *
 * <p>The patch hands {@link #fillsHeight} Tumblr's answer for a tall video as the player is built.
 * While the switch is on it answers no, so a tall video is treated like the others: fitted whole,
 * with the poster behind it. Tumblr's answer stays while the switch is off, HushTumblr is paused,
 * the settings aren't ready or anything throws.
 */
public final class VideoFit {
    /** The step a failed answer is reported under. */
    static final String STEP = "full-screen video fit";

    /** What the diagnostic report counts for each tall video fitted. Fixed text only. */
    static final String FITTED = "tall video fitted";

    private VideoFit() {
    }

    /**
     * Injected where Tumblr has decided a full-screen video is tall enough to fill the screen's
     * height, with that decision. Answers whether it still should. Never throws.
     */
    public static boolean fillsHeight(boolean tall) {
        try {
            if (!tall || !on()) return tall;
            HookStatus.counted(FamilyNames.FIT_FULL_SCREEN_VIDEOS, FITTED);
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FIT_FULL_SCREEN_VIDEOS, STEP, failure);
            return tall;
        }
    }

    private static boolean on() {
        if (!Utils.settingsReady() || !PatchFamily.Capability.FULL_SCREEN_VIDEO_FIT.installed()) return false;
        HookStatus.invoked(FamilyNames.FIT_FULL_SCREEN_VIDEOS);
        return Settings.FIT_FULL_SCREEN_VIDEOS.get();
    }
}
