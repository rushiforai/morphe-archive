package app.voidhack.extension.applemusic;

import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
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
    float center;
    float selectionWidth;
    float press;
    float engagement;
    float parallax;
    float deformation;
    boolean dark;
    private int opacity = 255;
    private Rect transitionBounds;
    private float transitionRadius;

    GlassDrawable(View navigation, LiquidGlass.Backdrop backdrop) {
        this.backdrop = backdrop;
        density = navigation.getResources().getDisplayMetrics().density;
        dark = (navigation.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    @Override public void draw(Canvas canvas) {
        capsule.set(transitionBounds == null ? getBounds() : transitionBounds);
        if (capsule.isEmpty() || opacity == 0) return;
        float radius = transitionBounds == null ? Math.min(capsule.width(), capsule.height()) / 2f : transitionRadius;
        boolean drawn = backdrop != null && backdrop.draw(canvas, capsule, radius, dark, parallax, engagement, opacity);
        paint.setStyle(Paint.Style.FILL);
        if (!drawn) {
            paint.setColor(dark ? SURFACE_DARK : SURFACE_LIGHT);
            paint.setAlpha(MATERIAL_ALPHA * opacity / 255);
            canvas.drawRoundRect(capsule, radius, radius, paint);
            if (engagement > 0f) {
                paint.setColor(dark ? Color.WHITE : Color.BLACK);
                paint.setAlpha((int) (opacity * (dark ? 0.07f : 0.035f) * engagement));
                canvas.drawRoundRect(capsule, radius, radius, paint);
            }
        }
        float inset = INSET_DP * density;
        if (selectionWidth > 0f && capsule.width() > 2f * inset && capsule.height() > 2f * inset) {
            float width = Math.min(capsule.width() - inset * 2, selectionWidth);
            float left = Math.max(inset, Math.min(capsule.width() - inset - width, center - width / 2f));
            selection.set(capsule.left + left, capsule.top + inset, capsule.left + left + width,
                    capsule.bottom - inset);
            paint.setColor(dark ? Color.WHITE : Color.BLACK);
            float selectionAlpha = drawn ? (dark ? 0.075f : 0.045f) * (1f - press) : 0.10f;
            paint.setAlpha(Math.round(opacity * selectionAlpha));
            canvas.drawRoundRect(selection, selection.height() / 2f, selection.height() / 2f, paint);
        }
        if (drawn) return;

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
    }

    @Override public void getOutline(Outline outline) {
        if (transitionBounds == null) outline.setRoundRect(getBounds(), getBounds().height() / 2f);
        else outline.setEmpty();
    }
    void setTransitionShape(Rect bounds, float radius) {
        if (transitionBounds == null) transitionBounds = new Rect();
        if (transitionBounds.equals(bounds) && transitionRadius == radius) return;
        transitionBounds.set(bounds);
        transitionRadius = radius;
        invalidateSelf();
    }

    @Override public void setAlpha(int alpha) {
        if (opacity == alpha) return;
        opacity = alpha;
        invalidateSelf();
    }
    @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); invalidateSelf(); }
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
}
