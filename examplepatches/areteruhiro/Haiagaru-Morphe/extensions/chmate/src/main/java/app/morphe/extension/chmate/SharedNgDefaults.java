package app.morphe.extension.chmate;

import android.content.SharedPreferences;

/** Defaults and one-time migration of the client-side report threshold. */
final class SharedNgDefaults {
    static final int DEFAULT_THRESHOLD = 2;
    private static final String MIGRATED = "thresholdDefault2Migrated";

    private SharedNgDefaults() {}

    static void migrate(SharedPreferences prefs) {
        if (prefs.getBoolean(MIGRATED, false)) return;
        SharedPreferences.Editor edit = prefs.edit();
        if (prefs.getInt("threshold", DEFAULT_THRESHOLD) <= 1) {
            edit.putInt("threshold", DEFAULT_THRESHOLD);
        }
        edit.putBoolean(MIGRATED, true).apply();
    }
}
