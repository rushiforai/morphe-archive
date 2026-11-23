package app.zonghome.extension;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;

/** Gives an icon a stable intrinsic size without changing its button's dimensions. */
final class SizedIcon extends Drawable implements Drawable.Callback {
    private final Drawable source;
    private final int size;
    private float outline;
    private SizedIcon(Drawable source, int size) {
        this.source = source.mutate();
        this.size = size;
        this.source.setCallback(this);
    }
    static Drawable wrap(Drawable source, int size) {
        if (source == null || source instanceof SizedIcon) return source;
        return new SizedIcon(source, size);
    }
    static Drawable bold(Drawable source,int size,float outline) {
        Drawable result=wrap(source,size);
        if(result instanceof SizedIcon)((SizedIcon)result).outline=outline;
        return result;
    }
    @Override public int getIntrinsicWidth() { return size; }
    @Override public int getIntrinsicHeight() { return size; }
    @Override public void draw(Canvas canvas) {
        source.setBounds(getBounds());
        if(outline>0) {
            drawOffset(canvas,-outline,0);drawOffset(canvas,outline,0);
            drawOffset(canvas,0,-outline);drawOffset(canvas,0,outline);
        }
        source.draw(canvas);
    }
    private void drawOffset(Canvas canvas,float x,float y) {
        int save=canvas.save();canvas.translate(x,y);source.draw(canvas);canvas.restoreToCount(save);
    }
    @Override public void setAlpha(int alpha) { source.setAlpha(alpha); }
    @Override public void setColorFilter(ColorFilter filter) { source.setColorFilter(filter); }
    @Override public void setTint(int color) { source.setTint(color); }
    @Override public void setTintList(ColorStateList tint) { source.setTintList(tint); }
    @Override public void setTintMode(PorterDuff.Mode mode) { source.setTintMode(mode); }
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    @Override public boolean isStateful() { return source.isStateful(); }
    @Override protected boolean onStateChange(int[] state) { return source.setState(state); }
    @Override public void invalidateDrawable(Drawable drawable) { invalidateSelf(); }
    @Override public void scheduleDrawable(Drawable drawable, Runnable task, long when) { scheduleSelf(task, when); }
    @Override public void unscheduleDrawable(Drawable drawable, Runnable task) { unscheduleSelf(task); }
}
