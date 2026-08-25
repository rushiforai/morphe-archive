package app.aimal.extension.streaming;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Persists the user's last choices so the panel comes back the way they left
 * it. Uses the patched app's own SharedPreferences - no storage permission and
 * nothing written outside the app's sandbox.
 */
final class Prefs {
    private static final String FILE = "stream_playback_controls";

    private static final String KEY_SPEED = "speed";
    private static final String KEY_ASPECT = "aspect";
    private static final String KEY_PANEL_X = "panel_x";
    private static final String KEY_PANEL_Y = "panel_y";

    private static SharedPreferences preferences;

    private Prefs() {
    }

    static void init(Context context) {
        preferences = context.getSharedPreferences(FILE, Context.MODE_PRIVATE);
    }

    static float speed() {
        return preferences == null ? 1f : preferences.getFloat(KEY_SPEED, 1f);
    }

    static void speed(float value) {
        if (preferences != null) preferences.edit().putFloat(KEY_SPEED, value).apply();
    }

    static int aspect() {
        return preferences == null ? 0 : preferences.getInt(KEY_ASPECT, 0);
    }

    static void aspect(int value) {
        if (preferences != null) preferences.edit().putInt(KEY_ASPECT, value).apply();
    }

    static int panelX(int fallback) {
        return preferences == null ? fallback : preferences.getInt(KEY_PANEL_X, fallback);
    }

    static int panelY(int fallback) {
        return preferences == null ? fallback : preferences.getInt(KEY_PANEL_Y, fallback);
    }

    static void panelPosition(int x, int y) {
        if (preferences == null) return;
        preferences.edit().putInt(KEY_PANEL_X, x).putInt(KEY_PANEL_Y, y).apply();
    }
}
