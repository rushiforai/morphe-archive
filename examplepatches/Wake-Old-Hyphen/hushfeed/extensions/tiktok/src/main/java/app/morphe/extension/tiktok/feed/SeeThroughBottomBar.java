/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.feed;

import android.animation.ValueAnimator;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.os.Build;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

import app.morphe.extension.tiktok.settings.preference.SettingsUi;

import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * The state behind See-through bottom bar (#145). TikTok's bottom tab bar paints its own
 * background, and the room under the picture is kept for it by a spacer in each cell or, on the
 * S22, by a strip the bar's height under the main feed's pager, so the picture stops above the
 * bar. VideoOverlayHider collapses those through its ordinary hide path, lifts each cell's widget
 * layer by what the pager gained, and hands this class the bar: it swaps the bar's background for
 * a clear one and puts the original back, and it judges whether the collapse still pushed the
 * caption or the buttons under the bar.
 */
final class SeeThroughBottomBar {
    /** How far an overlay may reach into the bar, in pixels, before it counts as under it. */
    private static final float SLACK_PX = 2f;

    /** The clear stand-in, told apart from anything TikTok sets by its class. */
    private static final class ClearBackground extends ColorDrawable {
        ClearBackground() {
            super(Color.TRANSPARENT);
        }
    }

    /** The floating pill's fill: dark and see-through, so the video shows behind the tabs. */
    static final int PILL_COLOR = 0x99000000;
    /** The pill's hairline, light enough to find the pill's edge over a dark video. */
    static final int PILL_EDGE_COLOR = 0x40FFFFFF;
    /** How far the pill stays in from the bar's sides and bottom, and from its top, in dp. */
    static final int PILL_SIDE_DP = 12, PILL_BOTTOM_DP = 6, PILL_TOP_DP = 2;

    /**
     * Floating bottom bar (#124): a rounded see-through pill drawn inside the bar, in from its
     * sides and bottom, so the tabs float over the video. Only the background changes: the bar
     * keeps its place and size, so every tab is where TikTok put it and takes its taps.
     */
    static class FloatingBackground extends InsetDrawable {
        FloatingBackground(float density) {
            this(pill(density), density);
        }

        FloatingBackground(Drawable pill, float density) {
            super(pill, Math.round(PILL_SIDE_DP * density), Math.round(PILL_TOP_DP * density),
                    Math.round(PILL_SIDE_DP * density), Math.round(PILL_BOTTOM_DP * density));
        }

        /**
         * No padding: a background's padding becomes the view's, which would squeeze the tabs and
         * outlive the pill when TikTok's background comes back. The insets only place the drawing.
         */
        @Override
        public boolean getPadding(Rect padding) {
            padding.set(0, 0, 0, 0);
            return false;
        }

        private static GradientDrawable pill(float density) {
            GradientDrawable pill = new GradientDrawable();
            pill.setShape(GradientDrawable.RECTANGLE);
            pill.setCornerRadius(SettingsUi.RADIUS_ROUND_ENDS * density);
            pill.setColor(PILL_COLOR);
            pill.setStroke(Math.max(1, Math.round(density)), PILL_EDGE_COLOR);
            return pill;
        }
    }

    /** The glass pill's dark tint, light enough that the video shows through, dark enough for white icons. */
    static final int GLASS_TINT = 0x4D000000;
    /** The white frost over the tint, brighter at the top. */
    static final int GLASS_FROST_TOP = 0x33FFFFFF, GLASS_FROST_BOTTOM = 0x0DFFFFFF;
    /** The sheen over the upper half, fading out by the middle. */
    static final int GLASS_SHEEN = 0x40FFFFFF;
    /** The rim: bright along the top edge where the light catches it, faint on the sides, a little back at the bottom. */
    static final int GLASS_RIM_TOP = 0x99FFFFFF, GLASS_RIM_SIDE = 0x26FFFFFF, GLASS_RIM_BOTTOM = 0x4DFFFFFF;

    /**
     * Liquid glass look (#218): the floating pill drawn as glass, in the same place. A view can
     * only blur what it draws itself, never the video under it, so the glass is drawn rather than
     * blurred: a lighter tint than the plain pill, a frost and a sheen that are brightest at the
     * top, and a rim that catches the light along the top edge.
     */
    static class GlassBackground extends FloatingBackground {
        GlassBackground(float density) {
            super(new GlassPill(density), density);
        }
    }

    static final class GlassPill extends Drawable {
        private final float cornerRadius;
        private final float rim;
        private final Paint tint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint frost = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint sheen = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint edge = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF box = new RectF();
        private int alpha = 255;

        GlassPill(float density) {
            cornerRadius = SettingsUi.RADIUS_ROUND_ENDS * density;
            rim = Math.max(1f, density);
            tint.setColor(GLASS_TINT);
            edge.setStyle(Paint.Style.STROKE);
            edge.setStrokeWidth(rim);
        }

        @Override
        protected void onBoundsChange(Rect bounds) {
            float top = bounds.top, bottom = bounds.bottom;
            frost.setShader(new LinearGradient(0, top, 0, bottom,
                    GLASS_FROST_TOP, GLASS_FROST_BOTTOM, Shader.TileMode.CLAMP));
            sheen.setShader(new LinearGradient(0, top, 0, (top + bottom) / 2f,
                    GLASS_SHEEN, GLASS_SHEEN & 0x00FFFFFF, Shader.TileMode.CLAMP));
            edge.setShader(new LinearGradient(0, top, 0, bottom,
                    new int[]{GLASS_RIM_TOP, GLASS_RIM_SIDE, GLASS_RIM_BOTTOM}, new float[]{0f, 0.5f, 1f},
                    Shader.TileMode.CLAMP));
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            if (bounds.isEmpty()) return;
            box.set(bounds);
            float radius = Math.min(cornerRadius, box.height() / 2f);
            canvas.drawRoundRect(box, radius, radius, tint);
            canvas.drawRoundRect(box, radius, radius, frost);
            // The sheen sits inside the rim.
            float in = rim * 2f;
            box.inset(in, in);
            canvas.drawRoundRect(box, Math.max(0f, radius - in), Math.max(0f, radius - in), sheen);
            box.set(bounds);
            box.inset(rim / 2f, rim / 2f);
            canvas.drawRoundRect(box, Math.max(0f, radius - rim / 2f), Math.max(0f, radius - rim / 2f), edge);
        }

        @Override
        public void setAlpha(int alpha) {
            if (this.alpha == alpha) return;
            this.alpha = alpha;
            // A shader's colors are scaled by the paint's alpha; the tint's own alpha is scaled here.
            tint.setColor((GLASS_TINT & 0x00FFFFFF) | ((Color.alpha(GLASS_TINT) * alpha / 255) << 24));
            frost.setAlpha(alpha);
            sheen.setAlpha(alpha);
            edge.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public int getAlpha() {
            return alpha;
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
            tint.setColorFilter(filter);
            frost.setColorFilter(filter);
            sheen.setColorFilter(filter);
            edge.setColorFilter(filter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** The lens's frost, brighter than the glass pill's, so the tab you're on reads as raised glass. */
    static final int LENS_FILL = 0x2EFFFFFF;
    /** The lens's rim: bright along its top where the light catches it, faint along its bottom. */
    static final int LENS_RIM_TOP = 0x8CFFFFFF, LENS_RIM_BOTTOM = 0x1AFFFFFF;
    /** How far the lens stays in from the pill's top and bottom and from the tab's sides, in dp. */
    static final int LENS_INSET_DP = 4;
    /** How long the lens takes to slide to a newly picked tab. */
    static final long LENS_SLIDE_MS = 280;
    /** How long a bar remembers where its last lens was, for the lens that replaces it. */
    static final long LENS_MEMORY_MS = 1000;
    /** A gap between two frames of a slide longer than this is the main thread stalling. */
    static final long LENS_STALL_MS = 50;
    /** How far a slide moves on over a stall: one frame at 60 Hz. */
    static final long LENS_FRAME_MS = 16;

    /**
     * Glass lens (#231): the glass pill with a smaller piece of glass behind the tab you're on,
     * sliding to the next tab you pick. TikTok marks the current tab with View.isSelected() and
     * nothing else (S22, 47.4.3: no indicator view, no alpha), so the lens follows the bar's first
     * selected child. A bar with no selected tab shows the glass pill alone. The lens is part of
     * the bar's background, so it sits under the tabs and never takes a tap. A selection change
     * redraws no background by itself, so a pre-draw listener on the bar's window asks for one
     * when the selected tab moved, and drops itself once the bar has another background.
     * Picking a tab can also hand the bar a new lens (the overlay pass swaps the background when
     * the bar's look changes), and a new lens has no slide of its own to continue, so each bar
     * remembers where its last lens was drawn and a new one slides on from there when that was
     * moments ago (S22, 2026-10-21: the lens jumped between tabs with animations on).
     */
    static final class GlassLensBackground extends GlassBackground {
        /** Where each bar's lens was last drawn, kept only as long as the bar is. */
        private static final Map<View, LensSpot> LAST_SPOT = new WeakHashMap<>();
        private final float inset;
        private final Paint lensFill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint lensRim = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF lens = new RectF();
        private final RectF shown = new RectF();
        private final RectF span = new RectF();
        private final ViewTreeObserver.OnPreDrawListener follow = this::followSelection;
        private ViewTreeObserver watched;
        /** The bar's remembered spot this lens last wrote, null before its first lens. */
        private LensSpot written;
        /** The selected tab's span the last draw used, NaN before a draw that found one. */
        private float drawnLeft = Float.NaN, drawnRight = Float.NaN;
        /** Where the slide runs from and to, and when it began. */
        private float fromLeft, fromRight, toLeft, toRight;
        private long slideStart;
        /** When this lens last drew itself, 0 before its first lens. */
        private long lastDraw;

        GlassLensBackground(float density) {
            super(density);
            inset = LENS_INSET_DP * density;
            lensRim.setStyle(Paint.Style.STROKE);
            lensRim.setStrokeWidth(Math.max(1f, density));
        }

        @Override
        protected void onBoundsChange(Rect bounds) {
            super.onBoundsChange(bounds);
            Rect pill = getDrawable().getBounds();
            lensRim.setShader(new LinearGradient(0, pill.top + inset, 0, pill.bottom - inset,
                    LENS_RIM_TOP, LENS_RIM_BOTTOM, Shader.TileMode.CLAMP));
        }

        @Override
        public void draw(Canvas canvas) {
            super.draw(canvas);
            ViewGroup bar = bar();
            if (bar == null) return;
            watch(bar);
            Rect pill = getDrawable().getBounds();
            if (pill.isEmpty() || !selectedSpan(bar, span)) {
                drawnLeft = drawnRight = Float.NaN;
                return;
            }
            float left = Math.max(pill.left + inset, span.left + inset);
            float right = Math.min(pill.right - inset, span.right - inset);
            if (right - left < inset * 2f) {
                drawnLeft = drawnRight = Float.NaN;
                return;
            }
            long now = SystemClock.uptimeMillis();
            holdOverStall(now);
            if (Float.isNaN(drawnLeft)) {
                LensSpot last = LAST_SPOT.get(bar);
                toLeft = left;
                toRight = right;
                if (last != null && now - last.at < LENS_MEMORY_MS
                        && (last.left != left || last.right != right)) {
                    // A lens this bar showed moments ago: carry on from where that one was.
                    fromLeft = last.left;
                    fromRight = last.right;
                    slideStart = now;
                } else {
                    // The first tab found, or the first in a while: no slide in from nowhere.
                    fromLeft = left;
                    fromRight = right;
                    slideStart = now - LENS_SLIDE_MS;
                }
            } else if (left != toLeft || right != toRight) {
                // From wherever the lens is now, so a tap mid-slide turns it around smoothly.
                float done = progress(now);
                fromLeft = lerp(fromLeft, toLeft, done);
                fromRight = lerp(fromRight, toRight, done);
                toLeft = left;
                toRight = right;
                slideStart = now;
            }
            drawnLeft = span.left;
            drawnRight = span.right;
            float done = progress(now);
            shown.set(lerp(fromLeft, toLeft, done), pill.top + inset, lerp(fromRight, toRight, done), pill.bottom - inset);
            LensSpot spot = LAST_SPOT.get(bar);
            if (spot == null) LAST_SPOT.put(bar, spot = new LensSpot());
            written = spot;
            spot.left = shown.left;
            spot.right = shown.right;
            spot.at = now;
            int alpha = getDrawable().getAlpha();
            lensFill.setColor((LENS_FILL & 0x00FFFFFF) | ((Color.alpha(LENS_FILL) * alpha / 255) << 24));
            lensRim.setAlpha(alpha);
            float radius = shown.height() / 2f;
            canvas.drawRoundRect(shown, radius, radius, lensFill);
            float half = lensRim.getStrokeWidth() / 2f;
            lens.set(shown);
            lens.inset(half, half);
            canvas.drawRoundRect(lens, radius - half, radius - half, lensRim);
            if (done < 1f) invalidateSelf();
        }

        /** Where the last draw put the lens; empty when that draw found no tab to put it behind. */
        RectF lensBounds() {
            return Float.isNaN(drawnLeft) ? new RectF() : new RectF(shown);
        }

        /** True when the selected tab isn't the one the last draw put the lens behind. */
        boolean selectionMoved(ViewGroup bar) {
            if (!selectedSpan(bar, span)) return !Float.isNaN(drawnLeft);
            return span.left != drawnLeft || span.right != drawnRight;
        }

        private boolean followSelection() {
            // A still screen draws nothing, so a lens still showing is as current as this frame,
            // whatever its last draw's time. The lens that replaces it (the bar has already
            // dropped this one as its callback by then) or this lens after a frame with no tab
            // slides on from it (S22, 2026-10-23: a lens jumped after a second on one tab).
            if (written != null && !Float.isNaN(drawnLeft)) written.at = SystemClock.uptimeMillis();
            ViewGroup bar = bar();
            if (bar == null || bar.getBackground() != this) {
                // Off the bar, so off the screen. A listener the window kept anyway (unwatch can't
                // reach one merged in from a detached observer) then leaves the memory alone.
                drawnLeft = drawnRight = Float.NaN;
                unwatch();
                return true;
            }
            if (selectionMoved(bar)) invalidateSelf();
            return true;
        }

        private ViewGroup bar() {
            Callback callback = getCallback();
            return callback instanceof ViewGroup ? (ViewGroup) callback : null;
        }

        private void watch(View bar) {
            ViewTreeObserver observer = bar.getViewTreeObserver();
            if (observer == watched || !observer.isAlive()) return;
            unwatch();
            // Attaching the bar merges its detached observer's listeners into the window's, so
            // the listener may already be there: never hold it twice.
            observer.removeOnPreDrawListener(follow);
            observer.addOnPreDrawListener(follow);
            watched = observer;
        }

        private void unwatch() {
            if (watched != null && watched.isAlive()) watched.removeOnPreDrawListener(follow);
            watched = null;
        }

        /**
         * A slide timed by the clock alone finishes unseen when the main thread stalls, as it does
         * while TikTok builds a tab's page the first time it opens: the frame after the stall
         * showed the lens already behind the new tab (S22, 2026-10-23: about 270 ms with no frame
         * after the first tap from Home onto Inbox, #231). A slide that was running at the last
         * draw carries on a frame past where that draw showed it. A gap past the bar's memory
         * means the bar was out of sight, and the slide is left to finish.
         */
        private void holdOverStall(long now) {
            long gap = now - lastDraw;
            if (lastDraw != 0 && gap > LENS_STALL_MS && gap < LENS_MEMORY_MS
                    && lastDraw - slideStart < LENS_SLIDE_MS) {
                slideStart += gap - LENS_FRAME_MS;
            }
            lastDraw = now;
        }

        private float progress(long now) {
            if (!animatorsEnabled()) return 1f;
            float t = Math.min(1f, Math.max(0f, (now - slideStart) / (float) LENS_SLIDE_MS));
            float rest = 1f - t;
            // Quick off the mark, easing into place.
            return 1f - rest * rest * rest;
        }

        private static float lerp(float from, float to, float done) {
            return from + (to - from) * done;
        }

        /** A lens's last drawn sides and the uptime it was drawn at. */
        private static final class LensSpot {
            float left, right;
            long at;
        }
    }

    /** False when the phone's animator duration scale is 0, so the lens jumps instead of sliding. */
    static boolean animatorsEnabled() {
        return Build.VERSION.SDK_INT < Build.VERSION_CODES.O || ValueAnimator.areAnimatorsEnabled();
    }

    /** The first shown, selected child's span in the bar's coordinates, or false when there's none. */
    static boolean selectedSpan(ViewGroup bar, RectF out) {
        for (int i = 0; i < bar.getChildCount(); i++) {
            View tab = bar.getChildAt(i);
            if (tab.getVisibility() != View.VISIBLE || !tab.isSelected() || tab.getWidth() == 0) continue;
            float left = tab.getLeft() + tab.getTranslationX() - bar.getScrollX();
            out.set(left, tab.getTop(), left + tab.getWidth(), tab.getBottom());
            return true;
        }
        return false;
    }

    /** What a bar's background is: TikTok's own, or one of the four this class draws. */
    private static final int THEIRS = 0, CLEAR = 1, FLOATING = 2, GLASS = 3, GLASS_LENS = 4;

    private static int kind(Drawable background) {
        if (background instanceof GlassLensBackground) return GLASS_LENS;
        if (background instanceof GlassBackground) return GLASS;
        if (background instanceof FloatingBackground) return FLOATING;
        if (background instanceof ClearBackground) return CLEAR;
        return THEIRS;
    }

    /** Bars whose background this class replaced, with the drawable each had. */
    private static final Map<View, Drawable> BACKGROUNDS = new WeakHashMap<>();

    /**
     * Overlays (the caption frame, the buttons' column) measured with the spacer in place: true
     * when one sat clear of the bar then. Only an overlay that was fine before the collapse can
     * be blamed for being under the bar after it.
     */
    private static final Map<View, Boolean> CLEAR_BEFORE = new WeakHashMap<>();

    /** Set once a collapse put an overlay under the bar; the spacer then stays as TikTok has it. */
    private static boolean collapseRefused;

    /** The overlay the refusal blamed and where it sat against the bar, for the debug log. */
    private static String blamed = "";

    private SeeThroughBottomBar() {
    }

    static String blamed() {
        return blamed;
    }

    /** Whether the spacer under the video may be collapsed. */
    static boolean collapseAllowed() {
        return !collapseRefused;
    }

    /** True while a bar's background is held, so the layout pass keeps running to put it back. */
    static boolean holdsBackground() {
        return !BACKGROUNDS.isEmpty();
    }

    /** Forgets the verdict and the measurements once the switch is off. */
    static void reset() {
        collapseRefused = false;
        CLEAR_BEFORE.clear();
    }

    /**
     * Swaps the bar's background for a clear one, or puts back the one this class took. A
     * background TikTok set since is never overwritten on the way back.
     */
    static void setBackgroundClear(View bar, boolean clear) {
        setBackgroundClear(bar, clear, false);
    }

    /**
     * The same, with {@code floating} drawing the floating pill (#124) in place of the clear
     * background. A bar with no background of its own is a layout this wasn't written for, and
     * keeps TikTok's look.
     */
    static void setBackgroundClear(View bar, boolean clear, boolean floating) {
        setBackgroundClear(bar, clear, floating, false);
    }

    /** The same, with {@code glass} drawing the floating pill as glass (#218). */
    static void setBackgroundClear(View bar, boolean clear, boolean floating, boolean glass) {
        setBackgroundClear(bar, clear, floating, glass, false);
    }

    /** The same, with {@code lens} adding the glass lens that follows the selected tab (#231). */
    static void setBackgroundClear(View bar, boolean clear, boolean floating, boolean glass, boolean lens) {
        if (bar == null) return;
        Drawable current = bar.getBackground();
        int kind = kind(current);
        if (clear) {
            if (current == null) return;
            int wanted = !floating ? CLEAR : !glass ? FLOATING : lens ? GLASS_LENS : GLASS;
            if (kind == wanted) return;
            if (kind == THEIRS) BACKGROUNDS.put(bar, current);
            float density = bar.getResources().getDisplayMetrics().density;
            bar.setBackground(wanted == GLASS_LENS ? new GlassLensBackground(density)
                    : wanted == GLASS ? new GlassBackground(density)
                    : wanted == FLOATING ? new FloatingBackground(density)
                    : new ClearBackground());
            return;
        }
        if (!BACKGROUNDS.containsKey(bar)) return;
        Drawable original = BACKGROUNDS.remove(bar);
        if (kind != THEIRS) bar.setBackground(original);
    }

    /**
     * Compares the overlays with the bar. With the spacer in place ({@code collapsed} false) it
     * notes which overlays sit clear of the bar; once the spacer is collapsed it reports true, and
     * remembers, when one that was clear has moved under it. Views not laid out, hidden, or
     * entirely above or below the bar (a neighbouring cell) are not judged.
     */
    static boolean judge(View bar, List<View> overlays, boolean collapsed) {
        if (bar == null || !bar.isShown() || bar.getHeight() == 0) return false;
        float barTop = topInWindow(bar);
        for (View overlay : overlays) {
            if (overlay == null || !overlay.isShown() || overlay.getHeight() == 0) continue;
            float top = topInWindow(overlay);
            boolean under = reachesUnder(top, top + overlay.getHeight(), barTop);
            if (!collapsed) {
                CLEAR_BEFORE.put(overlay, !under);
            } else if (under && Boolean.TRUE.equals(CLEAR_BEFORE.get(overlay))) {
                collapseRefused = true;
                blamed = "0x" + Integer.toHexString(overlay.getId()) + " at " + Math.round(top) + "-"
                        + Math.round(top + overlay.getHeight()) + ", bar top " + Math.round(barTop);
                return true;
            }
        }
        return false;
    }

    /** An overlay that starts above the bar's top edge and ends below it. */
    static boolean reachesUnder(float top, float bottom, float barTop) {
        return top < barTop && bottom > barTop + SLACK_PX;
    }

    private static float topInWindow(View view) {
        float top = view.getTop() + view.getTranslationY();
        android.view.ViewParent parent = view.getParent();
        while (parent instanceof View) {
            View group = (View) parent;
            top += group.getTop() - group.getScrollY() + group.getTranslationY();
            parent = group.getParent();
        }
        return top;
    }
}
