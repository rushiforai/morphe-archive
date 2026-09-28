package app.morphe.extension.chmate;

import android.app.Activity;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.view.Gravity;
import android.view.ViewGroup;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceError;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Displays the Hissi menu destination inside ChMate's task. */
public final class HissiMenuActivity extends Activity {
    private static final String HISSI_SCHEME = "haiagaru-hissi";
    private static final String HISSI_SECURE_SCHEME = "haiagaru-hissis";

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        Uri incoming = getIntent() == null ? null : getIntent().getData();
        String target = toHttpsUrl(incoming);
        if (target == null) {
            TextView error = new TextView(this);
            error.setText("必死チェッカーのURLを開けませんでした");
            error.setTextColor(Color.WHITE);
            error.setPadding(32, 32, 32, 32);
            setContentView(error);
            return;
        }

        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setBackgroundColor(Color.WHITE);
        TextView title = new TextView(this);
        title.setText("‹   必死チェッカーもどき  ·  ChMate内表示");
        title.setTextColor(Color.BLACK);
        title.setTextSize(18);
        title.setGravity(Gravity.CENTER_VERTICAL);
        title.setPadding(24, 12, 24, 12);
        title.setOnClickListener(view -> finish());
        layout.addView(title, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 56 * getResources().getDisplayMetrics().densityDpi / 160));

        WebView webView = new WebView(this);
        WebSettings settings = webView.getSettings();
        settings.setJavaScriptEnabled(false);
        settings.setDomStorageEnabled(false);
        settings.setLoadsImagesAutomatically(true);
        webView.setWebViewClient(new WebViewClient() {
            @Override
            public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
                if (request.isForMainFrame()) {
                    title.setText("‹   読み込みエラー · " + error.getDescription());
                }
            }
        });
        webView.loadUrl(target);
        layout.addView(webView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        setContentView(layout);
    }

    private static String toHttpsUrl(Uri uri) {
        if (uri == null || (!HISSI_SCHEME.equalsIgnoreCase(uri.getScheme())
                && !HISSI_SECURE_SCHEME.equalsIgnoreCase(uri.getScheme()))
                || !"hissi.org".equalsIgnoreCase(uri.getHost())) return null;
        String path = uri.getEncodedPath();
        if (path == null || !path.startsWith("/read.php/")) return null;
        String scheme = HISSI_SECURE_SCHEME.equalsIgnoreCase(uri.getScheme())
                ? "https" : "http";
        StringBuilder result = new StringBuilder(scheme).append("://hissi.org").append(path);
        if (uri.getEncodedQuery() != null) result.append('?').append(uri.getEncodedQuery());
        return result.toString();
    }
}
