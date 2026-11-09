package app.voidhack.extension.applemusic;

import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.view.View;

final class GlassDrawable extends Drawable {
    static final float INSET_DP = 4f;
    static final int MATERIAL_ALPHA = 102;
    static final int SURFACE_DARK = 0xff686869;
    static final int SURFACE_LIGHT = 0xfff5f5f7;
    final LiquidGlass.Backdrop backdrop;
    final float density;
    final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    final RectF capsule = new RectF();
    final RectF selection = new RectF();
    final Path clip = new Path();
    float center;
    float selectionWidth;
    float press;
    float engagement;
    float parallax;
    float deformation;
    boolean dark;
    private int opacity = 255;

    GlassDrawable(View navigation, LiquidGlass.Backdrop backdrop) {
        this.backdrop = backdrop;
        density = navigation.getResources().getDisplayMetrics().density;
        dark = (navigation.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    @Override public void draw(Canvas canvas) {
        capsule.set(getBounds());
        if (capsule.isEmpty()) return;
        float radius = capsule.height() / 2f;
        clip.rewind();
        clip.addRoundRect(capsule, radius, radius, Path.Direction.CW);
        int save = canvas.save();
        canvas.clipPath(clip);
        if (backdrop != null) backdrop.draw(canvas, capsule, dark, parallax);
        paint.setStyle(Paint.Style.FILL);
        paint.setShader(null);
        paint.setColor(dark ? SURFACE_DARK : SURFACE_LIGHT);
        paint.setAlpha(MATERIAL_ALPHA * opacity / 255);
        canvas.drawRoundRect(capsule, radius, radius, paint);
        if (engagement > 0f) {
            paint.setColor(dark ? Color.WHITE : Color.BLACK);
            paint.setAlpha((int) (opacity * (dark ? 0.07f : 0.035f) * engagement));
            canvas.drawRoundRect(capsule, radius, radius, paint);
        }
        if (selectionWidth > 0f) {
            float inset = INSET_DP * density;
            float width = Math.min(capsule.width() - inset * 2, selectionWidth);
            float left = Math.max(inset, Math.min(capsule.width() - inset - width, center - width / 2f));
            selection.set(left, inset, left + width, capsule.height() - inset);
            paint.setColor(dark ? Color.WHITE : Color.BLACK);
            paint.setAlpha((int) (opacity * 0.10f * (backdrop == null ? 1f : 1f - press)));
            canvas.drawRoundRect(selection, selection.height() / 2f, selection.height() / 2f, paint);
        }
        selection.set(capsule);
        selection.inset(density / 2f, density / 2f);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(density);
        paint.setAlpha(opacity);
        paint.setShader(new LinearGradient(capsule.left, capsule.top, capsule.right, capsule.bottom,
                new int[]{dark ? 0x65ffffff : 0xc0ffffff, dark ? 0x16ffffff : 0x20000000, 0x40ffffff},
                new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
        canvas.drawRoundRect(selection, radius, radius, paint);
        paint.setShader(null);
        canvas.restoreToCount(save);
    }

    @Override public void getOutline(Outline outline) {
        outline.setRoundRect(getBounds(), getBounds().height() / 2f);
    }
    @Override public void setAlpha(int alpha) { opacity = alpha; invalidateSelf(); }
    @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); invalidateSelf(); }
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
}
