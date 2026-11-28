package app.southstar21.extension.instagram.settings;

import android.content.SharedPreferences;

import java.util.concurrent.Callable;

public final class BooleanSetting extends Setting {
    private final Callable<Boolean> defaultValue;

    /**
     * @param defaultValue evaluated lazily, so it can come from a patch option
     *                     baked into the extension at patch time.
     */
    public BooleanSetting(String key, String title, String summary, boolean requiresRestart,
                          Callable<Boolean> defaultValue) {
        super(key, title, summary, requiresRestart);
        this.defaultValue = defaultValue;
    }

    public BooleanSetting(String key, String title, String summary, boolean requiresRestart,
                          boolean defaultValue) {
        this(key, title, summary, requiresRestart, () -> defaultValue);
    }

    public boolean getDefault() {
        try {
            return defaultValue.call();
        } catch (Exception e) {
            return false;
        }
    }

    public boolean get() {
        SharedPreferences prefs = Settings.preferencesOrNull();
        return prefs == null ? getDefault() : prefs.getBoolean(key, getDefault());
    }

    public void set(boolean value) {
        Settings.preferences().edit().putBoolean(key, value).apply();
    }
}
