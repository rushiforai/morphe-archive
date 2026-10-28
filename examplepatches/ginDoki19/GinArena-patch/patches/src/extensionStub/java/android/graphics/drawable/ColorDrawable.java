package android.graphics.drawable;
import android.graphics.ColorFilter;
public class ColorDrawable extends Drawable {
    public ColorDrawable(int color) {}
    public int getColor() { throw new RuntimeException(); }
    @Override public void setColorFilter(ColorFilter colorFilter) {}
}
