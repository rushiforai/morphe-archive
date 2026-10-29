package app.fakh.extension.linkedin;

import android.app.Activity;
import android.view.View;

/** Long pressing the Home tab of LinkedIn's bottom bar opens the Fakh Patches settings. */
final class HomeTabShortcut {
    private HomeTabShortcut() {
    }

    /**
     * Called whenever an SDUI screen resumes. The bottom bar is built and bound after that, which also
     * resets its listeners, so the listener is set once the window has laid out.
     */
    static void attach(Activity activity) {
        GamesShortcut.schedule(activity);
        activity.getWindow().getDecorView().postDelayed(() -> {
            int id = activity.getResources().getIdentifier("tab_feed", "id", activity.getPackageName());
            View tab = id == 0 ? null : activity.findViewById(id);
            Settings.debugLog("home tab " + (tab == null ? "not found" : "found"));
            if (tab == null) return;
            tab.setOnLongClickListener(v -> {
                SettingsActivity.open(activity);
                return true;
            });
        }, 1000);
    }
}
