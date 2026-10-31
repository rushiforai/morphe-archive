/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Activity;
import android.content.pm.ActivityInfo;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * The video viewer's full screen button turns the screen to one landscape side, picked from the way
 * the screen faces when it's tapped, and holds it there. With the switch on the phone's sensor picks
 * the side instead, either one, even with auto-rotate off (#27). Leaving full screen stays Telegram's
 * exit button's and the viewer's close; the sensor exit on an upright turn is {@link VideoUpright}'s.
 */
public final class VideoTurn {
    private VideoTurn() {}

    /**
     * Called in place of the full screen button's own turn.
     *
     * @param activity Telegram's activity
     * @param orientation the landscape side Telegram picked
     */
    public static void fullScreen(Activity activity, int orientation) {
        VideoUpright.buttonPressed();
        activity.setRequestedOrientation(orientation(orientation));
    }

    /** The orientation a video put in full screen asks for. */
    static int orientation(int telegrams) {
        HookStatus.invoked(FamilyNames.KEEP_VIDEOS_MUTED);
        try {
            if (!Utils.settingsReady() || !Settings.VIDEO_EITHER_LANDSCAPE.get()) return telegrams;
            HookStatus.counted(FamilyNames.KEEP_VIDEOS_MUTED, "full screen video free to turn");
            return ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "full screen turn", failure);
            return telegrams;
        }
    }
}
