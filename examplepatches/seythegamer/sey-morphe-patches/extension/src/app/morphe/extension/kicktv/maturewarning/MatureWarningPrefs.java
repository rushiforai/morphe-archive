package app.morphe.extension.kicktv.maturewarning;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import app.morphe.extension.kicktv.base.MorpheContext;
import kotlin.jvm.functions.Function0;

/**
 * Persistent SKIP 18+ WARNING setting.
 *
 * <p>When a mature stream is opened, KICK shows the "18+ Mature Content
 * Warning" dialog before playback starts. The dialog composable receives the
 * "start watching" callback; this helper invokes that callback right after
 * the current frame and tells the patch to skip drawing the dialog.</p>
 *
 * <p>The callback is posted to the main looper instead of being invoked from
 * the composable, so the player state is not changed during composition.</p>
 */
public final class MatureWarningPrefs {

    private static final String PREFS_NAME = "morphe_kicktv";
    private static final String KEY_AUTO_ACCEPT_ENABLED = "mature_auto_accept_enabled";
    private static final boolean DEFAULT_ENABLED = true;

    /** Ignore repeated accepts while the player is switching state. */
    private static final long ACCEPT_COOLDOWN_MS = 1500L;

    private static SharedPreferences prefs;
    private static volatile Boolean cachedEnabled;
    private static volatile long lastAcceptMs;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private MatureWarningPrefs() {
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

    public static boolean isAutoAcceptEnabled() {
        Boolean cached = cachedEnabled;
        if (cached != null) {
            return cached;
        }
        SharedPreferences p = getPrefs();
        if (p == null) {
            // The application context is not available yet; do not cache this
            // fallback or a later real preference read would be skipped.
            return DEFAULT_ENABLED;
        }
        boolean value = p.getBoolean(KEY_AUTO_ACCEPT_ENABLED, DEFAULT_ENABLED);
        cachedEnabled = value;
        return value;
    }

    public static void setAutoAcceptEnabled(boolean enabled) {
        cachedEnabled = enabled;
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putBoolean(KEY_AUTO_ACCEPT_ENABLED, enabled).apply();
        }
    }

    /**
     * Called at the start of the mature warning composable.
     *
     * @param accept the "Start watching" callback of the dialog
     * @return {@code true} when the dialog must be skipped
     */
    public static boolean autoAccept(final Function0<?> accept) {
        if (!isAutoAcceptEnabled() || accept == null) {
            return false;
        }

        long now = SystemClock.elapsedRealtime();
        if (now - lastAcceptMs >= ACCEPT_COOLDOWN_MS) {
            lastAcceptMs = now;
            MAIN.post(new Runnable() {
                @Override
                public void run() {
                    accept.invoke();
                }
            });
        }
        return true;
    }
}
