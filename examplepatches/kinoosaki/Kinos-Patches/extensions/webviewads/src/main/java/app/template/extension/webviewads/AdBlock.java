package app.template.extension.webviewads;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.net.Uri;
import android.net.http.SslError;
import android.os.Build;
import android.os.Message;
import android.view.KeyEvent;
import android.webkit.ClientCertRequest;
import android.webkit.HttpAuthHandler;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.SafeBrowsingResponse;
import android.webkit.SslErrorHandler;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.io.ByteArrayInputStream;
import java.util.Locale;

/**
 * Blocks ad and tracking hosts inside a WebView. The news apps render the article page itself, so
 * the ads are the website's own requests (Google Ad Manager, AdOcean/Gemius, the usual RTB
 * networks) rather than SDK calls; intercepting them before they leave the WebView removes the
 * slots without touching the page content.
 */
public final class AdBlock {

    private AdBlock() {
    }

    // Host suffixes. A request is blocked when its host equals an entry or ends with ".<entry>".
    // The three c.<publisher>.dk hosts are the JPPol Snowplow collectors.
    private static final String[] HOSTS = {
        "doubleclick.net",
        "googlesyndication.com",
        "googleadservices.com",
        "amazon-adsystem.com",
        "criteo.com",
        "criteo.net",
        "taboola.com",
        "outbrain.com",
        "adnxs.com",
        "rubiconproject.com",
        "pubmatic.com",
        "openx.net",
        "smartadserver.com",
        "casalemedia.com",
        "33across.com",
        "sharethrough.com",
        "teads.tv",
        "yieldmo.com",
        "bidswitch.net",
        "triplelift.com",
        "indexexchange.com",
        "sovrn.com",
        "gumgum.com",
        "spotxchange.com",
        "innovid.com",
        "serving-sys.com",
        "flashtalking.com",
        "adform.net",
        "1rx.io",
        "agkn.com",
        "mathtag.com",
        "demdex.net",
        "omtrdc.net",
        "gemius.pl",
        "gemius.com",
        "adocean.pl",
        "c.jyllands-posten.dk",
        "c.ekstrabladet.dk",
        "c.politiken.dk",
    };

    /**
     * Installs the blocking client on [webView]. On API 26+ the client already set is kept: the
     * blocking client wraps it and forwards every callback, so only ad requests change. Below API 26
     * the current client cannot be read and is replaced. Calling this twice is a no-op. A later
     * setWebViewClient by the app replaces the wrapper (and with it the blocking).
     */
    public static void install(WebView webView) {
        if (webView == null) {
            return;
        }
        WebViewClient existing = null;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            existing = webView.getWebViewClient();
            if (existing instanceof BlockingClient) {
                return;
            }
        }
        webView.setWebViewClient(new BlockingClient(existing));
    }

    /** True when [url] targets an ad or tracking host. Never throws. */
    public static boolean isAdUrl(String url) {
        if (url == null) {
            return false;
        }
        String host;
        try {
            host = Uri.parse(url).getHost();
        } catch (RuntimeException ignored) {
            return false;
        }
        return isAdHost(host);
    }

    static boolean isAdHost(String host) {
        if (host == null) {
            return false;
        }
        host = host.toLowerCase(Locale.ROOT);
        if (host.startsWith("adservice.google.")) {
            return true;
        }
        for (String blocked : HOSTS) {
            if (host.equals(blocked) || host.endsWith("." + blocked)) {
                return true;
            }
        }
        return false;
    }

    /** The empty response returned for a blocked request. */
    public static WebResourceResponse emptyResponse() {
        return new WebResourceResponse("text/plain", "utf-8", new ByteArrayInputStream(new byte[0]));
    }

    /**
     * Answers ad requests with an empty response and forwards every other WebViewClient callback to
     * [base] (the app's own client, or a plain WebViewClient when there was none, which matches the
     * framework defaults). The framework only invokes callbacks that exist on its API level, and
     * each forward calls that same method on [base], so the newer-API overrides need no runtime check.
     */
    @TargetApi(Build.VERSION_CODES.O_MR1)
    @SuppressWarnings("deprecation")
    static final class BlockingClient extends WebViewClient {

        final WebViewClient base;

        BlockingClient(WebViewClient base) {
            this.base = base != null ? base : new WebViewClient();
        }

        @Override
        public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
            Uri url = request == null ? null : request.getUrl();
            if (url != null && isAdUrl(url.toString())) {
                return emptyResponse();
            }
            return base.shouldInterceptRequest(view, request);
        }

        @Override
        public WebResourceResponse shouldInterceptRequest(WebView view, String url) {
            if (isAdUrl(url)) {
                return emptyResponse();
            }
            return base.shouldInterceptRequest(view, url);
        }

        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            return base.shouldOverrideUrlLoading(view, url);
        }

        @Override
        public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
            return base.shouldOverrideUrlLoading(view, request);
        }

        @Override
        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            base.onPageStarted(view, url, favicon);
        }

        @Override
        public void onPageFinished(WebView view, String url) {
            base.onPageFinished(view, url);
        }

        @Override
        public void onLoadResource(WebView view, String url) {
            base.onLoadResource(view, url);
        }

        @Override
        public void onPageCommitVisible(WebView view, String url) {
            base.onPageCommitVisible(view, url);
        }

        @Override
        public void onTooManyRedirects(WebView view, Message cancelMsg, Message continueMsg) {
            base.onTooManyRedirects(view, cancelMsg, continueMsg);
        }

        @Override
        public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            base.onReceivedError(view, errorCode, description, failingUrl);
        }

        @Override
        public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
            base.onReceivedError(view, request, error);
        }

        @Override
        public void onReceivedHttpError(WebView view, WebResourceRequest request, WebResourceResponse errorResponse) {
            base.onReceivedHttpError(view, request, errorResponse);
        }

        @Override
        public void onFormResubmission(WebView view, Message dontResend, Message resend) {
            base.onFormResubmission(view, dontResend, resend);
        }

        @Override
        public void doUpdateVisitedHistory(WebView view, String url, boolean isReload) {
            base.doUpdateVisitedHistory(view, url, isReload);
        }

        @Override
        public void onReceivedSslError(WebView view, SslErrorHandler handler, SslError error) {
            base.onReceivedSslError(view, handler, error);
        }

        @Override
        public void onReceivedClientCertRequest(WebView view, ClientCertRequest request) {
            base.onReceivedClientCertRequest(view, request);
        }

        @Override
        public void onReceivedHttpAuthRequest(WebView view, HttpAuthHandler handler, String host, String realm) {
            base.onReceivedHttpAuthRequest(view, handler, host, realm);
        }

        @Override
        public boolean shouldOverrideKeyEvent(WebView view, KeyEvent event) {
            return base.shouldOverrideKeyEvent(view, event);
        }

        @Override
        public void onUnhandledKeyEvent(WebView view, KeyEvent event) {
            base.onUnhandledKeyEvent(view, event);
        }

        @Override
        public void onScaleChanged(WebView view, float oldScale, float newScale) {
            base.onScaleChanged(view, oldScale, newScale);
        }

        @Override
        public void onReceivedLoginRequest(WebView view, String realm, String account, String args) {
            base.onReceivedLoginRequest(view, realm, account, args);
        }

        @Override
        public boolean onRenderProcessGone(WebView view, RenderProcessGoneDetail detail) {
            return base.onRenderProcessGone(view, detail);
        }

        @Override
        public void onSafeBrowsingHit(WebView view, WebResourceRequest request, int threatType,
                                      SafeBrowsingResponse callback) {
            base.onSafeBrowsingHit(view, request, threatType, callback);
        }
    }
}
