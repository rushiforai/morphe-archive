package e.e.a;

import android.util.Log;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.UnknownHostException;
import java.net.SocketTimeoutException;
import java.net.NoRouteToHostException;
import java.net.ConnectException;

/** Record playback commands and Media3 transitions without source URLs. */
public final class Media3Diagnostics276 {
    private static final String TAG = "nicoid-media-intent";
    private static final int EVENT_POSITION_DISCONTINUITY = 11;
    private static final int[] LOGGED_EVENTS = {0, 2, 3, 4, 5, 6, 7};
    private static final String PLAYER_API = "androidx.media3.common.Player";

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long STALLED_SEEK_MS = 8000L;
    private static final long SAMPLE_MS = 1000L;
    private static final WeakHashMap<Object, Probe> PROBES = new WeakHashMap<>();
    private static final WeakHashMap<Object, Attempt> ATTEMPTS = new WeakHashMap<>();
    private static final WeakHashMap<Object, NetworkRetry> NETWORK_RETRIES = new WeakHashMap<>();

    private Media3Diagnostics276() {}

    /** Limit frame preview to files and local content that do not use the HLS pipeline. */
    public static boolean canPreviewLocalMedia(Object owner) {
        Object item = read(field(owner, "player"), "getCurrentMediaItem");
        if (item == null) return false;
        try {
            Object config = item.getClass().getField("localConfiguration").get(item);
            if (config == null) return false;
            Object uri = config.getClass().getField("uri").get(config);
            if (!(uri instanceof Uri)) return false;
            String scheme = ((Uri) uri).getScheme();
            return "file".equalsIgnoreCase(scheme) || "content".equalsIgnoreCase(scheme)
                    || "android.resource".equalsIgnoreCase(scheme);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return false;
        }
    }

    public static void onStart(Object owner) {
        cancelNetwork(owner);
        command(owner, "Start");
        observe(owner, field(owner, "player"));
    }

    public static void onPause(Object owner) {
        cancel(owner);
        cancelNetwork(owner);
        command(owner, "Pause");
    }

    public static void onHandoffPause(Object owner) {
        cancel(owner);
        cancelNetwork(owner);
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
        if (owner == null || player == null || field(owner, "player") != player) return;
        boolean positionDiscontinuity = false;
        try {
            Method contains = events.getClass().getMethod("contains", int.class);
            positionDiscontinuity = Boolean.TRUE.equals(
                    contains.invoke(events, EVENT_POSITION_DISCONTINUITY));
            // Timeline, tracks, loading, and playback-state transitions.
            for (int event : LOGGED_EVENTS) {
                if (Boolean.TRUE.equals(contains.invoke(events, event))) {
                    Log.i(TAG, "Media3 " + snapshot(owner, player));
                    break;
                }
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Diagnostic hooks must never interfere with playback.
        }
        if (positionDiscontinuity) cancel(owner);
        if (integer(read(player, "getPlaybackState")) == 3) cancelNetwork(owner);
        observe(owner, player);
    }

    public static void onPlayIntentChange(Object owner, boolean ready, int reason) {
        Log.i(TAG, "Play intent ready=" + ready + " reason=" + reason + " " +
                snapshot(owner, field(owner, "player")));
        if (ready) observe(owner, field(owner, "player"));
        else { cancel(owner); cancelNetwork(owner); }
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
        if (isTemporaryNetworkFailure(error)) retryNetwork(owner);
        else cancelNetwork(owner);
    }


    /** Recover from a temporary DNS/socket outage without replacing the player. */
    private static boolean isTemporaryNetworkFailure(Throwable throwable) {
        for (int i = 0; i < 8 && throwable != null; i++, throwable = throwable.getCause()) {
            if (throwable instanceof UnknownHostException
                    || throwable instanceof SocketTimeoutException
                    || throwable instanceof ConnectException
                    || throwable instanceof NoRouteToHostException)
                return true;
        }
        return false;
    }

    private static void retryNetwork(Object owner) {
        Object player = field(owner, "player");
        if (owner == null || player == null || !canRecover(owner, player)
                || canPreviewLocalMedia(owner)) return;
        Object item = read(player, "getCurrentMediaItem");
        if (item == null) return;
        NetworkRetry previous = NETWORK_RETRIES.get(owner);
        if (previous != null && previous.player.get() == player && previous.item == item) {
            previous.queue();
            return;
        }
        cancelNetwork(owner);
        NetworkRetry retry = new NetworkRetry(owner, player, item);
        NETWORK_RETRIES.put(owner, retry);
        retry.queue();
    }

    private static void cancelNetwork(Object owner) {
        NetworkRetry old = NETWORK_RETRIES.remove(owner);
        if (old != null) MAIN.removeCallbacks(old);
    }

    private static final class NetworkRetry implements Runnable {
        private static final long[] DELAYS_MS = {3000L, 7000L, 15000L, 30000L};
        final WeakReference<Object> owner;
        final WeakReference<Object> player;
        final Object item;
        int used;
        boolean queued;

        NetworkRetry(Object owner, Object player, Object item) {
            this.owner = new WeakReference<>(owner);
            this.player = new WeakReference<>(player);
            this.item = item;
        }

        void queue() {
            if (queued || used >= DELAYS_MS.length) return;
            queued = true;
            MAIN.postDelayed(this, DELAYS_MS[used]);
        }

        @Override public void run() {
            queued = false;
            Object currentOwner = owner.get();
            Object currentPlayer = player.get();
            if (currentOwner == null || currentPlayer == null
                    || NETWORK_RETRIES.get(currentOwner) != this) return;
            if (!canRecover(currentOwner, currentPlayer)
                    || read(currentPlayer, "getCurrentMediaItem") != item) {
                cancelNetwork(currentOwner);
                return;
            }
            if (integer(read(currentPlayer, "getPlaybackState")) == 3) {
                cancelNetwork(currentOwner);
                return;
            }
            final int attempt = ++used;
            final long position = number(read(currentPlayer, "getCurrentPosition"));
            try {
                Class<?> api = Class.forName(PLAYER_API, false,
                        currentPlayer.getClass().getClassLoader());
                // Media3 keeps the media item and playback position after source error.
                // Never call stop(), seekTo(), setMediaItem() or construct a new player.
                api.getMethod("prepare").invoke(currentPlayer);
                Log.w(TAG, "Network recovery attempt " + attempt + "/4 at "
                        + position + "ms");
            } catch (ReflectiveOperationException | RuntimeException e) {
                Log.w(TAG, "Network recovery prepare failed", e);
            }
            // A further connection failure is reported through onError(), which
            // calls queue(). The last attempt is deliberately terminal.
        }
    }

    /** Observe only a post-seek Media3 BUFFERING state with active play intent.
     * Do not recover an ordinary initial load, legitimate pause, retained view,
     * handoff, or user scrub. The running player and media item must remain
     * identical, with no position or buffered-range progress for eight seconds.
     */
    private static void observe(Object owner, Object player) {
        if (owner == null || player == null || field(owner, "player") != player) return;
        int state = integer(read(player, "getPlaybackState"));
        if (state == 3) {
            cancel(owner);
            ATTEMPTS.remove(player);
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
        Attempt attempt = ATTEMPTS.get(player);
        if (attempt == null || attempt.item != item) {
            attempt = new Attempt(item);
            ATTEMPTS.put(player, attempt);
        }
        if (attempt.used) {
            cancel(owner);
            return;
        }
        Probe previous = PROBES.get(owner);
        if (previous != null && previous.player.get() == player && previous.item == item) {
            previous.recordProgress(position, buffered);
            return;
        }
        cancel(owner);
        Probe probe = new Probe(owner, player, item, position, buffered);
        PROBES.put(owner, probe);
        MAIN.postDelayed(probe, SAMPLE_MS);
    }

    private static boolean eligible(Object owner, Object player, int state) {
        return state == 2
                && Boolean.TRUE.equals(field(owner, "pendingSeek"))
                && canRecover(owner, player);
    }

    private static boolean canRecover(Object owner, Object player) {
        return field(owner, "player") == player
                && Boolean.FALSE.equals(field(owner, "scrubbing"))
                && Boolean.FALSE.equals(field(owner, "released"))
                && Boolean.FALSE.equals(field(owner, "bindingRetainedView"))
                && Boolean.TRUE.equals(read(player, "getPlayWhenReady"))
                && integer(read(player, "getPlaybackSuppressionReason")) == 0;
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
        long position;
        long buffered;
        long lastProgress;

        Probe(Object owner, Object player, Object item, long position, long buffered) {
            this.owner = new WeakReference<>(owner);
            this.player = new WeakReference<>(player);
            this.item = item;
            this.position = position;
            this.buffered = buffered;
            this.lastProgress = SystemClock.uptimeMillis();
        }

        void recordProgress(long position, long buffered) {
            if (Math.abs(this.position - position) > 250 || this.buffered != buffered) {
                this.position = position;
                this.buffered = buffered;
                lastProgress = SystemClock.uptimeMillis();
            }
        }

        @Override public void run() {
            Object currentOwner = owner.get();
            Object currentPlayer = player.get();
            if (currentOwner == null || PROBES.get(currentOwner) != this) return;
            if (currentPlayer == null) {
                cancel(currentOwner);
                return;
            }
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
            recordProgress(now, nowBuffered);
            long remaining = STALLED_SEEK_MS - (SystemClock.uptimeMillis() - lastProgress);
            if (remaining > 0) {
                MAIN.postDelayed(this, Math.min(SAMPLE_MS, remaining));
                return;
            }
            Attempt attempt = ATTEMPTS.get(currentPlayer);
            if (attempt == null || attempt.item != item || attempt.used) {
                cancel(currentOwner);
                return;
            }
            attempt.used = true; // Mark before stop(): Media3 callbacks can be reentrant.
            cancel(currentOwner);
            try {
                Class<?> api = Class.forName(PLAYER_API, false,
                        currentPlayer.getClass().getClassLoader());
                Method stop = api.getMethod("stop");
                Method prepare = api.getMethod("prepare");
                // Media3 stop() retains the playlist and position. It can run
                // callbacks that replace, release, or already prepare the player.
                stop.invoke(currentPlayer);
                if (canRecover(currentOwner, currentPlayer)
                        && integer(read(currentPlayer, "getPlaybackState")) == 1
                        && read(currentPlayer, "getCurrentMediaItem") == item) {
                    prepare.invoke(currentPlayer);
                    Log.w(TAG, "Retried stalled seek buffering at position=" + now + "ms");
                }
            } catch (ReflectiveOperationException | RuntimeException e) {
                Log.w(TAG, "Bounded seek-buffer recovery failed", e);
            }
        }
    }

    private static String snapshot(Object owner, Object player) {
        String values = playerValues(player);
        return "player=" + Integer.toHexString(System.identityHashCode(owner))
                + " engine=" + Integer.toHexString(System.identityHashCode(player)) + values +
                " scrubbing=" + field(owner, "scrubbing") +
                " seeking=" + field(owner, "pendingSeek") +
                " retained=" + field(owner, "bindingRetainedView");
    }

    private static String playerValues(Object player) {
        return " state=" + read(player, "getPlaybackState") +
                " ready=" + read(player, "getPlayWhenReady") +
                " suppression=" + read(player, "getPlaybackSuppressionReason") +
                " position=" + read(player, "getCurrentPosition") +
                " buffered=" + read(player, "getBufferedPosition") +
                " loading=" + read(player, "isLoading") +
                " tracksEmpty=" + tracksEmpty(player);
    }

    private static Object tracksEmpty(Object player) {
        Object tracks = read(player, "getCurrentTracks");
        if (tracks == null) return null;
        try {
            return tracks.getClass().getMethod("isEmpty").invoke(tracks);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
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
