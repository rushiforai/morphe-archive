package io.github.bakwudo.uyu.extension.settings;

import android.content.SharedPreferences;

public final class IntSetting extends Setting<Integer> {
    public final int min;
    public final int max;

    /**
     * @param min Smallest valid value. Stored values outside [min, max] read as the default.
     * @param max Largest valid value.
     */
    public IntSetting(String key, int defaultValue, int min, int max) {
        super(key, defaultValue);
        this.min = min;
        this.max = max;
    }

    /**
     * A setting that can take any int, such as an ARGB color.
     */
    public IntSetting(String key, int defaultValue) {
        this(key, defaultValue, Integer.MIN_VALUE, Integer.MAX_VALUE);
    }

    @Override
    public Integer get() {
        SharedPreferences preferences = preferences();
        if (preferences == null) return defaultValue;
        try {
            int value = preferences.getInt(key, defaultValue);
            return value < min || value > max ? defaultValue : value;
        } catch (ClassCastException ex) {
            return defaultValue;
        }
    }

    @Override
    public void save(Integer value) {
        SharedPreferences preferences = preferences();
        if (preferences == null) return;
        preferences.edit().putInt(key, value).apply();
    }
}
