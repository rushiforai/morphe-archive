package app.morphe.extension.twitch.adblock;

import android.util.Log;
import android.webkit.WebView;

import java.lang.ref.WeakReference;

/**
 * Injects the HLS ad filter into the Twitch TV web app.
 *
 * <p>Twitch TV plays streams with hls.js inside its WebView, so the ads are
 * stitched into the HLS media playlists instead of being separate requests.
 * The injected script hooks the playlist loaders, drops stitched ad segments
 * and, during a break, splices in the same broadcast requested with an ad-free
 * player type. It is adapted from CeladonTV's Starshot adapter (MIT).</p>
 *
 * <p>One shared preference ({@link AdBlockPrefs}) controls the filter. The
 * native SEYTTINGS dialog and the script stay in sync through
 * {@link SeyttingsAdBlockBridge}.</p>
 */
public final class AdBlockInjector {

    private static final String BRIDGE_NAME = "seyttingsAds";

    private static final String TAG = SeyttingsAdBlockBridge.TAG;

    private static WeakReference<WebView> currentWebView;

    private AdBlockInjector() {
    }

    /** Called from the WebView client constructor before the first page load. */
    public static void attach(WebView webView) {
        if (webView == null) {
            return;
        }
        currentWebView = new WeakReference<>(webView);
        AdBlockPrefs.init(webView.getContext());
        try {
            webView.addJavascriptInterface(new SeyttingsAdBlockBridge(), BRIDGE_NAME);
            Log.i(TAG, "bridge attached, enabled=" + AdBlockPrefs.isEnabled());
        } catch (Throwable ignored) {
            // Never let the injected helper break page loading.
        }
    }

    /**
     * Called from WebViewClient.onPageStarted and onPageFinished.
     *
     * <p>The script installs itself once per document, so the second call is a
     * cheap no-op. Injecting at page start puts the loader hooks in place before
     * the app's bundle creates its first hls.js instance.</p>
     */
    public static void inject(WebView webView) {
        if (webView == null) {
            return;
        }
        currentWebView = new WeakReference<>(webView);
        evaluate(webView, AdBlockScript.get());
    }

    /** Applies a toggle change immediately, without reloading the page. */
    public static void setEnabled(final boolean enabled) {
        evaluateOnCurrent(AdBlockScript.get());
        evaluateOnCurrent("window.__seyAdBlockSetEnabled(" + (enabled ? "true" : "false") + ");");
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
