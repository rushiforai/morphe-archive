package android.app;

import android.content.ContextWrapper;
import android.view.View;
import android.view.Window;

public class Activity extends ContextWrapper {
    public Window getWindow() { throw new RuntimeException(); }
    public <T extends View> T findViewById(int id) { throw new RuntimeException(); }
    public boolean isFinishing() { throw new RuntimeException(); }
    public boolean isDestroyed() { throw new RuntimeException(); }
    public void runOnUiThread(Runnable action) { throw new RuntimeException(); }
    public boolean moveTaskToBack(boolean nonRoot) { throw new RuntimeException(); }
}
