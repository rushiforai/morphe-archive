package app.wordfeudwordfinder.extension.play;

import java.util.Collections;
import java.util.List;

/**
 * Makes Wordfeud show the new game state after a move played through the overlay (spec section 8.4).
 *
 * <p>{@link #ORDER} names the strategies to try ({@link LifecycleBounce}, {@link ForegroundSignal},
 * {@link RouteBounce}, {@link FcmNudge}). It holds only {@link LifecycleBounce} in this test build (V4 testbuild 5,
 * docs/DEV.md "V4 — verversen"). Testbuild 3 showed that messages do arrive via FlutterJNI, but RouteBounce re-pushed
 * the game route without refetching it and left an extra game page on the stack, so it is unsuitable; testbuild 4's
 * ForegroundSignal arrived (jni 2/2 OK) but did not refresh the board. The final order waits for the device result. Each step is recorded in a {@link RefreshDiagnostic}; its
 * full line goes to Copy details. With an empty order nothing happens: the overlay closes and Wordfeud refreshes by itself
 * (about 20 s), the fallback from spec 8.4.
 *
 * <p>Debug override: when {@code wfwf/debug_refresh_order.txt} exists, its names replace {@link #ORDER} and each step
 * is logged (strategy and channel names only). Without that file nothing is logged.
 */
public final class Refresher {
    /** One way to make Wordfeud refresh. Returns true when it was carried out. */
    public interface Strategy {
        boolean refresh(long gameId) throws Exception;

        /** Name for debug logs; the strategies return their NAME constant (class names may be minified). */
        default String name() {
            return "anonymous";
        }
    }

    /** Sends platform messages to the Flutter engine of the current activity. */
    public interface Messenger {
        /**
         * Schedules the {@code sequence} on {@code channel} on the main thread: the first message right away, each
         * next one {@link MessageSequence#gapAfter(int)} after the previous one was sent. Once one was sent, the next
         * is always sent too (unless the engine itself is gone), so a sequence like [background, foreground] never
         * stops halfway; with {@link MessageSequence#closeAlways} the last message also follows a failed one. Returns
         * false when no Flutter engine is reachable now (nothing scheduled).
         */
        boolean send(String channel, MessageSequence sequence);

        /** {@link #send(String, MessageSequence)} with the same {@code gapMs} between all messages. */
        default boolean send(String channel, List<byte[]> messages, long gapMs) {
            return send(channel, MessageSequence.uniform(messages, gapMs));
        }
    }

    /** Debug log line sink (only used when the debug file exists). */
    public interface DebugLog {
        void d(String line);
    }

    /** What the Android side provides (FlutterBridge). */
    public interface Env {
        /**
         * The messenger; {@code log} is null in normal use and set when the debug file exists. It records its steps
         * in {@code diag} and calls {@link RefreshDiagnostic#finish()} when a scheduled sequence ended.
         */
        Messenger messenger(DebugLog log, RefreshDiagnostic diag);

        /** The text of the debug order file, or null when it does not exist (normal use). */
        String debugOrder();

        void debugLog(String line);
    }

    /** The strategy names to try, in order. Empty: fallback (spec 8.4), Wordfeud refreshes itself. */
    static final List<String> ORDER = Collections.singletonList(LifecycleBounce.NAME);

    private static volatile Env env;

    private Refresher() {}

    /** Installed by FlutterBridge for the current activity; null removes it. */
    public static void install(Env e) {
        env = e;
    }

    /** Never throws. Call it on the main thread after the overlay has closed. */
    public static void refresh(long gameId) {
        try {
            Env e = env;
            if (e == null) return;
            String debugText = e.debugOrder();
            DebugLog log = debugText == null ? null : e::debugLog;
            List<String> names = log == null ? ORDER : RefreshOrder.parse(debugText);
            if (log != null) log.d("refresh: order=" + names + " (debug file)");
            if (names.isEmpty()) return;
            RefreshDiagnostic diag = new RefreshDiagnostic(null);
            boolean scheduled = run(RefreshOrder.strategies(names, e.messenger(log, diag)), gameId, log, diag);
            if (!scheduled) diag.finish(); // otherwise the messenger finishes it when the sequence ended
        } catch (Throwable ignored) {
            // refreshing is best effort; Wordfeud catches up by itself
        }
    }

    /** Runs the strategies in order until one reports success; failures are swallowed. True when one worked. */
    static boolean run(List<Strategy> order, long gameId, DebugLog log) {
        return run(order, gameId, log, null);
    }

    /** As {@link #run(List, long, DebugLog)}, also recording each strategy's outcome in {@code diag} (may be null). */
    static boolean run(List<Strategy> order, long gameId, DebugLog log, RefreshDiagnostic diag) {
        for (Strategy s : order) {
            String name = s.name();
            try {
                if (log != null) log.d("strategy " + name + ": start");
                if (diag != null) diag.strategy(name);
                boolean ok = s.refresh(gameId);
                if (log != null) log.d("strategy " + name + ": " + (ok ? "scheduled" : "not possible"));
                if (ok) return true;
                if (diag != null) diag.fail("not possible");
            } catch (Throwable t) {
                if (log != null) log.d("strategy " + name + ": failed " + t.getClass().getSimpleName());
                if (diag != null) diag.fail("failed " + t.getClass().getSimpleName());
            }
        }
        if (order.isEmpty() && diag != null) diag.step("no strategies");
        // a strategy that was not possible usually already said why (e.g. "jni=none"): that reason stays first
        return false;
    }
}
