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
