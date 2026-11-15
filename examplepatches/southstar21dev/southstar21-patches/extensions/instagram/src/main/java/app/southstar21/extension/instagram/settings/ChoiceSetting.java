package app.southstar21.extension.instagram.settings;

import android.content.SharedPreferences;

/**
 * One of a few options, picked from a row of chips, or of color swatches when
 * {@link #colors} is set. Stored as the option's index.
 */
public final class ChoiceSetting extends Setting {
    public final String[] labels;
    /** A swatch color per option (0 for a neutral swatch), or null for text chips. */
    public final int[] colors;
    private final int defaultIndex;

    public ChoiceSetting(String key, String title, String summary, boolean requiresRestart,
                         String[] labels, int[] colors, int defaultIndex) {
        super(key, title, summary, requiresRestart);
        this.labels = labels;
        this.colors = colors;
        this.defaultIndex = defaultIndex;
    }

    public int getDefault() {
        return defaultIndex;
    }

    public int get() {
        SharedPreferences prefs = Settings.preferencesOrNull();
        int value = prefs == null ? defaultIndex : prefs.getInt(key, defaultIndex);
        return value >= 0 && value < labels.length ? value : defaultIndex;
    }

    public void set(int index) {
        Settings.preferences().edit().putInt(key, index).apply();
    }
}
