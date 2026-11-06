/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 *
 * The rim parameters follow Highlight.Default of Backdrop by Kyant (Apache License 2.0):
 * https://github.com/Kyant0/AndroidLiquidGlass
 */
package app.liquidmusic.extension;

import android.annotation.TargetApi;
import android.graphics.BlendMode;
import android.graphics.BlurMaskFilter;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RuntimeShader;
import android.graphics.drawable.Drawable;
import android.os.Build;

/**
 * The specular rim of the glass: a thin light along the edge of a rounded rectangle, brightest
 * where the edge faces the light (45 degrees), added to what is below with BlendMode.PLUS.
 * <p>
 * It is a Drawable so it can sit in the overlay of the view drawn over the glass (the tab bar
 * and the mini player draw a translucent tint over the BlurView, which would dim a rim drawn
 * under it). It draws the rounded rectangle of its bounds.
 */
@TargetApi(Build.VERSION_CODES.S)
final class GlassRim extends Drawable {

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path = new Path();
    private final RectF rect = new RectF();
    private final float strokeWidth;
    private int intensityPercent;
    private RuntimeShader shader;
    private float cornerRadius = Float.MAX_VALUE;

    GlassRim(float density, int intensityPercent) {
        this.intensityPercent = intensityPercent;
        // 0.5dp inside the edge: the stroke is centered on the path and clipped to the shape.
        strokeWidth = (float) Math.ceil(0.5f * density) * 2f;
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(strokeWidth);
        paint.setBlendMode(BlendMode.PLUS);
        paint.setMaskFilter(new BlurMaskFilter(Math.max(0.25f * density, 0.5f), BlurMaskFilter.Blur.NORMAL));
    }

    /** Intensity of the light, in percent of Backdrop's default rim. */
    void setIntensity(int percent) {
        if (percent != intensityPercent) {
            intensityPercent = percent;
            invalidateSelf();
        }
    }

    /** Corner radius of the shape; larger values are clamped to a capsule. */
    void setCornerRadius(float radius) {
        if (radius != cornerRadius) {
            cornerRadius = radius;
            invalidateSelf();
        }
    }

    @Override
    public void draw(Canvas canvas) {
        final Rect bounds = getBounds();
        final float width = bounds.width();
        final float height = bounds.height();
        if (width <= 0f || height <= 0f || intensityPercent <= 0) return;

        final float radius = Math.min(cornerRadius, Math.min(width, height) / 2f);
        rect.set(0f, 0f, width, height);
        path.rewind();
        path.addRoundRect(rect, radius, radius, Path.Direction.CW);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            paint.setShader(shader(width, height, radius));
            paint.setColor(Color.argb(Math.round(0.5f * 255 * intensityPercent / 100f), 255, 255, 255));
        } else {
            // No RuntimeShader on Android 12: an even rim, a little dimmer.
            paint.setShader(null);
            paint.setColor(Color.argb(Math.round(0.38f * 255 * intensityPercent / 100f), 255, 255, 255));
        }

        final int save = canvas.save();
        canvas.translate(bounds.left, bounds.top);
        canvas.clipPath(path);
        canvas.drawPath(path, paint);
        canvas.restoreToCount(save);
    }

    @TargetApi(Build.VERSION_CODES.TIRAMISU)
    private RuntimeShader shader(float width, float height, float radius) {
        if (shader == null) {
            shader = new RuntimeShader(GlassShaders.HIGHLIGHT);
            shader.setColorUniform("color", Color.WHITE);
            shader.setFloatUniform("angle", (float) Math.toRadians(45));
            shader.setFloatUniform("falloff", 1f);
        }
        shader.setFloatUniform("size", width, height);
        shader.setFloatUniform("cornerRadii", radius, radius, radius, radius);
        return shader;
    }

    @Override
    public void setAlpha(int alpha) {
        // The intensity comes from the patch option.
    }

    @Override
    public void setColorFilter(ColorFilter colorFilter) {
        // Not supported.
    }

    @Override
    @SuppressWarnings("deprecation")
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }
}
