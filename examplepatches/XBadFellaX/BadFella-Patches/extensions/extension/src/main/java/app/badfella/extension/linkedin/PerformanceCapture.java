package app.badfella.extension.linkedin;

import android.app.Activity;
import android.app.Application;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.SystemClock;
import android.view.FrameMetrics;
import android.view.Window;
import java.util.Locale;

/** Opt-in, twenty-second numeric capture. No view tree, network, account or content inspection. */
final class PerformanceCapture {
    private static volatile Session current;
    private static volatile String lastReport = "Performance: not captured.\n";

    private PerformanceCapture() {}

    static boolean start(Application application) {
        if (current != null) return false;
        Session session = new Session(application);
        current = session;
        try {
            session.worker.start();
            session.handler = new Handler(session.worker.getLooper());
            application.registerActivityLifecycleCallbacks(session);
            session.main.postDelayed(session.finish, 20_000);
            return true;
        } catch (RuntimeException failure) {
            stop();
            Diagnostics.error("performance capture failed", failure);
            return false;
        }
    }

    static void stop() {
        Session session = current;
        if (session == null) return;
        synchronized (session.stats) {
            session.running = false;
            lastReport = session.stats.report(SystemClock.elapsedRealtime() - session.started);
            current = null;
        }
        session.main.removeCallbacks(session.finish);
        session.application.unregisterActivityLifecycleCallbacks(session);
        session.detach();
        session.worker.quitSafely();
    }

    static void clear() {
        stop();
        lastReport = "Performance: not captured.\n";
    }

    static String report() {
        return current == null ? lastReport : "Performance: recording; stop or wait 20 seconds before exporting.\n";
    }

    static long beginHook() { return current == null ? 0 : System.nanoTime(); }

    static void endHook(int index, long started) {
        if (started == 0) return;
        Session session = current;
        if (session == null || started < session.startedNanos) return;
        long elapsed = System.nanoTime() - started;
        synchronized (session.stats) {
            if (session.running) session.stats.hook(index, elapsed);
        }
    }

    private static final class Session implements Application.ActivityLifecycleCallbacks {
        final Application application;
        final Handler main = new Handler(Looper.getMainLooper());
        final HandlerThread worker = new HandlerThread("badfella-frame-metrics");
        final Stats stats = new Stats();
        final long started = SystemClock.elapsedRealtime();
        final long startedNanos = System.nanoTime();
        final Runnable finish = PerformanceCapture::stop;
        boolean running = true;
        Handler handler;
        Window window;
        Window.OnFrameMetricsAvailableListener listener;

        Session(Application application) { this.application = application; }

        public void onActivityResumed(Activity activity) {
            if (activity instanceof SettingsActivity) return;
            detach();
            try {
                float hz = activity.getWindowManager().getDefaultDisplay().getRefreshRate();
                long budget = (long) (1_000_000_000d / (hz > 0 ? hz : 60));
                listener = (owner, metrics, dropped) -> {
                    long deadline = Build.VERSION.SDK_INT >= 31 ? metrics.getMetric(FrameMetrics.DEADLINE) : budget;
                    synchronized (stats) {
                        if (running) stats.frame(metrics.getMetric(FrameMetrics.TOTAL_DURATION),
                                deadline > 0 ? deadline : budget,
                                metrics.getMetric(FrameMetrics.FIRST_DRAW_FRAME) == 1, dropped);
                    }
                };
                window = activity.getWindow();
                window.addOnFrameMetricsAvailableListener(listener, handler);
            } catch (RuntimeException failure) {
                Diagnostics.error("frame metrics unavailable", failure);
            }
        }

        void detach() {
            if (window == null) return;
            try { window.removeOnFrameMetricsAvailableListener(listener); }
            catch (RuntimeException failure) { Diagnostics.error("frame metrics detach failed", failure); }
            window = null;
            listener = null;
        }

        public void onActivityPaused(Activity activity) { if (activity.getWindow() == window) detach(); }
        public void onActivityCreated(Activity activity, Bundle state) {}
        public void onActivityStarted(Activity activity) {}
        public void onActivityStopped(Activity activity) {}
        public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
        public void onActivityDestroyed(Activity activity) { if (activity.getWindow() == window) detach(); }
    }

    static final class Stats {
        private long frames, slow, total, maximum, firstDraws, dropped;
        private final long[] hookCount = new long[2], hookTotal = new long[2], hookMax = new long[2];

        void frame(long duration, long budget, boolean firstDraw, int missed) {
            dropped += Math.max(0, missed);
            if (firstDraw) { firstDraws++; return; }
            if (duration < 0 || budget <= 0) return;
            frames++;
            if (duration > budget) slow++;
            total += duration;
            maximum = Math.max(maximum, duration);
        }

        void hook(int index, long duration) {
            hookCount[index]++;
            hookTotal[index] += duration;
            hookMax[index] = Math.max(hookMax[index], duration);
        }

        String report(long elapsedMs) {
            StringBuilder out = new StringBuilder("Performance capture (numeric, current process only):\n");
            out.append("  elapsed_ms: ").append(elapsedMs).append('\n');
            out.append("  rendered_frames: ").append(frames).append("; over_frame_budget: ").append(slow).append('\n');
            out.append("  first_draw_frames_excluded: ").append(firstDraws).append("; dropped_metric_callbacks: ").append(dropped).append('\n');
            out.append(String.format(Locale.ROOT, "  mean_frame_ms: %.3f; max_frame_ms: %.3f\n",
                    frames == 0 ? 0 : total / (frames * 1_000_000d), maximum / 1_000_000d));
            if (frames == 0) out.append("  No foreground frame measurements; repeat while scrolling LinkedIn.\n");
            for (int i = 0; i < hookCount.length; i++) {
                out.append(String.format(Locale.ROOT, "  %s: calls=%d; total_ms=%.3f; max_ms=%.3f\n",
                        i == 0 ? "SDUI rewrite" : "SDUI filter", hookCount[i], hookTotal[i] / 1_000_000d, hookMax[i] / 1_000_000d));
            }
            out.append("  Slow frames use the frame deadline or display refresh budget. This capture adds some overhead.\n");
            return out.toString();
        }
    }
}
