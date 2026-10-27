package androidx.appcompat.widget;
import android.graphics.drawable.Drawable;
import android.view.Menu;
import android.view.ViewGroup;
public class Toolbar extends ViewGroup {
    public Menu getMenu() { throw new RuntimeException(); }
    public Drawable getNavigationIcon() { throw new RuntimeException(); }
    public void setNavigationIcon(Drawable icon) {}
    public Drawable getOverflowIcon() { throw new RuntimeException(); }
    public void setOverflowIcon(Drawable icon) {}
    public void setTitleTextColor(int color) {}
    public void setSubtitleTextColor(int color) {}
}
