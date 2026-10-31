package app.fblite.research;

import android.content.Context;

import java.io.File;
import java.io.FileWriter;
import java.lang.reflect.Method;

/**
 * Loads the replacement X.0eF from the APK dex before the secondary dex exists.
 *
 * X.09K (the app's class loader) searches its dex files most recently used first, so once the secondary
 * dex has served a class it is searched before the APK dex and the original X.0eF would win. Loading the
 * class at the start of attachBaseContext defines it in the PathClassLoader, and later lookups reuse it.
 */
public final class Preload {
    private static final String DEBUG_DIR = "/storage/emulated/0/Android/data/com.facebook.lite/cache/";

    public static void run(Context context) {
        String result;
        try {
            Class<?> c = Class.forName("X.0eF", false, Preload.class.getClassLoader());
            boolean replaced = false;
            for (Method m : c.getDeclaredMethods()) {
                if (m.getName().equals("drawChar")) replaced = true;
            }
            result = "preload X.0eF replaced=" + replaced + " loader=" + c.getClassLoader();
        } catch (Throwable t) {
            result = "preload failed: " + t;
        }
        android.util.Log.i("FbLiteSysFont", result);
        try {
            new File(DEBUG_DIR).mkdirs();
            FileWriter w = new FileWriter(DEBUG_DIR + "fblite-sysfont.txt", true);
            w.write(System.currentTimeMillis() + " " + result + "\n");
            w.close();
        } catch (Throwable ignored) {
        }
    }
}
