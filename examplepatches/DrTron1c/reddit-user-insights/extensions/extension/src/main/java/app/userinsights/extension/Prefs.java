package app.userinsights.extension;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Settings for the patch, stored in Reddit's own app data.
 */
final class Prefs {
    private static final String NAME = "user_insights_settings";

    private static final String KEY_BADGES = "badges_enabled";
    private static final String KEY_HIDDEN_BUTTON = "hidden_button_enabled";
    private static final String KEY_INLINE_HIDDEN = "inline_hidden_enabled";
    private static final String KEY_BADGE_COUNT = "badge_count";
    private static final String KEY_TIME_WINDOW = "time_window";
    private static final String KEY_PROMPT_DISMISSED = "prompt_dismissed";
    private static final String KEY_DEBUG_DUMP = "debug_dump_next";
    private static final String KEY_EMBEDDED = "embedded_pills_enabled";
    private static final String KEY_EMBEDDED_CRASHED = "embedded_pills_crashed";
    private static final String KEY_EMBEDDED_CRASH_SHOWN = "embedded_pills_crash_shown";

    /** Values for the Arctic Shift "after" parameter. Empty means all time. */
    static final String WINDOW_ALL = "";
    static final String WINDOW_YEAR = "1year";
    static final String WINDOW_3_MONTHS = "3month";

    private static SharedPreferences prefs;

    private Prefs() {
    }

    private static SharedPreferences sp() {
        if (prefs == null) {
            Context context = UserInsights.app();
            if (context == null) {
                return null;
            }
            prefs = context.getSharedPreferences(NAME, Context.MODE_PRIVATE);
        }
        return prefs;
    }

    private static boolean getBoolean(String key, boolean def) {
        SharedPreferences sp = sp();
        return sp == null ? def : sp.getBoolean(key, def);
    }

    private static void putBoolean(String key, boolean value) {
        SharedPreferences sp = sp();
        if (sp != null) {
            sp.edit().putBoolean(key, value).apply();
        }
    }

    static boolean badgesEnabled() {
        return getBoolean(KEY_BADGES, true);
    }

    static void setBadgesEnabled(boolean value) {
        putBoolean(KEY_BADGES, value);
    }

    static boolean hiddenButtonEnabled() {
        return getBoolean(KEY_HIDDEN_BUTTON, true);
    }

    static void setHiddenButtonEnabled(boolean value) {
        putBoolean(KEY_HIDDEN_BUTTON, value);
    }

    /** Show hidden activity right inside the profile page, instead of a button. */
    static boolean inlineHiddenEnabled() {
        return getBoolean(KEY_INLINE_HIDDEN, true);
    }

    static void setInlineHiddenEnabled(boolean value) {
        putBoolean(KEY_INLINE_HIDDEN, value);
    }

    /** Pills drawn inside comment headers (off after a crash in them, until turned on again). */
    static boolean embeddedEnabled() {
        return getBoolean(KEY_EMBEDDED, true) && !getBoolean(KEY_EMBEDDED_CRASHED, false);
    }

    static void setEmbeddedEnabled(boolean value) {
        SharedPreferences sp = sp();
        if (sp != null) {
            sp.edit().putBoolean(KEY_EMBEDDED, value).putBoolean(KEY_EMBEDDED_CRASHED, false).apply();
        }
    }

    /** Called while the app is crashing, so it is written at once. */
    static void markEmbeddedCrashed() {
        SharedPreferences sp = sp();
        if (sp != null) {
            sp.edit().putBoolean(KEY_EMBEDDED_CRASHED, true).putBoolean(KEY_EMBEDDED_CRASH_SHOWN, false).commit();
        }
    }

    /** True once after a crash turned the pills in comments off, to tell the user. */
    static boolean consumeEmbeddedCrashNotice() {
        if (!getBoolean(KEY_EMBEDDED_CRASHED, false) || getBoolean(KEY_EMBEDDED_CRASH_SHOWN, true)) {
            return false;
        }
        putBoolean(KEY_EMBEDDED_CRASH_SHOWN, true);
        return true;
    }

    static int badgeCount() {
        SharedPreferences sp = sp();
        int count = sp == null ? 3 : sp.getInt(KEY_BADGE_COUNT, 3);
        return Math.max(1, Math.min(3, count));
    }

    static void setBadgeCount(int count) {
        SharedPreferences sp = sp();
        if (sp != null) {
            sp.edit().putInt(KEY_BADGE_COUNT, Math.max(1, Math.min(3, count))).apply();
        }
    }

    static String timeWindow() {
        SharedPreferences sp = sp();
        String value = sp == null ? WINDOW_ALL : sp.getString(KEY_TIME_WINDOW, WINDOW_ALL);
        return value == null ? WINDOW_ALL : value;
    }

    static void setTimeWindow(String value) {
        SharedPreferences sp = sp();
        if (sp != null) {
            sp.edit().putString(KEY_TIME_WINDOW, value).apply();
        }
    }

    static boolean promptDismissed() {
        return getBoolean(KEY_PROMPT_DISMISSED, false);
    }

    static void setPromptDismissed(boolean value) {
        putBoolean(KEY_PROMPT_DISMISSED, value);
    }

    static void requestDebugDump() {
        putBoolean(KEY_DEBUG_DUMP, true);
    }

    /**
     * Returns true once after {@link #requestDebugDump()}.
     */
    static boolean consumeDebugDump() {
        if (!getBoolean(KEY_DEBUG_DUMP, false)) {
            return false;
        }
        putBoolean(KEY_DEBUG_DUMP, false);
        return true;
    }
}
