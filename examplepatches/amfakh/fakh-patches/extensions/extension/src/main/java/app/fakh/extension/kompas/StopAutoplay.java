package app.fakh.extension.kompas;

import android.net.Uri;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;

/**
 * The "Video Pilihan" block under an article is widget.kompas.com/kgplayer in a WebView, which puts the KGNow player
 * (www.kgnow.com/embed/...) in an iframe with autoplay "always". The player reads an autoplay query parameter, so each
 * embed request without autoplay=none is answered with a page that reloads it with that parameter and without the
 * position parameter, which overrides it.
 */
@SuppressWarnings("unused")
public final class StopAutoplay {
    private StopAutoplay() {
    }

    /** Called instead of the block's setWebViewClient: wraps the app's client so embed requests can be rewritten. */
    public static void setClient(WebView webView, WebViewClient client) {
        webView.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                return client.shouldOverrideUrlLoading(view, request);
            }

            @Override
            public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
                Uri url = request.getUrl();
                String host = url.getHost();
                String path = url.getPath();
                if (host == null || !host.endsWith("kgnow.com") || path == null || !path.startsWith("/embed/")
                        || "none".equals(url.getQueryParameter("autoplay"))) {
                    return client.shouldInterceptRequest(view, request);
                }
                Uri.Builder builder = url.buildUpon().clearQuery();
                for (String name : url.getQueryParameterNames()) {
                    // The server forces autoplay "always" for the app's article positions (app_detail_...).
                    if (name.equals("autoplay") || name.equals("position")) continue;
                    for (String value : url.getQueryParameters(name)) builder.appendQueryParameter(name, value);
                }
                String target = builder.appendQueryParameter("autoplay", "none").build().toString();
                String page = "<script>location.replace(" + JSONObject.quote(target) + ")</script>";
                return new WebResourceResponse("text/html", "utf-8",
                        new ByteArrayInputStream(page.getBytes(StandardCharsets.UTF_8)));
            }
        });
    }
}
