package io.github.sabopura.morphe.extension.twitch.ads;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.SafePreferences;
import io.github.sabopura.morphe.extension.twitch.original.Stats;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;
import io.github.sabopura.morphe.extension.twitch.ui.Text;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.util.Log;
import android.widget.Toast;

import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.concurrent.atomic.AtomicIntegerArray;

/**
 * Settings and injection points of the Block ads patch. Every layer reads {@link #enabled()},
 * so switching it off in the settings restores Twitch's own behavior.
 */
@SuppressWarnings("unused")
public final class AdBlock {
    static final String PREFS = "sabopura_ads";
    public static final String KEY_ENABLED = "enabled";
    public static final String KEY_FALLBACK = "fallback";
    public static final String FALLBACK_COVER = "cover";
    public static final String FALLBACK_SHOW = "show";

    public static final int REQUESTS = 0;
    public static final int REPLACED = 1;
    public static final int COVERED = 2;
    private static final AtomicIntegerArray counts = new AtomicIntegerArray(3);

    private static final String TAG = "SabopuraTwitch";
    private static final String AD_EDGE_API = "tv.twitch.android.shared.ad.edge.api.AdEdgeApi";
    private static final String AD_SERVER = "edge.ads.twitch.tv";

    private static volatile SharedPreferences prefs;
    private static volatile Context appContext;
    private static volatile Method resultError;

    public static final int EVENT_STITCHED_STARTED = 1;
    public static final int EVENT_LIVE_AGAIN = 2;
    public static final int EVENT_QUARTILE = 3;
    public static final int EVENT_CLIENT_AD = 4;
    public static final int EVENT_PBYP = 5;

    private AdBlock() {
    }

    // ---- settings ----

    public static void initialize(Context context) {
        Text.use(context);
        if (appContext == null && context != null) appContext = context.getApplicationContext();
        if (prefs == null && context != null) {
            prefs = SafePreferences.of(
                    context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE));
        }
    }

    public static SharedPreferences preferences(Context context) {
        initialize(context);
        return prefs;
    }

    public static boolean enabled() {
        SharedPreferences p = prefs;
        return p == null || p.getBoolean(KEY_ENABLED, true);
    }

    /** The stream proxy chosen in the playback settings, used as one more ad-free source. */
    static String proxyBase() {
        Context c = appContext;
        if (c == null) return "";
        return SafePreferences.of(c.getSharedPreferences("sabopura_chat", Context.MODE_PRIVATE))
                .getString("live_proxy", "");
    }

    static boolean coverUnreplacedAds() {
        SharedPreferences p = prefs;
        return p == null || !FALLBACK_SHOW.equals(p.getString(KEY_FALLBACK, FALLBACK_COVER));
    }

    /** Never throws: it runs in the middle of blocking, which a stored statistic of another type must not stop. */
    static void count(int kind) {
        counts.incrementAndGet(kind);
        try {
            Stats.ad(kind);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("ads.stats", e);
        }
    }

    public static int count(int kind, boolean unused) {
        return counts.get(kind);
    }

    static void log(String message) {
        Log.i(TAG, message);
    }

    private static volatile String lastIssue = "";
    private static volatile boolean noticedUnknownMarker;

    /** Something that kept an ad from being replaced; shown in the settings. */
    static void issue(String message) {
        if (!message.equals(lastIssue)) Log.w(TAG, message);
        lastIssue = message;
    }

    /** Once per run: Twitch marks ads in a way this version does not know, so it may need an update. */
    static void noticeUnknownMarker(String marker) {
        if (noticedUnknownMarker) return;
        noticedUnknownMarker = true;
        issue("Unknown ad marker: " + marker);
        Context context = appContext;
        if (context == null) return;
        new android.os.Handler(android.os.Looper.getMainLooper()).post(() -> Toast.makeText(context,
                Text.label("Twitch の広告の形式が変わった可能性があります", "Twitch may have changed how it marks ads"),
                Toast.LENGTH_LONG).show());
    }

    public static String lastIssue() {
        return lastIssue;
    }

    // ---- ① ads the app requests and plays itself ----

    /**
     * Injection point: constructor of the presenter that collects every ad request the app
     * plays itself (live prerolls, VOD ads, stream-requested video ads). false starts it in
     * Twitch's own "ads off" state, used for clips.
     */
    public static boolean allowClientAds(boolean original) {
        if (!original || !enabled()) return original;
        log("Client-side video ads are off for this player");
        return false;
    }

    /** Injection point: the picture-by-picture feature check. */
    public static boolean allowPictureByPicture(boolean original) {
        return original && !enabled();
    }

    // ---- ② ad server requests of the native screens ----

    /**
     * Injection point: return value of Retrofit's create(). The ad server API is wrapped so that,
     * while blocking, its calls finish at once as a failed request; nothing is sent.
     */
    public static Object service(Object service) {
        try {
            if (service == null || !Proxy.isProxyClass(service.getClass())) return service;
            Class<?>[] interfaces = service.getClass().getInterfaces();
            if (interfaces.length != 1 || !AD_EDGE_API.equals(interfaces[0].getName())) return service;
            Class<?> api = interfaces[0];
            InvocationHandler handler = (proxy, method, args) -> {
                if (method.getDeclaringClass() == Object.class) {
                    switch (method.getName()) {
                        case "equals": return proxy == args[0];
                        case "hashCode": return System.identityHashCode(proxy);
                        default: return "SabopuraTwitch " + api.getSimpleName();
                    }
                }
                Object blocked = blocked(method);
                if (blocked != null) {
                    count(REQUESTS);
                    return blocked;
                }
                try {
                    return method.invoke(service, args);
                } catch (InvocationTargetException e) {
                    throw e.getCause() != null ? e.getCause() : e;
                }
            };
            log("Ad server API wrapped");
            return Proxy.newProxyInstance(api.getClassLoader(), new Class<?>[]{api}, handler);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("ads.edge-api", e);
            return service;
        }
    }

    /** The finished failed request to answer {@code method} with, or null to let the ad server API run. */
    private static Object blocked(Method method) {
        try {
            if (!enabled() || !method.getReturnType().getName().startsWith("io.reactivex.")) return null;
            return single(blockedResult(method.getName()));
        } catch (ReflectiveOperationException | RuntimeException | LinkageError e) {
            Diagnostics.note("ads.edge-api-block", e);
            return null;
        }
    }

    private static Object blockedResult(String endpoint) throws ReflectiveOperationException {
        Method error = resultError;
        if (error == null) {
            Class<?> result = Class.forName("retrofit2.adapter.rxjava2.Result");
            error = result.getMethod("error", Throwable.class);
            resultError = error;
        }
        return error.invoke(null, new IOException("Ad request blocked: " + endpoint));
    }

    /** Replaced by the patch with RxJava's Single.just(value). */
    public static Object single(Object value) {
        throw new IllegalStateException("Single bridge was not installed");
    }

    /**
     * Injection point: the name each PubSub message type registers under. A renamed type never
     * matches, so Twitch drops those ad notices as unknown messages. Registered once at start.
     */
    public static String pubSubType(String name) {
        return enabled() ? "sabopura_off_" + name : name;
    }

    // ---- ③ ad server requests of the React Native screens ----

    /**
     * Injection point: start of NetworkingModule.sendRequestInternalReal. Answers ad server
     * requests with "204 No Content", Twitch's own "no ad to show", without connecting.
     *
     * @return true when the request was answered here.
     */
    public static boolean answerReactRequest(Object module, String method, String url, int requestId) {
        try {
            if (url == null || !url.contains(AD_SERVER) || !enabled()) return false;
            if (!AD_SERVER.equalsIgnoreCase(Uri.parse(url).getHost())) return false;
            Class<?> base = Class.forName("com.facebook.react.bridge.BaseJavaModule");
            Object context = base.getMethod("getReactApplicationContext").invoke(module);
            if (context == null) return false;
            Class<?> arguments = Class.forName("com.facebook.react.bridge.Arguments");
            Class<?> array = Class.forName("com.facebook.react.bridge.WritableArray");
            Class<?> readableMap = Class.forName("com.facebook.react.bridge.ReadableMap");
            Method createArray = arguments.getMethod("createArray");
            Method createMap = arguments.getMethod("createMap");
            Method pushInt = array.getMethod("pushInt", int.class);
            Method pushString = array.getMethod("pushString", String.class);
            Method emit = Class.forName("com.facebook.react.bridge.ReactContext")
                    .getMethod("emitDeviceEvent", String.class, Object.class);

            // The same three events NetworkingModule sends for a finished request.
            Object response = createArray.invoke(null);
            pushInt.invoke(response, requestId);
            pushInt.invoke(response, 204);
            array.getMethod("pushMap", readableMap).invoke(response, createMap.invoke(null));
            pushString.invoke(response, url);
            emit.invoke(context, "didReceiveNetworkResponse", response);

            Object data = createArray.invoke(null);
            pushInt.invoke(data, requestId);
            pushString.invoke(data, "");
            emit.invoke(context, "didReceiveNetworkData", data);

            Object complete = createArray.invoke(null);
            pushInt.invoke(complete, requestId);
            array.getMethod("pushNull").invoke(complete);
            emit.invoke(context, "didCompleteNetworkResponse", complete);
            count(REQUESTS);
            return true;
        } catch (Exception e) {
            Diagnostics.note("ads.react-request", e);
            return false;
        }
    }

    /** Injection point: AdMetadataCueRouter.route. Drops cues of client-requested ads. */
    public static boolean dropReactCue(String text) {
        if (text == null || !enabled()) return false;
        return Features.has(Feature.ADS_CLIENT) && text.contains("twitch-maf-ad")
                || Features.has(Feature.ADS_PBYP) && text.contains("pbyp-preflight");
    }

    // ---- ⑥ player events ----

    /** Replaced by the patch: which EVENT_ kind this player event is, 0 for any other event. */
    public static int kind(Object event) {
        throw new IllegalStateException("Event bridge was not installed");
    }

    /**
     * Injection point: start of the event dispatch of both native players.
     *
     * @return true to drop the event.
     */
    public static boolean onPlayerEvent(Object player, Object event) {
        int kind = kind(event);
        if (kind == 0) return false;
        try {
            if (kind == EVENT_LIVE_AGAIN) {
                if (Features.has(Feature.ADS_COVER)) AdShield.end(player);
                return false;
            }
            if (!enabled()) return false;
            switch (kind) {
                case EVENT_STITCHED_STARTED:
                    // Reaching here means no backup session could replace the ad.
                    if (!Features.has(Feature.ADS_COVER) || !coverUnreplacedAds()) return false;
                    AdShield.start(player, event);
                    return true;
                case EVENT_QUARTILE:
                    return Features.has(Feature.ADS_COVER) && coverUnreplacedAds();
                case EVENT_CLIENT_AD:
                    if (!Features.has(Feature.ADS_CLIENT)) return false;
                    count(REQUESTS);
                    return true;
                case EVENT_PBYP:
                    if (!Features.has(Feature.ADS_PBYP)) return false;
                    count(REQUESTS);
                    return true;
                default:
                    return false;
            }
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("ads.player-event", e);
            return false;
        }
    }
}
