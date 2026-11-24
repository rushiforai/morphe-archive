package app.southstar21.extension.youtubemusic.liquidglass;

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
 * iOS 26 "scroll edge effect": content behind the floating tab bar
 * is progressively blurred and faded towards the screen edge, so the glass floats over a
 * soft frosted band instead of sharp content.
 * <p>
 * Sits directly below the bar and re-records the siblings behind it when they may have moved,
 * like {@link LiquidGlassDrawable} does for the pill.
 */
@SuppressLint({"NewApi", "ViewConstructor"})
final class EdgeBlurView extends View {
    /** How far past the bar the effect fades out. */
    final int extraTop;
    private final int blurRadiusPx;

    private final Paint maskPaint = new Paint();
    private final Paint fadePaint = new Paint();
    /** The backdrop is recorded this many times smaller on each side (see recordBackdrop). */
    private static final int DOWNSAMPLE = 8;

    private RenderNode backdrop;
    /** The finished effect, in a small layer of its own (see drawEffect). */
    private RenderNode effect;
    private final Paint holePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private int maskHeight = -1;
    private boolean maskDark;
    private boolean dark;

    EdgeBlurView(Context context, float density) {
        super(context);
        this.extraTop = Math.round(36 * density);
        this.blurRadiusPx = Math.round(16 * density);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        setWillNotDraw(false);
        maskPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
        holePaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
    }

    /** Copies of the video surfaces under the bar, drawn into their holes; null for none. */
    private SurfaceSnapshots snapshots;

    void setSnapshots(SurfaceSnapshots snapshots) {
        this.snapshots = snapshots;
    }

    void setDark(boolean dark) {
        if (this.dark == dark) return;
        this.dark = dark;
        refreshBackdrop();
    }

    /** What's behind may have changed: record it again on the next draw. */
    void refreshBackdrop() {
        backdropStale = true;
        invalidate();
    }

    /**
     * Set when the backdrop must be recorded again. Other redraws (the hole following the
     * docked player as it opens) reuse the blurred backdrop as it is.
     */
    private boolean backdropStale = true;
    private int recordedW, recordedH;

    /** Left clear, in this view's coordinates: the docked player's capsule (empty for none). */
    private final android.graphics.RectF hole = new android.graphics.RectF();
    private final android.graphics.Path holePath = new android.graphics.Path();

    /**
     * Keeps the effect off {@code left, top, right, bottom} (a capsule): the docked player sits
     * below this view, and would otherwise be blurred and darkened with the content.
     */
    void setHole(float left, float top, float right, float bottom) {
        if (hole.left == left && hole.top == top && hole.right == right && hole.bottom == bottom) return;
        hole.set(left, top, right, bottom);
        holePath.reset();
        if (!hole.isEmpty()) {
            float r = hole.height() / 2f;
            holePath.addRoundRect(hole, r, r, android.graphics.Path.Direction.CW);
        }
        invalidate();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        int w = getWidth();
        int h = getHeight();
        if (w <= 0 || h <= 0) return;
        updateGradients(h);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && canvas.isHardwareAccelerated()) {
            drawEffect(canvas, w, h);
            return;
        }
        int save = canvas.save();
        if (!hole.isEmpty()) canvas.clipOutPath(holePath);
        canvas.drawRect(0, 0, w, h, fadePaint);
        canvas.restoreToCount(save);
    }

    /**
     * The whole effect in one small layer: the blurred backdrop, the darkening fade over it and
     * the hole for the docked player. The layer is drawn again only when one of them changes;
     * every other frame the app draws, the GPU puts the finished layer on screen, scaled up.
     * (Drawn straight into the view, the fade covered the whole width at full size every frame,
     * and the hole was a path clip with a pass of its own. Small, the hole's edge comes out a
     * little soft, which the docked art's own ring covers.)
     */
    private void drawEffect(Canvas canvas, int w, int h) {
        // Recorded again only when what's behind may have moved: the hole following the docked
        // player as it opens reuses the blurred backdrop as it is.
        boolean reuse = !backdropStale && w == recordedW && h == recordedH
                && backdrop != null && backdrop.hasDisplayList();
        boolean blurred = reuse || recordBackdrop(w, h);
        if (effect == null) {
            effect = new RenderNode("LiquidGlassEdge");
            effect.setUseCompositingLayer(true, null);
        }
        int sw = (w + DOWNSAMPLE - 1) / DOWNSAMPLE;
        int sh = (h + DOWNSAMPLE - 1) / DOWNSAMPLE;
        effect.setPosition(0, 0, sw, sh);
        RecordingCanvas ec = effect.beginRecording(sw, sh);
        try {
            if (blurred) ec.drawRenderNode(backdrop);
            ec.scale(1f / DOWNSAMPLE, 1f / DOWNSAMPLE);
            ec.drawRect(0, 0, w, h, fadePaint);
            if (!hole.isEmpty()) ec.drawPath(holePath, holePaint);
        } finally {
            effect.endRecording();
        }
        int save = canvas.save();
        canvas.scale(DOWNSAMPLE, DOWNSAMPLE);
        canvas.drawRenderNode(effect);
        canvas.restoreToCount(save);
    }

    /**
     * Records the siblings behind this view into {@link #backdrop}, faded in from the top by the
     * mask and blurred. The blur is wide, so it's recorded at an eighth of the size on each side,
     * with no visible difference once blurred: far fewer pixels to draw and blur, and a blur
     * small enough for the GPU to do in two passes (a wider one first scales down and back up).
     * The mask is applied in the same small layer rather than in an offscreen pass the size of
     * the view on every frame. False if there's nothing to record.
     */
    private boolean recordBackdrop(int w, int h) {
        if (!(getParent() instanceof ViewGroup)) return false;
        ViewGroup parent = (ViewGroup) getParent();
        int index = parent.indexOfChild(this);
        if (index <= 0) return false;
        backdropStale = false;
        recordedW = w;
        recordedH = h;

        if (backdrop == null) {
            backdrop = new RenderNode("LiquidGlassEdgeBlur");
            backdrop.setUseCompositingLayer(true, null);
            backdrop.setRenderEffect(RenderEffect.createBlurEffect(
                    blurRadiusPx / (float) DOWNSAMPLE, blurRadiusPx / (float) DOWNSAMPLE, Shader.TileMode.CLAMP));
        }

        float originX = getLeft() + getTranslationX();
        float originY = getTop() + getTranslationY();
        int sw = (w + DOWNSAMPLE - 1) / DOWNSAMPLE;
        int sh = (h + DOWNSAMPLE - 1) / DOWNSAMPLE;
        backdrop.setPosition(0, 0, sw, sh);
        RecordingCanvas rc = backdrop.beginRecording(sw, sh);
        try {
            rc.scale(1f / DOWNSAMPLE, 1f / DOWNSAMPLE);
            int content = rc.save();
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
                snapshots.drawBase(rc, dark ? Color.BLACK : Color.WHITE);
            } else {
                rc.drawColor(dark ? Color.BLACK : Color.WHITE, PorterDuff.Mode.DST_OVER);
            }
            rc.restoreToCount(content);
            // Fade the blurred copy in from the top so the blur ramps up progressively.
            rc.drawRect(0, 0, w, h, maskPaint);
        } finally {
            backdrop.endRecording();
        }
        return true;
    }

    private void updateGradients(int h) {
        if (h == maskHeight && dark == maskDark) return;
        maskHeight = h;
        maskDark = dark;
        // Gradients run from the open end (no effect) towards the screen edge (full effect).
        maskPaint.setShader(new LinearGradient(0, 0, 0, h,
                new int[]{Color.TRANSPARENT, Color.BLACK, Color.BLACK},
                new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
        int base = dark ? Color.BLACK : Color.WHITE;
        fadePaint.setShader(new LinearGradient(0, 0, 0, h,
                new int[]{withAlpha(base, 0), withAlpha(base, dark ? 0x70 : 0x60),
                        withAlpha(base, dark ? 0xB0 : 0xA0)},
                new float[]{0f, 0.6f, 1f}, Shader.TileMode.CLAMP));
    }

    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (alpha << 24);
    }
}
