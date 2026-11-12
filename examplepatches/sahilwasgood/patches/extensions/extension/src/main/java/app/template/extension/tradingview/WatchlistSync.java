package app.template.extension.tradingview;

import android.util.Log;
import android.webkit.WebView;
import app.template.extension.WebAssets;

@SuppressWarnings("unused")
public final class WatchlistSync {

    private static final String TAG = "MorpheTVSync";

    private WatchlistSync() {}

    public static void addSyncScript(WebView view) {
        if (view == null) return;
        try {
            Class<?> webViewFeatureClass = Class.forName("androidx.webkit.WebViewFeature");
            Class<?> webViewCompatClass = Class.forName("androidx.webkit.WebViewCompat");
            java.lang.reflect.Method isSupported = webViewFeatureClass.getMethod("isFeatureSupported", String.class);
            boolean supported = (Boolean) isSupported.invoke(null, "DOCUMENT_START_SCRIPT");
            if (supported) {
                java.lang.reflect.Method addDocStartScript = webViewCompatClass.getMethod(
                    "addDocumentStartJavaScript",
                    WebView.class,
                    String.class,
                    java.util.Set.class
                );
                addDocStartScript.invoke(null, view, WebAssets.TRADINGVIEW_SYNC_WEBVIEW, java.util.Collections.singleton("*"));
                Log.d(TAG, "Document start script injected via WebViewCompat");
                return;
            }
        } catch (Throwable ignored) {
            // Fallback to direct evaluateJavascript
        }

        view.evaluateJavascript(WebAssets.TRADINGVIEW_SYNC_WEBVIEW, null);
        Log.d(TAG, "Injected TradingView Sync script directly");
    }
}
