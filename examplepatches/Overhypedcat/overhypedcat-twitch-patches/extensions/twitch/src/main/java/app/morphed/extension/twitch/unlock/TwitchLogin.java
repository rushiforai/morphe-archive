package app.morphed.extension.twitch.unlock;

import android.content.Context;
import android.content.SharedPreferences;

import android.util.Log;

import java.io.File;

import app.morphed.extension.twitch.App;
import app.morphed.extension.twitch.patches.DebugLog;

/**
 * The viewer's Twitch login, read where the app keeps it (its own preferences, "authToken_v2"), at the moment
 * it's needed and never kept.
 */
final class TwitchLogin {
    private static final String KEY = "authToken_v2";
    private static final String USUAL_FILE = "twitch_user_prefs";

    private TwitchLogin() {
    }

    private static volatile String file = USUAL_FILE; // where it was found last
    private static final long RESCAN_MS = 5 * 60_000;
    private static volatile long scannedAt; // the other files are looked through at most every few minutes (memory)

    /** The token, or null when logged out (or it can't be read: then why is in the debug log). */
    static String token() {
        Context context = App.application();
        if (context == null) return null;
        String token = read(context, file);
        long now = System.currentTimeMillis();
        if (token != null || (scannedAt != 0 && now - scannedAt < RESCAN_MS)) return token;
        scannedAt = now; // (logged in since, in a file of another app version: found on the next look)
        // Another app version may keep it in another file: look through the app's preference files.
        File folder = new File(context.getApplicationInfo().dataDir, "shared_prefs");
        String[] files = folder.list((dir, name) -> name.endsWith(".xml"));
        if (files == null) return null;
        for (String found : files) {
            String name = found.substring(0, found.length() - 4);
            if (name.equals(USUAL_FILE)) continue;
            token = read(context, name);
            if (token != null) {
                file = name;
                return token;
            }
        }
        return null;
    }

    private static String read(Context context, String name) {
        try {
            SharedPreferences preferences = context.getSharedPreferences(name, Context.MODE_PRIVATE);
            Object value = preferences.getAll().get(KEY);
            return value instanceof String && !((String) value).isEmpty() ? (String) value : null;
        } catch (RuntimeException e) {
            Log.w(App.TAG, "The Twitch login couldn't be read from " + name, e);
            DebugLog.log("Quality unlock: the Twitch login couldn't be read from " + name + ": " + e);
            return null;
        }
    }
}
