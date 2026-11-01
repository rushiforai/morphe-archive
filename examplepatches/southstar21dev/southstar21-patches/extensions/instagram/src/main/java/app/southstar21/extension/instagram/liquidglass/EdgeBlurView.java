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
 * iOS 26 "scroll edge effect": content behind the floating tab bar
 * is progressively blurred and faded towards the screen edge, so the glass floats over a
 * soft frosted band instead of sharp content.
 * <p>
 * Sits directly below the bar and re-records the siblings behind it each frame,
 * like {@link LiquidGlassDrawable} does for the pill.
 */
@SuppressLint({"NewApi", "ViewConstructor"})
final class EdgeBlurView extends View {
    /** How far past the bar the effect fades out. */
    final int extraTop;
    private final int blurRadiusPx;

    private final Paint maskPaint = new Paint();
    private final Paint fadePaint = new Paint();
    private RenderNode backdrop;
    private RenderEffect blur;
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

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && canvas.isHardwareAccelerated()) {
            drawBlur(canvas, w, h);
        }
        canvas.drawRect(0, 0, w, h, fadePaint);
    }

    private void drawBlur(Canvas canvas, int w, int h) {
        if (!(getParent() instanceof ViewGroup)) return;
        ViewGroup parent = (ViewGroup) getParent();
        int index = parent.indexOfChild(this);
        if (index <= 0) return;

        if (backdrop == null) {
            backdrop = new RenderNode("LiquidGlassEdgeBlur");
            blur = RenderEffect.createBlurEffect(blurRadiusPx, blurRadiusPx, Shader.TileMode.CLAMP);
        }

        float originX = getLeft() + getTranslationX();
        float originY = getTop() + getTranslationY();
        backdrop.setPosition(0, 0, w, h);
        RecordingCanvas rc = backdrop.beginRecording(w, h);
        try {
            rc.drawColor(dark ? Color.BLACK : Color.WHITE);
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
        } finally {
            backdrop.endRecording();
        }
        backdrop.setRenderEffect(blur);

        // Fade the blurred copy in from the top so the blur ramps up progressively.
        int layer = canvas.saveLayer(0, 0, w, h, null);
        canvas.drawRenderNode(backdrop);
        canvas.drawRect(0, 0, w, h, maskPaint);
        canvas.restoreToCount(layer);
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
