package app.southstar21.extension.instagram.liquidglass;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RecordingCanvas;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;

/**
 * iOS 26 "scroll edge effect": content behind the floating tab bar (or a header at the top)
 * is progressively blurred and faded towards the screen edge, so the glass floats over a
 * soft frosted band instead of sharp content.
 * <p>
 * Sits directly below the bar (or header) and re-records the siblings behind it each frame,
 * like {@link LiquidGlassDrawable} does for the pill.
 */
@SuppressLint({"NewApi", "ViewConstructor"})
final class EdgeBlurView extends View {
    /** How far past the bar (or header) the effect fades out. */
    final int extraTop;
    /** At the top of the screen: the effect is strongest at the view's top edge. */
    private final boolean atTop;
    private final int blurRadiusPx;
    private final float density;

    private final Paint maskPaint = new Paint();
    private final Paint fadePaint = new Paint();
    private RenderNode backdrop;
    private RenderEffect blur;
    /**
     * The top variant's progressive blur: the content blurred lightly, medium and strongly, each
     * faded in a little further up, so the blur builds up smoothly instead of a single blurred
     * copy fading over sharp content (which shows both at once where it ends).
     */
    private static final float[] TOP_RADII_DP = {1.5f, 4f, 9f, 16f};
    /** Where each level fades in, as fractions of the tail below the header (0 = its open end). */
    private static final float[][] TOP_RAMPS = {{0f, 0.4f}, {0.15f, 0.6f}, {0.35f, 0.85f}, {0.55f, 1f}};
    /**
     * Room recorded past the tail's open end, so the blurs there average real content instead of
     * the recording's clamped last row (which smeared into a visible line where the blur ends).
     */
    private static final float TOP_PAD_DP = 32f;
    private RenderNode[] levels;
    private Paint[] levelMasks;
    private int maskHeight = -1;
    private boolean maskDark;
    private boolean dark;

    EdgeBlurView(Context context, float density) {
        this(context, density, false);
    }

    EdgeBlurView(Context context, float density, boolean atTop) {
        super(context);
        this.atTop = atTop;
        // The top ends just below the camera, fading out over a short tail.
        this.extraTop = Math.round((atTop ? 28 : 36) * density);
        this.density = density;
        this.blurRadiusPx = Math.round(16 * density);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        setWillNotDraw(false);
        maskPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
    }

    /** Copies of the video surfaces under the bar, drawn into their holes; null for none. */
    private SurfaceSnapshots snapshots;

    boolean isAtTop() {
        return atTop;
    }

    void setSnapshots(SurfaceSnapshots snapshots) {
        this.snapshots = snapshots;
    }

    /**
     * For the top variant: how far down from the top edge the effect reaches, when less than the
     * view's height (a header sliding away). The gradients are scaled to it rather than rebuilt.
     */
    void setExtent(int extent) {
        if (this.extent == extent) return;
        this.extent = extent;
        invalidate();
    }

    private int extent = -1;
    private final android.graphics.Matrix bandMatrix = new android.graphics.Matrix();

    /** The color behind the recorded content (the window's), or 0 for plain black or white. */
    private int background;

    void setBackgroundColorBehind(int color) {
        background = color;
    }

    private int backgroundColor() {
        return Color.alpha(background) == 0xFF ? background : dark ? Color.BLACK : Color.WHITE;
    }

    void setDark(boolean dark) {
        if (this.dark == dark) return;
        this.dark = dark;
        invalidate();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        int w = getWidth();
        int h = getHeight();
        if (w <= 0 || h <= 0) return;
        updateGradients(h);
        // The top variant's band can be shorter than the view: squeeze the gradients towards the
        // top edge and leave the rest of the view untouched.
        int band = atTop && extent > 0 ? Math.min(extent, h) : h;
        bandMatrix.setScale(1f, band / (float) h);
        maskPaint.getShader().setLocalMatrix(bandMatrix);
        fadePaint.getShader().setLocalMatrix(bandMatrix);
        if (levelMasks != null) {
            for (Paint mask : levelMasks) mask.getShader().setLocalMatrix(bandMatrix);
        }
        if (band <= 0) return;

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && canvas.isHardwareAccelerated()) {
            drawBlur(canvas, w, h);
        }
        canvas.drawRect(0, 0, w, band, fadePaint);
    }

    private void drawBlur(Canvas canvas, int w, int h) {
        if (!(getParent() instanceof ViewGroup)) return;
        ViewGroup parent = (ViewGroup) getParent();
        int index = parent.indexOfChild(this);
        if (index <= 0) return;

        if (backdrop == null) {
            backdrop = new RenderNode("LiquidGlassEdgeBlur");
            backdrop.setUseCompositingLayer(true, null);
            blur = RenderEffect.createBlurEffect(blurRadiusPx, blurRadiusPx, Shader.TileMode.CLAMP);
        }

        float originX = getLeft() + getTranslationX();
        float originY = getTop() + getTranslationY();
        // The top variant records a little further down than it draws (see TOP_PAD_DP).
        int rh = atTop ? h + Math.round(TOP_PAD_DP * density) : h;
        backdrop.setPosition(0, 0, w, rh);
        RecordingCanvas rc = backdrop.beginRecording(w, rh);
        try {
            rc.translate(-originX, -originY);
            for (int i = 0; i < index; i++) {
                View child = parent.getChildAt(i);
                if (child.getVisibility() != VISIBLE || child.getAlpha() == 0f) continue;
                if (child instanceof EdgeBlurView) continue;
                int save = rc.save();
                rc.translate(child.getLeft() + child.getTranslationX(), child.getTop() + child.getTranslationY());
                child.draw(rc);
                rc.restoreToCount(save);
            }
            // Videos are holes in the recording: fill them with copies where those work, then
            // the base color (for the window's background) everywhere but uncopied videos.
            if (snapshots != null) {
                snapshots.draw(rc);
                snapshots.drawBase(rc, backgroundColor());
            } else {
                rc.drawColor(backgroundColor(), PorterDuff.Mode.DST_OVER);
            }
        } finally {
            backdrop.endRecording();
        }
        if (atTop) {
            drawLevels(canvas, w, h, rh);
            return;
        }
        backdrop.setRenderEffect(blur);

        // Fade the blurred copy in from the top so the blur ramps up progressively.
        int layer = canvas.saveLayer(0, 0, w, h, null);
        canvas.drawRenderNode(backdrop);
        canvas.drawRect(0, 0, w, h, maskPaint);
        canvas.restoreToCount(layer);
    }

    /** Light to strong: each level covers the one before it where it has fully faded in. */
    private void drawLevels(Canvas canvas, int w, int h, int rh) {
        if (levels == null) {
            levels = new RenderNode[TOP_RADII_DP.length];
            for (int i = 0; i < levels.length; i++) {
                levels[i] = new RenderNode("LiquidGlassEdgeBlurLevel" + i);
                float r = TOP_RADII_DP[i] * density;
                levels[i].setRenderEffect(RenderEffect.createBlurEffect(r, r, Shader.TileMode.CLAMP));
            }
        }
        for (int i = 0; i < levels.length; i++) {
            RenderNode level = levels[i];
            level.setPosition(0, 0, w, rh);
            RecordingCanvas rc = level.beginRecording(w, rh);
            try {
                rc.drawRenderNode(backdrop);
            } finally {
                level.endRecording();
            }
            int layer = canvas.saveLayer(0, 0, w, h, null);
            canvas.drawRenderNode(level);
            canvas.drawRect(0, 0, w, h, levelMasks[i]);
            canvas.restoreToCount(layer);
        }
    }

    private void updateGradients(int h) {
        if (h == maskHeight && dark == maskDark) return;
        maskHeight = h;
        maskDark = dark;
        // Gradients run from the open end (no effect) towards the screen edge (full effect).
        float from = atTop ? h : 0;
        float to = atTop ? 0 : h;
        // At the bottom the ramp runs into the bar, whose glass covers it. A header has no glass:
        // keep it fully blurred and ramp out only below it, over the extra band.
        float ramp = atTop ? Math.min(0.55f, Math.max(0.05f, extraTop / (float) h)) : 0.55f;
        maskPaint.setShader(new LinearGradient(0, from, 0, to,
                new int[]{Color.TRANSPARENT, Color.BLACK, Color.BLACK},
                new float[]{0f, ramp, 1f}, Shader.TileMode.CLAMP));
        int base = dark ? Color.BLACK : Color.WHITE;
        if (!atTop) {
            fadePaint.setShader(new LinearGradient(0, from, 0, to,
                    new int[]{withAlpha(base, 0), withAlpha(base, dark ? 0x70 : 0x60),
                            withAlpha(base, dark ? 0xB0 : 0xA0)},
                    new float[]{0f, 0.6f, 1f}, Shader.TileMode.CLAMP));
            return;
        }
        // The tail is the first `tail` of the gradient (from its open end); past it everything is
        // at full strength. Eased curves, so no level starts or stops with a visible line.
        float tail = Math.min(0.7f, extraTop / (float) h);
        if (levelMasks == null) {
            levelMasks = new Paint[TOP_RAMPS.length];
            for (int i = 0; i < levelMasks.length; i++) {
                levelMasks[i] = new Paint();
                levelMasks[i].setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
            }
        }
        for (int i = 0; i < TOP_RAMPS.length; i++) {
            levelMasks[i].setShader(easedGradient(from, to, TOP_RAMPS[i][0] * tail, TOP_RAMPS[i][1] * tail,
                    Color.BLACK, 0, 0xFF));
        }
        // The tint fades in over the whole tail, then keeps building up to the edge.
        int[] colors = new int[EASE_STOPS + 1];
        float[] stops = new float[EASE_STOPS + 1];
        int mid = dark ? 0x70 : 0x60;
        for (int k = 0; k < EASE_STOPS; k++) {
            float t = k / (float) (EASE_STOPS - 1);
            stops[k] = t * tail;
            colors[k] = withAlpha(base, Math.round(mid * smoothstep(t)));
        }
        stops[EASE_STOPS] = 1f;
        colors[EASE_STOPS] = withAlpha(base, dark ? 0xB0 : 0xA0);
        fadePaint.setShader(new LinearGradient(0, from, 0, to, colors, stops, Shader.TileMode.CLAMP));
    }

    private static final int EASE_STOPS = 13;

    /** {@code color} at alpha {@code a0} before {@code start}, easing to {@code a1} at {@code end}. */
    private static LinearGradient easedGradient(float from, float to, float start, float end,
                                                int color, int a0, int a1) {
        int[] colors = new int[EASE_STOPS + 2];
        float[] stops = new float[EASE_STOPS + 2];
        colors[0] = withAlpha(color, a0);
        stops[0] = 0f;
        for (int k = 0; k < EASE_STOPS; k++) {
            float t = k / (float) (EASE_STOPS - 1);
            stops[k + 1] = Math.max(stops[k], start + (end - start) * t);
            colors[k + 1] = withAlpha(color, Math.round(a0 + (a1 - a0) * smoothstep(t)));
        }
        stops[EASE_STOPS + 1] = 1f;
        colors[EASE_STOPS + 1] = withAlpha(color, a1);
        return new LinearGradient(0, from, 0, to, colors, stops, Shader.TileMode.CLAMP);
    }

    /** Smootherstep: flat at both ends, so a level eases in with no visible start or end. */
    private static float smoothstep(float t) {
        return t * t * t * (t * (t * 6f - 15f) + 10f);
    }

    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (alpha << 24);
    }
}
