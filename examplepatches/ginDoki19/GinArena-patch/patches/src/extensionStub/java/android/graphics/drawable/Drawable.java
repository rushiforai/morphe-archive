package android.graphics.drawable;
import android.content.res.Resources;
import android.graphics.ColorFilter;
public abstract class Drawable {
    public static abstract class ConstantState {
        public abstract Drawable newDrawable();
        public Drawable newDrawable(Resources res) { throw new RuntimeException(); }
    }
    public Drawable mutate() { throw new RuntimeException(); }
    public abstract void setColorFilter(ColorFilter colorFilter);
    public ColorFilter getColorFilter() { throw new RuntimeException(); }
    public void invalidateSelf() {}
    public ConstantState getConstantState() { throw new RuntimeException(); }
    public int getIntrinsicWidth() { throw new RuntimeException(); }
    public int getIntrinsicHeight() { throw new RuntimeException(); }
}
