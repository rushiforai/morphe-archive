package android.view;
import android.graphics.drawable.Drawable;
public abstract class Window {
    public abstract View getDecorView();
    public abstract void addFlags(int flags);
    public abstract void clearFlags(int flags);
    public abstract void setStatusBarColor(int color);
    public abstract void setNavigationBarColor(int color);
    public abstract void setBackgroundDrawable(Drawable drawable);
    public WindowInsetsController getInsetsController() { throw new RuntimeException(); }
}
