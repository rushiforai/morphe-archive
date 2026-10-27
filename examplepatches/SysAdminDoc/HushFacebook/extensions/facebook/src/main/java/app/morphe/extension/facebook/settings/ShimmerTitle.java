/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.app.AlertDialog;
import android.content.res.TypedArray;
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

import app.morphe.extension.facebook.theme.TonePalette;

/**
 * Every Hushfacebook title in Facebook's blues: the settings bar, its dialogs, the recovery page
 * and the lock cover. The colours drift along the words all the time the title is on screen, and
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
     * Facebook's own colours from its 584 resources: its blue, the cyan beside it, the pale
     * highlight, the brighter link blue and the deep pressed blue. {@link #colorsOn} moves each one
     * toward white or black until it reads on the surface it's drawn over, keeping its hue.
     */
    static final int[] BRAND = {0xFF0866FF, 0xFF55C7EB, 0xFFE7F3FF, 0xFF0A7CFF, 0xFF0064D1};
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
    /** Waiting for its window's next draw, with nothing scheduled while Facebook is away. */
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

    /**
     * Puts the title of a shown [dialog] that keeps Facebook's theme in the gradient, read against
     * the theme's own dialog colour. Hushfacebook's offers over Facebook screens are built this way.
     */
    public static void wearTitleOf(@Nullable AlertDialog dialog) {
        if (dialog == null) return;
        @SuppressWarnings("DiscouragedApi")
        int titleId = dialog.getContext().getResources().getIdentifier("alertTitle", "id", "android");
        TextView title = titleId == 0 ? null : dialog.findViewById(titleId);
        if (title == null) return;
        TypedArray styled = dialog.getContext().obtainStyledAttributes(new int[]{android.R.attr.colorBackground});
        try {
            wear(title, styled.getColor(0, Color.BLACK) | 0xFF000000);
        } finally {
            styled.recycle();
        }
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
        double a = TonePalette.luminance(one) + 0.05;
        double b = TonePalette.luminance(other) + 0.05;
        return Math.max(a, b) / Math.min(a, b);
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

    /** The window draws again, as it does when Facebook comes back: the loop picks up. */
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
            // Facebook went to the background with the title's window still up, as the lock cover
            // and an open settings dialog stay: nothing wakes the main thread until it draws again.
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
