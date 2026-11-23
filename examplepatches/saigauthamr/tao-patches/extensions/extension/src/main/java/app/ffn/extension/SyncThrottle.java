package app.ffn.extension;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

/**
 * Skips a sync pull (bookmarks, folders, history, offline stories) when the same sync job pulled
 * recently. Every app start otherwise sends about six pulls through the server's one-at-a-time
 * queue, usually to learn that nothing changed.
 * <p>
 * Called from code injected by the "Throttle sync" patch.
 */
@SuppressWarnings("unused")
public final class SyncThrottle {
    private static final String PREFS = "ffn_tao";
    private static final String LAST_PULL = "last_sync_pull_";

    private SyncThrottle() {
    }

    /** Placeholder. The patch replaces the body to return the configured interval. */
    private static long intervalMinutes() {
        return 0;
    }

    /**
     * Called at the top of a sync job's pull coroutine.
     *
     * @return true if the pull must be skipped.
     */
    public static boolean shouldSkip(Object pullCoroutine) {
        try {
            // A coroutine re-enters this method on every resume; only a fresh start (state 0) counts.
            if (coroutineState(pullCoroutine) != 0) return false;
            String job = jobName(pullCoroutine);
            if (job == null) return false;

            SharedPreferences prefs = prefs();
            if (prefs == null) return false;
            long now = System.currentTimeMillis();
            long last = prefs.getLong(LAST_PULL + job, 0);
            if (now >= last && now - last < intervalMinutes() * 60_000) {
                Log.d(RequestHooks.TAG, "sync pull skipped for " + job + ", last pull " + (now - last) / 1000 + "s ago");
                return true;
            }
            prefs.edit().putLong(LAST_PULL + job, now).apply();
            return false;
        } catch (Throwable t) {
            Log.e(RequestHooks.TAG, "SyncThrottle", t);
            return false;
        }
    }

    /** The sync job a fresh pull coroutine belongs to: its only object field that is already set. */
    private static String jobName(Object coroutine) throws IllegalAccessException {
        for (Field field : coroutine.getClass().getDeclaredFields()) {
            if (field.getType().isPrimitive() || Modifier.isStatic(field.getModifiers())) continue;
            field.setAccessible(true);
            Object value = field.get(coroutine);
            if (value != null) return value.getClass().getName();
        }
        return null;
    }

    /** The coroutine's state machine label: the only int field its class declares. */
    private static int coroutineState(Object coroutine) throws IllegalAccessException {
        for (Field field : coroutine.getClass().getDeclaredFields()) {
            if (field.getType() == int.class && !Modifier.isStatic(field.getModifiers())) {
                field.setAccessible(true);
                return field.getInt(coroutine);
            }
        }
        return -1;
    }

    private static SharedPreferences prefs() {
        try {
            Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            return app == null ? null : app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        } catch (ReflectiveOperationException e) {
            return null;
        }
    }
}
