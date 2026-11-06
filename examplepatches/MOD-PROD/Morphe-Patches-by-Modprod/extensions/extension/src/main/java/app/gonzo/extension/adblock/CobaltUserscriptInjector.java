package app.gonzo.extension.adblock;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;

/**
 * Injects a JavaScript userscript into the YouTube TV web app running inside Cobalt.
 *
 * <p>Cobalt is not an Android WebView, so there is no {@code WebView.evaluateJavascript()}.
 * But the engine still contains Chromium's JS injection path:
 * <ul>
 *   <li>{@code CobaltActivity.getActiveWebContents()} returns the live page,</li>
 *   <li>its implementation keeps the native pointer in a {@code long} field,</li>
 *   <li>{@code org.jni_zero.GEN_JNI} still registers the native
 *       {@code ..._evaluateJavaScript(long, String, JavaScriptCallback)}.</li>
 * </ul>
 * Calling that native with the pointer runs the script in the page's main world, which is what
 * lets the script replace the page's own {@code JSON.parse} / {@code fetch}.
 *
 * <p>Everything is resolved by reflection and by shape, so a renamed field does not break it.
 *
 * <p>The script is loaded from {@code assets/tizentube-mod/adblock.user.js} (written by the patch,
 * easy to replace), with a small embedded fallback if the asset is missing.
 */
@SuppressWarnings("unused")
public final class CobaltUserscriptInjector {

    private static final String TAG = "TizenTubeMod";

    /** Asset written by the "Inject Adblocker Userscript" patch. Keep in sync with the Kotlin side. */
    private static final String USERSCRIPT_ASSET = "tizentube-mod/adblock.user.js";

    /** Poll interval while waiting for the page, and while re-injecting right after start. */
    private static final long FAST_INTERVAL_MS = 250L;
    /** Slower re-injection interval afterwards (new documents after navigations). */
    private static final long SLOW_INTERVAL_MS = 2000L;
    /** 240 x 250 ms = 60 s waiting for the first successful injection. */
    private static final int MAX_WAIT_ATTEMPTS = 240;
    /** 120 x 250 ms = 30 s of fast re-injection after the first success. */
    private static final int FAST_REINJECT_ATTEMPTS = 120;
    /** Total re-injections (~10 min). The script guards itself, so repeats are no-ops. */
    private static final int MAX_REINJECT_ATTEMPTS = 420;

    /**
     * Minimal fallback: strips ad keys from parsed InnerTube JSON.
     * ES5 only, single quotes only (safe inside a Java string).
     */
    private static final String FALLBACK_USERSCRIPT =
            "(function(){if(window.__tizenTubeModAdblock)return;window.__tizenTubeModAdblock=true;"
                    + "var K=['adPlacements','playerAds','adSlots','adBreakHeartbeatParams',"
                    + "'adBreakServiceMetadata','importantAdBreak'];"
                    + "function s(o){if(!o||typeof o!=='object')return o;"
                    + "for(var i=0;i<K.length;i++){if(K[i] in o){try{delete o[K[i]];}catch(e){}}}"
                    + "if(o.playerResponse)s(o.playerResponse);return o;}"
                    + "var p=JSON.parse;JSON.parse=function(){var r=p.apply(this,arguments);"
                    + "try{s(r);}catch(e){}return r;};})();";

    private static boolean scheduled;
    private static String userscript;

    private CobaltUserscriptInjector() {
    }

    /**
     * Injection point, called first thing in {@code CobaltActivity.onCreate(Bundle)}.
     *
     * <p>The WebContents does not exist yet, so this only schedules a poll on the main looper.
     * The first successful injection usually lands in a document that the next navigation
     * discards, hence the re-injection phase.
     */
    public static void schedule(final Activity activity) {
        if (activity == null || scheduled) return;
        scheduled = true;

        userscript = loadUserscript(activity);

        final Handler handler = new Handler(Looper.getMainLooper());
        handler.postDelayed(new Runnable() {
            private int waitAttempts;
            private int reinjectAttempts;
            private boolean injectedOnce;

            @Override
            public void run() {
                boolean injected = false;
                try {
                    injected = inject(activity, userscript);
                } catch (Throwable t) {
                    if (waitAttempts < 3) Log.w(TAG, "Injection attempt failed", t);
                }

                if (!injectedOnce) {
                    if (injected) {
                        injectedOnce = true;
                        Log.i(TAG, "Userscript injected");
                    } else if (++waitAttempts >= MAX_WAIT_ATTEMPTS) {
                        Log.w(TAG, "Gave up: no WebContents after " + MAX_WAIT_ATTEMPTS + " attempts");
                        return;
                    }
                    handler.postDelayed(this, FAST_INTERVAL_MS);
                    return;
                }

                if (++reinjectAttempts >= MAX_REINJECT_ATTEMPTS) return;
                handler.postDelayed(this, reinjectAttempts <= FAST_REINJECT_ATTEMPTS
                        ? FAST_INTERVAL_MS
                        : SLOW_INTERVAL_MS);
            }
        }, FAST_INTERVAL_MS);
    }

    /** Reads the userscript asset, or returns the embedded fallback. */
    private static String loadUserscript(Activity activity) {
        try (InputStream input = activity.getAssets().open(USERSCRIPT_ASSET)) {
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while ((read = input.read(buffer)) != -1) output.write(buffer, 0, read);
            String script = new String(output.toByteArray(), StandardCharsets.UTF_8);
            Log.i(TAG, "Loaded userscript asset (" + script.length() + " chars)");
            return script;
        } catch (Throwable t) {
            Log.w(TAG, "Userscript asset not found, using embedded fallback");
            return FALLBACK_USERSCRIPT;
        }
    }

    /** One injection attempt. Returns false while the page is not ready yet. */
    private static boolean inject(Activity activity, String script) throws Exception {
        Method getActiveWebContents = activity.getClass().getMethod("getActiveWebContents");
        Object webContents = getActiveWebContents.invoke(activity);
        if (webContents == null) return false;

        Field pointerField = findNativePointerField(webContents);
        if (pointerField == null) return false;

        long pointer = pointerField.getLong(webContents);
        if (pointer == 0L) return false;

        Method evaluateJavaScript = findEvaluateJavaScript();
        if (evaluateJavaScript == null) return false;

        // (nativePointer, script, callback) - no callback needed.
        evaluateJavaScript.invoke(null, pointer, script, null);
        return true;
    }

    /** The native pointer is the (only) non-zero long field of the WebContents implementation. */
    private static Field findNativePointerField(Object webContents) {
        for (Class<?> type = webContents.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (field.getType() != long.class) continue;
                try {
                    field.setAccessible(true);
                    if (field.getLong(webContents) != 0L) return field;
                } catch (Throwable ignored) {
                    // Static or not readable, keep looking.
                }
            }
        }
        return null;
    }

    /** Finds the registered {@code ..._evaluateJavaScript(long, String, callback)} JNI method. */
    private static Method findEvaluateJavaScript() {
        try {
            Class<?> genJni = Class.forName("org.jni_zero.GEN_JNI");
            for (Method method : genJni.getDeclaredMethods()) {
                if (!method.getName().endsWith("_evaluateJavaScript")) continue;
                Class<?>[] parameters = method.getParameterTypes();
                if (parameters.length == 3 && parameters[0] == long.class && parameters[1] == String.class) {
                    method.setAccessible(true);
                    return method;
                }
            }
        } catch (Throwable ignored) {
            // Engine not loaded yet; the caller retries.
        }
        return null;
    }
}
