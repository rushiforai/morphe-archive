package app.morphe.extension.twitch.hometab;

import android.util.Log;
import android.webkit.WebView;

import java.lang.ref.WeakReference;

/**
 * Injects the default-home-tab helper into the Twitch TV web app.
 *
 * <p>Twitch TV opens the remote Next.js UI on the same tab every launch. The
 * injected script re-routes the app to the tab chosen in SEYTTINGS on every
 * page load and re-applies after client-side navigation.</p>
 *
 * <p>One shared preference ({@link HomeTabPrefs}) controls the feature. The
 * native SEYTTINGS dialog and the page stay in sync through
 * {@link SeyttingsHomeTabBridge}.</p>
 */
public final class HomeTabInjector {

    private static final String BRIDGE_NAME = "seyttingsHomeTab";

    private static final String TAG = SeyttingsHomeTabBridge.TAG;

    private static WeakReference<WebView> currentWebView;

    private HomeTabInjector() {
    }

    /** Called from the WebView client constructor before the first page load. */
    public static void attach(WebView webView) {
        if (webView == null) {
            return;
        }
        currentWebView = new WeakReference<>(webView);
        HomeTabPrefs.init(webView.getContext());
        try {
            webView.addJavascriptInterface(new SeyttingsHomeTabBridge(), BRIDGE_NAME);
            Log.i(TAG, "bridge attached, enabled=" + HomeTabPrefs.isEnabled() + " tab=" + HomeTabPrefs.getHomeTab());
        } catch (Throwable ignored) {
            // Never let the injected helper break page loading.
        }
    }

    /**
     * Called from WebViewClient.onPageStarted and onPageFinished, so the app is
     * re-routed to the chosen tab before the user lands on the stock tab.
     */
    public static void inject(WebView webView) {
        if (webView == null) {
            return;
        }
        currentWebView = new WeakReference<>(webView);
        evaluate(webView, HomeTabScript.get());
    }

    /** Applies a toggle or tab change immediately, without reloading the page. */
    public static void setEnabled(final boolean enabled) {
        evaluateOnCurrent(HomeTabScript.get());
        evaluateOnCurrent("window.__seyHomeTabSetEnabled(" + (enabled ? "true" : "false") + ");");
    }

    public static void setTab(final String tab) {
        evaluateOnCurrent(HomeTabScript.get());
        evaluateOnCurrent("window.__seyHomeTabSetTab(" + jsString(tab) + ");");
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

    /**
     * Quotes a value as a single JavaScript string literal, including the
     * surrounding quotes. Callers must not add their own quotes: doing so used
     * to emit {@code ''Home''} and break the whole injected call.
     */
    private static String jsString(String s) {
        if (s == null) {
            return "''";
        }
        StringBuilder out = new StringBuilder(s.length() + 2);
        out.append('\'');
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            switch (c) {
                case '\\':
                    out.append("\\\\");
                    break;
                case '\'':
                    out.append("\\'");
                    break;
                case '\n':
                    out.append("\\n");
                    break;
                case '\r':
                    out.append("\\r");
                    break;
                case '\u2028':
                    out.append("\\u2028");
                    break;
                case '\u2029':
                    out.append("\\u2029");
                    break;
                default:
                    out.append(c);
                    break;
            }
        }
        out.append('\'');
        return out.toString();
    }
}
