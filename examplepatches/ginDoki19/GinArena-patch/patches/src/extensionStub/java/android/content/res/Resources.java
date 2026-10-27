package android.content.res;
import android.graphics.drawable.Drawable;
import android.util.DisplayMetrics;
public class Resources {
    public static class NotFoundException extends RuntimeException {}
    public final class Theme {}
    public String getResourceEntryName(int resid) throws NotFoundException { throw new RuntimeException(); }
    public Drawable getDrawable(int id, Theme theme) throws NotFoundException { throw new RuntimeException(); }
    public int getColor(int id, Theme theme) throws NotFoundException { throw new RuntimeException(); }
    public ColorStateList getColorStateList(int id, Theme theme) throws NotFoundException { throw new RuntimeException(); }
    public DisplayMetrics getDisplayMetrics() { throw new RuntimeException(); }
}
