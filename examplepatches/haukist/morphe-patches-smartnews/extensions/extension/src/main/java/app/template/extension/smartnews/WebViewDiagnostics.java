package app.template.extension.smartnews;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.net.Uri;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import java.util.ArrayDeque;

/** Read-only view inspection called only by the explicitly enabled diagnostic build. */
public final class WebViewDiagnostics {
    private WebViewDiagnostics() {}

    public static void logClients(View anchor) {
        Context context = anchor.getContext();
        for (int i = 0; i < 16 && !(context instanceof Activity)
                && context instanceof ContextWrapper; i++) {
            context = ((ContextWrapper) context).getBaseContext();
        }
        if (!(context instanceof Activity)) return;
        ArrayDeque<View> views = new ArrayDeque<>();
        views.add(((Activity) context).getWindow().getDecorView());
        while (!views.isEmpty()) {
            View view = views.removeFirst();
            if (view instanceof WebView) {
                WebView webView = (WebView) view;
                WebViewClient client = webView.getWebViewClient();
                String url = webView.getUrl();
                String host = url == null ? null : Uri.parse(url).getHost();
                Log.i("SmartNewsWebViewDiag", "host=" + host + " client="
                        + (client == null ? "null" : client.getClass().getName()));
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) views.add(group.getChildAt(i));
            }
        }
    }
}
