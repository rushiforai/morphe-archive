package app.tikkamasalla.stremio.introskip;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;

/**
 * Coloured skip-segment marks on the player's progress bar (Stremio Enhanced idea 4).
 * Intro and recap share one colour, credits and previews have their own. Only segments that would
 * be offered under the current settings are drawn, never on movies. The bar is the stock leanback
 * SeekBar (TV 1.6.12): the marks live in that view's ViewOverlay, so they follow its bounds, alpha
 * and visibility, i.e. they show exactly while Stremio's controls show. Compose builds have no bar
 * view: the search finds nothing and no marks are drawn. Pure helpers first (unit tested on a PC),
 * Android code below. Main thread only, every Android call fail-soft.
 */
final class SeekMarks {
    static final int COLOR_INTRO = 0xE6FFC107;
    static final int COLOR_CREDITS = 0xE62196F3;
    static final int COLOR_PREVIEW = 0xE64CAF50;

    private SeekMarks() {
    }

    static final class Mark {
        final double startFrac;
        final double endFrac;
        final int color;
        final String label;

        Mark(double startFrac, double endFrac, int color, String label) {
            this.startFrac = startFrac;
            this.endFrac = endFrac;
            this.color = color;
            this.label = label;
        }
    }

    /** Pure. Marks for the segments that would be OFFERED under the settings. */
    static Mark[] build(double[] starts, double[] ends, String[] labels, int n, double durationSec,
                        boolean enabled, boolean movie, boolean recaps, boolean creditsOff, boolean previews) {
        if (!enabled || movie || !(durationSec > 0) || Double.isInfinite(durationSec)
                || starts == null || ends == null || labels == null) {
            return new Mark[0];
        }
        int count = Math.max(0, Math.min(n, Math.min(starts.length, Math.min(ends.length, labels.length))));
        Mark[] temp = new Mark[count];
        int valid = 0;
        for (int i = 0; i < count; i++) {
            double s = starts[i];
            double e = ends[i];
            String l = labels[i];
            if (l == null || Double.isNaN(s) || Double.isNaN(e) || Double.isInfinite(s) || Double.isInfinite(e)) continue;
            if (e <= s || s >= durationSec) continue;
            if ("recap".equals(l) && !recaps) continue;
            if ("credits".equals(l) && creditsOff) continue;
            if ("preview".equals(l) && !previews) continue;
            int color;
            if ("OP".equals(l) || "recap".equals(l)) color = COLOR_INTRO;
            else if ("credits".equals(l)) color = COLOR_CREDITS;
            else if ("preview".equals(l)) color = COLOR_PREVIEW;
            else continue;
            double sFrac = Math.max(0.0, Math.min(1.0, s / durationSec));
            double eFrac = Math.max(0.0, Math.min(1.0, e / durationSec));
            if (eFrac <= sFrac) continue;
            temp[valid++] = new Mark(sFrac, eFrac, color, l);
        }
        Mark[] result = new Mark[valid];
        System.arraycopy(temp, 0, result, 0, valid);
        return result;
    }

    /** Pure. Pixel span {x0,x1} of a mark on a track that starts at `left` px and is `trackW` px long; x1-x0 is at least minPx. */
    static float[] span(Mark m, float left, float trackW, float minPx) {
        float[] out = new float[2];
        spanInto(m, left, trackW, minPx, out);
        return out;
    }

    /** Pure, allocation free variant of span() (used while drawing). */
    static void spanInto(Mark m, float left, float trackW, float minPx, float[] out) {
        float x0 = left + (float) (m.startFrac * trackW);
        float x1 = left + (float) (m.endFrac * trackW);
        if (x1 - x0 < minPx) {
            float center = (x0 + x1) / 2.0f;
            x0 = center - minPx / 2.0f;
            x1 = center + minPx / 2.0f;
        }
        float right = left + trackW;
        if (x0 < left) {
            x0 = left;
            x1 = Math.min(left + minPx, right);
        } else if (x1 > right) {
            x1 = right;
            x0 = Math.max(right - minPx, left);
        }
        out[0] = x0;
        out[1] = x1;
    }

    /** Pure. Cheap content hash of the inputs of build(): the caller rebuilds only when it changes. */
    static long signature(double[] starts, double[] ends, String[] labels, int n, double durationSec,
                          boolean enabled, boolean movie, boolean recaps, boolean creditsOff, boolean previews) {
        long h = 17L;
        h = h * 31L + (enabled ? 1 : 0);
        h = h * 31L + (movie ? 1 : 0);
        h = h * 31L + (recaps ? 1 : 0);
        h = h * 31L + (creditsOff ? 1 : 0);
        h = h * 31L + (previews ? 1 : 0);
        h = h * 31L + Math.round(durationSec);
        h = h * 31L + n;
        if (starts != null && ends != null && labels != null) {
            int count = Math.max(0, Math.min(n, Math.min(starts.length, Math.min(ends.length, labels.length))));
            for (int i = 0; i < count; i++) {
                h = h * 31L + Math.round(starts[i] * 10.0);
                h = h * 31L + Math.round(ends[i] * 10.0);
                h = h * 31L + (labels[i] != null ? labels[i].hashCode() : 0);
            }
        }
        return h;
    }

    /** Pure. The "Show skip marks" switch: off means no marks at all. */
    static Mark[] gate(Mark[] marks, boolean switchOn) {
        return switchOn ? marks : null;
    }

    /** Reads the "Show skip marks" switch (default on); on when the context is unavailable. */
    private static boolean switchOn(View root) {
        try {
            return root == null || IntroSkipPrefs.isSeekMarksEnabled(root.getContext());
        } catch (Throwable ignored) {
            return true;
        }
    }

    /** Owns the overlay on ONE found bar view. Main thread only. */
    static final class Controller {
        private View bar;
        private MarkDrawable drawable;
        private long lastSearchMs;
        private int missStreak;
        private Mark[] shown;

        /**
         * Finds the bar under root (cached, re-searched at most every 2 s, 20 s after repeated
         * misses), installs/updates the overlay, or removes it when marks is null/empty or the "Show skip
         * marks" switch is off (read on every call, so toggling it takes effect live). Returns a
         * short note only when its state changed in a way worth one log line, else null.
         */
        String update(View root, Mark[] allMarks, long nowMs) {
            try {
                Mark[] marks = gate(allMarks, switchOn(root));
                if (marks == null || marks.length == 0) {
                    boolean had = drawable != null;
                    clear();
                    return had ? "marks cleared" : null;
                }
                if (bar != null && Build.VERSION.SDK_INT >= 19 && !bar.isAttachedToWindow()) clear();
                if (bar == null) {
                    long backoff = missStreak > 3 ? 20000L : 2000L;
                    if (lastSearchMs != 0 && nowMs - lastSearchMs < backoff) return null;
                    lastSearchMs = nowMs;
                    View found = findBar(root, new int[1]);
                    if (found == null) {
                        missStreak++;
                        return missStreak == 1 ? "no seek bar in view tree (Compose?)" : null;
                    }
                    missStreak = 0;
                    bar = found;
                    drawable = new MarkDrawable(found);
                    found.getOverlay().add(drawable);
                    found.addOnLayoutChangeListener(drawable);
                    drawable.updateBounds();
                    drawable.setMarks(marks);
                    shown = marks;
                    return "bar found: " + found.getClass().getName();
                }
                if (shown != marks && !sameMarks(shown, marks)) {
                    drawable.setMarks(marks);
                    shown = marks;
                }
            } catch (Throwable ignored) {
                clear();
            }
            return null;
        }

        void clear() {
            try {
                if (bar != null && drawable != null) {
                    bar.getOverlay().remove(drawable);
                    bar.removeOnLayoutChangeListener(drawable);
                    bar.invalidate();
                }
            } catch (Throwable ignored) {
            }
            bar = null;
            drawable = null;
            shown = null;
            missStreak = 0;
        }

        private static View findBar(View v, int[] visited) {
            if (v == null || visited[0] > 2500) return null;
            visited[0]++;
            try {
                if (v.getId() != View.NO_ID && "playback_progress".equals(v.getResources().getResourceEntryName(v.getId()))) {
                    return v;
                }
            } catch (Throwable ignored) {
            }
            for (Class<?> c = v.getClass(); c != null; c = c.getSuperclass()) {
                if ("SeekBar".equals(c.getSimpleName()) && c.getName().startsWith("androidx.leanback")) return v;
            }
            if (v instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) v;
                for (int i = 0; i < group.getChildCount(); i++) {
                    View result = findBar(group.getChildAt(i), visited);
                    if (result != null) return result;
                }
            }
            return null;
        }

        private static boolean sameMarks(Mark[] a, Mark[] b) {
            if (a == b) return true;
            if (a == null || b == null || a.length != b.length) return false;
            for (int i = 0; i < a.length; i++) {
                if (a[i].startFrac != b[i].startFrac || a[i].endFrac != b[i].endFrac || a[i].color != b[i].color) return false;
            }
            return true;
        }
    }

    /** Drawn inside the bar's own canvas, on top of its progress; track maths mirror leanback SeekBar.calculate(). */
    private static final class MarkDrawable extends Drawable implements View.OnLayoutChangeListener {
        private final View bar;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final float[] span = new float[2];
        private Mark[] marks;
        private float barH;
        private float activeR;
        private float density;

        MarkDrawable(View bar) {
            this.bar = bar;
            paint.setStyle(Paint.Style.FILL);
            Context ctx = bar.getContext();
            Resources res = ctx.getResources();
            density = res.getDisplayMetrics().density;
            barH = dimen(res, ctx, "lb_playback_transport_progressbar_bar_height", 4f * density);
            activeR = dimen(res, ctx, "lb_playback_transport_progressbar_active_radius", 6f * density);
        }

        private static float dimen(Resources res, Context ctx, String name, float fallback) {
            try {
                int id = res.getIdentifier(name, "dimen", ctx.getPackageName());
                return id != 0 ? res.getDimension(id) : fallback;
            } catch (Throwable ignored) {
                return fallback;
            }
        }

        void setMarks(Mark[] marks) {
            this.marks = marks;
            bar.invalidate();
        }

        void updateBounds() {
            setBounds(0, 0, bar.getWidth(), bar.getHeight());
        }

        @Override
        public void onLayoutChange(View v, int left, int top, int right, int bottom,
                                   int oldLeft, int oldTop, int oldRight, int oldBottom) {
            updateBounds();
        }

        @Override
        public void draw(Canvas canvas) {
            try {
                Mark[] list = marks;
                if (list == null || list.length == 0) return;
                float r = bar.isFocused() ? activeR : barH / 2f;
                float left = r; // the knob (current time) sits at r + p*trackW in leanback SeekBar.calculate()
                float trackW = bar.getWidth() - 2f * r;
                if (trackW <= 0) return;
                float half = 4f * density;
                float cy = bar.getHeight() / 2f;
                for (Mark m : list) {
                    spanInto(m, left, trackW, 3f * density, span);
                    rect.set(span[0], cy - half, span[1], cy + half);
                    paint.setColor(m.color);
                    canvas.drawRect(rect, paint);
                }
            } catch (Throwable ignored) {
            }
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
