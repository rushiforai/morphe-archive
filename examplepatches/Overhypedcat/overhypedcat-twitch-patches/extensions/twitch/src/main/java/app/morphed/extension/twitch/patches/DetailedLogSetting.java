package app.morphed.extension.twitch.patches;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.List;

import app.morphed.extension.twitch.adblock.Problem;
import app.morphed.extension.twitch.settings.ToggleItems;

/**
 * The "Detailed log" switch at the end of Settings, Preferences.
 */
@SuppressWarnings("unused")
public final class DetailedLogSetting {
    private static final String TAG = "TwitchMorphed";

    private static WeakReference<Object> row = new WeakReference<>(null);
    private static WeakReference<Context> context = new WeakReference<>(null);

    private DetailedLogSetting() {
    }

    /** Injected at the end of the method that fills the Preferences screen. */
    public static void addTo(Object screen) {
        try {
            List<Object> rows = ToggleItems.rowsOf(screen);
            Activity activity = ToggleItems.fieldOfType(screen, Activity.class);
            if (rows == null || activity == null) {
                StreamAdsPatch.PROBLEMS.report(Problem.LOG_SWITCH_MISSING,
                        rows == null ? "no list of switches found" : "no screen found");
                return;
            }
            Object added = ToggleItems.addToggle(rows, "Detailed log", "Saved to Downloads", DebugLog.isEnabled(activity));
            if (added == null) {
                StreamAdsPatch.PROBLEMS.report(Problem.LOG_SWITCH_MISSING, "switch type not recognised");
                return;
            }
            row = new WeakReference<>(added);
            context = new WeakReference<>(activity.getApplicationContext());
        } catch (Throwable t) {
            Log.e(TAG, "Adding the Detailed log switch failed", t);
            StreamAdsPatch.PROBLEMS.report(Problem.LOG_SWITCH_MISSING, t.toString());
        }
    }

    /** Injected at the start of the Preferences switch handler. */
    public static void onToggle(Object toggled, boolean on) {
        if (toggled == null || toggled != row.get()) return;
        Context app = context.get();
        if (app == null) return;
        try {
            String file = DebugLog.setEnabled(app, on);
            if (file != null) Toast.makeText(app, (on ? "Logging to Downloads/" : "Saved Downloads/") + file, Toast.LENGTH_LONG).show();
        } catch (Throwable t) {
            Log.e(TAG, "Switching the detailed log failed", t);
        }
    }
}
