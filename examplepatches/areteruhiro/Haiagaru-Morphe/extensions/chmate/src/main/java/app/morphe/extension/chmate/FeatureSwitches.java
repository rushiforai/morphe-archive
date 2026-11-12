package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;

/** Read the feature preference at its use site. Settings live with their owning feature. */
final class FeatureSwitches {
    static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(WacchoiSearchOptions.PREFS, 0);
    }
    static boolean enabled(String key, boolean initial) {
        Context context = Haiagaru.applicationContextForExtension();
        return context == null ? initial : prefs(context).getBoolean(key, initial);
    }
    private FeatureSwitches() { }
}
