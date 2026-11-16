package app.onlynazril.extension.tiktok;

import android.app.Activity;
import android.view.WindowManager;

import app.onlynazril.extension.tiktok.settings.KeepScreenSettings;

/**
 * Keeps the display awake while a TikTok screen is resumed.
 *
 * The flag lives on the window, so every activity sets it on its own resume and clears it on pause.
 * Nothing is tracked app-wide, and a screen that is not in front cannot hold the display. The
 * switch is read on every resume, so changing it takes effect the next time a screen comes forward;
 * the Tweaks row also applies it to its own window immediately.
 */
public final class KeepScreenBridge {
    private KeepScreenBridge() {}

    public static void onResume(Activity activity) {
        apply(activity);
    }

    public static void onPause(Activity activity) {
        if (activity == null) return;
        activity.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
    }

    /** Applies the current switch to one window, for a resume and for the Tweaks row. */
    public static void apply(Activity activity) {
        if (activity == null) return;
        int flag = WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON;
        if (KeepScreenSettings.isEnabled(activity)) {
            activity.getWindow().addFlags(flag);
        } else {
            activity.getWindow().clearFlags(flag);
        }
    }
}
