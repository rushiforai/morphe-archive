/*
 * Forked from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * extensions/facebook/.../ads/GameBridge.java. Modified for facebook-morphe-patches, 2026.
 */
package app.fbpatches.extension.facebook.ads;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.webkit.JavascriptInterface;
import android.webkit.WebView;

import org.json.JSONObject;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Locale;

/**
 * Put in front of an Instant Game's own JavaScript bridge, for games running from code Facebook
 * downloads after install. Ad messages are answered here with "no ad"; everything else goes on.
 */
@SuppressWarnings("unused")
public final class GameBridge {
    private static final String TAG = "FbPatches";

    static final String NAME = "QuicksilverAndroid";

    static final String DISPATCH = "e = new Event('message');e.data = %s;window.dispatchEvent(e);";

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private final WebView view;
    private final Object target;
    private final Method postMessage;

    private GameBridge(WebView view, Object target, Method postMessage) {
        this.view = view;
        this.target = target;
        this.postMessage = postMessage;
    }

    /**
     * Injection point, the game WebView's addJavascriptInterface. What to register under [name]:
     * this bridge around [target] for a game bridge, otherwise [target] itself. Never throws.
     */
    public static Object wrap(WebView view, Object target, String name) {
        try {
            if (view == null || target == null || target instanceof GameBridge || !NAME.equals(name)) {
                return target;
            }
            Method method = onlyPostMessage(target.getClass());
            if (method == null) return target;
            method.setAccessible(true);
            return new GameBridge(view, target, method);
        } catch (Throwable failure) {
            Log.w(TAG, "GameBridge.wrap failed", failure);
            return target;
        }
    }

    private static Method onlyPostMessage(Class<?> type) {
        Method found = null;
        for (Method method : type.getMethods()) {
            if (!method.isAnnotationPresent(JavascriptInterface.class)) continue;
            Class<?>[] parameters = method.getParameterTypes();
            if (found != null || !"postMessage".equals(method.getName()) || parameters.length != 2
                    || parameters[0] != String.class || parameters[1] != String.class) {
                return null;
            }
            found = method;
        }
        return found;
    }

    @JavascriptInterface
    public void postMessage(String message, String origin) throws Throwable {
        String promise = GameAds.heldPromise(message);
        String answer = promise != null ? answer(promise, message) : null;
        if (answer == null) {
            forward(message, origin);
            return;
        }
        MAIN.post(() -> {
            try {
                view.evaluateJavascript(answer, null);
            } catch (Throwable failure) {
                Log.w(TAG, "GameBridge answer failed", failure);
            }
        });
    }

    static String answer(String promise, String message) {
        try {
            JSONObject content = new JSONObject().put("promiseID", promise);
            content.put("data", new JSONObject()
                    .put("code", GameAds.rejection(message))
                    .put("message", GameAds.NO_AD));
            JSONObject event = new JSONObject()
                    .put("type", "rejectpromise")
                    .put("content", content)
                    .put("source", "android");
            return String.format(Locale.ROOT, DISPATCH, event);
        } catch (Throwable failure) {
            Log.w(TAG, "GameBridge answer failed", failure);
            return null;
        }
    }

    private void forward(String message, String origin) throws Throwable {
        GameAds.forwarding(true);
        try {
            postMessage.invoke(target, message, origin);
        } catch (InvocationTargetException thrown) {
            throw thrown.getCause() != null ? thrown.getCause() : thrown;
        } finally {
            GameAds.forwarding(false);
        }
    }
}
