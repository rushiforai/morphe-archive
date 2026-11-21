package e.e.a;

import android.util.Log;
import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Record playback commands and Media3 transitions without source URLs. */
public final class Media3Diagnostics276 {
    private static final String TAG = "nicoid-media-intent";
    private static final int[] STATE_EVENTS = {4, 5, 6, 7};
    private static final String PLAYER_API = "androidx.media3.common.Player";

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long STALLED_SEEK_MS = 8000L;
    private static final WeakHashMap<Object, Probe> PROBES = new WeakHashMap<>();
    private static final WeakHashMap<Object, Attempt> ATTEMPTS = new WeakHashMap<>();

    private Media3Diagnostics276() {}

    public static void onStart(Object owner) {
        command(owner, "Start");
        observe(owner, field(owner, "player"));
    }

    public static void onPause(Object owner) {
        cancel(owner);
        command(owner, "Pause");
    }

    public static void onHandoffPause(Object owner) {
        cancel(owner);
        command(owner, "Handoff pause");
    }

    private static void command(Object owner, String action) {
        StringBuilder path = null;
        if (Log.isLoggable(TAG, Log.DEBUG)) {
            path = new StringBuilder();
            StackTraceElement[] frames = new Throwable().getStackTrace();
            for (int i = 3; i < frames.length && i < 10; i++) {
                if (path.length() > 0) path.append(" <- ");
                path.append(frames[i].getClassName()).append('.').append(frames[i].getMethodName());
            }
        }
        Log.i(TAG, action + " " + snapshot(owner, field(owner, "player")) + (path == null || path.length() == 0 ? "" : " caller=" + path));
    }

    public static void onEvents(Object owner, Object player, Object events) {
        try {
            Method contains = events.getClass().getMethod("contains", int.class);
            // Player.EVENT_PLAYBACK_STATE_CHANGED through EVENT_IS_PLAYING_CHANGED.
            for (int event = 4; event <= 7; event++) {
                if (Boolean.TRUE.equals(contains.invoke(events, event))) {
                    Log.i(TAG, "Media3 " + snapshot(owner, player));
                    break;
                }
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Diagnostic hooks must never interfere with playback.
        }
        observe(owner, player);
    }

    public static void onPlayIntentChange(Object owner, boolean ready, int reason) {
        Log.i(TAG, "Play intent ready=" + ready + " reason=" + reason + " " +
                snapshot(owner, field(owner, "player")));
        if (ready) observe(owner, field(owner, "player"));
        else cancel(owner);
    }

    public static void onError(Object owner, Throwable error) {
        cancel(owner);
        Object code = null;
        try {
            code = error.getClass().getField("errorCode").get(error);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
        }
        Throwable cause = error.getCause();
        Log.w(TAG, "Error code=" + code + " cause=" +
                (cause == null ? error.getClass().getSimpleName() : cause.getClass().getSimpleName()) +
                " " + snapshot(owner, field(owner, "player")));
    }

    /** Observe only a post-seek Media3 BUFFERING state with active play intent.
     * Do not recover an ordinary initial load, legitimate pause, retained view,
     * handoff, or user scrub. The running player and media item must remain
     * identical, with no position or buffered-range progress for eight seconds.
     */
    private static void observe(Object owner, Object player) {
        if (owner == null || player == null) return;
        int state = integer(read(player, "getPlaybackState"));
        if (state == 3) {
            cancel(owner);
            ATTEMPTS.remove(owner);
            return;
        }
        if (!eligible(owner, player, state)) {
            cancel(owner);
            return;
        }
        Object item = read(player, "getCurrentMediaItem");
        long position = number(read(player, "getCurrentPosition"));
        long buffered = number(read(player, "getBufferedPosition"));
        if (item == null || position < 0 || buffered < 0) {
            cancel(owner);
            return;
        }
        Attempt attempt = ATTEMPTS.get(owner);
        if (attempt == null || attempt.item != item) {
            attempt = new Attempt(item);
            ATTEMPTS.put(owner, attempt);
        }
        if (attempt.used) {
            cancel(owner);
            return;
        }
        Probe previous = PROBES.get(owner);
        if (previous != null && previous.player.get() == player
                && previous.item == item
                && Math.abs(previous.position - position) <= 250
                && Math.abs(previous.buffered - buffered) <= 2000) {
            return;
        }
        cancel(owner);
        Probe probe = new Probe(owner, player, item, position, buffered);
        PROBES.put(owner, probe);
        MAIN.postDelayed(probe, STALLED_SEEK_MS);
    }

    private static boolean eligible(Object owner, Object player, int state) {
        return state == 2
                && Boolean.TRUE.equals(read(player, "getPlayWhenReady"))
                && integer(read(player, "getPlaybackSuppressionReason")) == 0
                && Boolean.TRUE.equals(field(owner, "pendingSeek"))
                && !Boolean.TRUE.equals(field(owner, "scrubbing"))
                && !Boolean.TRUE.equals(field(owner, "released"))
                && !Boolean.TRUE.equals(field(owner, "bindingRetainedView"));
    }

    private static int integer(Object value) {
        return value instanceof Number ? ((Number) value).intValue() : -1;
    }

    private static long number(Object value) {
        return value instanceof Number ? ((Number) value).longValue() : -1L;
    }

    private static void cancel(Object owner) {
        Probe old = PROBES.remove(owner);
        if (old != null) MAIN.removeCallbacks(old);
    }

    private static final class Attempt {
        final Object item;
        boolean used;
        Attempt(Object item) { this.item = item; }
    }

    private static final class Probe implements Runnable {
        final WeakReference<Object> owner;
        final WeakReference<Object> player;
        final Object item;
        final long position;
        final long buffered;

        Probe(Object owner, Object player, Object item, long position, long buffered) {
            this.owner = new WeakReference<>(owner);
            this.player = new WeakReference<>(player);
            this.item = item;
            this.position = position;
            this.buffered = buffered;
        }

        @Override public void run() {
            Object currentOwner = owner.get();
            Object currentPlayer = player.get();
            if (currentOwner == null || currentPlayer == null) return;
            if (PROBES.get(currentOwner) != this
                    || field(currentOwner, "player") != currentPlayer) return;
            if (!eligible(currentOwner, currentPlayer,
                    integer(read(currentPlayer, "getPlaybackState")))
                    || read(currentPlayer, "getCurrentMediaItem") != item) {
                cancel(currentOwner);
                return;
            }
            long now = number(read(currentPlayer, "getCurrentPosition"));
            long nowBuffered = number(read(currentPlayer, "getBufferedPosition"));
            if (now < 0 || nowBuffered < 0) {
                cancel(currentOwner);
                return;
            }
            if (Math.abs(now - position) > 250 || nowBuffered > buffered + 2000) {
                cancel(currentOwner);
                observe(currentOwner, currentPlayer);
                return;
            }
            Attempt attempt = ATTEMPTS.get(currentOwner);
            if (attempt == null || attempt.item != item || attempt.used) {
                cancel(currentOwner);
                return;
            }
            attempt.used = true; // Mark before stop(): Media3 callbacks can be reentrant.
            cancel(currentOwner);
            try {
                Class<?> api = Class.forName(PLAYER_API, false,
                        currentPlayer.getClass().getClassLoader());
                // Retain the existing media item and explicit seek position.
                // stop()+prepare() also resets stuck loading/decoder pipelines,
                // unlike prepare() alone while the player remains BUFFERING.
                api.getMethod("stop").invoke(currentPlayer);
                api.getMethod("seekTo", long.class).invoke(currentPlayer, now);
                api.getMethod("prepare").invoke(currentPlayer);
                Log.w(TAG, "Recovered a stalled seek buffer once at position="
                        + now + "ms; media identity preserved");
            } catch (ReflectiveOperationException | RuntimeException e) {
                Log.w(TAG, "Bounded seek-buffer recovery failed", e);
            }
        }
    }

    private static String snapshot(Object owner, Object player) {
        String values = playerValues(player);
        return "player=" + Integer.toHexString(System.identityHashCode(owner)) + values +
                " scrubbing=" + field(owner, "scrubbing") +
                " seeking=" + field(owner, "pendingSeek") +
                " retained=" + field(owner, "bindingRetainedView");
    }

    private static String playerValues(Object player) {
        return " state=" + read(player, "getPlaybackState") +
                " ready=" + read(player, "getPlayWhenReady") +
                " suppression=" + read(player, "getPlaybackSuppressionReason") +
                " position=" + read(player, "getCurrentPosition") +
                " buffered=" + read(player, "getBufferedPosition");
    }

    private static Object field(Object owner, String name) {
        try {
            Field field = owner.getClass().getDeclaredField(name);
            field.setAccessible(true);
            return field.get(owner);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }

    private static Object read(Object player, String name) {
        if (player == null) return null;
        try {
            // ExoPlayerImpl itself is package-private. Invoke the public
            // Player interface declaration to avoid IllegalAccessException.
            Class<?> api = Class.forName(PLAYER_API, false, player.getClass().getClassLoader());
            return api.getMethod(name).invoke(player);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }
}
