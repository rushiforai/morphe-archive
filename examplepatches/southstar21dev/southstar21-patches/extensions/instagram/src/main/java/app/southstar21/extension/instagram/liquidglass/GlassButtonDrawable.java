package app.southstar21.extension.instagram.liquidglass;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;

/**
 * Small Liquid Glass control background: a circle for icon buttons, a capsule for fields.
 * <p>
 * These sit on the frosted header band ({@link EdgeBlurView}), which already blurs what's
 * behind, so a translucent fill with a lit rim and a soft contact shadow reads as glass
 * without sampling the backdrop again.
 */
final class GlassButtonDrawable extends Drawable {
    private final float density;
    private final boolean capsule;
    /** Circle diameter in px, ignored for capsules. */
    private final float diameter;
    private boolean dark;
    /** 0 = hidden, 1 = fully shown; iOS only shows header glass once content is behind it. */
    private float reveal = 1f;

    private final RectF shape = new RectF();
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint rim = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint shadow = new Paint(Paint.ANTI_ALIAS_FLAG);

    static GlassButtonDrawable circle(float density, float diameterDp) {
        return new GlassButtonDrawable(density, false, diameterDp * density);
    }

    static GlassButtonDrawable capsule(float density) {
        return new GlassButtonDrawable(density, true, 0f);
    }

    private GlassButtonDrawable(float density, boolean capsule, float diameter) {
        this.density = density;
        this.capsule = capsule;
        this.diameter = diameter;
        rim.setStyle(Paint.Style.STROKE);
        rim.setStrokeWidth(Math.max(1f, 0.8f * density));
    }

    void setReveal(float reveal) {
        if (this.reveal == reveal) return;
        this.reveal = reveal;
        invalidateSelf();
    }

    void setDark(boolean dark) {
        if (this.dark == dark) return;
        this.dark = dark;
        invalidateSelf();
    }

    @Override
    protected void onBoundsChange(Rect bounds) {
        if (capsule) {
            shape.set(bounds);
        } else {
            float d = Math.min(diameter, Math.min(bounds.width(), bounds.height()) - 4 * density);
            shape.set(bounds.exactCenterX() - d / 2f, bounds.exactCenterY() - d / 2f,
                    bounds.exactCenterX() + d / 2f, bounds.exactCenterY() + d / 2f);
        }
    }

    @Override
    public void draw(Canvas canvas) {
        if (shape.isEmpty() || reveal <= 0.01f) return;
        float r = shape.height() / 2f;
        int layer = reveal < 0.99f
                ? canvas.saveLayerAlpha(getBounds().left, getBounds().top, getBounds().right, getBounds().bottom,
                Math.round(255 * reveal))
                : -1;

        // Soft contact shadow, a radial falloff rather than a shadow layer (those render hard).
        if (!capsule) {
            float sr = r + 4 * density;
            shadow.setShader(new RadialGradient(shape.centerX(), shape.centerY() + 1.5f * density, sr,
                    new int[]{Color.argb(dark ? 0x40 : 0x22, 0, 0, 0), Color.TRANSPARENT},
                    new float[]{r / sr, 1f}, Shader.TileMode.CLAMP));
            canvas.drawCircle(shape.centerX(), shape.centerY() + 1.5f * density, sr, shadow);
        }

        if (capsule) {
            // Fields sit on plain backgrounds too, so use iOS's grey fill to stay visible on white.
            fill.setColor(dark ? Color.argb(0x3D, 0x76, 0x76, 0x80) : Color.argb(0x1F, 0x76, 0x76, 0x80));
        } else {
            fill.setColor(dark ? Color.argb(0x2E, 0xFF, 0xFF, 0xFF) : Color.argb(0xA6, 0xFF, 0xFF, 0xFF));
        }
        canvas.drawRoundRect(shape, r, r, fill);

        int bright = dark ? Color.argb(0x5C, 0xFF, 0xFF, 0xFF) : Color.argb(0xF0, 0xFF, 0xFF, 0xFF);
        int faint = dark ? Color.argb(0x10, 0xFF, 0xFF, 0xFF) : Color.argb(0x30, 0xFF, 0xFF, 0xFF);
        int edge = dark ? Color.argb(0x30, 0xFF, 0xFF, 0xFF) : Color.argb(0x26, 0, 0, 0);
        rim.setShader(new LinearGradient(shape.left, shape.top, shape.right, shape.bottom,
                new int[]{bright, faint, edge}, new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
        float half = rim.getStrokeWidth() / 2f;
        canvas.drawRoundRect(shape.left + half, shape.top + half, shape.right - half, shape.bottom - half,
                r - half, r - half, rim);
        if (layer != -1) canvas.restoreToCount(layer);
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

    @Override
    public boolean getPadding(Rect padding) {
        padding.set(0, 0, 0, 0);
        return false;
    }
}
