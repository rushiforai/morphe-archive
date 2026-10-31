package net.gtvbox.videoplayer;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Fixes for bugs in Vimu's own code (not skip logic). Called from smali hooks.
 *
 * 1. prepare(): media3's ExoPlayerImpl generates the audio session id on a background thread and only
 *    delivers it to the renderers through a main-thread callback. Vimu creates the player and calls
 *    prepare() in the same main-thread task. When the native engine opens quickly while the main thread
 *    is still busy (cold start), the video renderer is enabled with tunneling on and session id 0, and
 *    media3 throws IllegalStateException from MediaCodecVideoRenderer.onEnabled ("Exo2 Unexpected: null").
 *    prepare() is therefore deferred (a few 15 ms main-thread hops) until the id has been delivered.
 */
public final class VimuFix {
    private static final String TAG = "VimuFix";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long STEP_MS = 15L;
    private static final long MAX_WAIT_MS = 2000L;

    private VimuFix() {
    }

    /** Replacement for ExoPlayer.prepare() in Vimu's player class (i.A1). */
    public static void prepare(Object owner, Object player) {
        final B.D p = (B.D) player;
        try {
            new Waiter(owner, p).run();
        } catch (Throwable error) {
            Log.w(TAG, "prepare", error);
            p.g();
        }
    }

    /**
     * Register-safe entry point for Vimu's media-session wrapper m.m(). The hook site only
     * has two registers free, too few to pass the (session, position) pair, so the owner is
     * passed and its fields are read here. Falls back to releasing without a position when
     * the fields cannot be read.
     */
    public static void stopSession0(Object owner) {
        try {
            if (owner == null) return;
            Field sessionField = owner.getClass().getDeclaredField("c");
            sessionField.setAccessible(true);
            Object session = sessionField.get(owner);
            long position = -1L;
            try {
                Field positionField = owner.getClass().getDeclaredField("g");
                positionField.setAccessible(true);
                position = positionField.getLong(owner);
            } catch (Throwable ignored) {
            }
            stopSession(session, position);
        } catch (Throwable error) {
            Log.w(TAG, "stopSession0", error);
        }
    }

    private static final java.util.WeakHashMap<Object, Boolean> STOPPED_SESSIONS = new java.util.WeakHashMap<>();

    /**
     * Replacement body of Vimu's media-session wrapper m.m() (called when playback finishes). Vimu only called
     * setActive(false) and never released the MediaSession, so the system kept it in state PLAYING with the
     * last position for as long as the cached process lived. Idempotent.
     */
    public static void stopSession(Object sessionObj, long positionMs) {
        if (!(sessionObj instanceof android.media.session.MediaSession)) return;
        android.media.session.MediaSession s = (android.media.session.MediaSession) sessionObj;
        synchronized (STOPPED_SESSIONS) {
            if (STOPPED_SESSIONS.containsKey(s)) return;
            STOPPED_SESSIONS.put(s, Boolean.TRUE);
        }
        try {
            s.setPlaybackState(new android.media.session.PlaybackState.Builder().setActions(0L)
                    .setState(android.media.session.PlaybackState.STATE_STOPPED, positionMs < 0 ? 0L : positionMs, 0f).build());
        } catch (Throwable t) {
            Log.w(TAG, "stopSession state", t);
        }
        try {
            s.setActive(false);
        } catch (Throwable t) {
            Log.w(TAG, "stopSession inactive", t);
        }
        try {
            s.release();
            Log.i(TAG, "media session stopped and released");
        } catch (Throwable t) {
            Log.w(TAG, "stopSession release", t);
        }
    }

    private static final class Waiter implements Runnable {
        private final Object owner;
        private final B.D player;
        private final long startedAt = android.os.SystemClock.uptimeMillis();
        private Field ownerPlayerField;
        private Field stateField;
        private Method stateGet;
        private boolean resolved;

        Waiter(Object owner, B.D player) {
            this.owner = owner;
            this.player = player;
        }

        private void resolve() {
            resolved = true;
            try {
                for (Class<?> c = player.getClass(); c != null && stateField == null; c = c.getSuperclass()) {
                    for (Field f : c.getDeclaredFields()) {
                        if ("E.g".equals(f.getType().getName())) {
                            f.setAccessible(true);
                            stateField = f;
                            stateGet = f.getType().getMethod("d");
                            break;
                        }
                    }
                }
                ownerPlayerField = owner.getClass().getDeclaredField("h");
                ownerPlayerField.setAccessible(true);
            } catch (Throwable t) {
                Log.w(TAG, "resolve failed, preparing immediately", t);
                stateField = null;
            }
        }

        private boolean stillOwned() {
            try {
                return ownerPlayerField == null || ownerPlayerField.get(owner) == player;
            } catch (Throwable t) {
                return true;
            }
        }

        private boolean sessionIdDelivered() {
            try {
                if (stateField == null) return true;
                Object id = stateGet.invoke(stateField.get(player));
                return id instanceof Integer && ((Integer) id) != 0;
            } catch (Throwable t) {
                return true;
            }
        }

        @Override
        public void run() {
            try {
                if (!resolved) resolve();
                if (!stillOwned()) {
                    Log.i(TAG, "prepare skipped: player released/replaced before it was prepared");
                    return;
                }
                long waited = android.os.SystemClock.uptimeMillis() - startedAt;
                if (sessionIdDelivered() || waited >= MAX_WAIT_MS) {
                    if (waited >= MAX_WAIT_MS) Log.w(TAG, "audio session id still 0 after " + waited + "ms, preparing anyway");
                    else if (waited > 0) Log.i(TAG, "prepare after audio session id delivered (" + waited + "ms)");
                    player.g();
                    return;
                }
                MAIN.postDelayed(this, STEP_MS);
            } catch (Throwable error) {
                Log.w(TAG, "waiter", error);
                try { player.g(); } catch (Throwable ignored) { }
            }
        }
    }
}
