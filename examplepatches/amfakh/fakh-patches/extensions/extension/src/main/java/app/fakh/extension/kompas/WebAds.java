package app.fakh.extension.kompas;

import android.graphics.Bitmap;
import android.net.http.SslError;
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

/**
 * Removes the ads from the kompas.com pages the app opens in a WebView (such as Harga Emas from Living Assistance).
 * Requests to the ad networks get an empty response, and a style sheet hides the slots the site keeps for them: the
 * sticky banner at the top, the fixed one at the bottom and the in-page boxes.
 */
@SuppressWarnings({"unused", "deprecation"})
public final class WebAds {
    private static final String[] AD_HOSTS = {
            "doubleclick.net", "googlesyndication.com", "googleadservices.com", "adservice.google.com",
            "jixie.media", "jixie.io", "adsimg.kompas.com",
    };

    private static final String HIDE_SLOTS = "(function(){if(document.getElementById('fakh-hide-ads'))return;"
            + "var s=document.createElement('style');s.id='fakh-hide-ads';s.textContent="
            + "'#js-banner-sticky,.boxBanner1,.banner1,.banner-300,.banner-row-15,#sticky-mobile-r,#smartbanner,"
            + ".pushdown-banner,.ads-parallax-expand,.banner-sticky-holder,.mostItem.ads,"
            + "[id^=\"div-gpt-ad\"],[id^=\"wrap_lazy_div-gpt-ad\"],[id^=\"google_ads_iframe\"]"
            + "{display:none!important;height:0!important;min-height:0!important}';"
            + "(document.head||document.documentElement).appendChild(s);})()";

    private WebAds() {
    }

    /** Called instead of the screen's setWebViewClient: wraps the app's client with the ad filter. */
    public static void setClient(WebView webView, WebViewClient client) {
        webView.setWebViewClient(new Client(client));
    }

    /** Whether [host] belongs to one of the ad networks the pages load. */
    private static boolean isAdHost(String host) {
        if (host == null) return false;
        for (String adHost : AD_HOSTS) {
            if (host.equals(adHost) || host.endsWith("." + adHost)) return true;
        }
        return false;
    }

    /** Passes every callback to the app's client, except ad requests, and adds the style sheet as a page shows. */
    private static final class Client extends WebViewClient {
        private final WebViewClient client;

        Client(WebViewClient client) {
            this.client = client;
        }

        @Override
        public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
            if (isAdHost(request.getUrl().getHost())) {
                return new WebResourceResponse("text/plain", "utf-8", new ByteArrayInputStream(new byte[0]));
            }
            return client.shouldInterceptRequest(view, request);
        }

        @Override
        public void onPageCommitVisible(WebView view, String url) {
            view.evaluateJavascript(HIDE_SLOTS, null);
            client.onPageCommitVisible(view, url);
        }

        @Override
        public void onPageFinished(WebView view, String url) {
            view.evaluateJavascript(HIDE_SLOTS, null);
            client.onPageFinished(view, url);
        }

        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            return client.shouldOverrideUrlLoading(view, url);
        }

        @Override
        public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
            return client.shouldOverrideUrlLoading(view, request);
        }

        @Override
        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            client.onPageStarted(view, url, favicon);
        }

        @Override
        public void onLoadResource(WebView view, String url) {
            client.onLoadResource(view, url);
        }

        @Override
        public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            client.onReceivedError(view, errorCode, description, failingUrl);
        }

        @Override
        public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
            client.onReceivedError(view, request, error);
        }

        @Override
        public void onReceivedHttpError(WebView view, WebResourceRequest request, WebResourceResponse errorResponse) {
            client.onReceivedHttpError(view, request, errorResponse);
        }

        @Override
        public void onReceivedSslError(WebView view, SslErrorHandler handler, SslError error) {
            client.onReceivedSslError(view, handler, error);
        }

        @Override
        public void onFormResubmission(WebView view, Message dontResend, Message resend) {
            client.onFormResubmission(view, dontResend, resend);
        }

        @Override
        public void doUpdateVisitedHistory(WebView view, String url, boolean isReload) {
            client.doUpdateVisitedHistory(view, url, isReload);
        }

        @Override
        public void onReceivedClientCertRequest(WebView view, ClientCertRequest request) {
            client.onReceivedClientCertRequest(view, request);
        }

        @Override
        public void onReceivedHttpAuthRequest(WebView view, HttpAuthHandler handler, String host, String realm) {
            client.onReceivedHttpAuthRequest(view, handler, host, realm);
        }

        @Override
        public boolean shouldOverrideKeyEvent(WebView view, KeyEvent event) {
            return client.shouldOverrideKeyEvent(view, event);
        }

        @Override
        public void onUnhandledKeyEvent(WebView view, KeyEvent event) {
            client.onUnhandledKeyEvent(view, event);
        }

        @Override
        public void onScaleChanged(WebView view, float oldScale, float newScale) {
            client.onScaleChanged(view, oldScale, newScale);
        }

        @Override
        public void onReceivedLoginRequest(WebView view, String realm, String account, String args) {
            client.onReceivedLoginRequest(view, realm, account, args);
        }

        @Override
        public boolean onRenderProcessGone(WebView view, RenderProcessGoneDetail detail) {
            return client.onRenderProcessGone(view, detail);
        }

        @Override
        public void onSafeBrowsingHit(WebView view, WebResourceRequest request, int threatType, SafeBrowsingResponse callback) {
            client.onSafeBrowsingHit(view, request, threatType, callback);
        }
    }
}
