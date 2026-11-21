package e.e.a;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Choreographer;
import android.view.TextureView;
import android.view.View;
import java.util.IdentityHashMap;

/** Drive TextureView comment rendering from display VSYNC, API 28+. */
public final class CommentFrames implements Runnable, Choreographer.FrameCallback {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final IdentityHashMap<TextureView, CommentFrames> ACTIVE = new IdentityHashMap<>();
    private static final long EARLY_TOLERANCE_NS = 500_000L;
    private final TextureView view;
    private final Runnable draw;
    private final long periodNs;
    private Choreographer choreographer;
    private long nextDueNs;
    private long statsStartNs, drawCount, totalDrawNs, maxDrawNs;

    private CommentFrames(TextureView view, Runnable draw, int fps) {
        this.view = view;
        this.draw = draw;
        periodNs = 1_000_000_000L / Math.max(1, Math.min(120, fps));
    }

    public static void start(TextureView view, Runnable draw, int fps) {
        if (view == null || draw == null) return;
        CommentFrames replacement = new CommentFrames(view, draw, fps);
        synchronized (ACTIVE) {
            cancel(ACTIVE.put(view, replacement));
            if (!MAIN.post(replacement)) ACTIVE.remove(view);
        }
    }

    public static void stop(TextureView view) {
        synchronized (ACTIVE) {
            cancel(ACTIVE.remove(view));
        }
    }

    private static void cancel(CommentFrames frame) {
        if (frame == null) return;
        MAIN.removeCallbacks(frame);
        if (frame.choreographer != null) frame.choreographer.removeFrameCallback(frame);
    }

    private void stopIfCurrent() {
        synchronized (ACTIVE) {
            if (ACTIVE.get(view) == this) cancel(ACTIVE.remove(view));
        }
    }

    private boolean isCurrent() {
        synchronized (ACTIVE) { return ACTIVE.get(view) == this; }
    }

    @Override public void run() {
        if (!isCurrent()) return;
        if (!view.isAttachedToWindow() || !view.isAvailable()) {
            stopIfCurrent();
            return;
        }
        synchronized (ACTIVE) {
            if (ACTIVE.get(view) != this) return;
            choreographer = Choreographer.getInstance();
            choreographer.postFrameCallback(this);
        }
    }

    @Override public void doFrame(long frameTimeNanos) {
        if (!isCurrent()) return;
        if (!view.isAttachedToWindow() || !view.isAvailable()) {
            stopIfCurrent();
            return;
        }
        if (nextDueNs == 0L || frameTimeNanos + EARLY_TOLERANCE_NS >= nextDueNs) {
            if (view.isShown() && view.getWindowVisibility() == View.VISIBLE) {
                drawAndMeasure();
            } else {
                statsStartNs = drawCount = totalDrawNs = maxDrawNs = 0L;
            }
            if (!isCurrent()) return;
            nextDueNs = nextDeadline(nextDueNs, frameTimeNanos, periodNs);
        }
        synchronized (ACTIVE) {
            if (ACTIVE.get(view) == this) choreographer.postFrameCallback(this);
        }
    }

    private void drawAndMeasure() {
        long start = System.nanoTime();
        draw.run();
        long end = System.nanoTime();
        if (statsStartNs == 0L) statsStartNs = start;
        long duration = end - start;
        drawCount++;
        totalDrawNs += duration;
        maxDrawNs = Math.max(maxDrawNs, duration);
        long elapsed = end - statsStartNs;
        if (elapsed >= 10_000_000_000L) {
            Log.i("nicoid-frame-total", "drawsPerSec=" + drawCount / (elapsed / 1_000_000_000f)
                    + " drawWholeAvgMs=" + (totalDrawNs / (drawCount * 1_000_000f))
                    + " drawWholeMaxMs=" + (maxDrawNs / 1_000_000f));
            statsStartNs = end;
            drawCount = totalDrawNs = maxDrawNs = 0L;
        }
    }

    /** Keep fractional phase and skip old frames instead of catching up. */
    static long nextDeadline(long deadlineNs, long currentNs, long periodNs) {
        if (deadlineNs == 0L) return currentNs + periodNs;
        long periods = Math.max(0L, (currentNs - deadlineNs) / periodNs) + 1L;
        long next = deadlineNs + periods * periodNs;
        return next > currentNs ? next : currentNs + periodNs;
    }
}
