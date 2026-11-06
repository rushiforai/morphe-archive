package semicoloncolonel.mobilestream.extension.cnn;

import android.content.Context;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;

/**
 * Starts CNN's Optimizely client at once, from the datafile already on the
 * phone, instead of waiting for a fresh download.
 *
 * CNN's splash screen waits for Optimizely's asynchronous start, which
 * downloads a new datafile first. When that download is blocked or slow, the
 * SDK retries with waits of 2, 4 and 8 seconds before falling back to the
 * datafile bundled in the app, so the app takes about 14 seconds to open.
 *
 * Here the client is built from Optimizely's cached datafile (or the bundled
 * one when there is no cache), and handed to CNN's listener right away.
 * Building the client also starts Optimizely's usual background updates. The
 * SDK's methods are renamed in each build, so they are found by signature.
 * Anything unexpected falls back to CNN's own call.
 */
@SuppressWarnings("unused")
public final class OptimizelyQuickStart {
    private static final String TAG = "MSP-CNN";

    private OptimizelyQuickStart() {
    }

    /** Replaces OptimizelyManager.initialize(context, datafileRes, listener). */
    public static void start(Object manager, Context context, Integer datafileRes, Object listener) {
        try {
            if (startNow(manager, context, datafileRes, listener)) return;
        } catch (Throwable t) {
            Log.w(TAG, "quick start failed: " + t);
        }
        initializeAsync(manager, context, datafileRes, listener);
    }

    private static boolean startNow(Object manager, Context context, Integer datafileRes, Object listener) throws Exception {
        String datafile = cachedDatafile(context);
        if (datafile == null && datafileRes != null) datafile = rawResource(context, datafileRes);
        if (datafile == null || datafile.isEmpty()) return false;

        Method setListener = null;
        Method build = null;
        for (Method method : manager.getClass().getMethods()) {
            if (Modifier.isStatic(method.getModifiers()) || method.getReturnType() != void.class) continue;
            Class<?>[] p = method.getParameterTypes();
            if (p.length == 2 && p[1] == boolean.class && p[0].isInstance(listener)) setListener = method;
            if (p.length == 3 && p[0] == Context.class && p[2] == String.class && !p[1].isPrimitive()) build = method;
        }
        if (setListener == null || build == null) return false;

        setListener.invoke(manager, listener, true);
        build.invoke(manager, context, null, datafile);
        Log.i(TAG, "Optimizely started from the saved datafile");
        return true;
    }

    private static void initializeAsync(Object manager, Context context, Integer datafileRes, Object listener) {
        try {
            for (Method method : manager.getClass().getMethods()) {
                Class<?>[] p = method.getParameterTypes();
                if (p.length == 3 && p[0] == Context.class && p[1] == Integer.class && p[2].isInstance(listener)
                        && method.getReturnType() == void.class) {
                    method.invoke(manager, context, datafileRes, listener);
                    return;
                }
            }
            Log.e(TAG, "Optimizely initialize not found");
        } catch (Throwable t) {
            Log.e(TAG, "Optimizely initialize failed", t);
        }
    }

    /** The newest datafile Optimizely saved ("optly-data-file-<sdk key>.json"), or null. */
    private static String cachedDatafile(Context context) {
        File[] files = context.getFilesDir().listFiles();
        if (files == null) return null;
        File newest = null;
        for (File file : files) {
            if (file.getName().startsWith("optly-data-file-") && file.length() > 0
                    && (newest == null || file.lastModified() > newest.lastModified())) {
                newest = file;
            }
        }
        if (newest == null) return null;
        try (InputStream in = new FileInputStream(newest)) {
            return read(in);
        } catch (Throwable t) {
            return null;
        }
    }

    private static String rawResource(Context context, int id) {
        try (InputStream in = context.getResources().openRawResource(id)) {
            return read(in);
        } catch (Throwable t) {
            return null;
        }
    }

    private static String read(InputStream in) throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int n;
        while ((n = in.read(buffer)) != -1) out.write(buffer, 0, n);
        return new String(out.toByteArray(), StandardCharsets.UTF_8);
    }
}
