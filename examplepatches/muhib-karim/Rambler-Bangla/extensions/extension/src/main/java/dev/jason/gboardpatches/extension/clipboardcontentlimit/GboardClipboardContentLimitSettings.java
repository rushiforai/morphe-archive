package dev.jason.gboardpatches.extension.clipboardcontentlimit;

import android.content.Context;
import android.content.SharedPreferences;

public final class GboardClipboardContentLimitSettings {
    public static final String PREF_FILE = "gboard_clipboard_content_limit";
    public static final String PREF_KEY_MAX_CHARACTERS =
            "pref_clipboard_text_char_limit";
    public static final int DEFAULT_MAX_CHARACTERS = 20_000;

    private GboardClipboardContentLimitSettings() {
    }

    public static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREF_FILE, Context.MODE_PRIVATE);
    }

    public static void ensureDefault(SharedPreferences preferences) {
        if (preferences == null || preferences.contains(PREF_KEY_MAX_CHARACTERS)) {
            return;
        }
        preferences.edit()
                .putInt(PREF_KEY_MAX_CHARACTERS, DEFAULT_MAX_CHARACTERS)
                .apply();
    }

    public static int readMaxCharacters(SharedPreferences preferences) {
        if (preferences == null) {
            return DEFAULT_MAX_CHARACTERS;
        }
        Object rawValue = preferences.getAll().get(PREF_KEY_MAX_CHARACTERS);
        int value = DEFAULT_MAX_CHARACTERS;
        if (rawValue instanceof Number number) {
            value = number.intValue();
        } else if (rawValue instanceof String stringValue) {
            try {
                value = Integer.parseInt(stringValue);
            } catch (NumberFormatException ignored) {
                value = DEFAULT_MAX_CHARACTERS;
            }
        }
        return value > 0 ? value : DEFAULT_MAX_CHARACTERS;
    }

    public static boolean writeMaxCharacters(Context context, int value) {
        if (context == null || value <= 0) {
            return false;
        }
        return preferences(context).edit()
                .putInt(PREF_KEY_MAX_CHARACTERS, value)
                .commit();
    }
}
