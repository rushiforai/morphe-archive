package app.wordfeudwordfinder.extension.ui;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Choreographer;
import android.view.PixelCopy;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import java.lang.ref.WeakReference;

/**
 * Samples pixels of Wordfeud's Flutter surface (main thread, only while the button may show) so the button looks as
 * if it lies under Wordfeud's menus and dialogs (see {@link ScreenShade}), and to read the board colours. Our own
 * views are not in the Flutter surface, so the button never sees itself.
 *
 * <p>Idle it samples every {@link #IDLE_MS}. After a touch, and for as long as the button is dimmed or cut off, it
 * samples every frame, so menus that open or close move over the button frame by frame. Every failure leaves the
 * last result in place; never throws.
 */
final class ScreenSampler {
    interface Listener {
        /** The button's look changed; {@code cover} is never null. */
        void onCover(ScreenShade.Cover cover);
    }

    private static final long IDLE_MS = 300;
    /** Frame-by-frame sampling lasts this long after a touch (a menu opens on release, then animates). */
    private static final long FAST_AFTER_TOUCH_MS = 1500;
    /** Every n-th idle tick samples a row through the board instead. */
    private static final int BOARD_EVERY = 5;
    private static final float[] BOARD_ROWS = {0.42f, 0.5f, 0.58f};
    /** The scrim reference: the app bar, this far below the status bar, in the middle of the button's right margin. */
    private static final int APP_BAR_Y_DP = 10;
    private static final float APP_BAR_X_GAP_DP = FabPlacement.FAB_MARGIN_RIGHT_DP / 2f;
    /** The rack check: a pixel row this far below the button runs through the middle of the rack tiles. */
    private static final int RACK_BELOW_DP = 40;
    /** Columns under the button are classified every this many pixels. */
    private static final int COLUMN_STEP = 2;

    private final Activity activity;
    private final View fab;
    private final float density;
    private final Listener listener;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Runnable idleTick = this::idleTick;
    private final Choreographer.FrameCallback frame = t -> frameTick();

    private WeakReference<SurfaceView> surface = new WeakReference<>(null);
    private boolean active;
    private boolean stopped;
    private boolean inFlight;
    private boolean frameScheduled;
    private long fastUntil;
    private int ticks;
    private int base = ScreenShade.PAGE_LIGHT;
    private boolean appDark;
    private int contentTop;
    private final ScreenShade shade = new ScreenShade();
    private ScreenShade.Cover cover;
    private Boolean boardDark;
    private Bitmap area;
    private Bitmap bar;
    /** Pending results of the two copies of one sample (app bar pixel, area under the button). */
    private int pending;
    private double pendingScrim;
    private int pendingBar;
    private int[] pendingRack;
    private Bitmap rack;
    private int[] pendingArea;

    ScreenSampler(Activity a, View fab, float density, Listener l) {
        this.activity = a;
        this.fab = fab;
        this.density = density;
        this.listener = l;
    }

    /** The board colours last seen, or the app theme when no board was classified yet. */
    boolean boardDark(boolean appDark) {
        Boolean b = boardDark;
        return b == null ? appDark : b.booleanValue();
    }

    /** The page background behind the button for the app theme. */
    void setAppDark(boolean dark) {
        if (dark != appDark) shade.resetScrim();
        appDark = dark;
        base = dark ? ScreenShade.PAGE_DARK : ScreenShade.PAGE_LIGHT;
    }

    /** Window y where the app draws below the status bar (the top of Wordfeud's app bar). */
    void setContentTop(int y) {
        contentTop = y;
    }

    /** Another game: forget the app bar baseline. */
    void resetScrim() {
        shade.resetScrim();
    }

    void setActive(boolean on) {
        if (on == active || stopped) return;
        active = on;
        main.removeCallbacks(idleTick);
        if (on) {
            main.postDelayed(idleTick, IDLE_MS);
        } else {
            setCover(null);
        }
    }

    /** A touch on the screen: sample frame by frame for a while. */
    void onTouch() {
        if (!active || stopped) return;
        fastUntil = SystemClock.uptimeMillis() + FAST_AFTER_TOUCH_MS;
        scheduleFrame();
    }

    void stop() {
        stopped = true;
        active = false;
        main.removeCallbacks(idleTick);
        if (frameScheduled) Choreographer.getInstance().removeFrameCallback(frame);
        frameScheduled = false;
    }

    private boolean fast() {
        ScreenShade.Cover c = cover;
        return SystemClock.uptimeMillis() < fastUntil || (c != null && !c.elsewhere && !c.untouched(fab.getHeight()));
    }

    private void scheduleFrame() {
        if (frameScheduled || !active || stopped) return;
        frameScheduled = true;
        Choreographer.getInstance().postFrameCallback(frame);
    }

    private void frameTick() {
        frameScheduled = false;
        if (!active || stopped || !fast()) return;
        scheduleFrame();
        if (!inFlight) safely(this::sampleColumn);
    }

    private void idleTick() {
        if (!active || stopped) return;
        main.postDelayed(idleTick, IDLE_MS);
        if (fast()) {
            scheduleFrame();
            return;
        }
        if (inFlight) return;
        ticks++;
        if (ticks % BOARD_EVERY == 0) safely(() -> sampleBoard(BOARD_ROWS[(ticks / BOARD_EVERY) % BOARD_ROWS.length]));
        else safely(this::sampleColumn);
    }

    private void safely(Runnable r) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return;
        try {
            r.run();
        } catch (Throwable ignored) {
            inFlight = false;
        }
    }

    private void sampleColumn() {
        int w = fab.getWidth();
        int h = fab.getHeight();
        if (w <= 0 || h <= 0 || fab.getVisibility() != View.VISIBLE) return;
        int[] loc = new int[2];
        fab.getLocationInWindow(loc);
        int bx = loc[0] + w + Math.round(APP_BAR_X_GAP_DP * density);
        int by = contentTop + Math.round(APP_BAR_Y_DP * density);
        if (by >= loc[1]) return;
        if (bar == null) bar = Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);
        View root = activity.getWindow().getDecorView();
        int sw = root.getWidth();
        if (sw <= 0) return;
        int rn = Math.max(14, sw / 4);
        if (rack == null || rack.getWidth() != rn) rack = Bitmap.createBitmap(rn, 1, Bitmap.Config.ARGB_8888);
        final Bitmap rackBmp = rack;
        int ry = loc[1] + h + Math.round(RACK_BELOW_DP * density);
        Rect rackRect = new Rect(0, ry, sw, ry + 1);
        if (area == null || area.getWidth() != w || area.getHeight() != h) {
            area = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
        }
        final Bitmap barBmp = bar;
        final Bitmap areaBmp = area;
        // The button itself is not in Wordfeud's surface, so this is what Wordfeud draws under it.
        Rect under = new Rect(loc[0], loc[1], loc[0] + w, loc[1] + h);
        Rect barRect = new Rect(bx, by, bx + 1, by + 1);
        pending = 3;
        pendingArea = null;
        pendingRack = null;
        if (!copy(barRect, barBmp, () -> {
            pendingBar = barBmp.getPixel(0, 0) & 0xFFFFFF;
            pendingScrim = shade.scrim(pendingBar);
            finishSample(w, h);
        }) || !copy(rackRect, rackBmp, () -> {
            int[] row = new int[rn];
            rackBmp.getPixels(row, 0, rn, 0, 0, rn, 1);
            pendingRack = row;
            finishSample(w, h);
        }) || !copy(under, areaBmp, () -> {
            int[] px = new int[w * h];
            areaBmp.getPixels(px, 0, w, 0, 0, w, h);
            pendingArea = px;
            finishSample(w, h);
        })) {
            pending = 0;
        }
    }

    private void finishSample(int w, int h) {
        if (--pending > 0) return;
        inFlight = false;
        ScreenShade.Cover c = ScreenShade.analyseArea(pendingArea, w, h, base, pendingScrim, COLUMN_STEP,
                pendingRack);
        pendingRack = null;
        pendingArea = null;
        if (c != null) setCover(c);
    }

    private void setCover(ScreenShade.Cover c) {
        ScreenShade.Cover old = cover;
        cover = c;
        ScreenShade.Cover shown = c != null ? c : new ScreenShade.Cover(Integer.MAX_VALUE, 1f);
        if (old != null && c != null && old.sameLook(c)) {
            return;
        }
        listener.onCover(shown);
        if (c != null && !c.elsewhere && !c.untouched(fab.getHeight())) scheduleFrame();
    }

    private void sampleBoard(float row) {
        View root = activity.getWindow().getDecorView();
        int w = root.getWidth();
        int h = root.getHeight();
        ScreenShade.Cover c = cover;
        if (w <= 0 || h <= 0 || (c != null && !c.untouched(fab.getHeight()))) return;
        int y = Math.round(h * row);
        int n = Math.max(15, w / 3);
        final Bitmap bmp = Bitmap.createBitmap(n, 1, Bitmap.Config.ARGB_8888);
        copy(new Rect(0, y, w, y + 1), bmp, () -> {
            inFlight = false;
            int[] px = new int[n];
            bmp.getPixels(px, 0, n, 0, 0, n, 1);
            for (int i = 0; i < n; i++) px[i] &= 0xFFFFFF;
            Boolean d = ScreenShade.boardDark(px);
            if (d != null) boardDark = d;
            bmp.recycle();
        });
    }

    /**
     * Copies {@code windowRect} (window coordinates) into {@code dest}; {@code done} runs on success only. Returns
     * false when nothing was requested. A failed copy ends the sample ({@code inFlight} cleared).
     */
    private boolean copy(Rect windowRect, Bitmap dest, Runnable done) {
        SurfaceView sv = findSurface();
        PixelCopy.OnPixelCopyFinishedListener l = result -> {
            if (result != PixelCopy.SUCCESS || !active || stopped) {
                inFlight = false;
                pending = 0;
                return;
            }
            try {
                done.run();
            } catch (Throwable ignored) {
                inFlight = false;
                pending = 0;
            }
        };
        if (sv != null) {
            int[] loc = new int[2];
            sv.getLocationInWindow(loc);
            Rect r = new Rect(windowRect);
            r.offset(-loc[0], -loc[1]);
            if (r.left < 0 || r.top < 0 || r.right > sv.getWidth() || r.bottom > sv.getHeight() || r.isEmpty()) {
                return false;
            }
            inFlight = true;
            PixelCopy.request(sv, r, dest, l, main);
        } else {
            Window w = activity.getWindow();
            inFlight = true;
            PixelCopy.request(w, windowRect, dest, l, main);
        }
        return true;
    }

    /** Flutter's FlutterSurfaceView (the largest visible SurfaceView), or null when Flutter draws into the window. */
    private SurfaceView findSurface() {
        SurfaceView cached = surface.get();
        if (cached != null && cached.isAttachedToWindow() && cached.getHolder().getSurface().isValid()) return cached;
        SurfaceView best = largest(activity.getWindow().getDecorView(), null);
        surface = new WeakReference<>(best);
        return best;
    }

    private static SurfaceView largest(View v, SurfaceView best) {
        if (v.getVisibility() != View.VISIBLE) return best;
        if (v instanceof SurfaceView && ((SurfaceView) v).getHolder().getSurface().isValid()) {
            long area = (long) v.getWidth() * v.getHeight();
            if (best == null || area > (long) best.getWidth() * best.getHeight()) best = (SurfaceView) v;
        }
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) best = largest(g.getChildAt(i), best);
        }
        return best;
    }
}
