package app.southstar21.extension.instagram.liquidglass;

import android.annotation.SuppressLint;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.PixelCopy;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

/**
 * The video surfaces playing under the bar, and copies of them where the system allows it.
 * <p>
 * Instagram plays feed videos in SurfaceViews, which the system composites as separate layers:
 * their pixels never pass through the view hierarchy, so when the glass re-records what's
 * behind it, a playing video is only a transparent hole there. Left alone the glass filled
 * the hole with its base color and turned solid, and the edge blur had nothing to blur.
 * <p>
 * So the recordings fill their base color everywhere except the visible videos
 * ({@link #drawBase}), and the live video shows through the glass there. Where a surface can be
 * copied with {@link PixelCopy}, {@link #draw} also puts a small copy (blurred anyway) into the
 * hole, behind the video's own overlays (mute button, captions). Instagram's player draws into
 * a separate layer under its SurfaceView, so its copies come back empty ("no data"); those
 * surfaces are only retried now and then.
 */
@SuppressLint("NewApi")
final class SurfaceSnapshots {
    private static final long SCAN_MS = 400;
    /** Copies are this many times smaller than the surface on each side. */
    private static final int DOWNSCALE = 4;

    private final View bar;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final List<Entry> entries = new ArrayList<>();
    private final Paint paint = new Paint(Paint.FILTER_BITMAP_FLAG);
    private final int[] location = new int[2];
    private final int[] parentLocation = new int[2];
    private final Rect visible = new Rect();
    private final RectF bounds = new RectF();
    private final RectF clip = new RectF();
    private long lastScan;
    /** How long to wait before trying again to copy a surface that had nothing to copy. */
    private static final long RETRY_MS = 3000;

    private static final class Entry {
        final WeakReference<SurfaceView> view;
        /** The latest finished copy, and the one being copied into. */
        Bitmap shown, spare;
        boolean inFlight;
        /** When copying may be tried again after a failure; logged once per surface. */
        long retryAt;
        boolean failureLogged;

        Entry(SurfaceView view) {
            this.view = new WeakReference<>(view);
        }
    }

    SurfaceSnapshots(View bar) {
        this.bar = bar;
        // Only fills what's still transparent: the holes the surfaces punched.
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_OVER));
    }

    /**
     * Once a frame: refreshes the copies of the video surfaces that overlap {@code region}, in
     * the bar's parent's coordinates.
     */
    void update(RectF region) {
        if (!(bar.getParent() instanceof ViewGroup)) return;
        ViewGroup parent = (ViewGroup) bar.getParent();
        long now = SystemClock.uptimeMillis();
        if (now - lastScan > SCAN_MS) {
            lastScan = now;
            rescan(parent);
        }
        if (entries.isEmpty()) return;
        parent.getLocationInWindow(parentLocation);
        for (Entry entry : entries) {
            SurfaceView view = entry.view.get();
            if (!usable(view) || !visibleBounds(view)) continue;
            if (!RectF.intersects(clip, region)) continue;
            if (now < entry.retryAt) continue;
            request(entry, view);
        }
    }

    /**
     * Fills {@code color} behind what {@code canvas} (in the bar's parent's coordinates) holds,
     * standing in for the window's background, except where a video is visible: there the
     * recording stays transparent so the live video shows through.
     */
    void drawBase(Canvas canvas, int color) {
        int save = canvas.save();
        if (!entries.isEmpty() && bar.getParent() instanceof ViewGroup) {
            ((ViewGroup) bar.getParent()).getLocationInWindow(parentLocation);
            for (Entry entry : entries) {
                SurfaceView view = entry.view.get();
                // A copy fills the hole itself; leave only uncopied videos open.
                if (entry.shown != null || !usable(view) || !visibleBounds(view)) continue;
                canvas.clipOutRect(clip);
            }
        }
        canvas.drawColor(color, PorterDuff.Mode.DST_OVER);
        canvas.restoreToCount(save);
    }

    /**
     * Draws the latest copies into {@code canvas}, which is in the bar's parent's coordinates,
     * behind what it already holds. Call after recording the content, before the base color.
     */
    void draw(Canvas canvas) {
        if (entries.isEmpty() || !(bar.getParent() instanceof ViewGroup)) return;
        ((ViewGroup) bar.getParent()).getLocationInWindow(parentLocation);
        for (Entry entry : entries) {
            SurfaceView view = entry.view.get();
            if (entry.shown == null || !usable(view) || !visibleBounds(view)) continue;
            int save = canvas.save();
            canvas.clipRect(clip);
            canvas.drawBitmap(entry.shown, null, bounds, paint);
            canvas.restoreToCount(save);
        }
    }

    private static boolean usable(SurfaceView view) {
        return view != null && view.isAttachedToWindow() && view.getVisibility() == View.VISIBLE
                && view.getWidth() > 0 && view.getHeight() > 0
                && view.getHolder().getSurface() != null && view.getHolder().getSurface().isValid();
    }

    /** Sets {@link #bounds} (the whole surface) and {@link #clip} (its visible part), in the parent's coordinates. */
    private boolean visibleBounds(SurfaceView view) {
        view.getLocationInWindow(location);
        float left = location[0] - parentLocation[0];
        float top = location[1] - parentLocation[1];
        bounds.set(left, top, left + view.getWidth(), top + view.getHeight());
        if (!view.getGlobalVisibleRect(visible)) return false;
        View root = view.getRootView();
        root.getLocationInWindow(location);
        clip.set(visible.left + location[0] - parentLocation[0], visible.top + location[1] - parentLocation[1],
                visible.right + location[0] - parentLocation[0], visible.bottom + location[1] - parentLocation[1]);
        return !clip.isEmpty();
    }

    private void request(Entry entry, SurfaceView view) {
        if (entry.inFlight) return;
        int w = Math.max(1, view.getWidth() / DOWNSCALE);
        int h = Math.max(1, view.getHeight() / DOWNSCALE);
        if (entry.spare == null || entry.spare.getWidth() != w || entry.spare.getHeight() != h) {
            entry.spare = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
        }
        Bitmap target = entry.spare;
        entry.inFlight = true;
        try {
            // The whole surface, scaled into the small bitmap; drawn back over the view's bounds.
            PixelCopy.request(view, target, result -> {
                entry.inFlight = false;
                if (result != PixelCopy.SUCCESS) {
                    // Nothing to copy (the player draws into a layer of its own): the live video
                    // shows through instead. Try again later rather than every frame.
                    entry.retryAt = SystemClock.uptimeMillis() + RETRY_MS;
                    entry.shown = null;
                    if (!entry.failureLogged) {
                        entry.failureLogged = true;
                        android.util.Log.i(LiquidGlassNavBarPatch.TAG, "Can't copy the video under the bar "
                                + "(PixelCopy result " + result + "), letting it show through instead");
                    }
                    return;
                }
                Bitmap previous = entry.shown;
                entry.shown = target;
                entry.spare = previous;
            }, handler);
        } catch (RuntimeException e) {
            // A surface torn down between the check and the copy.
            entry.inFlight = false;
            entry.retryAt = SystemClock.uptimeMillis() + RETRY_MS;
        }
    }

    /** Finds the SurfaceViews among the content under the bar, keeping the copies of ones still there. */
    private void rescan(ViewGroup parent) {
        List<SurfaceView> found = new ArrayList<>();
        int barIndex = parent.indexOfChild(bar);
        for (int i = 0; i < barIndex; i++) collect(parent.getChildAt(i), found);
        List<Entry> kept = new ArrayList<>();
        for (SurfaceView view : found) {
            Entry existing = null;
            for (Entry entry : entries) {
                if (entry.view.get() == view) {
                    existing = entry;
                    break;
                }
            }
            kept.add(existing != null ? existing : new Entry(view));
        }
        entries.clear();
        entries.addAll(kept);
    }

    private static void collect(View view, List<SurfaceView> out) {
        if (view.getVisibility() != View.VISIBLE) return;
        if (view instanceof SurfaceView) {
            out.add((SurfaceView) view);
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), out);
        }
    }
}
