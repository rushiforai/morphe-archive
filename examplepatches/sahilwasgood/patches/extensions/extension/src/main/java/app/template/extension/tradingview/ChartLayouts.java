package app.template.extension.tradingview;

import android.util.Log;
import android.webkit.WebView;
import app.template.extension.WebAssets;

@SuppressWarnings("unused")
public final class ChartLayouts {

    private static final String TAG = "MorpheTVLayouts";

    private ChartLayouts() {}

    public static void addLayoutLimitScript(WebView view) {
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
                addDocStartScript.invoke(null, view, WebAssets.TRADINGVIEW_CHART_LAYOUTS_WEBVIEW, java.util.Collections.singleton("*"));
                Log.d(TAG, "Multi-chart unlock script injected via WebViewCompat");
                return;
            }
        } catch (Throwable ignored) {
            // Fallback to direct evaluateJavascript
        }

        view.evaluateJavascript(WebAssets.TRADINGVIEW_CHART_LAYOUTS_WEBVIEW, null);
        Log.d(TAG, "Injected Multi-chart unlock script directly");
    }
}
