package com.travianpatch.notifier;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

/**
 * Reads the game's own cached login session from its private storage. This
 * extension runs inside the game's own process and UID, so reading the
 * game's private files needs no root and no separate login: whatever the
 * player is already logged in with (password or Google) is what the game
 * itself saved for its own "stay logged in" behavior.
 *
 * Unity keeps that in its PlayerPrefs file, which on Android is an ordinary
 * SharedPreferences file named "<package>.v2.playerprefs". The key
 * "lastLobbyCookie" holds the lobby session cookie the game logs in with.
 */
final class TravianSession {

    private static final String TAG = "TravianNotifier";
    private static final String KEY_LOBBY_COOKIE = "lastLobbyCookie";

    private TravianSession() {
    }

    private static final String KEY_NAMES_LOGGED = "playerprefs_names_logged_v1";

    /**
     * Once per install, writes the NAMES of the game's own saved settings (with each value's type and
     * length, never the value) to the phone log ("PREFS" lines). Local only: nothing is sent anywhere. Used
     * to find out whether the game keeps its world login token, so this app could reuse it instead of
     * signing in on its own.
     */
    static void logKeyNamesOnce(Context ctx) {
        Context app = ctx.getApplicationContext();
        SharedPreferences mine = app.getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE);
        if (mine.getBoolean(KEY_NAMES_LOGGED, false)) {
            return;
        }
        mine.edit().putBoolean(KEY_NAMES_LOGGED, true).apply();
        try {
            java.util.Map<String, ?> all = app.getSharedPreferences(app.getPackageName() + ".v2.playerprefs",
                    Context.MODE_PRIVATE).getAll();
            java.util.List<String> names = new java.util.ArrayList<String>(all.keySet());
            java.util.Collections.sort(names);
            Log.i(TAG, "PREFS " + names.size() + " saved settings");
            for (String name : names) {
                Object v = all.get(name);
                Log.i(TAG, "PREFS " + name + " : " + (v == null ? "null" : v.getClass().getSimpleName()
                        + (v instanceof String ? " length " + ((String) v).length() : "")));
            }
        } catch (Exception e) {
            Log.i(TAG, "PREFS not readable: " + e);
        }
    }

    /** All of the game's own saved settings (Unity PlayerPrefs); empty when unreadable. Never logged. */
    static java.util.Map<String, ?> savedSettings(Context ctx) {
        try {
            Context app = ctx.getApplicationContext();
            return app.getSharedPreferences(app.getPackageName() + ".v2.playerprefs", Context.MODE_PRIVATE).getAll();
        } catch (Exception e) {
            return new java.util.HashMap<String, Object>();
        }
    }

    /** Returns the game's current lobby session cookie value, or null if it isn't logged in. */
    static String readLobbySessionCookie(Context ctx) {
        Context app = ctx.getApplicationContext();
        SharedPreferences prefs = app.getSharedPreferences(
                app.getPackageName() + ".v2.playerprefs", Context.MODE_PRIVATE);
        String raw = prefs.getString(KEY_LOBBY_COOKIE, null);
        if (raw == null) {
            return null;
        }
        String value = raw.trim();
        // tolerate a "name=value" or "name=value; Path=..." shape, in case the game stores the header form
        String prefix = TravianApi.LOBBY_SESSION_COOKIE + "=";
        if (value.startsWith(prefix)) {
            value = value.substring(prefix.length());
        }
        int attrs = value.indexOf(';');
        if (attrs >= 0) {
            value = value.substring(0, attrs);
        }
        if (value.length() == 0) {
            return null;
        }
        Log.i(TAG, "found the game's own session (len=" + value.length() + ")");
        return value;
    }
}
