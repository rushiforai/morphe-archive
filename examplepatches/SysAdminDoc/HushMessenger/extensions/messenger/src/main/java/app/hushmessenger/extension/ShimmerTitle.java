package app.hushmessenger.extension;

import android.graphics.Color;
import android.graphics.ComposeShader;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.PorterDuff;
import android.graphics.Shader;
import android.text.Layout;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Every HushMessenger title in Messenger's gradient: the settings bar, its sheets, the empty search and the restart
 * screen. The colors drift along the words all the time the title is on screen, and as it opens, and every
 * {@link #PERIOD_MS} after, a white sheen sweeps over them. It runs its own frame loop rather than an animator, so it
 * moves whatever Android's animation scale says (the S22 runs with all three at 0, where an animator holds still).
 */
final class ShimmerTitle implements Runnable, View.OnAttachStateChangeListener, View.OnLayoutChangeListener {
    /** One sheen sweep and the wait after it. */
    static final long PERIOD_MS = 6000;
    /** How long a sheen sweep runs. */
    static final long SWEEP_MS = 1400;
    /** How long the colors take to drift one whole mirrored round. */
    static final long DRIFT_MS = 8000;
    /**
     * The least time between frames: the next frame after it, so about 60 a second. A frame posted with no wait runs
     * at once wherever time stands still, as in a test's paused looper, which then never goes idle.
     */
    private static final long FRAME_MS = 10;
    /** How often a title that isn't showing checks whether it is again. */
    private static final long HIDDEN_CHECK_MS = 500;
    /**
     * Messenger's gradient, blue (#0866FF, the launcher icon's) through purple and pink to orange, each stop lightened
     * just enough to read at 7:1 on the dark page (black) and its panels (#10151D).
     */
    static final int[] DARK = {0xFF69A2FF, 0xFFC686FF, 0xFFFF7499, 0xFFFF7A6C};
    /** The same hues darkened to read at 7:1 on the light page (#F0F2F5) and its white panels. */
    static final int[] LIGHT = {0xFF0047BA, 0xFF7000D1, 0xFFA4002C, 0xFFA20F00};
    private static final int[] SHEEN = {0x00FFFFFF, 0xB3FFFFFF, 0x00FFFFFF};
    /**
     * The titles wearing the gradient, so painting one twice doesn't run two loops. The shimmer is held weakly too: it
     * holds its title, and a value that holds its own key keeps every closed screen in memory. The title's attach
     * listener keeps the shimmer alive as long as the title is.
     */
    private static final Map<TextView, WeakReference<ShimmerTitle>> WORN = new WeakHashMap<>();

    private final TextView title;
    private final int[] stops;
    private final Matrix move = new Matrix();
    private final Matrix across = new Matrix();
    private LinearGradient colors;
    private LinearGradient sheen;
    private float shadedWidth = -1f;
    private float shadedHeight = -1f;
    /** When the first sweep started, so it plays as the title opens. */
    private long startedAt = -1L;
    private boolean running;

    private ShimmerTitle(TextView title, int[] stops) {
        this.title = title;
        this.stops = stops;
    }

    /** Puts title in the gradient for the light or dark page, moving for as long as it's on screen. Again changes nothing. */
    static void wear(TextView title, boolean light) {
        if (WORN.containsKey(title)) return;
        ShimmerTitle shimmer = new ShimmerTitle(title, light ? LIGHT : DARK);
        WORN.put(title, new WeakReference<>(shimmer));
        // The gradient replaces the color, and a full-strength color keeps it full strength.
        title.setTextColor(Color.WHITE);
        title.addOnAttachStateChangeListener(shimmer);
        title.addOnLayoutChangeListener(shimmer);
        if (title.isAttachedToWindow()) shimmer.onViewAttachedToWindow(title);
    }

    static boolean wears(TextView title) {
        return WORN.containsKey(title);
    }

    @Override public void onViewAttachedToWindow(View view) {
        startedAt = -1L;
        if (!running) {
            running = true;
            title.postOnAnimationDelayed(this, FRAME_MS);
        }
    }

    /** Shaded as soon as there are words to shade, so the first frame drawn isn't plain white while the loop's first frame waits. */
    @Override public void onLayoutChange(View view, int left, int top, int right, int bottom,
            int oldLeft, int oldTop, int oldRight, int oldBottom) {
        frame(startedAt < 0L ? 0L : AnimationUtils.currentAnimationTimeMillis() - startedAt);
    }

    @Override public void onViewDetachedFromWindow(View view) {
        running = false;
        title.removeCallbacks(this);
    }

    @Override public void run() {
        if (!running || !title.isAttachedToWindow()) {
            running = false;
            return;
        }
        if (!title.isShown()) {
            // Nothing to draw behind a closed section or tab: look again in a while instead of every frame.
            startedAt = -1L;
            title.postDelayed(this, HIDDEN_CHECK_MS);
            return;
        }
        long now = AnimationUtils.currentAnimationTimeMillis();
        if (startedAt < 0L) startedAt = now;
        frame(now - startedAt);
        title.postOnAnimationDelayed(this, FRAME_MS);
    }

    /** Shades title, which wears the gradient, as it stands sinceStart ms after it opened. */
    static void frameFor(TextView title, long sinceStart) {
        WeakReference<ShimmerTitle> worn = WORN.get(title);
        ShimmerTitle shimmer = worn == null ? null : worn.get();
        if (shimmer != null) shimmer.frame(sinceStart);
    }

    void frame(long sinceStart) {
        title.getPaint().setShader(shade(sinceStart));
        title.invalidate();
    }

    private Shader shade(long sinceStart) {
        Layout layout = title.getLayout();
        if (layout == null || layout.getLineCount() == 0) return null;
        // TextView draws its layout from the padding's corner, so these are the layout's own coordinates. A centered
        // or wrapped title takes its colors across its widest reach, or it would show only one end of the gradient.
        float left = Float.MAX_VALUE, right = -Float.MAX_VALUE;
        for (int line = 0; line < layout.getLineCount(); line++) {
            left = Math.min(left, layout.getLineLeft(line));
            right = Math.max(right, layout.getLineRight(line));
        }
        float width = Math.max(1f, right - left);
        float height = Math.max(1f, layout.getHeight());
        float band = height * 1.6f;
        if (colors == null || width != shadedWidth || height != shadedHeight) {
            colors = new LinearGradient(0f, 0f, width, 0f, stops, null, Shader.TileMode.MIRROR);
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

    /** How far into its sweep the title is sinceStart ms after it opened, 0 to 1, or -1 while it waits for the next. */
    static float sweep(long sinceStart) {
        if (sinceStart < 0L) return -1f;
        long into = sinceStart % PERIOD_MS;
        return into < SWEEP_MS ? into / (float) SWEEP_MS : -1f;
    }

    /**
     * How far round its mirrored cycle the gradient has drifted sinceStart ms after the title opened, 0 to 1. A whole
     * round ends on the colors it began with, so the drift never jumps.
     */
    static float drift(long sinceStart) {
        if (sinceStart <= 0L) return 0f;
        return (sinceStart % DRIFT_MS) / (float) DRIFT_MS;
    }
}
