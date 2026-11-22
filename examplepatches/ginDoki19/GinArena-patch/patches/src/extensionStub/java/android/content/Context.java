package android.content;

import android.content.pm.PackageManager;
import android.content.res.Resources;
import java.io.File;

/**
 * Lab stub: adds getPackageManager() to the shared Context stub.
 *
 * Everything else is copied verbatim from patch-source's stub so the two cannot drift apart in
 * ways that matter; this file exists only because the base class has to declare a method before
 * an extension may call it.
 */
public abstract class Context {
    public abstract Resources getResources();
    public abstract String getPackageName();

    public Context getApplicationContext() { throw new RuntimeException(); }
    public File getFilesDir() { throw new RuntimeException(); }
    public SharedPreferences getSharedPreferences(String name, int mode) { throw new RuntimeException(); }
    public Object getSystemService(String name) { throw new RuntimeException(); }
    public void sendBroadcast(Intent intent) { throw new RuntimeException(); }
    public PackageManager getPackageManager() { throw new RuntimeException(); }
}
