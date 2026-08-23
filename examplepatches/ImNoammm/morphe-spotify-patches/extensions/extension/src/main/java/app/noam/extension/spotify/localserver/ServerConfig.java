package app.noam.extension.spotify.localserver;

import android.content.Context;
import android.content.SharedPreferences;

import app.noam.extension.spotify.Utils;

/** Persisted configuration of the remote music folder. */
public final class ServerConfig {

    private static final String PREFERENCES = "morphe_local_server";

    public static final String KEY_ENABLED = "enabled";
    public static final String KEY_URL = "url";
    public static final String KEY_USERNAME = "username";
    public static final String KEY_PASSWORD = "password";
    public static final String KEY_FOLDER = "folder";
    public static final String KEY_STREAM = "stream";
    public static final String KEY_BEAUTIFUL_LYRICS = "beautiful_lyrics";

    private ServerConfig() {}

    private static SharedPreferences preferences() {
        Context context = Utils.getContext();
        if (context == null) return null;
        return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    public static String getString(String key, String fallback) {
        SharedPreferences preferences = preferences();
        return preferences == null ? fallback : preferences.getString(key, fallback);
    }

    public static boolean getBoolean(String key, boolean fallback) {
        SharedPreferences preferences = preferences();
        return preferences == null ? fallback : preferences.getBoolean(key, fallback);
    }

    public static void putString(String key, String value) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putString(key, value).apply();
    }

    public static void putBoolean(String key, boolean value) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putBoolean(key, value).apply();
    }

    public static boolean isEnabled() {
        return getBoolean(KEY_ENABLED, false);
    }

    /** True when tracks are streamed on demand; false downloads each track fully before playing. */
    public static boolean isStreaming() {
        return getBoolean(KEY_STREAM, true);
    }

    public static boolean isConfigured() {
        String url = getString(KEY_URL, "");
        return url != null && !url.trim().isEmpty();
    }
}
