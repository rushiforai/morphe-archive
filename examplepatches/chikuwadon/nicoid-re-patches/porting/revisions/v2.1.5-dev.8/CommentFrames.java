package e.e.a;

import android.os.Handler;
import android.os.Looper;
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
    private final int fps;
    private final long periodNs;
    private volatile Choreographer choreographer;
    private long nextDueNs;

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
        choreographer = Choreographer.getInstance();
        choreographer.postFrameCallback(this);
    }

    @Override public void doFrame(long frameTimeNanos) {
        if (!isCurrent()) return;
        if (!view.isAttachedToWindow() || !view.isAvailable()) {
            stop(view);
            return;
        }
        if (nextDueNs == 0L || frameTimeNanos + EARLY_TOLERANCE_NS >= nextDueNs) {
            if (view.isShown() && view.getWindowVisibility() == View.VISIBLE) {
                draw.run();
            }
            if (!isCurrent()) return;
            nextDueNs = nextDeadline(nextDueNs, frameTimeNanos, periodNs);
        }
        Choreographer current = choreographer;
        if (current != null && isCurrent()) current.postFrameCallback(this);
    }

    /** Keep fractional phase and skip old frames instead of catching up. */
    static long nextDeadline(long deadlineNs, long currentNs, long periodNs) {
        if (deadlineNs == 0L) return currentNs + periodNs;
        long periods = Math.max(0L, (currentNs - deadlineNs) / periodNs) + 1L;
        long next = deadlineNs + periods * periodNs;
        return next > currentNs ? next : currentNs + periodNs;
    }
}
