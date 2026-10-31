package app.badfella.extension.remoteatv;

import android.app.Activity;
import android.app.AlertDialog;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import org.json.JSONObject;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Map;
import java.util.HashMap;
import java.util.WeakHashMap;
import java.nio.charset.StandardCharsets;

/** UI-only adapter for the reviewed 6.1.0 Flutter navigation channel. */
public final class AdFreeStatus {
    private static final Map<Object, Boolean> installed = new WeakHashMap<>();

    /** Override only the presentation position in the Flutter remote-config response. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void hideBanner(HashMap values) {
        Object original = values.get("banner_ad_configuration");
        HashMap entry = original instanceof Map ? new HashMap((Map) original) : new HashMap();
        Object raw = entry.get("value");
        JSONObject config;
        try {
            config = new JSONObject(raw instanceof byte[]
                    ? new String((byte[]) raw, StandardCharsets.UTF_8) : "{}");
        } catch (org.json.JSONException error) {
            config = new JSONObject();
        }
        try {
            for (String key : new String[]{"opaqueBackground", "adaptiveBanner", "tvNameInline",
                    "tabletAdaptiveBanner", "tabletOpaqueBackground"}) {
                if (!config.has(key)) config.put(key, true);
            }
            if (!config.has("giveBannerAdFullWidth")) config.put("giveBannerAdFullWidth", false);
            // The reviewed app renders positions 0 (top) and 1 (bottom); -1 renders neither.
            config.put("adPosition", -1);
            entry.put("value", config.toString().getBytes(StandardCharsets.UTF_8));
            if (!entry.containsKey("source")) entry.put("source", "default");
            values.put("banner_ad_configuration", entry);
        } catch (org.json.JSONException error) {
            throw new IllegalStateException("Unable to hide the advertising banner", error);
        }
    }

    public static void install(Activity activity) {
        try {
            Object delegate = activity.getClass().getField("c").get(activity);
            Object engine = delegate.getClass().getField("b").get(delegate);
            Object navigation = engine.getClass().getField("i").get(engine);
            Object channel = navigation.getClass().getField("c").get(navigation);
            if (installed.containsKey(channel)) return;
            ClassLoader loader = activity.getClassLoader();
            Class<?> handler = Class.forName("w8.n", true, loader);
            WeakReference<Activity> owner = new WeakReference<>(activity);
            Object observer = Proxy.newProxyInstance(loader, new Class<?>[]{handler}, (proxy, method, args) -> {
                if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                if (method.getName().equals("equals")) return proxy == args[0];
                if (method.getName().equals("toString")) return "BadFella ad-free status";
                if (!method.getName().equals("t")) return null;
                Object call = args[0];
                String name = (String) call.getClass().getField("b").get(call);
                Object arguments = call.getClass().getField("c").get(call);
                // The original navigation handler completes every call with null.
                Method complete = args[1].getClass().getMethod("d", Object.class);
                complete.setAccessible(true);
                complete.invoke(args[1], new Object[]{null});
                if (!"routeInformationUpdated".equals(name)) return null;
                String uri = arguments instanceof JSONObject
                        ? ((JSONObject) arguments).optString("uri", "")
                        : arguments instanceof Map ? String.valueOf(((Map<?, ?>) arguments).get("uri")) : "";
                String path = Uri.parse(uri).getPath();
                if (!"/purchaseSubscription".equals(path) && !"/activeSubscription".equals(path)) return null;
                new Handler(Looper.getMainLooper()).post(() -> {
                    Activity current = owner.get();
                    if (current == null || current.isFinishing() || current.isDestroyed()) return;
                    current.onBackPressed();
                    new AlertDialog.Builder(current, AlertDialog.THEME_DEVICE_DEFAULT_DARK)
                            .setTitle("Ad-free is active")
                            .setMessage("Advertising is disabled by BadFella Patches. No activation or purchase is needed for the patched ad-free feature.")
                            .setPositiveButton("Done", (dialog, which) -> {})
                            .show();
                });
                return null;
            });
            channel.getClass().getMethod("l", handler).invoke(channel, observer);
            installed.put(channel, Boolean.TRUE);
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w("BadFella", "Unable to install ad-free status UI", error);
        }
    }

    private AdFreeStatus() {}
}
