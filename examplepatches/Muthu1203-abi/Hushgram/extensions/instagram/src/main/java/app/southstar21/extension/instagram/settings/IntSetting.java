package app.southstar21.extension.instagram.settings;

import android.content.SharedPreferences;

import java.util.concurrent.Callable;

/** A number picked with a slider between {@link #min} and {@link #max}. */
public final class IntSetting extends Setting {
    public final int min;
    public final int max;
    /** Shown after the value, e.g. "dp" or "%". */
    public final String unit;
    private final Callable<Integer> defaultValue;

    /**
     * @param defaultValue evaluated lazily, so it can come from a patch option
     *                     baked into the extension at patch time.
     */
    public IntSetting(String key, String title, String summary, boolean requiresRestart,
                      int min, int max, String unit, Callable<Integer> defaultValue) {
        super(key, title, summary, requiresRestart);
        this.min = min;
        this.max = max;
        this.unit = unit;
        this.defaultValue = defaultValue;
    }

    public int getDefault() {
        try {
            return clamp(defaultValue.call());
        } catch (Exception e) {
            return min;
        }
    }

    public int get() {
        SharedPreferences prefs = Settings.preferencesOrNull();
        return prefs == null ? getDefault() : clamp(prefs.getInt(key, getDefault()));
    }

    public void set(int value) {
        Settings.preferences().edit().putInt(key, clamp(value)).apply();
    }

    private int clamp(int value) {
        return Math.max(min, Math.min(max, value));
    }
}
