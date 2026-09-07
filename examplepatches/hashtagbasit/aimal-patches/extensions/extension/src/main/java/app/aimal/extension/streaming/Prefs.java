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

    private static final String KEY_SUB_SIZE = "subtitle_size";
    private static final String KEY_SUB_FONT = "subtitle_font";
    private static final String KEY_SUB_BACKGROUND = "subtitle_background";
    private static final String KEY_SUB_EDGE = "subtitle_edge";

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

    // Subtitles ---------------------------------------------------------------

    /** Index into Subtitles.SIZES; 2 is 1.0x, the app's own size. */
    static int subtitleSize() {
        return preferences == null ? 2 : preferences.getInt(KEY_SUB_SIZE, 2);
    }

    static void subtitleSize(int value) {
        put(KEY_SUB_SIZE, value);
    }

    static int subtitleFont() {
        return preferences == null ? 0 : preferences.getInt(KEY_SUB_FONT, 0);
    }

    static void subtitleFont(int value) {
        put(KEY_SUB_FONT, value);
    }

    static int subtitleBackground() {
        return preferences == null ? 0 : preferences.getInt(KEY_SUB_BACKGROUND, 0);
    }

    static void subtitleBackground(int value) {
        put(KEY_SUB_BACKGROUND, value);
    }

    /** 1 is OUTLINE, which is the readable default. */
    static int subtitleEdge() {
        return preferences == null ? 1 : preferences.getInt(KEY_SUB_EDGE, 1);
    }

    static void subtitleEdge(int value) {
        put(KEY_SUB_EDGE, value);
    }

    private static void put(String key, int value) {
        if (preferences != null) preferences.edit().putInt(key, value).apply();
    }
}
