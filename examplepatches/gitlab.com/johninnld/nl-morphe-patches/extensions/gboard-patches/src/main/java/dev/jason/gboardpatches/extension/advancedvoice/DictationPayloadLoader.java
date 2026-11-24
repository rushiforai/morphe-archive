package dev.jason.gboardpatches.extension.advancedvoice;

import android.content.Context;
import android.os.Build;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;

/**
 * Loads the dictation formatter library that ships as an asset in the patched APK.
 *
 * Gboard expects `libdictation_jni.so` in its native library directory, but the patched APK cannot
 * carry it there: the target says `extractNativeLibs=false`, and the packager deflates anything a
 * patch adds to `lib/<abi>`, which the linker then refuses to map. The library therefore travels as
 * an asset and is extracted to the app's own lib directory before being loaded, the same pattern
 * Gboard uses for its own extracted libraries (hos).
 *
 * {@link #overrideInt(String, boolean)} is injected at the top of NativeLibHelper.c so the stock
 * readiness check sees the library as present once it loaded.
 */
public final class DictationPayloadLoader {
    private static final String TAG = "GboardPatches";
    private static final String LIBRARY = "dictation_jni";
    private static final String ASSET_ROOT = "dictation";
    private static volatile Boolean loaded;

    private DictationPayloadLoader() {
    }

    /**
     * Points Gboard's own readiness check at the already-loaded shared object.
     *
     * NativeLibHelper keeps a name alias map (`c`) consulted by `c(name, ...)`; mapping
     * `dictation_jni` to `integrated_shared_object` makes that check call
     * loadIntegratedSharedObjectLibrary(), which returns true, instead of failing on a library
     * that cannot exist in the APK's lib directory. The formatter's JNI symbols are already
     * registered by the System.load above, so native calls resolve normally.
     */
    private static void installReadinessAlias() throws Exception {
        ClassLoader loader = DictationPayloadLoader.class.getClassLoader();
        Class<?> aubj = Class.forName("aubj", false, loader);
        java.util.Map<String, String> aliases = new java.util.HashMap<String, String>();
        aliases.put(LIBRARY, "integrated_shared_object");
        Object map = aubj.getMethod("i", java.util.Map.class).invoke(null, aliases);
        Class<?> helper = Class.forName(
                "com.google.android.libraries.inputmethod.nativelib.NativeLibHelper",
                false,
                loader);
        java.lang.reflect.Field field = helper.getDeclaredField("c");
        field.setAccessible(true);
        field.set(null, map);
    }

    public static synchronized boolean ensureLoaded() {
        Boolean cached = loaded;
        if (cached != null) {
            return cached.booleanValue();
        }
        boolean result = false;
        try {
            Context context = GboardFlagRuntimeContext.resolveContext();
            if (context != null) {
                result = extractAndLoad(context);
            }
        } catch (Throwable failure) {
            Log.w(TAG, "dictation payload load failed", failure);
        }
        loaded = Boolean.valueOf(result);
        Log.i(TAG, "dictation payload loaded=" + result);
        return result;
    }

    private static boolean extractAndLoad(Context context) throws Exception {
        String abi = preferredAbi();
        String asset = ASSET_ROOT + "/" + abi + "/lib" + LIBRARY + ".so";
        File directory = context.getDir("lib", Context.MODE_PRIVATE);
        File target = new File(directory, "lib" + LIBRARY + ".so");
        if (!target.exists() || target.length() == 0L) {
            try (InputStream input = context.getAssets().open(asset);
                 FileOutputStream output = new FileOutputStream(target)) {
                byte[] buffer = new byte[64 * 1024];
                int read;
                while ((read = input.read(buffer)) != -1) {
                    output.write(buffer, 0, read);
                }
            }
        }
        try {
            // Android refuses to dlopen a writable file ("Attempt to load writable file"); Gboard's
            // own loader marks extracted libraries read-only first (NativeLibHelper.d).
            target.setReadOnly();
            System.load(target.getAbsolutePath());
            installReadinessAlias();
            return true;
        } catch (Throwable failure) {
            Log.w(TAG, "System.load(" + target + ") failed", failure);
        }
        try {
            System.loadLibrary(LIBRARY);
            return true;
        } catch (Throwable failure) {
            Log.w(TAG, "loadLibrary(" + LIBRARY + ") failed", failure);
        }
        return false;
    }

    private static String preferredAbi() {
        try {
            for (String abi : Build.SUPPORTED_ABIS) {
                if ("arm64-v8a".equals(abi) || "armeabi-v7a".equals(abi)) {
                    return abi;
                }
            }
        } catch (Throwable ignored) {
            // Fall through to the shipped default.
        }
        return "arm64-v8a";
    }
}
