/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at 837bac40e (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.settings;

import android.graphics.Color;
import android.graphics.ComposeShader;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.PorterDuff;
import android.graphics.Shader;
import android.text.Layout;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.animation.AnimationUtils;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Every HushThreads title in the logo's blues: the settings bar, its dialogs and the recovery
 * page. The colours drift along the words all the time the title is on screen, and
 * as it opens, and every {@link #PERIOD_MS} after, a white sheen sweeps over them. It moves
 * whatever Android's animation scale says (Matt, 2026-10-26: the S22 runs with animations off and
 * HushGram's title sat still there).
 */
public final class ShimmerTitle implements Runnable, View.OnAttachStateChangeListener, ViewTreeObserver.OnPreDrawListener {
    /** One sheen sweep and the wait after it. */
    static final long PERIOD_MS = 6000;
    /** How long a sheen sweep runs. */
    static final long SWEEP_MS = 1400;
    /** How long the colours take to drift one whole mirrored round. */
    static final long DRIFT_MS = 8000;
    /**
     * The least time between frames: the next frame after it, so about 60 a second on a 60 or
     * 120 Hz screen. A frame posted with no wait runs at once wherever time stands still, as in a
     * test's paused looper, which then never goes idle.
     */
    private static final long FRAME_MS = 10;
    /** How often a title that isn't showing checks whether it is again. */
    private static final long HIDDEN_CHECK_MS = 500;
    /** The contrast every stop keeps on the surface behind the title. */
    static final double CONTRAST = 7.0;
    /**
     * The HushThreads logo's colours: its blue, the lighter blue toward its edge, the pale blue
     * shading, the white thread and the dark blue at its rim. {@link #colorsOn} moves each one
     * toward white or black until it reads on the surface it's drawn over, keeping its hue.
     */
    static final int[] BRAND = {0xFF0050F0, 0xFF0078F5, 0xFFD6E6F5, 0xFFF3F5F7, 0xFF0034C4};
    private static final int[] SHEEN = {0x00FFFFFF, 0xB3FFFFFF, 0x00FFFFFF};
    /**
     * The titles wearing the gradient, so painting one twice doesn't run two loops. The loop is held
     * weakly too: it holds its title, and a value that holds its key keeps the entry, and with it
     * the title's dialog and screen, for good. The title's own listener list keeps the loop alive.
     */
    private static final Map<TextView, WeakReference<ShimmerTitle>> WORN = new WeakHashMap<>();

    private final TextView title;
    private final Matrix move = new Matrix();
    private final Matrix across = new Matrix();
    private int surface;
    private int[] colorStops;
    private LinearGradient colors;
    private LinearGradient sheen;
    private float shadedWidth = -1f;
    private float shadedHeight = -1f;
    /** When the first sweep started, so it plays as the title opens. */
    private long startedAt = -1L;
    private boolean running;
    /** Waiting for its window's next draw, with nothing scheduled while Threads is away. */
    @Nullable
    private ViewTreeObserver parkedOn;

    private ShimmerTitle(TextView title, int surface) {
        this.title = title;
        this.surface = surface;
        colorStops = colorsOn(surface);
    }

    /**
     * Puts [title] in the gradient, moving for as long as it's on screen, in stops that read on
     * the opaque [surface] behind it. Again only follows a new surface.
     */
    public static void wear(TextView title, int surface) {
        ShimmerTitle worn = wornBy(title);
        if (worn != null) {
            if (worn.surface != surface) {
                worn.surface = surface;
                worn.colorStops = colorsOn(surface);
                worn.colors = null;
            }
            return;
        }
        ShimmerTitle shimmer = new ShimmerTitle(title, surface);
        WORN.put(title, new WeakReference<>(shimmer));
        // The gradient replaces the colour, and a full-strength colour keeps it full strength.
        title.setTextColor(Color.WHITE);
        title.addOnAttachStateChangeListener(shimmer);
        if (title.isAttachedToWindow()) shimmer.onViewAttachedToWindow(title);
    }

    /** Whether [title] wears the gradient. */
    public static boolean wears(TextView title) {
        return wornBy(title) != null;
    }

    @Nullable
    private static ShimmerTitle wornBy(TextView title) {
        WeakReference<ShimmerTitle> worn = WORN.get(title);
        return worn == null ? null : worn.get();
    }

    /** The stops [title] is drawn in, or null when it doesn't wear the gradient. */
    @Nullable
    static int[] stopsOf(TextView title) {
        ShimmerTitle shimmer = wornBy(title);
        return shimmer == null ? null : shimmer.colorStops.clone();
    }

    /**
     * {@link #BRAND} for the opaque [surface]: each stop, or the first step from it toward white
     * (on a dark surface) or black (on a light one) that reads at {@link #CONTRAST} or more.
     */
    static int[] colorsOn(int surface) {
        boolean lift = contrast(Color.WHITE, surface) >= contrast(Color.BLACK, surface);
        int[] stops = new int[BRAND.length];
        for (int i = 0; i < BRAND.length; i++) stops[i] = reaching(BRAND[i], lift ? Color.WHITE : Color.BLACK, surface);
        return stops;
    }

    /** The first of 256 steps from [color] toward [end] that reads on [surface], or [end] itself. */
    private static int reaching(int color, int end, int surface) {
        // Each step toward the end moves the luminance the same way, so the first passing step is the
        // smallest change that passes.
        int low = 0;
        int high = 0xFF;
        if (contrast(color, surface) >= CONTRAST) return color;
        while (low < high) {
            int step = (low + high) >>> 1;
            if (contrast(mix(color, end, step), surface) >= CONTRAST) high = step;
            else low = step + 1;
        }
        return mix(color, end, low);
    }

    private static int mix(int color, int end, int step) {
        int r = Color.red(color) + (Color.red(end) - Color.red(color)) * step / 0xFF;
        int g = Color.green(color) + (Color.green(end) - Color.green(color)) * step / 0xFF;
        int b = Color.blue(color) + (Color.blue(end) - Color.blue(color)) * step / 0xFF;
        return Color.rgb(r, g, b);
    }

    static double contrast(int one, int other) {
        double a = luminance(one) + 0.05;
        double b = luminance(other) + 0.05;
        return Math.max(a, b) / Math.min(a, b);
    }

    /** WCAG 2 relative luminance of an opaque [color]. */
    static double luminance(int color) {
        return 0.2126 * channel(Color.red(color)) + 0.7152 * channel(Color.green(color))
                + 0.0722 * channel(Color.blue(color));
    }

    private static double channel(int value) {
        double v = value / 255.0;
        return v <= 0.04045 ? v / 12.92 : Math.pow((v + 0.055) / 1.055, 2.4);
    }

    @Override
    public void onViewAttachedToWindow(View view) {
        startedAt = -1L;
        if (!running) {
            running = true;
            title.postOnAnimationDelayed(this, FRAME_MS);
        }
    }

    @Override
    public void onViewDetachedFromWindow(View view) {
        running = false;
        title.removeCallbacks(this);
        unpark();
    }

    /** The window draws again, as it does when Threads comes back: the loop picks up. */
    @Override
    public boolean onPreDraw() {
        unpark();
        if (running) title.postOnAnimationDelayed(this, FRAME_MS);
        return true;
    }

    private void unpark() {
        ViewTreeObserver observer = parkedOn;
        parkedOn = null;
        if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
    }

    @Override
    public void run() {
        if (!running || !title.isAttachedToWindow()) {
            running = false;
            return;
        }
        if (title.getWindowVisibility() != View.VISIBLE) {
            // Threads went to the background with the title's window still up, as an open settings
            // dialog stays: nothing wakes the main thread until it draws again.
            startedAt = -1L;
            if (parkedOn == null) {
                parkedOn = title.getViewTreeObserver();
                parkedOn.addOnPreDrawListener(this);
            }
            return;
        }
        if (!title.isShown()) {
            // Nothing to draw behind a closed page: look again in a while instead of every frame.
            startedAt = -1L;
            title.postDelayed(this, HIDDEN_CHECK_MS);
            return;
        }
        long now = AnimationUtils.currentAnimationTimeMillis();
        // Inside a frame the animation clock is the later of the vsync and the last read outside
        // one, so the first frame can stand ahead of the ones after it: start from the earlier.
        if (startedAt < 0L || now < startedAt) startedAt = now;
        frame(now - startedAt);
        title.postOnAnimationDelayed(this, FRAME_MS);
    }

    /** Shades [title], which wears the gradient, as it stands [sinceStart] ms after it opened. */
    static void frameFor(TextView title, long sinceStart) {
        ShimmerTitle shimmer = wornBy(title);
        if (shimmer != null) shimmer.frame(sinceStart);
    }

    /** Shades the title as it stands [sinceStart] ms after it opened, and has it redrawn. */
    void frame(long sinceStart) {
        title.getPaint().setShader(shade(sinceStart));
        title.invalidate();
    }

    @Nullable
    private Shader shade(long sinceStart) {
        Layout layout = title.getLayout();
        if (layout == null || layout.getLineCount() == 0) return null;
        // TextView draws its layout from the padding's corner, so these are the layout's own
        // coordinates. A wrapped title takes its colours across its widest line.
        float left = Float.MAX_VALUE, right = -Float.MAX_VALUE;
        for (int line = 0; line < layout.getLineCount(); line++) {
            left = Math.min(left, layout.getLineLeft(line));
            right = Math.max(right, layout.getLineRight(line));
        }
        float width = Math.max(1f, right - left);
        float height = Math.max(1f, layout.getHeight());
        float band = height * 1.6f;
        if (colors == null || width != shadedWidth || height != shadedHeight) {
            colors = new LinearGradient(0f, 0f, width, 0f, colorStops, null, Shader.TileMode.MIRROR);
            sheen = new LinearGradient(0f, 0f, band, band * 0.35f, SHEEN, null, Shader.TileMode.CLAMP);
            shadedWidth = width;
            shadedHeight = height;
        }
        move.setTranslate(left + drift(sinceStart) * 2f * width, 0f);
        colors.setLocalMatrix(move);
        float sweep = sweep(sinceStart);
        if (sweep < 0f) return colors;
        across.setTranslate(left - band + sweep * (width + band), 0f);
        sheen.setLocalMatrix(across);
        // Built afresh each frame: a ComposeShader keeps the matrices its parts had when it was made.
        return new ComposeShader(colors, sheen, PorterDuff.Mode.SRC_OVER);
    }

    /**
     * How far into its sweep the title is [sinceStart] ms after it opened, 0 to 1, or -1 while it
     * waits for the next.
     */
    static float sweep(long sinceStart) {
        if (sinceStart < 0L) return -1f;
        long into = sinceStart % PERIOD_MS;
        return into < SWEEP_MS ? into / (float) SWEEP_MS : -1f;
    }

    /**
     * How far round its mirrored cycle the gradient has drifted [sinceStart] ms after the title
     * opened, 0 to 1. A whole round ends on the colours it began with, so the drift never jumps.
     */
    static float drift(long sinceStart) {
        if (sinceStart <= 0L) return 0f;
        return (sinceStart % DRIFT_MS) / (float) DRIFT_MS;
    }
}
