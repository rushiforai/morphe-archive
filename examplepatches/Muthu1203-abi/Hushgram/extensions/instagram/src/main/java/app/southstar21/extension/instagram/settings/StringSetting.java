package app.southstar21.extension.instagram.settings;

import android.content.SharedPreferences;

/** A short piece of text typed in a dialog, such as a custom message. Empty means unset. */
public final class StringSetting extends Setting {
    /** Shown in the empty text field. */
    public final String hint;
    public final int maxLength;

    public StringSetting(String key, String title, String summary, String hint, int maxLength) {
        super(key, title, summary, false);
        this.hint = hint;
        this.maxLength = maxLength;
    }

    public String get() {
        SharedPreferences prefs = Settings.preferencesOrNull();
        String value = prefs == null ? "" : prefs.getString(key, "");
        return value == null ? "" : value;
    }

    public void set(String value) {
        Settings.preferences().edit().putString(key, value == null ? "" : value).apply();
    }
}
