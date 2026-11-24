package app.morphed.extension.twitch.ui;

import android.app.Activity;
import android.content.Context;
import android.widget.Toast;

import app.morphed.extension.twitch.App;
import app.morphed.extension.twitch.Messages;
import app.morphed.extension.twitch.patches.DebugLog;
import app.morphed.extension.twitch.settings.PatchSettings;

/**
 * Debug mode: the log file in Downloads and the live log window. Switched on and off in Settings; the window can be
 * closed on its own (the file goes on, for watching and recording without it), and comes back when Debug mode is
 * switched on again.
 */
public final class DebugMode {
    private static final String KEY_WINDOW_CLOSED = "debug_window_closed";

    private DebugMode() {
    }

    public static boolean isOn(Context context) {
        return DebugLog.isEnabled(context);
    }

    /** Whether the log window was closed while Debug mode goes on logging. */
    public static boolean windowClosed(Context context) {
        return context != null && PatchSettings.preferences(context)
                .getBoolean(KEY_WINDOW_CLOSED, false);
    }

    /** Whether the log window belongs on screen now: logging, and not closed. */
    public static boolean windowWanted(Context context) {
        return DebugLog.isOn() && !windowClosed(context);
    }

    /** The window's close button: the window goes, the log file goes on. */
    public static void closeWindow(Activity activity) {
        Context app = activity.getApplicationContext();
        PatchSettings.preferences(app).edit().putBoolean(KEY_WINDOW_CLOSED, true).apply();
        LogWindow.hide();
        Toast.makeText(app, "Log window closed, still logging to " + DebugLog.folder(), Toast.LENGTH_LONG).show();
        Screens.refreshSettingsRows();
    }

    /** The Settings row's second line. */
    public static String rowText(boolean on, boolean windowClosed) {
        if (!on) return "Off";
        return windowClosed ? "On, log window closed" : "On";
    }

    public static void set(Activity activity, boolean on) {
        Context app = activity.getApplicationContext();
        try {
            String file = DebugLog.setEnabled(app, on);
            // Switched on: with its window again (a closed window is for one stretch of logging)
            if (on) PatchSettings.preferences(app).edit()
                    .putBoolean(KEY_WINDOW_CLOSED, false).apply();
            if (on && DebugLog.isOn()) {
                LogWindow.show(activity);
                DebugLog.log("Debug mode on, logging to " + DebugLog.folder() + "/" + file);
            } else {
                LogWindow.hide();
            }
            // When it couldn't start, DebugLog has already said why.
            if (file != null) {
                Toast.makeText(app, (on ? "Logging to " : "Saved to ") + DebugLog.folder() + "/" + file, Toast.LENGTH_LONG).show();
            }
        } catch (Throwable t) {
            android.util.Log.e(App.TAG, "Switching Debug mode failed", t);
            Toast.makeText(app, "Debug mode couldn't be switched " + (on ? "on" : "off") + ": " + Messages.of(t),
                    Toast.LENGTH_LONG).show();
        }
        Screens.refreshSettingsRows();
    }
}
