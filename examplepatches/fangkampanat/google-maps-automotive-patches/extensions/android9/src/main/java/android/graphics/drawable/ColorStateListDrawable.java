package android.graphics.drawable;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;

/**
 * Android 10's ColorStateListDrawable for Android 9, where the class does not exist (patch "Android 9 (API 28)").
 * Loaded only on Android 9 (classes load parent first). Android 9 never hands one out, so Maps' instance-of checks
 * see false; the class draws its current color if Maps makes one.
 */
public class ColorStateListDrawable extends Drawable {
    private final Paint paint = new Paint();
    private ColorStateList colorStateList;
    private int alpha = 255;

    public ColorStateListDrawable() {
        this(ColorStateList.valueOf(0));
    }

    public ColorStateListDrawable(ColorStateList colorStateList) {
        this.colorStateList = colorStateList;
    }

    public ColorStateList getColorStateList() {
        return colorStateList;
    }

    public void setColorStateList(ColorStateList colorStateList) {
        this.colorStateList = colorStateList;
        invalidateSelf();
    }

    @Override
    public void draw(Canvas canvas) {
        int color = colorStateList.getColorForState(getState(), colorStateList.getDefaultColor());
        paint.setColor(color);
        paint.setAlpha((color >>> 24) * alpha / 255);
        canvas.drawRect(getBounds(), paint);
    }

    @Override
    public boolean isStateful() {
        return colorStateList.isStateful();
    }

    @Override
    protected boolean onStateChange(int[] state) {
        return colorStateList.isStateful();
    }

    @Override
    public void setAlpha(int alpha) {
        this.alpha = alpha;
        invalidateSelf();
    }

    @Override
    public int getAlpha() {
        return alpha;
    }

    @Override
    public void setColorFilter(ColorFilter colorFilter) {
        paint.setColorFilter(colorFilter);
        invalidateSelf();
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }
}
