package io.github.bakwudo.uyu.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;

import io.github.bakwudo.uyu.extension.Utils;

/**
 * A value stored in uyu's own SharedPreferences file. The settings screen writes to the same
 * file through {@link android.preference.Preference} keys, so {@link #get()} always returns what
 * the user last chose.
 */
public abstract class Setting<T> {
    public static final String PREFERENCES_NAME = "uyu_settings";

    public final String key;
    public final T defaultValue;

    protected Setting(String key, T defaultValue) {
        this.key = key;
        this.defaultValue = defaultValue;
    }

    public abstract T get();

    public abstract void save(T value);

    /**
     * Calls the listener whenever an uyu setting changes. SharedPreferences keeps only a weak
     * reference to the listener, so the caller must hold on to it.
     */
    public static void addChangeListener(SharedPreferences.OnSharedPreferenceChangeListener listener) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.registerOnSharedPreferenceChangeListener(listener);
    }

    public static void removeChangeListener(SharedPreferences.OnSharedPreferenceChangeListener listener) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.unregisterOnSharedPreferenceChangeListener(listener);
    }

    /**
     * @return The preferences, or null if called before the app context is known.
     */
    protected static SharedPreferences preferences() {
        Context context = Utils.getContext();
        if (context == null) return null;
        return context.getSharedPreferences(PREFERENCES_NAME, Context.MODE_PRIVATE);
    }
}
