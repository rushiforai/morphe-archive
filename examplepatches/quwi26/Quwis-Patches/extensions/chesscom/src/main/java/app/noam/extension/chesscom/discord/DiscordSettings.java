package app.noam.extension.chesscom.discord;

import android.content.Context;
import android.content.SharedPreferences;

import app.noam.extension.chesscom.Utils;

/**
 * What Discord Rich Presence keeps on the phone: the two OAuth tokens and the status the session
 * asks for. A private file of its own, so no other part of the bundle reads or writes them.
 */
public final class DiscordSettings {
    public static final String ONLINE = "online";
    public static final String IDLE = "idle";
    public static final String DND = "dnd";
    static final String KEY_ACCESS = "access_token";
    static final String KEY_REFRESH = "refresh_token";
    static final String KEY_EXPIRES = "access_expires_at";
    static final String KEY_USER = "user_name";
    static final String KEY_VERIFIER = "pkce_verifier";
    static final String KEY_STATE = "pkce_state";

    private static final String FILE = "discord_rpc";
    private static final String STATUS = "status";

    private DiscordSettings() {}

    public static String status() {
        String status = get(STATUS, ONLINE);
        return IDLE.equals(status) || DND.equals(status) ? status : ONLINE;
    }

    public static void setStatus(String status) {
        put(STATUS, status);
    }

    static String get(String key, String fallback) {
        SharedPreferences preferences = preferences();
        String value = preferences == null ? null : preferences.getString(key, fallback);
        return value == null ? fallback : value;
    }

    static void put(String key, String value) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putString(key, value).apply();
    }

    static long getLong(String key) {
        SharedPreferences preferences = preferences();
        return preferences == null ? 0 : preferences.getLong(key, 0);
    }

    static void putLong(String key, long value) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putLong(key, value).apply();
    }

    private static SharedPreferences preferences() {
        Context context = Utils.context();
        return context == null ? null : context.getSharedPreferences(FILE, Context.MODE_PRIVATE);
    }
}
