package app.amazonamoled.extension;

import android.graphics.Color;
import android.os.Build;
import android.util.Log;
import android.webkit.WebSettings;
import android.webkit.WebView;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Applies the AMOLED stylesheet (see src/main/js/amoled-dark.js) to the app's WebViews.
 *
 * The script is registered as a document-start script when the WebView supports it, so pages
 * are dark from their very first frame, and it is also evaluated on every page callback as a
 * fallback (it is idempotent). All methods run on the UI thread, like every WebView call.
 */
final class WebDarkener {
    private static final String OFF_JS =
            "(function(){try{if(window.__amoledDark)window.__amoledDark.off();}catch(e){}})();";

    /** WebViews already set up, mapped to their document-start script handler (or a marker). */
    private static final Map<WebView, Object> prepared = new WeakHashMap<>();
    private static final Object NO_SCRIPT_HANDLER = new Object();

    private static String script;

    private WebDarkener() {
    }

    private static String script() {
        if (script == null) {
            int brightness = Math.max(30, Math.min(100, AmoledTheme.configuredPhotoBrightness()));
            String cfg = "{\"b\":" + (brightness / 100.0) + ",\"precise\":"
                    + AmoledTheme.configuredPreciseWebColors() + "}";
            script = "(" + WebAssets.DARK_JS + ")(" + cfg + ");";
        }
        return script;
    }

    static void prepareIfDark(WebView webView) {
        try {
            if (webView != null && AmoledTheme.isDarkActive(webView.getContext())) prepare(webView);
        } catch (Throwable t) {
            Log.e(AmoledTheme.TAG, "prepare", t);
        }
    }

    static void onPageEvent(WebView webView) {
        if (webView == null) return;
        try {
            if (!AmoledTheme.isDarkActive(webView.getContext())) {
                // Follow-system mode and the system went light.
                if (prepared.containsKey(webView)) unprepare(webView);
                return;
            }
            prepare(webView);
            webView.evaluateJavascript(script(), null);
        } catch (Throwable t) {
            Log.e(AmoledTheme.TAG, "page event", t);
        }
    }

    @SuppressWarnings("deprecation")
    private static void prepare(WebView webView) {
        if (prepared.containsKey(webView)) return;
        prepared.put(webView, NO_SCRIPT_HANDLER);

        // Black behind the page while it loads, instead of a white flash.
        webView.setBackgroundColor(Color.BLACK);

        // The page is darkened by our stylesheet. Chromium's own darkening on top of it would
        // turn it light again, so switch every flavor of it off for this WebView.
        if (Build.VERSION.SDK_INT >= 29) webView.setForceDarkAllowed(false);
        WebSettings settings = webView.getSettings();
        try {
            if (Build.VERSION.SDK_INT >= 33) {
                settings.setAlgorithmicDarkeningAllowed(false);
            } else if (Build.VERSION.SDK_INT >= 29) {
                settings.setForceDark(WebSettings.FORCE_DARK_OFF);
            }
        } catch (Throwable t) {
            Log.w(AmoledTheme.TAG, "Could not switch off WebView darkening", t);
        }

        Object handler = addDocumentStartScript(webView, script());
        if (handler != null) prepared.put(webView, handler);
    }

    private static void unprepare(WebView webView) {
        Object handler = prepared.remove(webView);
        if (handler != null && handler != NO_SCRIPT_HANDLER) removeDocumentStartScript(handler);
        webView.setBackgroundColor(Color.WHITE);
        if (Build.VERSION.SDK_INT >= 29) webView.setForceDarkAllowed(true);
        webView.evaluateJavascript(OFF_JS, null);
    }

    // region Document-start scripts.
    //
    // There is no framework API for them: they come from the WebView support library. The app
    // usually bundles androidx.webkit, so it is used by reflection. If its public classes were
    // renamed by the app's minifier, the support library boundary interfaces (which are always
    // kept, because WebView looks them up by name) are used directly. If neither is available,
    // the page callbacks above still apply the theme, a little later.

    private static Object addDocumentStartScript(WebView webView, String js) {
        Set<String> allOrigins = Collections.singleton("*");
        try {
            Class<?> feature = Class.forName("androidx.webkit.WebViewFeature");
            Method isSupported = feature.getMethod("isFeatureSupported", String.class);
            if (Boolean.TRUE.equals(isSupported.invoke(null, "DOCUMENT_START_SCRIPT"))) {
                Class<?> compat = Class.forName("androidx.webkit.WebViewCompat");
                Method add = compat.getMethod(
                        "addDocumentStartJavaScript", WebView.class, String.class, Set.class);
                Object handler = add.invoke(null, webView, js, allOrigins);
                if (handler != null) return handler;
            }
        } catch (Throwable ignored) {
            // Not bundled, or renamed.
        }
        if (Build.VERSION.SDK_INT < 28) return null;
        try {
            ClassLoader webViewLoader = WebView.getWebViewClassLoader();
            Class<?> glue = Class.forName(
                    "org.chromium.support_lib_glue.SupportLibReflectionUtil", false, webViewLoader);
            InvocationHandler factory =
                    (InvocationHandler) glue.getDeclaredMethod("createWebViewProviderFactory").invoke(null);
            Class<?> factoryInterface = Class.forName(
                    "org.chromium.support_lib_boundary.WebViewProviderFactoryBoundaryInterface");
            Class<?> providerInterface = Class.forName(
                    "org.chromium.support_lib_boundary.WebViewProviderBoundaryInterface");
            Method createWebView = factoryInterface.getMethod("createWebView", WebView.class);
            InvocationHandler provider =
                    (InvocationHandler) factory.invoke(null, createWebView, new Object[]{webView});
            Method add = providerInterface.getMethod(
                    "addDocumentStartJavaScript", String.class, String[].class);
            return provider.invoke(null, add, new Object[]{js, new String[]{"*"}});
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void removeDocumentStartScript(Object handler) {
        try {
            if (handler instanceof InvocationHandler) {
                Class<?> scriptInterface = Class.forName(
                        "org.chromium.support_lib_boundary.ScriptHandlerBoundaryInterface");
                ((InvocationHandler) handler).invoke(null, scriptInterface.getMethod("remove"), null);
            } else {
                handler.getClass().getMethod("remove").invoke(handler);
            }
        } catch (Throwable ignored) {
            // The page callbacks will switch the stylesheet off anyway.
        }
    }

    // endregion
}
