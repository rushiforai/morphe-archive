package com.nmnvan.extension.thescore.settings;

import android.content.Context;
import android.content.SharedPreferences;

import com.nmnvan.extension.thescore.Utils;

/**
 * An on/off setting stored in SharedPreferences.
 * <p>
 * {@link #get()} reads the value once per app process, so a change takes effect after an app restart.
 * The settings screen reads and writes the stored value directly.
 */
public final class BooleanSetting {

    public interface Availability {
        /** @return true if the patch that uses this setting was applied. */
        boolean isAvailable();
    }

    private static final String PREFERENCES_NAME = "neil_morphe_settings";

    public final String key;
    public final boolean defaultValue;
    public final String title;
    public final String summary;
    private final Availability availability;

    private volatile Boolean cachedValue;

    public BooleanSetting(String key, boolean defaultValue, String title, String summary,
                          Availability availability) {
        this.key = key;
        this.defaultValue = defaultValue;
        this.title = title;
        this.summary = summary;
        this.availability = availability;
    }

    public boolean isAvailable() {
        return availability.isAvailable();
    }

    /**
     * @return the value in effect for this app session.
     */
    public boolean get() {
        Boolean value = cachedValue;
        if (value == null) {
            Context context = Utils.getContext();
            if (context == null) return defaultValue; // Too early; don't cache.
            value = getStoredValue(context);
            cachedValue = value;
        }
        return value;
    }

    /**
     * @return the saved value, which may differ from {@link #get()} until the app restarts.
     */
    public boolean getStoredValue(Context context) {
        return preferences(context).getBoolean(key, defaultValue);
    }

    public void save(Context context, boolean value) {
        preferences(context).edit().putBoolean(key, value).apply();
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFERENCES_NAME, Context.MODE_PRIVATE);
    }
}
