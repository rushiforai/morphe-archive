package app.morphe.extension.twitch.hidepinned;

import android.util.Log;
import android.webkit.WebView;

import java.lang.ref.WeakReference;

/**
 * Injects the pinned message hider into the Twitch TV web app.
 *
 * <p>Twitch TV renders a pinned chat message as a card above the message list.
 * The injected helper hides the native {@code pinned-chat} card together with
 * its attribution, pin badge and any pinned highlight in the message list.</p>
 *
 * <p>One shared preference ({@link PinnedChatPrefs}) controls the helper. The
 * native SEYTTINGS dialog and the page stay in sync through
 * {@link SeyttingsPinnedBridge}.</p>
 */
public final class PinnedChatInjector {

    private static final String BRIDGE_NAME = "seyttingsPinned";

    private static final String TAG = SeyttingsPinnedBridge.TAG;

    private static WeakReference<WebView> currentWebView;

    private PinnedChatInjector() {
    }

    /** Called from the WebView client constructor before the first page load. */
    public static void attach(WebView webView) {
        if (webView == null) {
            return;
        }
        currentWebView = new WeakReference<>(webView);
        PinnedChatPrefs.init(webView.getContext());
        try {
            webView.addJavascriptInterface(new SeyttingsPinnedBridge(), BRIDGE_NAME);
            Log.i(TAG, "bridge attached, enabled=" + PinnedChatPrefs.isHidePinnedEnabled());
        } catch (Throwable ignored) {
            // Never let the injected helper break page loading.
        }
    }

    /**
     * Called from WebViewClient.onPageStarted and onPageFinished, so the helper
     * is watching the chat as soon as the app renders a stream page.
     */
    public static void inject(WebView webView) {
        if (webView == null) {
            return;
        }
        currentWebView = new WeakReference<>(webView);
        evaluate(webView, PinnedChatScript.get());
    }

    /** Applies a toggle change immediately, without reloading the page. */
    public static void setEnabled(final boolean enabled) {
        evaluateOnCurrent(PinnedChatScript.get());
        evaluateOnCurrent("window.__seyPinnedSetEnabled(" + (enabled ? "true" : "false") + ");");
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
