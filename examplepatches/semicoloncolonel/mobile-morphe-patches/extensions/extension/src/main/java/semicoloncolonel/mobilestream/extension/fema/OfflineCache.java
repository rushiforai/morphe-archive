package semicoloncolonel.mobilestream.extension.fema;

import android.content.Context;
import android.net.Uri;
import android.util.Log;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;

/**
 * Keeps FEMA's Prepare and Recover content readable offline.
 *
 * The FEMA app is a web app. It loads that content (the safety guides, the
 * featured categories, disaster declarations, and the FAQ) as JSON through
 * Capacitor's native HTTP plugin on every visit, and keeps none of it. This
 * class wraps the plugin's request: each successful GET from FEMA's content
 * hosts is saved to the app's private storage, and when the same request
 * later fails, because the phone is offline or FEMA's servers are down, the
 * saved response is returned instead.
 *
 * Alert and location requests carry the device's identifier and are never
 * saved.
 */
@SuppressWarnings("unused")
public final class OfflineCache {
    private static final String TAG = OfflineStore.TAG;
    private static final String HANDLER = "com.getcapacitor.plugin.util.HttpRequestHandler";
    private static final String PLUGIN_CALL = "com.getcapacitor.PluginCall";
    private static final String BRIDGE = "com.getcapacitor.Bridge";
    private static final String JS_OBJECT = "com.getcapacitor.JSObject";

    private OfflineCache() {
    }

    /** Replaces HttpRequestHandler.request(call, httpMethod, bridge) in CapacitorHttp. */
    public static Object request(Object call, String httpMethod, Object bridge) throws Exception {
        ClassLoader loader = call.getClass().getClassLoader();
        Class<?> callClass = Class.forName(PLUGIN_CALL, false, loader);
        Class<?> bridgeClass = Class.forName(BRIDGE, false, loader);
        Method request = Class.forName(HANDLER, false, loader)
            .getMethod("request", callClass, String.class, bridgeClass);

        Saved saved = saved(call, callClass, httpMethod, bridge, bridgeClass);
        Object response;
        try {
            response = request.invoke(null, call, httpMethod, bridge);
        } catch (InvocationTargetException e) {
            Object cached = saved == null ? null : readCached(saved.file(), loader);
            if (cached != null) {
                Log.i(TAG, "offline, served saved copy");
                return cached;
            }
            Throwable cause = e.getCause();
            if (cause instanceof Exception) throw (Exception) cause;
            throw e;
        }
        if (saved == null || response == null) return response;

        int status = status(response);
        if (status >= 200 && status < 300) {
            OfflineStore.savePage(saved.context, saved.key, saved.url, saved.params, response.toString());
        } else if (status >= 500) {
            Object cached = readCached(saved.file(), loader);
            if (cached != null) return cached;
        }
        return response;
    }

    private static final class Saved {
        final Context context;
        final String key;
        final String url;
        final String params;

        Saved(Context context, String url, String params) {
            this.context = context;
            this.url = url;
            this.params = params;
            this.key = OfflineStore.key(url, params);
        }

        File file() {
            return OfflineStore.page(context, key);
        }
    }

    // Null unless this is a GET of FEMA content.
    private static Saved saved(Object call, Class<?> callClass, String httpMethod, Object bridge,
                               Class<?> bridgeClass) {
        try {
            Method getString = callClass.getMethod("getString", String.class);
            String method = httpMethod != null ? httpMethod : (String) getString.invoke(call, "method");
            if (method != null && !"GET".equalsIgnoreCase(method)) return null;

            String url = (String) getString.invoke(call, "url");
            if (url == null || url.contains("user_token") || url.contains("identifier=")) return null;
            if (!OfflineStore.isContentHost(Uri.parse(url).getHost())) return null;

            Object params = callClass.getMethod("getObject", String.class).invoke(call, "params");
            Context context = (Context) bridgeClass.getMethod("getContext").invoke(bridge);
            return new Saved(context, url, params == null ? null : params.toString());
        } catch (Throwable t) {
            Log.w(TAG, "could not key request", t);
            return null;
        }
    }

    private static int status(Object response) {
        try {
            return (Integer) response.getClass().getMethod("optInt", String.class).invoke(response, "status");
        } catch (Throwable t) {
            return 0;
        }
    }

    private static Object readCached(File file, ClassLoader loader) {
        if (!file.isFile()) return null;
        try {
            String json = new String(OfflineStore.read(file), StandardCharsets.UTF_8);
            return Class.forName(JS_OBJECT, false, loader).getConstructor(String.class).newInstance(json);
        } catch (Throwable t) {
            Log.w(TAG, "could not read saved copy", t);
            return null;
        }
    }
}
