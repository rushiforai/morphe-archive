package nl.johninnl.eclipse.auto.app;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * The patch calls {@link #queueChanged()} at the start of the app's queue mutators. It only
 * schedules: one run on the main looper however many mutations arrive first, after the mutation
 * that triggered it has finished. It touches no app type, never returns a value and swallows every
 * failure, so a hooked mutator behaves exactly as before.
 *
 * <p>Two surfaces listen: the car session (templated screens) and the classic browse tree, which
 * turns the signal into children-changed for the queue node. Each has its own slot and either may
 * be empty; the signal is not scheduled at all while both are.
 */
public final class Signals {
    private static final AtomicBoolean PENDING = new AtomicBoolean();
    private static volatile Runnable listener;
    private static volatile Runnable treeListener;
    private static volatile Handler main;

    /** The car session's refresh; one session at a time is enough, the newest wins. */
    public static void setListener(Runnable refresh) { listener = refresh; }

    /** Removes {@code refresh} only if it is still the registered listener. */
    public static void clearListener(Runnable refresh) {
        if (listener == refresh) listener = null;
    }

    /** The classic browse tree's refresh; it lives as long as the process, so it is set once. */
    public static void setTreeListener(Runnable refresh) { treeListener = refresh; }

    /** Removes {@code refresh} only if it is still the registered tree listener. */
    public static void clearTreeListener(Runnable refresh) {
        if (treeListener == refresh) treeListener = null;
    }

    /** Called by hooked app code: any change to the queue. */
    public static void queueChanged() {
        try {
            if (listener == null && treeListener == null) return;
            if (!PENDING.compareAndSet(false, true)) return;
            Handler handler = main;
            if (handler == null) main = handler = new Handler(Looper.getMainLooper());
            handler.post(Signals::deliver);
        } catch (Throwable ignored) {
            PENDING.set(false);
        }
    }

    private static void deliver() {
        PENDING.set(false);
        run(listener);
        run(treeListener);
    }

    private static void run(Runnable target) {
        if (target == null) return;
        try {
            target.run();
        } catch (Throwable ignored) {
            // A failed refresh must never reach the app's queue code.
        }
    }

    private Signals() { }
}
