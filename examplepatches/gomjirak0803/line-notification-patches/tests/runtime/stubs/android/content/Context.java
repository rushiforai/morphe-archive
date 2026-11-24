package android.content;

import android.app.NotificationManager;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class Context {
    public static final int MODE_PRIVATE = 0;

    private final Resources resources = new Resources();
    private final PackageManager packageManager = new PackageManager();
    private final Map<String, SharedPreferences.InMemory> prefs = new HashMap<String, SharedPreferences.InMemory>();
    private final NotificationManager notificationManager = new NotificationManager();
    private File cacheDir;

    public Context getApplicationContext() { return this; }
    public String getPackageName() { return "jp.naver.line.android"; }
    public ClassLoader getClassLoader() { return Context.class.getClassLoader(); }
    public Resources getResources() { return resources; }
    public PackageManager getPackageManager() { return packageManager; }

    public synchronized SharedPreferences getSharedPreferences(String name, int mode) {
        SharedPreferences.InMemory p = prefs.get(name);
        if (p == null) {
            p = new SharedPreferences.InMemory();
            prefs.put(name, p);
        }
        return p;
    }

    @SuppressWarnings("unchecked")
    public <T> T getSystemService(Class<T> serviceClass) {
        if (serviceClass == NotificationManager.class) return (T) notificationManager;
        return null;
    }

    public File getDatabasePath(String name) { return new File(name); }

    public synchronized File getCacheDir() {
        if (cacheDir == null) {
            cacheDir = new File(System.getProperty("java.io.tmpdir"), "line-notify-test-cache");
        }
        return cacheDir;
    }

    public int getColor(int id) { return 0xFFFFFFFF; }
    public String getString(int resId) { return resources.getString(resId); }
    public CharSequence getText(int resId) { return resources.getText(resId); }

    public synchronized void resetForTest() {
        prefs.clear();
        notificationManager.resetForTest();
    }
}
