package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.SurfaceTexture;
import android.os.Trace;
import android.util.Log;
import android.view.Surface;
import android.view.TextureView;
import android.view.View;
import android.view.ViewParent;
import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.WeakHashMap;

/** Owns the Canvas producer for a comment TextureView, independently of the video surface. */
public final class CommentPresentation {
    private static final int DIAGNOSTIC_LIMIT = 120;
    private static final String TAG = "nicoid-comment-present";
    private static final long LOG_PERIOD_NS = 5_000_000_000L;
    private static final long LONG_POST_GAP_NS = 25_000_000L;
    private static final WeakHashMap<TextureView, CommentPresentation> ACTIVE = new WeakHashMap<>();

    private static final ArrayDeque<String> DIAGNOSTICS = new ArrayDeque<>();

    private final WeakReference<SurfaceTexture> texture;
    private Surface hardwareSurface;
    private String mode;
    private long periodStart, drawStart, lastPost;
    private long lockNs, drawNs, postNs, maxPostGapNs;
    private int attempts, locked, posted, longPostGaps;

    private CommentPresentation(TextureView view, SurfaceTexture texture, String mode) {
        this.texture = new WeakReference<>(texture);
        this.mode = mode;
        if (view.isHardwareAccelerated() && !"other".equals(mode)) {
            try {
                hardwareSurface = new Surface(texture);
            } catch (RuntimeException error) {
                hardwareFailure("create", error);
            }
        }
        event("start mode=" + mode + " backend=" + backend()
                + " view=" + view.getWidth() + "x" + view.getHeight()
                + " acceleratedWindow=" + view.isHardwareAccelerated());
    }

    private static String playbackMode(TextureView view) {
        for (View item = view; item != null; ) {
            if ("nicoid-retained-mini-player".equals(item.getTag())) return "mini";
            ViewParent parent = item.getParent();
            item = parent instanceof View ? (View) parent : null;
        }
        Context context = view.getContext();
        while (context != null) {
            if ("com.sauzask.nicoid.NicoidPopupViewService".equals(context.getClass().getName())) {
                return "popup";
            }
            if (context instanceof Activity) {
                Activity activity = (Activity) context;
                if ("com.sauzask.nicoid.NicoidVideoActivity".equals(activity.getClass().getName())) {
                    return isFullscreen(view, activity) ? "fullscreen" : "normal";
                }
                return "other";
            }
            if (!(context instanceof ContextWrapper)) break;
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) break;
            context = base;
        }
        return "other";
    }

    private static boolean isFullscreen(TextureView view, Activity activity) {
        if (view.getResources().getConfiguration().orientation
                != Configuration.ORIENTATION_LANDSCAPE) return false;
        Intent intent = activity.getIntent();
        if (intent != null && (intent.getBooleanExtra("isFullScreen", false)
                || intent.getBooleanExtra("isLandscape", false))) return true;
        View root = view.getRootView();
        return root.getWidth() > 0 && root.getHeight() > 0
                && view.getWidth() >= root.getWidth() * .9f
                && view.getHeight() >= root.getHeight() * .75f;
    }

    private String backend() {
        return hardwareSurface == null ? "software" : "hardware";
    }

    public static String appendDiagnostics(String previous) {
        synchronized (DIAGNOSTICS) {
            if (DIAGNOSTICS.isEmpty()) return previous;
            StringBuilder message = new StringBuilder(previous)
                    .append("\n\nComment presentation diagnostics:\n");
            for (String entry : DIAGNOSTICS) message.append(entry).append('\n');
            return message.toString();
        }
    }

    private static void event(String message) {
        Log.i(TAG, message);
        synchronized (DIAGNOSTICS) {
            if (DIAGNOSTICS.size() == DIAGNOSTIC_LIMIT) DIAGNOSTICS.removeFirst();
            DIAGNOSTICS.addLast(System.currentTimeMillis() + " " + message);
        }
    }

    public static Canvas lock(TextureView view) {
        // The existing scheduler and the TextureView lifecycle callbacks run on the main Looper.
        SurfaceTexture texture = view.getSurfaceTexture();
        if (texture == null) {
            release(view);
            return null;
        }
        String mode = playbackMode(view);
        CommentPresentation state = ACTIVE.get(view);
        if (state == null || state.texture.get() != texture) {
            release(view);
            state = new CommentPresentation(view, texture, mode);
            ACTIVE.put(view, state);
        }
        long start = System.nanoTime();
        if (!mode.equals(state.mode)) {
            // Reparenting and resizing can retain the same producer connection.
            event("mode=" + state.mode + "->" + mode + " backend=" + state.backend()
                    + " view=" + view.getWidth() + "x" + view.getHeight());
            state.mode = mode;
            state.resetWindow(start);
            state.lastPost = 0L;
        }
        if (state.periodStart == 0L) state.periodStart = start;
        state.attempts++;
        Trace.beginSection("nicoid.comments.lockCanvas");
        Canvas canvas;
        try {
            if (state.hardwareSurface == null) {
                canvas = view.lockCanvas();
            } else {
                try {
                    canvas = state.hardwareSurface.lockHardwareCanvas();
                } catch (RuntimeException error) {
                    // Release the hardware producer before the next frame tries the legacy Canvas.
                    state.disableHardware("lock", error);
                    canvas = null;
                }
            }
        } finally {
            if (state.periodStart != 0L) state.lockNs += System.nanoTime() - start;
            Trace.endSection();
        }
        if (canvas != null) {
            state.locked++;
            state.drawStart = System.nanoTime();
            Trace.beginSection("nicoid.comments.paint");
        } else {
            state.report(view, System.nanoTime());
        }
        return canvas;
    }

    public static void post(TextureView view, Canvas canvas) {
        CommentPresentation state = ACTIVE.get(view);
        long start = System.nanoTime();
        Trace.endSection();
        state.drawNs += start - state.drawStart;
        Trace.beginSection("nicoid.comments.postCanvas");
        try {
            if (state.hardwareSurface == null) {
                view.unlockCanvasAndPost(canvas);
            } else {
                try {
                    state.hardwareSurface.unlockCanvasAndPost(canvas);
                } catch (RuntimeException error) {
                    state.disableHardware("post", error);
                    return;
                }
            }
            long now = System.nanoTime();
            if (state.lastPost != 0L) {
                long gap = now - state.lastPost;
                state.maxPostGapNs = Math.max(state.maxPostGapNs, gap);
                if (gap >= LONG_POST_GAP_NS) state.longPostGaps++;
            }
            state.lastPost = now;
            state.posted++;
        } finally {
            long end = System.nanoTime();
            Trace.endSection();
            if (state.periodStart != 0L) {
                state.postNs += end - start;
                state.report(view, end);
            }
        }
    }

    public static void release(TextureView view) {
        CommentPresentation state = ACTIVE.remove(view);
        if (state != null) state.releaseSurface();
    }

    private void disableHardware(String phase, RuntimeException error) {
        hardwareFailure(phase, error);
        releaseSurface();
        resetWindow(0L);
        lastPost = 0L;
    }

    private void hardwareFailure(String phase, RuntimeException error) {
        Log.w(TAG, "Comment hardware producer failed, reverting to software", error);
        event("mode=" + mode + " fallback=software phase=" + phase
                + " error=" + error.getClass().getSimpleName());
    }

    private void releaseSurface() {
        Surface surface = hardwareSurface;
        hardwareSurface = null;
        if (surface != null) surface.release();
    }

    private void report(TextureView view, long now) {
        long elapsed = now - periodStart;
        if (periodStart == 0L || elapsed < LOG_PERIOD_NS) return;
        event("mode=" + mode + " backend=" + backend()
                + " view=" + view.getWidth() + "x" + view.getHeight()
                + " attempts=" + attempts + " locked=" + locked + " posted=" + posted
                + " postedPerSec=" + posted * 1_000_000_000f / elapsed
                + " lockAvgMs=" + lockNs / (Math.max(1, attempts) * 1_000_000f)
                + " paintAvgMs=" + drawNs / (Math.max(1, locked) * 1_000_000f)
                + " postAvgMs=" + postNs / (Math.max(1, locked) * 1_000_000f)
                + " postMaxGapMs=" + maxPostGapNs / 1_000_000f
                + " postGapsOver25ms=" + longPostGaps);
        resetWindow(now);
    }

    private void resetWindow(long start) {
        periodStart = start;
        attempts = locked = posted = longPostGaps = 0;
        lockNs = drawNs = postNs = maxPostGapNs = 0L;
    }
}
