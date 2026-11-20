package app.southstar21.extension.instagram.liquidglass;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;

/**
 * A small piece of glass on the share sheet: the search field (a capsule) and the round
 * share action buttons. The panel behind it is already blurred glass, so this is a light
 * translucent fill with a fine rim lit from the top, and a little brighter while pressed.
 * Fully rounded: a square view gives a circle.
 */
final class ShareCapsuleDrawable extends Drawable implements Drawable.Callback {
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint rim = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();
    private final Matrix matrix = new Matrix();
    private final float stroke;
    private final Rect insets;
    private LinearGradient rimShader;
    private boolean rimDark;
    private boolean dark;
    private boolean pressed;

    /** @param insets where the replaced background drew its shape inside the view */
    ShareCapsuleDrawable(float density, boolean dark, Rect insets) {
        this.insets = new Rect(insets);
        this.dark = dark;
        stroke = Math.max(1f, 0.7f * density);
        rim.setStyle(Paint.Style.STROKE);
        rim.setStrokeWidth(stroke);
    }

    /**
     * The background this capsule replaced, drawn instead whenever Instagram gives it a color
     * (it colors the discs of some apps' buttons after they are shown), or null.
     */
    private Drawable original;

    void setOriginal(Drawable original) {
        this.original = original;
        if (original != null) original.setCallback(this);
    }

    @Override
    public void invalidateDrawable(Drawable who) {
        invalidateSelf();
    }

    @Override
    public void scheduleDrawable(Drawable who, Runnable what, long when) {
        scheduleSelf(what, when);
    }

    @Override
    public void unscheduleDrawable(Drawable who, Runnable what) {
        unscheduleSelf(what);
    }

    void setDark(boolean dark) {
        if (this.dark == dark) return;
        this.dark = dark;
        invalidateSelf();
    }

    @Override
    public boolean isStateful() {
        return true;
    }

    @Override
    protected boolean onStateChange(int[] state) {
        boolean now = false;
        for (int s : state) {
            if (s == android.R.attr.state_pressed) now = true;
        }
        if (now == pressed) return false;
        pressed = now;
        invalidateSelf();
        return true;
    }

    @Override
    public void draw(Canvas canvas) {
        Rect b = getBounds();
        if (b.isEmpty()) return;
        if (original != null && (colored || !ShareSheetGlass.isGrey(original))) {
            original.setBounds(b);
            original.draw(canvas);
            return;
        }
        float r;
        int fillColor = dark
                ? Color.argb(pressed ? 0x40 : 0x26, 0xFF, 0xFF, 0xFF)
                : Color.argb(pressed ? 0x30 : 0x18, 0x00, 0x00, 0x00);
        fill.setColor(fillColor);
        float left = b.left + insets.left, right = b.right - insets.right;
        float top = b.top + insets.top, bottom = b.bottom - insets.bottom;
        if (right <= left || bottom <= top) return;
        r = Math.min(right - left, bottom - top) / 2f;
        rect.set(left, top, right, bottom);
        canvas.drawRoundRect(rect, r, r, fill);

        if (rimShader == null || rimDark != dark) {
            rimDark = dark;
            int rimTop = dark ? Color.argb(0x60, 0xFF, 0xFF, 0xFF) : Color.argb(0xF0, 0xFF, 0xFF, 0xFF);
            int mid = dark ? Color.argb(0x14, 0xFF, 0xFF, 0xFF) : Color.argb(0x60, 0xFF, 0xFF, 0xFF);
            int rimBottom = dark ? Color.argb(0x4A, 0xFF, 0xFF, 0xFF) : Color.argb(0xC0, 0xFF, 0xFF, 0xFF);
            rimShader = new LinearGradient(0, 0, 0, 1, new int[]{rimTop, mid, rimBottom},
                    new float[]{0f, 0.5f, 1f}, Shader.TileMode.CLAMP);
            rim.setShader(rimShader);
        }
        matrix.setScale(1f, bottom - top);
        matrix.postTranslate(0f, top);
        rimShader.setLocalMatrix(matrix);
        float half = stroke / 2f;
        rect.set(left + half, top + half, right - half, bottom - half);
        canvas.drawRoundRect(rect, r - half, r - half, rim);
    }

    @Override
    public void setAlpha(int alpha) {
    }

    /** Instagram colored the disc (with a tint or a color filter): the original shows instead. */
    private boolean colored;

    @Override
    public void setColorFilter(ColorFilter colorFilter) {
        if (original == null) return;
        original.setColorFilter(colorFilter);
        colored = colorFilter != null;
        invalidateSelf();
    }

    @Override
    public void setTintList(android.content.res.ColorStateList tint) {
        if (original == null) return;
        original.setTintList(tint);
        colored = tint != null && !ShareSheetGlass.isGreyTint(tint);
        invalidateSelf();
    }

    @Override
    public void setTintBlendMode(android.graphics.BlendMode mode) {
        if (original != null) original.setTintBlendMode(mode);
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }

    @Override
    public boolean getPadding(Rect padding) {
        padding.set(0, 0, 0, 0);
        return false;
    }
}
