package e.e.a;

import android.app.Activity;
import android.preference.PreferenceManager;
import android.util.Log;

/**
 * Shorten only an explicit video-to-popup app switch. The reviewed 500ms
 * debounce is preserved for internal navigation, background playback and
 * any other activity to prevent spurious popup launches.
 */
public final class PopupSwitch274 {
    private static final long DEFAULT_DELAY_MS = 500L;
    private static final long POPUP_DELAY_MS = 180L;
    private PopupSwitch274() {}

    public static long delay(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed())
            return DEFAULT_DELAY_MS;
        if (!"com.sauzask.nicoid.NicoidVideoActivity".equals(activity.getClass().getName()))
            return DEFAULT_DELAY_MS;
        try {
            String selection=PreferenceManager.getDefaultSharedPreferences(activity)
                    .getString("app_switch_playback", "none");
            if ("popup".equals(selection)) {
                Log.i("nicoid-popup-switch","Explicit popup handoff scheduled before Activity stop");
                return POPUP_DELAY_MS;
            }
        } catch (RuntimeException error) {
            Log.w("nicoid-popup-switch","Unable to read app-switch preference; retaining safe delay", error);
        }
        return DEFAULT_DELAY_MS;
    }
}
