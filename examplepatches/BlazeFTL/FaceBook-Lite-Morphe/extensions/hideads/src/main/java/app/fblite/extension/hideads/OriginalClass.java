package app.fblite.extension.hideads;

import android.util.Log;

import java.io.File;
import java.util.LinkedHashSet;
import java.util.Set;

import dalvik.system.DexFile;
import dalvik.system.PathClassLoader;

/**
 * Loads the original of a class this extension replaces, from the app's own secondary dex, in a
 * PathClassLoader whose parent hides only that class name. Every other class it uses resolves through
 * the app's class loader.
 */
final class OriginalClass {
    static final String TAG = "FbLiteHideAds";

    static String dataDir;

    private OriginalClass() {
    }

    static Class<?> load(final String name) {
        final ClassLoader app = OriginalClass.class.getClassLoader();
        ClassLoader hideReplacement = new ClassLoader(app) {
            @Override
            protected Class<?> loadClass(String className, boolean resolve) throws ClassNotFoundException {
                if (className.equals(name)) throw new ClassNotFoundException(className);
                return super.loadClass(className, resolve);
            }
        };
        for (String path : candidates(app)) {
            try {
                return new PathClassLoader(path, hideReplacement).loadClass(name);
            } catch (ClassNotFoundException e) {
                // Not in this dex.
            } catch (Throwable t) {
                Log.e(TAG, "Could not load " + name + " from " + path, t);
            }
        }
        return null;
    }

    /** The app's class loader class, its static instance field and its dex file array field, */
    private static final String[][] APP_LOADERS = {
            {"X.09V", "A08", "A01"},
    };

    /** Secondary dex files the app has loaded, then any others in its dex directory. */
    private static Set<String> candidates(ClassLoader app) {
        Set<String> paths = new LinkedHashSet<>();
        try {
            // The app's class loader, its static instance and its dex files (null slots included), by version:
            // 536.0.0.11.107: X.09V, A08, A01.
            for (String[] names : APP_LOADERS) {
                Class<?> loaderClass;
                try {
                    loaderClass = Class.forName(names[0], false, app);
                } catch (ClassNotFoundException e) {
                    continue;
                }
                if (!ClassLoader.class.isAssignableFrom(loaderClass)) continue;
                Object loader = loaderClass.getField(names[1]).get(null);
                if (loader == null) break;
                for (DexFile dex : (DexFile[]) loaderClass.getField(names[2]).get(loader)) {
                    if (dex != null && !dex.getName().endsWith(".apk")) paths.add(dex.getName());
                }
                break;
            }
        } catch (Throwable t) {
            Log.e(TAG, "Could not read the app's dex files", t);
        }
        if (dataDir != null) {
            File[] files = new File(dataDir, "dex").listFiles();
            if (files != null) {
                for (File file : files) {
                    String fileName = file.getName();
                    // The app makes a dex read-only once it is complete; Android refuses writable ones.
                    if ((fileName.endsWith(".dex") || fileName.endsWith(".zip")) && !file.canWrite()) {
                        paths.add(file.getAbsolutePath());
                    }
                }
            }
        }
        return paths;
    }
}
