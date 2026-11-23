/**
 * Gboard_Pro - Gboard Enhancement Mod
 *
 * Maintained and customized by Arafath (@smartworldarafath)
 * Repository: https://github.com/smartworldarafath/Gboard_Pro
 * Licensed under the GNU General Public License v3.0 (GPLv3)
 */
package com.akshaykadam.pixelboard.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

/**
 * Settings helper for Material 3 Expressive rounded (Belka) key styling.
 *
 * <p>This manages the Gboard_Pro-side preference toggle. At runtime, the
 * {@code GboardAiWritingToolsRuntime} flag override hook checks these
 * preferences and forces the Belka Phenotype flags ({@code belka_rounded_keyboard},
 * {@code more_pill_keys}, {@code enable_rounded_key_by_default}, etc.) to
 * {@code true} when the user has enabled rounded keys.</p>
 *
 * <p>Additionally, the preference is written to Gboard's own default
 * SharedPreferences so that the built-in {@code enable_rounded_keys}
 * preference key is respected at theme-application time.</p>
 *
 * @see <a href="https://github.com/smartworldarafath/Gboard_Pro/issues/14">Issue #14</a>
 */
public final class GboardRoundedKeysSettings {
    private static final String TAG = "GboardPatches";
    public static final String PREF_KEY_ENABLED = "rounded_keys_enabled";
    public static final boolean DEFAULT_ENABLED = true;

    /** Gboard's internal preference key read at theme-application time. */
    static final String GBOARD_PREF_KEY_ENABLE_ROUNDED_KEYS =
            "enable_rounded_keys";

    // Phenotype flag names that gate the rounded key feature.
    // These are checked in the flag override hook at runtime.
    public static final String FLAG_BELKA_ROUNDED_KEYBOARD = "belka_rounded_keyboard";
    public static final String FLAG_BELKA_UI = "belka_ui";
    public static final String FLAG_BELKA_BACKGROUND = "belka_background";
    public static final String FLAG_MORE_PILL_KEYS = "more_pill_keys";
    public static final String FLAG_ENABLE_ROUNDED_KEY_BY_DEFAULT =
            "enable_rounded_key_by_default";
    public static final String FLAG_ENABLE_ROUNDED_KEYS =
            "enable_rounded_keys";

    private static volatile Boolean cachedEnabled;

    private GboardRoundedKeysSettings() {
    }

    /**
     * Returns Gboard_Pro's shared preferences (device-protected storage).
     */
    public static SharedPreferences preferences(Context context) {
        return GboardPatchesSettings.preferences(context);
    }

    public static boolean readEnabled(SharedPreferences preferences) {
        if (preferences == null) {
            return DEFAULT_ENABLED;
        }
        return preferences.getBoolean(PREF_KEY_ENABLED, DEFAULT_ENABLED);
    }

    public static void ensureDefaults(Context context, SharedPreferences preferences) {
        if (preferences == null) {
            return;
        }
        if (!preferences.contains(PREF_KEY_ENABLED)
                || !preferences.getBoolean("pref_defaults_migrated_v4", false)) {
            preferences.edit()
                    .putBoolean(PREF_KEY_ENABLED, DEFAULT_ENABLED)
                    .putBoolean("pref_defaults_migrated_v4", true)
                    .apply();
            if (context != null) {
                applyToGboardPreferences(context, DEFAULT_ENABLED);
            }
        }
    }

    public static boolean isEnabled(Context context) {
        Boolean cached = cachedEnabled;
        if (cached != null) {
            return cached.booleanValue();
        }
        if (context == null) {
            return DEFAULT_ENABLED;
        }
        try {
            SharedPreferences prefs = preferences(context);
            boolean enabled = readEnabled(prefs);
            cachedEnabled = Boolean.valueOf(enabled);
            return enabled;
        } catch (Throwable throwable) {
            return DEFAULT_ENABLED;
        }
    }

    public static void invalidateCache() {
        cachedEnabled = null;
    }

    public static boolean writeEnabled(SharedPreferences preferences, boolean enabled) {
        if (preferences == null) {
            return false;
        }
        invalidateCache();
        return preferences.edit().putBoolean(PREF_KEY_ENABLED, enabled).commit();
    }

    /**
     * Returns {@code true} if the given Phenotype flag name is one of the
     * Belka flags that must be forced to {@code true} for rounded keys.
     */
    public static boolean isRoundedKeyPhenotypeFlag(String flagName) {
        return FLAG_BELKA_ROUNDED_KEYBOARD.equals(flagName)
                || FLAG_BELKA_UI.equals(flagName)
                || FLAG_BELKA_BACKGROUND.equals(flagName)
                || FLAG_MORE_PILL_KEYS.equals(flagName)
                || FLAG_ENABLE_ROUNDED_KEY_BY_DEFAULT.equals(flagName)
                || FLAG_ENABLE_ROUNDED_KEYS.equals(flagName);
    }

    /**
     * Writes to Gboard's own default SharedPreferences to set the
     * {@code enable_rounded_keys} preference that Gboard reads at
     * theme-application time.
     *
     * <p>Since the Gboard_Pro extension runs inside the same Dalvik VM
     * as Gboard, it has full access to the host app's SharedPreferences.</p>
     *
     * @param context Application context
     * @param enabled {@code true} to enable rounded keys
     */
    public static void applyToGboardPreferences(Context context, boolean enabled) {
        if (context == null) {
            return;
        }
        try {
            // Gboard reads from its default SharedPreferences file.
            SharedPreferences gboardPrefs = context.getSharedPreferences(
                    context.getPackageName() + "_preferences",
                    Context.MODE_PRIVATE);
            if (enabled) {
                gboardPrefs.edit()
                        .putBoolean(GBOARD_PREF_KEY_ENABLE_ROUNDED_KEYS, true)
                        .apply();
            } else {
                gboardPrefs.edit()
                        .remove(GBOARD_PREF_KEY_ENABLE_ROUNDED_KEYS)
                        .apply();
            }
            Log.w(TAG, "[rounded-keys] gboard-pref=" + enabled);
        } catch (Throwable throwable) {
            Log.w(TAG, "[rounded-keys] failed to apply to Gboard preferences",
                    throwable);
        }
    }
}
