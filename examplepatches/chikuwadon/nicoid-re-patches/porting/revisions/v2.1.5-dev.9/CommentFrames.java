package e.e.a;

import android.os.Handler;
import android.os.Looper;
import android.view.Choreographer;
import android.view.TextureView;
import android.view.View;
import android.util.Log;
import java.util.Arrays;
import java.util.IdentityHashMap;

/** Drive TextureView comment rendering from display VSYNC, API 28+. */
public final class CommentFrames implements Runnable, Choreographer.FrameCallback {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final IdentityHashMap<TextureView, CommentFrames> ACTIVE = new IdentityHashMap<>();
    private static final long EARLY_TOLERANCE_NS = 500_000L;
    private final TextureView view;
    private final Runnable draw;
    private final int fps;
    private final long periodNs;
    private volatile Choreographer choreographer;
    private long nextDueNs;
    private long statsStartNs, callbackCount, drawingCount, notDueCount, hiddenCount;
    private long drawTimeNs, maxDrawTimeNs, maxFrameLatenessNs, vsyncDrops;
    private long previousVsyncNs;
    private long displayPeriodNs = 8_333_333L;
    private final int[] drawTimesMs = new int[101];

    private CommentFrames(TextureView view, Runnable draw, int fps) {
        this.view = view;
        this.draw = draw;
        this.fps = Math.max(1, Math.min(120, fps));
        periodNs = 1_000_000_000L / this.fps;
    }

    public static void start(TextureView view, Runnable draw, int fps) {
        if (view == null || draw == null) return;
        stop(view);
        CommentFrames replacement = new CommentFrames(view, draw, fps);
        synchronized (ACTIVE) { ACTIVE.put(view, replacement); }
        MAIN.post(replacement);
    }

    public static void stop(TextureView view) {
        CommentFrames old;
        synchronized (ACTIVE) { old = ACTIVE.remove(view); }
        if (old == null) return;
        MAIN.removeCallbacks(old);
        Choreographer pending = old.choreographer;
        if (pending != null) pending.removeFrameCallback(old);
    }

    private boolean isCurrent() {
        synchronized (ACTIVE) { return ACTIVE.get(view) == this; }
    }

    @Override public void run() {
        if (!isCurrent()) return;
        if (!view.isAttachedToWindow() || !view.isAvailable()) {
            stop(view);
            return;
        }
        updateDisplayPeriod();
        choreographer = Choreographer.getInstance();
        choreographer.postFrameCallback(this);
    }

    @Override public void doFrame(long frameTimeNanos) {
        if (!isCurrent()) return;
        if (!view.isAttachedToWindow() || !view.isAvailable()) {
            stop(view);
            return;
        }
        long callbackStart = System.nanoTime();
        if (statsStartNs == 0L) statsStartNs = callbackStart;
        callbackCount++;
        if (previousVsyncNs != 0L && frameTimeNanos > previousVsyncNs) {
            long gap = frameTimeNanos - previousVsyncNs;
            if (gap > displayPeriodNs * 3L / 2L) {
                long missed = (gap + displayPeriodNs / 2L) / displayPeriodNs - 1L;
                vsyncDrops += Math.max(1L, missed);
            }
        }
        previousVsyncNs = frameTimeNanos;
        maxFrameLatenessNs = Math.max(maxFrameLatenessNs,
                Math.max(0L, callbackStart - frameTimeNanos));
        if (nextDueNs == 0L || frameTimeNanos + EARLY_TOLERANCE_NS >= nextDueNs) {
            if (view.isShown() && view.getWindowVisibility() == View.VISIBLE) {
                long startedNs = System.nanoTime();
                try {
                    // Includes lockCanvas, comment painting, and unlockCanvasAndPost
                    // performed by the native draw Runnable.
                    draw.run();
                } finally {
                    long duration = Math.max(0L, System.nanoTime() - startedNs);
                    drawingCount++;
                    drawTimeNs += duration;
                    maxDrawTimeNs = Math.max(maxDrawTimeNs, duration);
                    drawTimesMs[(int) Math.min(100, duration / 1_000_000L)]++;
                }
            } else {
                hiddenCount++;
            }
            if (!isCurrent()) return;
            nextDueNs = nextDeadline(nextDueNs, frameTimeNanos, periodNs);
        } else {
            notDueCount++;
        }
        if (System.nanoTime() - statsStartNs >= 10_000_000_000L) logFrameStats();
        Choreographer current = choreographer;
        if (current != null && isCurrent()) current.postFrameCallback(this);
    }

    private void logFrameStats() {
        long now = System.nanoTime();
        float durationSec = Math.max(.001f, (now - statsStartNs) / 1_000_000_000f);
        long n = Math.max(1L, drawingCount);
        Log.i("nicoid-frame-total", "requestedFps=" + fps
                + " displayPeriodMs=" + (displayPeriodNs / 1_000_000f)
                + " callbacksPerSec=" + callbackCount / durationSec
                + " drawsPerSec=" + drawingCount / durationSec
                + " notDue=" + notDueCount + " hidden=" + hiddenCount
                + " missedVsyncIntervals=" + vsyncDrops
                + " drawWholeAvgMs=" + (drawTimeNs / n / 1_000_000f)
                + " drawWholeMaxMs=" + (maxDrawTimeNs / 1_000_000f)
                + " drawWholeP95Ms=" + percentile(drawTimesMs, .95f)
                + " drawWholeP99Ms=" + percentile(drawTimesMs, .99f)
                + " callbackLatenessMaxMs=" + (maxFrameLatenessNs / 1_000_000f));
        statsStartNs = now;
        callbackCount = drawingCount = notDueCount = hiddenCount = 0L;
        drawTimeNs = maxDrawTimeNs = maxFrameLatenessNs = vsyncDrops = 0L;
        Arrays.fill(drawTimesMs, 0);
        updateDisplayPeriod();
    }

    private void updateDisplayPeriod() {
        android.view.Display display = view.getDisplay();
        if (display == null) return;
        float hz = display.getRefreshRate();
        if (Float.isFinite(hz) && hz >= 24f && hz <= 480f)
            displayPeriodNs = Math.max(1L, Math.round(1_000_000_000d / hz));
    }

    private static int percentile(int[] counts, float fraction) {
        long total = 0L;
        for (int n : counts) total += n;
        if (total == 0L) return 0;
        long remaining = (long) Math.ceil(total * fraction);
        for (int i = 0; i < counts.length; i++) {
            remaining -= counts[i];
            if (remaining <= 0L) return i;
        }
        return counts.length - 1;
    }

    /** Keep fractional phase and skip old frames instead of catching up. */
    static long nextDeadline(long deadlineNs, long currentNs, long periodNs) {
        if (deadlineNs == 0L) return currentNs + periodNs;
        long periods = Math.max(0L, (currentNs - deadlineNs) / periodNs) + 1L;
        long next = deadlineNs + periods * periodNs;
        return next > currentNs ? next : currentNs + periodNs;
    }
}
