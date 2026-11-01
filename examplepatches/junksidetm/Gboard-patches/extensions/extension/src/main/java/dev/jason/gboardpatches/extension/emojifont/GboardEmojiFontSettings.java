package dev.jason.gboardpatches.extension.emojifont;

import android.content.Context;
import android.content.SharedPreferences;

import java.io.File;

public final class GboardEmojiFontSettings {
    public static final String PREF_NAME = "gboard_patches_emoji_font";
    public static final String PREF_KEY_ENABLED = "pref_custom_emoji_font_enabled";
    public static final String PREF_KEY_FONT_NAME = "pref_custom_emoji_font_name";
    public static final String PREF_KEY_FONT_SIZE = "pref_custom_emoji_font_size";
    public static final String FONT_FILE_NAME = "custom_emoji_font.ttf";

    public static final boolean DEFAULT_ENABLED = false;

    private GboardEmojiFontSettings() {
    }

    public static Context resolveAppContext(Context context) {
        if (context == null) return null;
        Context app = context.getApplicationContext();
        return app != null ? app : context;
    }

    public static SharedPreferences preferences(Context context) {
        Context resolved = resolveAppContext(context);
        return resolved != null
                ? resolved.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
                : context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
    }

    public static boolean readEnabled(SharedPreferences preferences) {
        return preferences != null && preferences.getBoolean(PREF_KEY_ENABLED, DEFAULT_ENABLED);
    }

    public static String readFontName(SharedPreferences preferences) {
        return preferences == null ? "" : preferences.getString(PREF_KEY_FONT_NAME, "");
    }

    public static long readFontSize(SharedPreferences preferences) {
        return preferences == null ? 0L : preferences.getLong(PREF_KEY_FONT_SIZE, 0L);
    }

    public static void writeSettings(SharedPreferences preferences, boolean enabled, String fontName, long fileSize) {
        if (preferences == null) return;
        preferences.edit()
                .putBoolean(PREF_KEY_ENABLED, enabled)
                .putString(PREF_KEY_FONT_NAME, fontName != null ? fontName : "")
                .putLong(PREF_KEY_FONT_SIZE, fileSize)
                .apply();
    }

    public static void writeEnabled(SharedPreferences preferences, boolean enabled) {
        if (preferences == null) return;
        preferences.edit().putBoolean(PREF_KEY_ENABLED, enabled).apply();
    }

    public static File getFontFile(Context context) {
        Context resolved = resolveAppContext(context);
        if (resolved == null) return null;
        File filesDir = resolved.getFilesDir();
        if (filesDir == null) return null;
        return new File(filesDir, FONT_FILE_NAME);
    }

    public static boolean hasCustomFontFile(Context context) {
        File fontFile = getFontFile(context);
        return fontFile != null && fontFile.exists() && fontFile.length() > 0;
    }
}
