package e.e.a;

import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.preference.PreferenceManager;
import android.util.Log;

/**
 * Synchronize Android's external video-link entry Activities with the native
 * intent_type preference. The fullscreen option installs a custom preference
 * listener, so the original NicoidSetting listener no longer updates these
 * component enablement states when the user changes a playback choice.
 *
 * Do not change the stored choice or the playback session. A single process-
 * scoped listener is sufficient and only keeps the manifest's four dispatch
 * targets consistent with the saved preference.
 */
public final class LinkIntentPolicy217 implements SharedPreferences.OnSharedPreferenceChangeListener {
    private static final String TAG = "nicoid-link-mode";
    private static final String KEY = "intent_type";
    private static final String PACKAGE = "com.sauzask.nicoid.";
    private static final String[] TARGETS = {
        PACKAGE + "intent.NicoidIntentSelect",
        PACKAGE + "intent.NicoidVideoActivityIntent",
        PACKAGE + "intent.NicoidVideoInfoActivityIntent",
        PACKAGE + "intent.NicoidPopupViewActivityIntent"
    };
    private static LinkIntentPolicy217 active;
    private final Context app;
    private final SharedPreferences prefs;

    private LinkIntentPolicy217(Context context) {
        app = context.getApplicationContext() == null ? context : context.getApplicationContext();
        prefs = PreferenceManager.getDefaultSharedPreferences(app);
    }

    public static synchronized void install(Context context) {
        if (context == null) return;
        if (active == null) {
            active = new LinkIntentPolicy217(context);
            active.prefs.registerOnSharedPreferenceChangeListener(active);
        }
        active.applyMode();
    }

    /** Native values: ask=0, normal=1, information=2, popup=3, background=4. */
    private static int selectedTarget(String value) {
        if ("0".equals(value)) return 0;
        if ("2".equals(value)) return 2;
        if ("3".equals(value) || "4".equals(value)) return 3;
        return 1;  // Existing native default and fullscreen's virtual normal route.
    }

    @Override
    public void onSharedPreferenceChanged(SharedPreferences preferences, String key) {
        if (KEY.equals(key)) applyMode();
    }

    private synchronized void applyMode() {
        String saved;
        try {
            saved = prefs.getString(KEY, "1");
        } catch (ClassCastException invalid) {
            Log.w(TAG, "Invalid stored link playback type; using normal route", invalid);
            saved = "1";
        }
        if (!"0".equals(saved) && !"1".equals(saved) && !"2".equals(saved)
                && !"3".equals(saved) && !"4".equals(saved)) {
            Log.w(TAG, "Unknown link playback mode; using the original normal route");
            saved = "1";
        }
        int target = selectedTarget(saved);
        PackageManager manager = app.getPackageManager();
        // Enable the chosen entry before disabling any previous one so a
        // transient PackageManager failure cannot leave all links unhandled.
        applyTarget(manager, target, true);
        for (int i = 0; i < TARGETS.length; i++) {
            if (i != target) applyTarget(manager, i, false);
        }
    }

    private void applyTarget(PackageManager manager, int index, boolean enabled) {
        ComponentName component = new ComponentName(app, TARGETS[index]);
        int desired = enabled
                ? PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                : PackageManager.COMPONENT_ENABLED_STATE_DISABLED;
        try {
            if (manager.getComponentEnabledSetting(component) == desired) return;
            manager.setComponentEnabledSetting(component, desired, PackageManager.DONT_KILL_APP);
            Log.i(TAG, "Link entry " + index + " " + (enabled ? "enabled" : "disabled"));
        } catch (RuntimeException failure) {
            Log.w(TAG, "Cannot update link entry " + index, failure);
        }
    }
}
