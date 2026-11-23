package app.hoitruyenchu.extension.itruyenchu.patches.shared;

import android.content.Context;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;

/**
 * Evaluates a plain-JS script in the app's Hermes runtime, right after the app bundle
 * (called at the end of ReactInstance.loadJSBundle, the app's Hermes compiles plain JS).
 * <p>
 * Every script is preceded by the current settings: {@code globalThis.__htcS} (see
 * {@link HtcSettings#toJson()}), kept up to date by the settings script, and
 * {@code globalThis.__htcSL}, the functions called after a change.
 */
public final class JsScripts {
    private JsScripts() {
    }

    /**
     * @return the BridgelessReactContext of the instance, or null if the script could not be queued.
     */
    public static Object load(Object reactInstance, String fileName, String script, String tag) {
        try {
            Field contextField = reactInstance.getClass().getDeclaredField("context");
            contextField.setAccessible(true);
            Object reactContext = contextField.get(reactInstance);
            Context context = (Context) reactContext;
            JsBridge.setContext(reactContext);
            File file = new File(context.getFilesDir(), fileName);
            byte[] bytes = (prelude() + script).getBytes(StandardCharsets.UTF_8);
            try (FileOutputStream out = new FileOutputStream(file)) {
                out.write(bytes);
            }
            Method load = reactInstance.getClass()
                    .getDeclaredMethod("loadJSBundleFromFile", String.class, String.class);
            load.setAccessible(true);
            load.invoke(reactInstance, file.getAbsolutePath(), fileName);
            Log.i(tag, fileName + " queued");
            return reactContext;
        } catch (Throwable t) {
            Log.e(tag, "could not load " + fileName, t);
            return null;
        }
    }

    private static String prelude() {
        String settings;
        try {
            settings = HtcSettings.toJson().toString();
        } catch (Throwable t) {
            settings = "{}";
        }
        // A JSON object is a valid JS expression; U+2028 / U+2029 are escaped by JSONObject.
        return "(function (g) { try { if (!g.__htcS) g.__htcS = " + settings + ";"
                + " if (!g.__htcSL) g.__htcSL = []; } catch (e) {} })"
                + "(typeof globalThis !== 'undefined' ? globalThis : this);\n";
    }
}
