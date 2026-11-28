package com.waze.gw;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Shader;
import android.view.View;

/**
 * Rectangular low-HP red vignette: red along the 4 edges, fading gently inward.
 * Whole-view alpha is animated for a smooth pulse.
 */
public class Vignette extends View {

    public static final int MODE_NONE = 0;
    public static final int MODE_WEAK = 1;
    public static final int MODE_STRONG = 2;
    private final Paint paint = new Paint();
    private android.animation.ObjectAnimator pulse;
    private boolean active;
    private int mode = MODE_STRONG;
    private static final int DEFAULT_EDGE_ALPHA = 0x4D;
    private int edgeAlpha = DEFAULT_EDGE_ALPHA;
    private static final float DEPTH = 0.16f;     // bleed depth (fraction of the short side) — gentle

    public Vignette(Context c) {
        super(c);
        setAlpha(0f);
        setClickable(false);
        setFocusable(false);
    }

    /** Shared over-speed animation used by both the HUD and Waze's main map. */
    public void setActive(boolean enabled) {
        if (active == enabled) return;
        active = enabled;
        animate().cancel();
        if (pulse != null) pulse.cancel();
        if (enabled) {
            pulse = android.animation.ObjectAnimator.ofFloat(this, "alpha", 0.28f, 1f);
            pulse.setDuration(680L);
            pulse.setRepeatMode(android.animation.ObjectAnimator.REVERSE);
            pulse.setRepeatCount(android.animation.ObjectAnimator.INFINITE);
            pulse.start();
        } else {
            animate().alpha(0f).setDuration(500L).start();
        }
    }

    /** Weak mode paints only the top edge; strong mode keeps the original four-edge effect. */
    public void setMode(int value) {
        int next = value == MODE_WEAK ? MODE_WEAK
                : value == MODE_NONE ? MODE_NONE : MODE_STRONG;
        if (mode == next) return;
        mode = next;
        invalidate();
    }

    /** Map backgrounds are brighter than the black HUD, so they can request a denser edge. */
    public void setEdgeAlpha(int value) {
        int next = Math.max(0, Math.min(255, value));
        if (edgeAlpha == next) return;
        edgeAlpha = next;
        invalidate();
    }

    @Override
    protected void onDetachedFromWindow() {
        active = false;
        animate().cancel();
        if (pulse != null) pulse.cancel();
        pulse = null;
        super.onDetachedFromWindow();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        int w = getWidth(), h = getHeight();
        if (w == 0 || h == 0) return;
        float t = Math.min(w, h) * DEPTH;
        int edge = (edgeAlpha << 24) | 0x00FF1A1A;
        int clear = 0x00FF1A1A;

        paint.setShader(new LinearGradient(0, 0, 0, t, edge, clear, Shader.TileMode.CLAMP));        // top
        if (mode == MODE_NONE) return;
        canvas.drawRect(0, 0, w, t, paint);
        if (mode == MODE_WEAK) return;
        paint.setShader(new LinearGradient(0, h, 0, h - t, edge, clear, Shader.TileMode.CLAMP));    // bottom
        canvas.drawRect(0, h - t, w, h, paint);
        paint.setShader(new LinearGradient(0, 0, t, 0, edge, clear, Shader.TileMode.CLAMP));        // left
        canvas.drawRect(0, 0, t, h, paint);
        paint.setShader(new LinearGradient(w, 0, w - t, 0, edge, clear, Shader.TileMode.CLAMP));    // right
        canvas.drawRect(w - t, 0, w, h, paint);
    }
}
