package app.sircoderin.extension.twilight;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.view.Display;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Records what Twilight's overlay view draws (tint colour, dim, window alpha) over time, so a
 * screenshot taken at time T can be matched with the tint that was on screen. Written on the UI
 * thread, read from a worker thread.
 */
@android.annotation.SuppressLint("NewApi")
final class TintRecorder {
    private static final int MAX_HISTORY = 256;

    /** One immutable state of the overlay, valid from {@link #time} until the next entry. */
    static final class Entry {
        final long time;
        final boolean shown;
        final int tint; // sRGB ARGB passed to drawColor
        final int dim; // 0..255 alpha of the black dim
        final float windowAlpha;
        final boolean textured;

        Entry(long time, boolean shown, int tint, int dim, float windowAlpha, boolean textured) {
            this.time = time;
            this.shown = shown;
            this.tint = tint;
            this.dim = dim;
            this.windowAlpha = windowAlpha;
            this.textured = textured;
        }

        boolean sameState(Entry o) {
            return shown == o.shown && tint == o.tint && dim == o.dim
                    && windowAlpha == o.windowAlpha && textured == o.textured;
        }

        double aEff() {
            if (!shown) return 0;
            return TintMath.effectiveAlpha(windowAlpha, Color.alpha(tint) / 255.0, dim / 255.0);
        }

        double premulFactor() {
            if (!shown) return 0;
            return TintMath.premulFactor(windowAlpha, Color.alpha(tint) / 255.0, dim / 255.0);
        }

        @Override
        public String toString() {
            return "tint=#" + Integer.toHexString(tint) + " dim=" + dim + " win=" + windowAlpha
                    + (textured ? " textured" : "") + (shown ? "" : " hidden");
        }
    }

    /** State accumulated during the current draw pass. */
    private static final class Pass {
        final View view;
        int tint;
        int dim;
        boolean textured;

        Pass(View view) {
            this.view = view;
        }
    }

    private static final Object LOCK = new Object();
    private static final List<Entry> HISTORY = new ArrayList<>();
    private static final Map<View, Boolean> WATCHED = new WeakHashMap<>();
    private static Pass current;

    private TintRecorder() {}

    static void beginFrame(View view) {
        synchronized (LOCK) {
            if (!isDefaultDisplay(view)) {
                current = null;
                return;
            }
            current = new Pass(view);
            if (WATCHED.put(view, Boolean.TRUE) == null) {
                view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                    @Override
                    public void onViewAttachedToWindow(View v) {}

                    @Override
                    public void onViewDetachedFromWindow(View v) {
                        pushHidden();
                    }
                });
            }
        }
    }

    static void onDrawColor(int color) {
        synchronized (LOCK) {
            Pass p = current;
            if (p == null) return;
            p.tint = color;
            p.dim = 0;
            p.textured = false;
            commit(p);
        }
    }

    static void onDrawRect(float l, float t, float r, float b, Paint paint) {
        synchronized (LOCK) {
            Pass p = current;
            if (p == null) return;
            boolean fullView = l <= 0 && t <= 0 && r >= p.view.getWidth() && b >= p.view.getHeight();
            int color = paint.getColor();
            if (fullView && (color & 0xFFFFFF) == 0 && paint.getShader() == null) {
                p.dim = Color.alpha(color);
            } else {
                p.textured = true;
            }
            commit(p);
        }
    }

    static void onOtherDraw() {
        synchronized (LOCK) {
            Pass p = current;
            if (p == null) return;
            p.textured = true;
            commit(p);
        }
    }

    /** Entry active at {@code from} plus every entry recorded in (from, to]. */
    static List<Entry> candidates(long from, long to) {
        List<Entry> out = new ArrayList<>();
        synchronized (LOCK) {
            Entry active = null;
            for (Entry e : HISTORY) {
                if (e.time <= from) {
                    active = e;
                } else if (e.time <= to) {
                    if (active != null) {
                        out.add(active);
                        active = null;
                    }
                    out.add(e);
                }
            }
            if (active != null) out.add(active);
        }
        return out;
    }

    private static void commit(Pass p) {
        Entry e = new Entry(System.currentTimeMillis(), true, p.tint, p.dim, windowAlpha(p.view), p.textured);
        push(e);
    }

    private static void pushHidden() {
        synchronized (LOCK) {
            push(new Entry(System.currentTimeMillis(), false, 0, 0, 0f, false));
        }
    }

    private static void push(Entry e) {
        if (!HISTORY.isEmpty() && HISTORY.get(HISTORY.size() - 1).sameState(e)) return;
        HISTORY.add(e);
        if (HISTORY.size() > MAX_HISTORY) HISTORY.remove(0);
    }

    private static float windowAlpha(View view) {
        try {
            View root = view.getRootView();
            ViewGroup.LayoutParams lp = root != null ? root.getLayoutParams() : view.getLayoutParams();
            if (lp instanceof WindowManager.LayoutParams) {
                return ((WindowManager.LayoutParams) lp).alpha;
            }
        } catch (Throwable ignored) {
        }
        return 1f;
    }

    private static boolean isDefaultDisplay(View view) {
        Display d = view.getDisplay();
        return d == null || d.getDisplayId() == Display.DEFAULT_DISPLAY;
    }

}
