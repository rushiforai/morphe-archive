package app.southstar21.extension.instagram.settings;

import android.content.SharedPreferences;

/**
 * One of a few options, picked from a row of chips, or of color swatches when
 * {@link #colors} is set. Stored as the option's index.
 */
public final class ChoiceSetting extends Setting {
    /**
     * In {@link #colors}: this option is a color you pick yourself with the color wheel,
     * stored under {@link #customKey()}.
     */
    public static final int CUSTOM_COLOR = 1;

    public final String[] labels;
    /** A swatch color per option (0 for a neutral swatch), or null for text chips. */
    public final int[] colors;
    private final int defaultIndex;
    private final int customDefault;

    public ChoiceSetting(String key, String title, String summary, boolean requiresRestart,
                         String[] labels, int[] colors, int defaultIndex) {
        this(key, title, summary, requiresRestart, labels, colors, defaultIndex, 0xFFFFFFFF);
    }

    /** @param customDefault the color wheel's starting color for a {@link #CUSTOM_COLOR} option */
    public ChoiceSetting(String key, String title, String summary, boolean requiresRestart,
                         String[] labels, int[] colors, int defaultIndex, int customDefault) {
        super(key, title, summary, requiresRestart);
        this.labels = labels;
        this.colors = colors;
        this.defaultIndex = defaultIndex;
        this.customDefault = customDefault;
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

    /** Whether option {@code index} is the color you pick yourself. */
    public boolean isCustom(int index) {
        return colors != null && index >= 0 && index < colors.length && colors[index] == CUSTOM_COLOR;
    }

    /**
     * Where the picked color is kept. Resetting the setting leaves it alone, so the wheel
     * still remembers your color after a reset or a preset.
     */
    public String customKey() {
        return key + "_custom";
    }

    /** The color picked with the wheel, opaque. */
    public int getCustomColor() {
        SharedPreferences prefs = Settings.preferencesOrNull();
        int value = prefs == null ? customDefault : prefs.getInt(customKey(), customDefault);
        return value | 0xFF000000;
    }

    public void setCustomColor(int color) {
        Settings.preferences().edit().putInt(customKey(), color | 0xFF000000).apply();
    }

    /** Option {@code index}'s color, the picked one for the custom option (0 for none). */
    public int colorAt(int index) {
        if (colors == null || index < 0 || index >= colors.length) return 0;
        return isCustom(index) ? getCustomColor() : colors[index];
    }
}
