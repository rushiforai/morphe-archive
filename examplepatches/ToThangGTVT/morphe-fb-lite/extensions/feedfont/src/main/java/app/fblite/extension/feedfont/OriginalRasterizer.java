package app.fblite.extension.feedfont;

import android.os.SystemClock;
import android.util.Log;

import java.io.File;
import java.io.FileWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.LinkedHashSet;
import java.util.Set;

import dalvik.system.DexFile;
import dalvik.system.PathClassLoader;

/**
 * The app's own glyph rasterizer, used for icons and characters the system font cannot draw.
 *
 * The replacement takes the name X.0eF, so the original is loaded again from the app's secondary dex,
 * in a PathClassLoader whose parent hides only X.0eF. Every other class it uses resolves through the
 * app's class loader, so it shares the atlas classes with the rest of the app.
 *
 * The secondary dex is unpacked either as one prog-hash.dex per dex (first launch) or as a z-sha.zip,
 * so candidates come both from the app's class loader and from its dex directory. Loading is retried
 * for a while, since the first glyphs can be drawn before the secondary dex is complete.
 */
public final class OriginalRasterizer {
    private static final String TAG = "FbLiteFeedFont";
    private static final String RASTERIZER = "X.0eF";
    private static final long RETRY_INTERVAL_MS = 2000;
    private static final int MAX_ATTEMPTS = 30;

    /** Creating this file turns on a debug log next to it. ColorOS hides app logs from logcat. */
    private static final String DEBUG_DIR = "/storage/emulated/0/Android/data/com.facebook.lite/cache/";
    private static final boolean DEBUG = new File(DEBUG_DIR + "fblite-feedfont-debug").exists();

    static String dataDir;

    private static Constructor<?> constructor;
    private static Method rasterize;
    private static int attempts;
    private static long lastAttempt;

    private final Object instance;

    private OriginalRasterizer(Object instance) {
        this.instance = instance;
    }

    /** Creates the original rasterizer with the same constructor arguments, or returns null if not available yet. */
    public static synchronized OriginalRasterizer create(Object[] args) {
        if (!load()) return null;
        try {
            return new OriginalRasterizer(constructor.newInstance(args));
        } catch (Throwable t) {
            log("Could not create the original rasterizer", t);
            return null;
        }
    }

    /** Returns the X.1In the original A03 returns, or null. */
    public Object rasterize(byte[] data, char c) {
        try {
            return rasterize.invoke(instance, data, c);
        } catch (Throwable t) {
            log("Original rasterizer failed for U+" + Integer.toHexString(c), t);
            return null;
        }
    }

    private static boolean load() {
        if (constructor != null) return true;
        if (attempts >= MAX_ATTEMPTS) return false;
        long now = SystemClock.uptimeMillis();
        if (attempts > 0 && now - lastAttempt < RETRY_INTERVAL_MS) return false;
        attempts++;
        lastAttempt = now;

        final ClassLoader app = OriginalRasterizer.class.getClassLoader();
        ClassLoader hideReplacement = new ClassLoader(app) {
            @Override
            protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
                if (name.equals(RASTERIZER)) throw new ClassNotFoundException(name);
                return super.loadClass(name, resolve);
            }
        };

        for (String path : candidates(app)) {
            try {
                Class<?> original = new PathClassLoader(path, hideReplacement).loadClass(RASTERIZER);
                Class<?> atlasHolder = Class.forName("X.0e1", false, app);
                Class<?> windowManager = Class.forName("com.moblica.common.xmob.ui.WindowManager", false, app);
                Constructor<?> ctor = original.getConstructor(atlasHolder, windowManager, int.class, int.class,
                        int.class, int.class, boolean.class, boolean.class, boolean.class);
                rasterize = original.getMethod("A03", byte[].class, char.class);
                constructor = ctor;
                log("Original rasterizer loaded from " + path + " (attempt " + attempts + ")", null);
                return true;
            } catch (ClassNotFoundException e) {
                // Not in this dex.
            } catch (Throwable t) {
                log("Could not load the original rasterizer from " + path, t);
            }
        }
        log("Original rasterizer not found (attempt " + attempts + ")", null);
        return false;
    }

    /** Secondary dex files the app has loaded, then any others in its dex directory. */
    private static Set<String> candidates(ClassLoader app) {
        Set<String> paths = new LinkedHashSet<>();
        try {
            // X.09K is the app's class loader. A0A is its instance, A02 its dex files (null slots included).
            Class<?> loaderClass = Class.forName("X.09K", false, app);
            Object loader = loaderClass.getField("A0A").get(null);
            if (loader != null) {
                for (DexFile dex : (DexFile[]) loaderClass.getField("A02").get(loader)) {
                    if (dex != null && !dex.getName().endsWith(".apk")) paths.add(dex.getName());
                }
            }
        } catch (Throwable t) {
            log("Could not read the app's dex files", t);
        }
        if (dataDir != null) {
            File[] files = new File(dataDir, "dex").listFiles();
            if (files != null) {
                for (File file : files) {
                    String name = file.getName();
                    // The app makes a dex read-only once it is complete; Android refuses writable ones.
                    if ((name.endsWith(".dex") || name.endsWith(".zip")) && !file.canWrite()) {
                        paths.add(file.getAbsolutePath());
                    }
                }
            }
        }
        return paths;
    }

    /** Whether loading the original has been given up for good. */
    public static synchronized boolean unavailable() {
        return constructor == null && attempts >= MAX_ATTEMPTS;
    }

    /** Writes to the debug log when it is turned on. */
    public static void debug(String message) {
        log(message, null);
    }

    private static void log(String message, Throwable t) {
        if (t != null) Log.e(TAG, message, t);
        if (!DEBUG) return;
        try {
            FileWriter writer = new FileWriter(DEBUG_DIR + "fblite-feedfont.log", true);
            writer.write(System.currentTimeMillis() + " " + message + (t != null ? ": " + Log.getStackTraceString(t) : "") + "\n");
            writer.close();
        } catch (Throwable ignored) {
        }
    }
}
