package app.spicetify.extension.spotify.extensions;

import android.annotation.SuppressLint;
import android.content.Context;
import android.util.Log;
import app.spicetify.extension.spotify.settings.InstalledPatches;
import java.io.IOException;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/**
 * The line to Spotify's native core for the extensions and the Home pins picker: single
 * esperanto calls and cosmos GETs, and the {@code ContextPlayer/GetState} stream while anything
 * listens to it. It's process-wide, and connects when Spotify builds its
 * {@code SharedCosmosRouterService} (hook H1).
 * <p>
 * Threading: the router answers on Spotify's core thread. There a callback only copies the body
 * and posts it to the one bridge thread, so it never blocks the core, and every {@link Result} and
 * {@link StateListener} runs on the bridge thread. Nothing may block that thread either: a wait is
 * a {@link #postDelayed}, and a network call runs on a thread of its own. Spotify may hold
 * callbacks weakly, so the bridge keeps each live one in {@link #LIVE} until it answers or is
 * cancelled.
 * <p>
 * When Spotify replaces its router, calls still waiting on the old one fail with "bridge not
 * connected", so a {@link Result} can arrive as a failure on router loss. A state stream that ends,
 * answers an error status, or that Spotify won't open, opens again after a backoff while anything
 * listens.
 */
public final class PlayerBridge {
    static final String NOT_CONNECTED = "bridge not connected";
    private static final String GET_STATE = "sp://esperanto/" + Esperanto.CONTEXT_PLAYER + "/GetState";
    private static final long FIRST_REOPEN_MILLIS = 1000;
    private static final long LAST_REOPEN_MILLIS = 60_000;

    /**
     * One daemon thread, parked while idle. {@link #post} is strictly first in, first out: on this
     * one-thread ScheduledThreadPoolExecutor, execute() schedules with zero delay, so each task is
     * due the moment it's posted, and tasks due at the same moment run in the order they were posted.
     */
    private static final ScheduledExecutorService THREAD = Executors.newSingleThreadScheduledExecutor(task -> {
        Thread thread = new Thread(task, "Spicetify player bridge");
        thread.setDaemon(true);
        return thread;
    });
    private static final Set<CosmosRouter.Callback> LIVE = ConcurrentHashMap.newKeySet();
    private static final CopyOnWriteArrayList<StateListener> LISTENERS = new CopyOnWriteArrayList<>();
    /**
     * Guards the router, the stream and the last state. Router callbacks never take it. With it held,
     * the bridge may take Spotify's router monitor to send, but never the other way around.
     */
    private static final Object LOCK = new Object();
    private static volatile CosmosRouter router;
    private static volatile Stream stream;
    private static volatile Esperanto.PlayerState lastState;
    /** The latest thing that went wrong, shown on the bridge's problem line until it's resolved. */
    private static volatile String problem;
    /** The wait before the next reopen: it doubles each time up to a minute, and a state or a new router resets it. */
    private static long reopenMillis = FIRST_REOPEN_MILLIS; // guarded by LOCK
    /** A reopen is due on the current router, so another failure meanwhile schedules no second one. */
    private static boolean reopenDue; // guarded by LOCK

    interface Result {
        void done(byte[] body);

        void failed(String reason);
    }

    /** Hears each player state on the bridge thread. It may hear one more just after it's removed. */
    interface StateListener {
        void onState(Esperanto.PlayerState state);
    }

    private PlayerBridge() {}

    /**
     * Hook H1, at the end of {@code SharedCosmosRouterService.<init>}: attaches Spotify's router,
     * then, with the extensions patch installed, starts the extensions that are on. Never throws
     * into Spotify.
     */
    public static void onCosmos(Object service) {
        onCosmos(service, InstalledPatches.extensions());
    }

    /**
     * Without the extensions patch, H1 came with Home pins alone, whose picker reads Your Library
     * through the bridge. Then no extension starts: one left on from an earlier build couldn't be
     * turned off.
     */
    static void onCosmos(Object service, boolean extensionsInstalled) {
        try {
            Context application = application(service);
            if (application != null) Extensions.setAppContext(application);
            attach(CosmosRouter.reflective(service));
            if (!extensionsInstalled) return;
            Context context = Extensions.appContext();
            if (context == null) {
                Log.w("Spicetify", "No application context to start the extensions with");
            } else {
                post(() -> Extensions.startEnabled(context));
            }
        } catch (Throwable e) {
            Log.w("Spicetify", "Couldn't connect the player bridge", e);
            problem = "Couldn't connect: " + e;
        }
    }

    /** Spotify's {@code Application}, from {@code ActivityThread} through the router's class loader, or null. */
    @SuppressLint("PrivateApi") // greylisted, contained here, and PatchSettings' context covers a denial
    private static Context application(Object service) {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread", false,
                    service.getClass().getClassLoader());
            return (Context) activityThread.getMethod("currentApplication").invoke(null);
        } catch (Throwable e) {
            Log.w("Spicetify", "Couldn't find Spotify's application; using the one from its startup", e);
            return null;
        }
    }

    /**
     * Sends everything through {@code cosmos} from now on. Calls still waiting on the old router
     * fail, and the state stream moves to the new one if anything listens. The reopen backoff starts
     * over, and a reopen that was due on the old router does nothing.
     */
    static void attach(CosmosRouter cosmos) {
        synchronized (LOCK) {
            CosmosRouter old = router;
            closeStream();
            router = cosmos;
            problem = null;
            reopenDue = false;
            reopenMillis = FIRST_REOPEN_MILLIS;
            if (old != null && old != cosmos) failPending(old);
            if (!LISTENERS.isEmpty()) openStream();
        }
    }

    /** Called with {@link #LOCK} held. Failing a call also releases its request. */
    private static void failPending(CosmosRouter old) {
        for (CosmosRouter.Callback live : LIVE) {
            if (live instanceof Call && ((Call) live).sentThrough == old) ((Call) live).fail(NOT_CONNECTED);
        }
    }

    /** True while a router is attached and Spotify hasn't destroyed it. */
    static boolean connected() {
        CosmosRouter current = router;
        return current != null && !destroyed(current);
    }

    /** POSTs {@code body} to {@code sp://esperanto/<service>/<method>}. */
    static void call(String service, String method, byte[] body, Result result) {
        send("POST", "sp://esperanto/" + service + "/" + method, body, result);
    }

    /** A plain cosmos GET, such as {@code sp://auth/v2/token?renew=0}. */
    static void get(String uri, Result result) {
        send("GET", uri, new byte[0], result);
    }

    /** Status 200 gives {@code done}, anything else {@code failed}; either runs on the bridge thread. */
    private static void send(String action, String uri, byte[] body, Result result) {
        CosmosRouter current = router;
        if (current == null || destroyed(current)) {
            post(() -> result.failed(NOT_CONNECTED));
            return;
        }
        Call call = new Call(current, result);
        LIVE.add(call);
        try {
            call.started(current.resolve(action, uri, body, call));
        } catch (Throwable e) {
            // A router destroyed since the check above refuses to send.
            call.fail(destroyed(current) ? NOT_CONNECTED : String.valueOf(e));
        }
    }

    /** Adds {@code listener}. The first one opens the {@code GetState} stream, as does the next one after it failed. */
    static void addStateListener(StateListener listener) {
        synchronized (LOCK) {
            LISTENERS.addIfAbsent(listener);
            if (stream == null) openStream();
        }
    }

    /** Removes {@code listener}. Removing the last one cancels the stream. */
    static void removeStateListener(StateListener listener) {
        synchronized (LOCK) {
            LISTENERS.remove(listener);
            if (LISTENERS.isEmpty()) closeStream();
        }
    }

    /** The latest state of the open stream, or null when no stream is open or none has arrived. */
    static Esperanto.PlayerState lastState() {
        return lastState;
    }

    /**
     * The bridge's line while it waits for Spotify or its stream failed, which Spicetify settings
     * shows; null while it works.
     */
    public static String problemLine() {
        if (!connected()) return "Player bridge: waiting for Spotify" + note();
        synchronized (LOCK) {
            // Something listens, yet no stream is open: it ended, or it couldn't open, and a reopen is due.
            if (stream == null && !LISTENERS.isEmpty()) return "Player bridge: stream error, retrying" + note();
        }
        return null;
    }

    /** The latest problem in parentheses, or nothing once it's resolved. */
    private static String note() {
        String latest = problem;
        return latest == null ? "" : " (" + latest + ")";
    }

    /**
     * Called with {@link #LOCK} held. Without a live router, the next {@link #attach} opens it; a
     * live router that won't open it gets a reopen.
     */
    private static void openStream() {
        CosmosRouter current = router;
        if (current == null || destroyed(current)) return;
        Stream opened = new Stream();
        stream = opened; // before resolve, because Spotify may answer before resolve returns
        LIVE.add(opened);
        try {
            opened.cancel = current.resolve("SUB", GET_STATE, Esperanto.getState(), opened);
        } catch (Throwable e) {
            stream = null;
            LIVE.remove(opened);
            Log.w("Spicetify", "Couldn't open the player state stream", e);
            problem = "Couldn't open the player state stream: " + e;
            reopenLater();
        }
    }

    /** Called with {@link #LOCK} held: one reopen at a time, after the backoff, which then doubles up to a minute. */
    private static void reopenLater() {
        if (reopenDue) return;
        reopenDue = true;
        CosmosRouter dueOn = router;
        postDelayed(() -> reopen(dueOn), reopenMillis);
        reopenMillis = nextBackoff(reopenMillis);
    }

    /** The wait after one of {@code millis}: twice as long, up to a minute. */
    static long nextBackoff(long millis) {
        return Math.min(millis * 2, LAST_REOPEN_MILLIS);
    }

    /**
     * On the bridge thread: opens a stream when something listens and none is open. A destroyed
     * router opens nothing and schedules nothing more; the next {@link #attach} opens the stream.
     */
    private static void reopen(CosmosRouter dueOn) {
        synchronized (LOCK) {
            if (router != dueOn) return; // attach started over
            reopenDue = false;
            if (stream == null && !LISTENERS.isEmpty()) openStream();
        }
    }

    /** Called with {@link #LOCK} held. It forgets the last state too, since the track can now change unseen. */
    private static void closeStream() {
        lastState = null;
        Stream closing = stream;
        if (closing == null) return;
        stream = null;
        LIVE.remove(closing);
        if (closing.cancel != null) release(closing.cancel);
    }

    /**
     * On the bridge thread. An answer other than 200 ends the stream, as a stream error does: Spotify's
     * core ends the subscription after one, such as the 404 it answers before its player is ready. A
     * state that can't be read is reported once per stream, which stays open, since it's alive.
     */
    private static void onState(Stream from, int status, byte[] body) {
        if (from != stream) return; // the old stream had it in flight
        if (status != 200) {
            synchronized (LOCK) {
                if (from != stream) return;
                closeStream();
                if (!LISTENERS.isEmpty()) reopenLater();
            }
            Log.w("Spicetify", "The player state stream answered status " + status);
            problem = "Couldn't read the player state: status " + status;
            return;
        }
        Esperanto.PlayerState state;
        try {
            state = Esperanto.parseState(body);
        } catch (IOException e) {
            Log.w("Spicetify", "Couldn't read the player state", e);
            if (!from.reported) {
                from.reported = true;
                problem = "Couldn't read the player state: " + e.getMessage();
            }
            return;
        }
        synchronized (LOCK) {
            if (from != stream) return; // closed while this one was read
            lastState = state;
            problem = null;
            reopenMillis = FIRST_REOPEN_MILLIS;
        }
        for (StateListener listener : LISTENERS) {
            try {
                listener.onState(state);
            } catch (Throwable e) {
                Log.w("Spicetify", "A player state listener failed", e);
            }
        }
    }

    /** On the bridge thread. While anything listens, the stream opens again after the backoff. */
    private static void onStreamError(Stream from, Throwable error) {
        synchronized (LOCK) {
            if (from != stream) return;
            closeStream();
            if (!LISTENERS.isEmpty()) reopenLater();
        }
        Log.w("Spicetify", "The player state stream ended", error);
        problem = "The player state stream ended: " + error;
    }

    private static boolean destroyed(CosmosRouter cosmos) {
        try {
            return cosmos.destroyed();
        } catch (Throwable e) {
            Log.w("Spicetify", "Couldn't ask Spotify's router whether it's destroyed", e);
            return true;
        }
    }

    private static void release(CosmosRouter.Cancel cancel) {
        try {
            cancel.cancel();
        } catch (Throwable e) {
            Log.w("Spicetify", "Couldn't release a cosmos request", e);
        }
    }

    /** Spotify owns the array it answered with, so the bridge thread gets a copy. */
    private static byte[] copy(byte[] body) {
        return body == null ? new byte[0] : body.clone();
    }

    /** Runs {@code task} on the bridge thread, after everything posted before it. A task that throws is logged. */
    static void post(Runnable task) {
        THREAD.execute(logged(task));
    }

    /** Runs {@code task} on the bridge thread once {@code delayMillis} have passed; the thread stays free meanwhile. */
    static void postDelayed(Runnable task, long delayMillis) {
        THREAD.schedule(logged(task), delayMillis, TimeUnit.MILLISECONDS);
    }

    private static Runnable logged(Runnable task) {
        return () -> {
            try {
                task.run();
            } catch (Throwable e) {
                Log.w("Spicetify", "A player bridge task failed", e);
            }
        };
    }

    /** One call. Only its first answer counts, and that answer releases the request, as Spotify's own transport does. */
    private static final class Call implements CosmosRouter.Callback {
        private static final Object ANSWERED = new Object();
        final CosmosRouter sentThrough;
        private final Result result;
        /** Null while resolving, then the request's Cancel, then {@link #ANSWERED}. */
        private final AtomicReference<Object> state = new AtomicReference<>();

        Call(CosmosRouter sentThrough, Result result) {
            this.sentThrough = sentThrough;
            this.result = result;
        }

        /** Keeps {@code cancel}, or releases it now if the answer came before resolve returned. */
        void started(CosmosRouter.Cancel cancel) {
            if (!state.compareAndSet(null, cancel)) release(cancel);
        }

        @Override
        public void onResponse(int status, byte[] body) {
            try {
                if (!answered()) return;
                byte[] copy = copy(body);
                post(() -> {
                    if (status == 200) result.done(copy);
                    else result.failed("status " + status);
                });
            } catch (Throwable e) {
                Log.w("Spicetify", "A cosmos answer failed", e);
            }
        }

        @Override
        public void onError(Throwable error) {
            fail(String.valueOf(error));
        }

        /** Fails the call with {@code reason} unless it already answered, and releases its request. */
        void fail(String reason) {
            try {
                if (!answered()) return;
                post(() -> result.failed(reason));
            } catch (Throwable e) {
                Log.w("Spicetify", "A cosmos error failed", e);
            }
        }

        private boolean answered() {
            Object previous = state.getAndSet(ANSWERED);
            if (previous == ANSWERED) return false;
            LIVE.remove(this);
            if (previous != null) release((CosmosRouter.Cancel) previous);
            return true;
        }
    }

    /** The {@code GetState} subscription: each answer is one state, until it's cancelled. */
    private static final class Stream implements CosmosRouter.Callback {
        CosmosRouter.Cancel cancel; // guarded by LOCK
        boolean reported; // only the bridge thread uses it

        @Override
        public void onResponse(int status, byte[] body) {
            try {
                byte[] copy = copy(body);
                post(() -> onState(this, status, copy));
            } catch (Throwable e) {
                Log.w("Spicetify", "A player state answer failed", e);
            }
        }

        @Override
        public void onError(Throwable error) {
            try {
                post(() -> onStreamError(this, error));
            } catch (Throwable e) {
                Log.w("Spicetify", "A player state error failed", e);
            }
        }
    }
}
