package io.github.bryceaspringfield.morphe.extension.kick;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * KICK Extras' settings (saved in the app's own preferences file "kick_extras") and log. KICK has no Morphe settings
 * screen, so {@link KickSettingsActivity} edits them, opened from its own launcher icon.
 */
public final class Kick {

    static final String TAG = "KickExtras";
    static final String PREFS = "kick_extras";

    // Settings keys, with their defaults in the getters below.
    static final String DEBUG = "debug";
    static final String AUDIO_ONLY_OPTION = "audio_only_option";
    static final String HIDE_TOP_GIFTED = "hide_top_gifted";
    static final String STATIC_TOP_GIFTED = "static_top_gifted";
    static final String HIDE_RECORDINGS = "hide_recordings";
    static final String HIDDEN_WORDS = "hidden_words";
    static final String HIDDEN_CHANNELS = "hidden_channels";
    static final String HIDDEN_CATEGORIES = "hidden_categories";
    static final String CHAT_HIDDEN_WORDS = "chat_hidden_words";
    static final String CHAT_HIDDEN_USERS = "chat_hidden_users";

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static Context context;

    private Kick() {
    }

    @SuppressLint({"PrivateApi", "DiscouragedPrivateApi"})
    static Context context() {
        if (context == null) {
            try {
                context = (Context) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
            } catch (Throwable ignored) {
            }
        }
        return context;
    }

    static SharedPreferences prefs() {
        Context c = context();
        return c == null ? null : c.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    static boolean bool(String key, boolean def) {
        SharedPreferences p = prefs();
        return p == null ? def : p.getBoolean(key, def);
    }

    static String text(String key) {
        SharedPreferences p = prefs();
        String s = p == null ? null : p.getString(key, "");
        return s == null ? "" : s;
    }

    /** A setting's list: one entry a line or comma, lowercased, blanks dropped, a leading @ dropped. */
    static List<String> list(String key) {
        List<String> out = new ArrayList<>();
        for (String s : text(key).split("[\\n,]")) {
            s = s.trim().toLowerCase(Locale.ROOT);
            if (s.startsWith("@")) s = s.substring(1);
            if (!s.isEmpty()) out.add(s);
        }
        return out;
    }

    static boolean debug() {
        return bool(DEBUG, false);
    }

    static void log(String message) {
        if (debug()) Log.d(TAG, message);
    }

    static void error(String message, Throwable t) {
        Log.e(TAG, message, t);
    }

    static void main(Runnable r) {
        if (Looper.myLooper() == Looper.getMainLooper()) r.run();
        else MAIN.post(r);
    }

    /** Whether text names one of the words: a word in "quotes" matches whole words only, any other as a substring. */
    static String matchWord(String text, List<String> words) {
        if (text == null || words.isEmpty()) return null;
        String t = text.toLowerCase(Locale.ROOT);
        for (String w : words) {
            if (w.length() > 2 && w.startsWith("\"") && w.endsWith("\"")) {
                String core = w.substring(1, w.length() - 1);
                if (!core.isEmpty() && java.util.regex.Pattern.compile("(?<![\\p{L}\\p{N}])"
                        + java.util.regex.Pattern.quote(core) + "(?![\\p{L}\\p{N}])").matcher(t).find()) return w;
            } else if (t.contains(w)) {
                return w;
            }
        }
        return null;
    }
}
