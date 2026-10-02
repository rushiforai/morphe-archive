package io.github.bakwudo.uyu.extension.settings;

import android.content.SharedPreferences;

public final class StringSetting extends Setting<String> {
    public StringSetting(String key, String defaultValue) {
        super(key, defaultValue);
    }

    @Override
    public String get() {
        SharedPreferences preferences = preferences();
        if (preferences == null) return defaultValue;
        try {
            return preferences.getString(key, defaultValue);
        } catch (ClassCastException ex) {
            return defaultValue;
        }
    }

    @Override
    public void save(String value) {
        SharedPreferences preferences = preferences();
        if (preferences == null) return;
        preferences.edit().putString(key, value).apply();
    }
}
