package io.github.jordanwoodson.extension.shared;

import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;
import java.util.function.Consumer;

import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Sleep timer, shared by the apps: pauses playback the chosen number of minutes (the {@code sleep_timer}
 * choice) after it last started or resumed. The app reports its players starting and stopping and supplies
 * the pause action.
 *
 * <p>Two locks, always taken in the same order (the gate, then the bookkeeping). {@code STARTED} guards the
 * bookkeeping (players, generation, the scheduled callback) and is only held for that, never while app code
 * runs. {@code DISPATCH}, the gate, is held while a sleep pause runs app code. A play callback waits at the
 * gate, at most {@link #GATE_WAIT_MS}, so a resume that races the pause lands after it instead of being
 * paused; stop callbacks never wait. A pause path that waits on another thread reporting a stop therefore
 * can't deadlock, and one that waits on a thread reporting a play holds that thread up for at most the bound.
 */
public final class SleepTimer {
    public static final String KEY = "sleep_timer";

    /** How long a play callback waits for a pause in progress on another thread before it goes ahead. */
    static final long GATE_WAIT_MS = 1000;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** Players that were started and not paused or released since. */
    private static final Map<Object, Long> STARTED = Collections.synchronizedMap(new WeakHashMap<>());
    /** Advanced by every play callback, including a resume of the same player. Guarded by STARTED. */
    private static long generation;
    private static Runnable scheduledSleep;
    private static volatile Consumer<Expiry> pauseAction;
    private static final ReentrantLock DISPATCH = new ReentrantLock();
    /**
     * The expiry whose pause action runs on this thread, for {@link #guardPauseOperation}. It is a ThreadLocal,
     * so only operations the action enqueues on the thread it was called on are recognized. When an app's
     * pause path hops to another thread first, what that thread enqueues runs as a stock operation: it isn't
     * revalidated, so a resume that overtakes it can still be paused. Tagging submissions from other threads
     * while a pause runs would also catch the user's own pause, seek or quality commands enqueued at that
     * moment and could drop them, which is worse than the rare stale pause.
     */
    private static final ThreadLocal<Expiry> DISPATCHING = new ThreadLocal<>();

    private SleepTimer() {
    }

    /** The app's way to pause everything that plays. Called on the main thread when the timer runs out. */
    public static void setPauseAction(Runnable action) {
        pauseAction = action == null ? null : expiry -> action.run();
    }

    /** An app with a delayed fallback retains this expiry's eligible players and playback generations. */
    public static void setExpiryAction(Consumer<Expiry> action) {
        pauseAction = action;
    }

    /**
     * Injection point at an app's player executor enqueue. Stock operations pass through unchanged;
     * commands enqueued by a sleep action revalidate that expiry when they actually execute.
     */
    public static Runnable guardPauseOperation(Runnable operation) {
        Expiry expiry = DISPATCHING.get();
        return expiry == null ? operation : () -> expiry.runIfCurrent(operation);
    }

    /** A player started or resumed: (re)arms the timer from now. May run on any thread. */
    public static void onPlay(Object player) {
        if (player == null) return;
        boolean gated = enterGate();
        try {
            synchronized (STARTED) {
                long playing = ++generation;
                STARTED.put(player, playing);
                MAIN.post(() -> arm(playing));
            }
        } finally {
            if (gated) DISPATCH.unlock();
        }
    }

    /**
     * The chosen time changed while something may be playing (the player's Sleep timer row): arms again from
     * now for the current playback, as a play would, or cancels the pending pause when it was turned off.
     */
    public static void settingChanged() {
        synchronized (STARTED) {
            long playing = generation;
            MAIN.post(() -> arm(playing));
        }
    }

    /** A player paused, stopped or was released. Never waits for a pause in progress. */
    public static void onStop(Object player) {
        if (player != null) STARTED.remove(player);
    }

    /** The players started and not stopped since, for pause actions that pause them directly. */
    public static List<Object> started() {
        synchronized (STARTED) {
            return new ArrayList<>(STARTED.keySet());
        }
    }

    private static void arm(long playing) {
        synchronized (STARTED) {
            // A play on another thread can overtake this queued arm callback.
            if (playing != generation) return;
            if (scheduledSleep != null) MAIN.removeCallbacks(scheduledSleep);
            int minutes = Settings.getInt(KEY);
            scheduledSleep = () -> sleep(playing);
            if (minutes > 0) MAIN.postDelayed(scheduledSleep, minutes * 60_000L);
        }
    }

    private static void sleep(long playing) {
        if (Settings.getInt(KEY) <= 0) return;
        Consumer<Expiry> action = pauseAction;
        Expiry expiry;
        // Snapshot under the bookkeeping lock; the app's pause code runs outside it.
        synchronized (STARTED) {
            if (playing != generation) return;
            if (STARTED.isEmpty()) {
                Logger.d("sleep timer: nothing is playing");
                return;
            }
            if (action == null) {
                Logger.d("sleep timer: no pause action");
                return;
            }
            expiry = new Expiry(playing, new WeakHashMap<>(STARTED));
        }
        // Initial pause paths can affect every app player. Plays wait at the gate until the dispatch is done,
        // as they do for the per-player fallback; stops (IVS's injected onStop) go straight through. The gate
        // is only busy here when an earlier expiry's queued pause runs on a player thread.
        boolean gated = enterGate();
        try {
            synchronized (STARTED) {
                // A play got in between the snapshot and the gate.
                if (playing != generation) return;
            }
            DISPATCHING.set(expiry);
            try {
                action.accept(expiry);
            } finally {
                DISPATCHING.remove();
            }
        } finally {
            if (gated) DISPATCH.unlock();
        }
        toast("Sleep timer: playback paused");
    }

    /**
     * Waits for a pause in progress on another thread, at most GATE_WAIT_MS; the thread running it enters at
     * once. False when it gave up waiting, so the caller goes ahead without the gate.
     */
    private static boolean enterGate() {
        try {
            return DISPATCH.tryLock(GATE_WAIT_MS, TimeUnit.MILLISECONDS);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            return false;
        }
    }

    /**
     * One expiry's players and their play generations. A fallback may pause a player missed by the app,
     * but never one started afterwards, resumed on the same instance, stopped or released. Other players
     * starting do not exempt an eligible old player that the app's pause path genuinely missed.
     */
    public static final class Expiry {
        private final long generation;
        private final Map<Object, Long> candidates;
        private boolean consumed;

        private Expiry(long generation, Map<Object, Long> candidates) {
            this.generation = generation;
            this.candidates = candidates;
        }

        /** Runs a pause command the action enqueued, unless a play came after this expiry or the timer is off. */
        private void runIfCurrent(Runnable operation) {
            boolean gated = enterGate();
            try {
                synchronized (STARTED) {
                    if (generation != SleepTimer.generation) return;
                }
                if (Settings.getInt(KEY) <= 0) return;
                operation.run();
            } finally {
                if (gated) DISPATCH.unlock();
            }
        }

        public void pauseLeftovers(String platform) {
            List<Object> due = new ArrayList<>();
            boolean gated = enterGate();
            try {
                synchronized (STARTED) {
                    if (consumed) return;
                    consumed = true;
                    if (Settings.getInt(KEY) <= 0) return;
                    for (Map.Entry<Object, Long> entry : candidates.entrySet()) {
                        Object player = entry.getKey();
                        if (entry.getValue().equals(STARTED.get(player))) due.add(player);
                    }
                }
                // Plays wait at the gate, so the generation check above still holds while these pause.
                for (Object player : due) {
                    try {
                        player.getClass().getMethod("pause").invoke(player);
                        Logger.d("sleep timer: paused a player " + platform + " missed");
                    } catch (Throwable t) {
                        Logger.w("sleep timer: couldn't pause a player " + platform + " missed: " + t);
                    }
                }
            } finally {
                if (gated) DISPATCH.unlock();
            }
        }
    }

    private static void toast(String text) {
        MAIN.post(() -> {
            try {
                Toast.makeText(Settings.appContext(), text, Toast.LENGTH_SHORT).show();
            } catch (RuntimeException e) {
                Logger.d("toast: " + e);
            }
        });
    }
}
