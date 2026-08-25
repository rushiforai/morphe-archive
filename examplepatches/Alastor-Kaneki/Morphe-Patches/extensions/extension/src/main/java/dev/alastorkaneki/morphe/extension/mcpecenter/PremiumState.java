package dev.alastorkaneki.morphe.extension.mcpecenter;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;

/**
 * Keeps a premium entitlement stable only after the target app itself has observed it as valid.
 * A clean install with a missing/false premium flag stays non-premium.
 */
public final class PremiumState {
    private static final String FLUTTER_PREFS = "FlutterSharedPreferences";
    private static final String PREMIUM_KEY = "flutter.IS_PREMIUM";
    private static final String MORPHE_PREFS = "morphe_mcpe_premium_state";
    private static final String SEEN_VALID_PREMIUM = "seen_valid_premium";

    private static boolean initialized;
    private static SharedPreferences.OnSharedPreferenceChangeListener listener;

    private PremiumState() {
    }

    public static synchronized void initialize(Activity activity) {
        if (initialized || activity == null) {
            return;
        }

        Context context = activity.getApplicationContext();
        SharedPreferences flutter = context.getSharedPreferences(FLUTTER_PREFS, Context.MODE_PRIVATE);
        SharedPreferences morphe = context.getSharedPreferences(MORPHE_PREFS, Context.MODE_PRIVATE);

        if (flutter.contains(PREMIUM_KEY)) {
            boolean current = flutter.getBoolean(PREMIUM_KEY, false);
            morphe.edit().putBoolean(SEEN_VALID_PREMIUM, current).apply();
        } else if (morphe.getBoolean(SEEN_VALID_PREMIUM, false)) {
            // Restore only when the target app lost/migrated the key. An explicit false value is
            // respected and clears the cached state below.
            flutter.edit().putBoolean(PREMIUM_KEY, true).apply();
        }

        listener = (preferences, key) -> {
            if (!PREMIUM_KEY.equals(key)) {
                return;
            }

            if (!preferences.contains(PREMIUM_KEY)) {
                return;
            }

            boolean current = preferences.getBoolean(PREMIUM_KEY, false);
            morphe.edit().putBoolean(SEEN_VALID_PREMIUM, current).apply();
        };
        flutter.registerOnSharedPreferenceChangeListener(listener);
        initialized = true;
    }
}
