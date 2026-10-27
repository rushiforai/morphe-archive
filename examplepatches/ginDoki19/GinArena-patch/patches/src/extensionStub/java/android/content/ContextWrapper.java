package android.content;
import android.content.res.Resources;
public class ContextWrapper extends Context {
    public Context getBaseContext() { throw new RuntimeException(); }
    @Override public Resources getResources() { throw new RuntimeException(); }
}
