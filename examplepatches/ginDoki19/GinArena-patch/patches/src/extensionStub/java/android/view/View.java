package android.view;
import android.content.Context;
import android.graphics.drawable.Drawable;
public class View {
    public Context getContext() { throw new RuntimeException(); }
    public int getId() { throw new RuntimeException(); }
    public Drawable getBackground() { throw new RuntimeException(); }
    public void setBackgroundColor(int color) {}
    public void setSystemUiVisibility(int visibility) {}
    public int getSystemUiVisibility() { throw new RuntimeException(); }
    public boolean post(Runnable action) { throw new RuntimeException(); }
}
