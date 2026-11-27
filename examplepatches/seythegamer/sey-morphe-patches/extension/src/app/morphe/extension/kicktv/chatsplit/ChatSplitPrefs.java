package app.morphe.extension.kicktv.chatsplit;

import android.content.Context;
import android.content.SharedPreferences;

import app.morphe.extension.kicktv.base.MorpheContext;

/**
 * Persistent DEFAULT SPLIT VIEW setting.
 *
 * <p>KICK stores the chat display mode in DataStore under {@code chatMode}.
 * Its default is {@code hw0.B} = OVERLAY_HALF (small overlay chat). When this
 * tweak is on, the default becomes {@code hw0.D} = SIDE_PANEL (video/chat
 * split view). A mode the user explicitly saved later still wins.</p>
 */
public final class ChatSplitPrefs {

    private static final String PREFS_NAME = "morphe_kicktv";
    private static final String KEY_SPLIT_DEFAULT_ENABLED = "chat_split_default_enabled";
    private static final boolean DEFAULT_ENABLED = true;

    private static SharedPreferences prefs;
    private static volatile Boolean cachedEnabled;

    private ChatSplitPrefs() {
    }

    /** Called from MainActivity.onCreate() by the patch. */
    public static synchronized void init(Context context) {
        if (context instanceof android.app.Activity) {
            MorpheContext.setActivity((android.app.Activity) context);
        }
    }

    private static synchronized SharedPreferences getPrefs() {
        if (prefs == null) {
            Context context = MorpheContext.getAppContext();
            if (context != null) {
                prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            }
        }
        return prefs;
    }

    public static boolean isEnabled() {
        Boolean cached = cachedEnabled;
        if (cached != null) {
            return cached;
        }
        SharedPreferences p = getPrefs();
        boolean value = p == null
                ? DEFAULT_ENABLED
                : p.getBoolean(KEY_SPLIT_DEFAULT_ENABLED, DEFAULT_ENABLED);
        cachedEnabled = value;
        return value;
    }

    public static void setEnabled(boolean enabled) {
        cachedEnabled = enabled;
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putBoolean(KEY_SPLIT_DEFAULT_ENABLED, enabled).apply();
        }
    }

    /**
     * Returns KICK's SIDE_PANEL enum instance ({@code hw0.D}) when enabled,
     * otherwise the original default ({@code hw0.B}). Never throws: the
     * patched app must always keep a valid chat mode.
     */
    public static Object getDefaultMode(Object original) {
        try {
            if (!isEnabled()) {
                return original;
            }
            return Class.forName("hw0").getField("D").get(null);
        } catch (Throwable ignored) {
            return original;
        }
    }
}