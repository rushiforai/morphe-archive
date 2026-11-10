package app.morphe.extension.twitch.amoled;

import android.util.Log;
import android.webkit.WebView;

import java.lang.ref.WeakReference;

/**
 * Injects the AMOLED theme into the Twitch TV web app.
 *
 * <p>Twitch TV paints its page (and the letterbox bars above and below the
 * video) with {@code #0e0e10} and the chat panel with {@code #18181b}. The
 * injected style sheet turns those surfaces pure black and repaints the chat
 * edge gradients, which the app computes at runtime.</p>
 *
 * <p>One shared preference ({@link AmoledPrefs}) controls the theme. The native
 * SEYTTINGS dialog and the page stay in sync through
 * {@link SeyttingsAmoledBridge}.</p>
 */
public final class AmoledInjector {

    private static final String BRIDGE_NAME = "seyttingsAmoled";

    private static final String TAG = SeyttingsAmoledBridge.TAG;

    private static WeakReference<WebView> currentWebView;

    private AmoledInjector() {
    }

    /** Called from the WebView client constructor before the first page load. */
    public static void attach(WebView webView) {
        if (webView == null) {
            return;
        }
        currentWebView = new WeakReference<>(webView);
        AmoledPrefs.init(webView.getContext());
        try {
            webView.addJavascriptInterface(new SeyttingsAmoledBridge(), BRIDGE_NAME);
            Log.i(TAG, "bridge attached, enabled=" + AmoledPrefs.isEnabled());
        } catch (Throwable ignored) {
            // Never let the injected helper break page loading.
        }
    }

    /**
     * Called from WebViewClient.onPageStarted and onPageFinished, so the black
     * surfaces are in place before the app paints its first frame.
     */
    public static void inject(WebView webView) {
        if (webView == null) {
            return;
        }
        currentWebView = new WeakReference<>(webView);
        evaluate(webView, AmoledScript.get());
    }

    /** Applies a toggle change immediately, without reloading the page. */
    public static void setEnabled(final boolean enabled) {
        evaluateOnCurrent(AmoledScript.get());
        evaluateOnCurrent("window.__seyAmoledSetEnabled(" + (enabled ? "true" : "false") + ");");
    }

    private static void evaluateOnCurrent(final String script) {
        WebView webView = currentWebView == null ? null : currentWebView.get();
        if (webView == null) {
            return;
        }
        webView.post(new Runnable() {
            @Override
            public void run() {
                WebView target = currentWebView == null ? null : currentWebView.get();
                if (target != null) {
                    evaluate(target, script);
                }
            }
        });
    }

    private static void evaluate(WebView webView, String script) {
        try {
            webView.evaluateJavascript(script, null);
        } catch (Throwable ignored) {
            // Never let the injected helper break page loading.
        }
    }
}
