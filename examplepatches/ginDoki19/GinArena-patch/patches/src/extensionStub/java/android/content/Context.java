package android.content;

import android.content.res.Resources;
import java.io.File;

public abstract class Context {
    public abstract Resources getResources();
    public abstract String getPackageName();

    public Context getApplicationContext() { throw new RuntimeException(); }
    public File getFilesDir() { throw new RuntimeException(); }
    public SharedPreferences getSharedPreferences(String name, int mode) { throw new RuntimeException(); }
    public Object getSystemService(String name) { throw new RuntimeException(); }
    public void sendBroadcast(Intent intent) { throw new RuntimeException(); }
}
