package app.morphe.extension.twitch.maturewarning;

import android.util.Log;
import android.webkit.WebView;

import java.lang.ref.WeakReference;

/**
 * Injects the mature content warning auto-accept helper into the Twitch TV web
 * app.
 *
 * <p>Twitch TV occasionally gates a stream behind an "18+ / mature content"
 * confirmation overlay rendered by the remote Next.js bundle. The injected
 * helper finds the confirmation button inside that overlay and clicks it once,
 * so the stream starts without the extra click.</p>
 *
 * <p>One shared preference ({@link MatureWarningPrefs}) controls the helper.
 * The native SEYTTINGS dialog and the page stay in sync through
 * {@link SeyttingsMatureWarningBridge}.</p>
 */
public final class MatureWarningInjector {

    private static final String BRIDGE_NAME = "seyttingsMature";

    private static final String TAG = SeyttingsMatureWarningBridge.TAG;

    private static WeakReference<WebView> currentWebView;

    private MatureWarningInjector() {
    }

    /** Called from the WebView client constructor before the first page load. */
    public static void attach(WebView webView) {
        if (webView == null) {
            return;
        }
        currentWebView = new WeakReference<>(webView);
        MatureWarningPrefs.init(webView.getContext());
        try {
            webView.addJavascriptInterface(new SeyttingsMatureWarningBridge(), BRIDGE_NAME);
            Log.i(TAG, "bridge attached, enabled=" + MatureWarningPrefs.isEnabled());
        } catch (Throwable ignored) {
            // Never let the injected helper break page loading.
        }
    }

    /**
     * Called from WebViewClient.onPageStarted and onPageFinished, so the helper
     * is watching for the warning as soon as the app renders a stream page.
     */
    public static void inject(WebView webView) {
        if (webView == null) {
            return;
        }
        currentWebView = new WeakReference<>(webView);
        evaluate(webView, MatureWarningScript.get());
    }

    /** Applies a toggle change immediately, without reloading the page. */
    public static void setEnabled(final boolean enabled) {
        evaluateOnCurrent(MatureWarningScript.get());
        evaluateOnCurrent("window.__seyMatureSetEnabled(" + (enabled ? "true" : "false") + ");");
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
