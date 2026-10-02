package io.github.bakwudo.uyu.extension.settings;

import android.content.SharedPreferences;

public final class BooleanSetting extends Setting<Boolean> {
    public BooleanSetting(String key, boolean defaultValue) {
        super(key, defaultValue);
    }

    @Override
    public Boolean get() {
        SharedPreferences preferences = preferences();
        if (preferences == null) return defaultValue;
        return preferences.getBoolean(key, defaultValue);
    }

    @Override
    public void save(Boolean value) {
        SharedPreferences preferences = preferences();
        if (preferences == null) return;
        preferences.edit().putBoolean(key, value).apply();
    }
}
