package patches.bright;

import android.graphics.Bitmap;
import android.net.http.SslError;
import android.os.Message;
import android.view.KeyEvent;
import android.webkit.ClientCertRequest;
import android.webkit.HttpAuthHandler;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.SslErrorHandler;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import java.io.ByteArrayInputStream;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

/**
 * Delegating WebView client installed by the shared runtime patch. Every
 * original callback is forwarded exactly once to the plugin's own client.
 * For one eligible publisher-owned article navigation, the private article
 * client supplies a complete reader document as the main-frame response;
 * every other request continues through the original experience.
 */
public final class BrightWebClient extends WebViewClient {

    private final WebViewClient original;
    private static volatile HttpArticleTransport transport;

    private BrightWebClient(WebViewClient original) {
        this.original = original;
    }

    /**
     * The patch-injected entry point. Unselected builds keep the original
     * client untouched; an already-wrapped client is never wrapped twice.
     */
    public static WebViewClient wrap(WebViewClient client) {
        if (client == null || client instanceof BrightWebClient || !BrightPolicy.any()) {
            return client;
        }
        return new BrightWebClient(client);
    }

    private static synchronized HttpArticleTransport articleTransport() {
        if (transport == null) {
            transport = new HttpArticleTransport(new HmacArticleHeaderSigner(
                    BrightSigningKey.source(), new EpochClock() {
                public long nowSeconds() {
                    return System.currentTimeMillis() / 1000L;
                }
            }), new ArticleParser());
        }
        return transport;
    }

    @Override
    public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
        if (request.isForMainFrame()) {
            NavigationState.advance(view);
        }
        return original.shouldOverrideUrlLoading(view, request);
    }

    @SuppressWarnings("deprecation")
    @Override
    public boolean shouldOverrideUrlLoading(WebView view, String url) {
        // The plugin client receives the request-based callback on API 24+.
        return original.shouldOverrideUrlLoading(view, url);
    }

    @Override
    public void onPageStarted(WebView view, String url, Bitmap favicon) {
        NavigationState.advance(view, url);
        original.onPageStarted(view, url, favicon);
    }

    @Override
    public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
        WebPolicies.RequestFacts facts = new WebPolicies.RequestFacts(request.getUrl().toString(),
                request.getMethod(), request.isForMainFrame());
        if (WebPolicies.suppressConsentBootstrap(NavigationState.currentUrl(view), facts)) {
            // The publisher loader explicitly supports this page-local skip flag.
            // Do not run its CMP configuration or record any consent/age choice.
            WebResourceResponse response = new WebResourceResponse("application/javascript", "utf-8",
                    new ByteArrayInputStream("window.ndmSkipCmpWall=true;".getBytes(StandardCharsets.UTF_8)));
            Map<String, String> headers = new HashMap<String, String>();
            headers.put("Cache-Control", "no-store");
            response.setResponseHeaders(headers);
            return response;
        }
        WebResourceResponse reader = null;
        if (WebPolicies.classify(facts) == WebPolicies.Decision.READER_ARTICLE) {
            reader = readerResponse(view, WebPolicies.eligibleArticle(request.getUrl().toString()));
            if (reader != null) {
                return reader;
            }
            // Any non-FULL outcome defers: the WebView loads the
            // publisher's own document through its normal path.
        }
        return original.shouldInterceptRequest(view, request);
    }

    @SuppressWarnings("deprecation")
    @Override
    public WebResourceResponse shouldInterceptRequest(WebView view, String url) {
        return original.shouldInterceptRequest(view, url);
    }

    private WebResourceResponse readerResponse(WebView view, ArticleRef ref) {
        long generation = NavigationState.current(view);
        CancelToken cancel = new NavigationState.NavigationCancel(view, generation);
        // No persistent expanded-body cache: one private fetch per navigation.
        ArticleResult result = articleTransport().fetch(ref, cancel);
        if (result == null || !result.isFull() || cancel.isCancelled()) {
            return null;
        }
        String html = new ArticleRenderer().render(result.document, isDark(view));
        if (html == null) {
            return null;
        }
        WebResourceResponse response = new WebResourceResponse("text/html", "utf-8",
                new ByteArrayInputStream(html.getBytes(StandardCharsets.UTF_8)));
        Map<String, String> headers = new HashMap<String, String>();
        headers.put("Cache-Control", "private, no-store");
        response.setResponseHeaders(headers);
        return response;
    }

    private static boolean isDark(WebView view) {
        try {
            int flags = view.getContext().getResources().getConfiguration().uiMode
                    & android.content.res.Configuration.UI_MODE_NIGHT_MASK;
            return flags == android.content.res.Configuration.UI_MODE_NIGHT_YES;
        } catch (Exception unavailable) {
            return false;
        }
    }

    // ---- Every remaining callback forwards once to the original client. ----

    @Override
    public void onPageFinished(WebView view, String url) {
        suppressLoadedConsent(view, url);
        original.onPageFinished(view, url);
    }

    @Override
    public void onReceivedError(WebView view, WebResourceRequest request, android.webkit.WebResourceError error) {
        original.onReceivedError(view, request, error);
    }

    @SuppressWarnings("deprecation")
    @Override
    public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
        original.onReceivedError(view, errorCode, description, failingUrl);
    }

    @Override
    public void onReceivedHttpError(WebView view, WebResourceRequest request, WebResourceResponse response) {
        original.onReceivedHttpError(view, request, response);
    }

    @Override
    public void onReceivedSslError(WebView view, SslErrorHandler handler, SslError error) {
        // Never suppress an SSL error to make the reader load.
        original.onReceivedSslError(view, handler, error);
    }

    @Override
    public void onReceivedClientCertRequest(WebView view, ClientCertRequest request) {
        original.onReceivedClientCertRequest(view, request);
    }

    @Override
    public void onReceivedHttpAuthRequest(WebView view, HttpAuthHandler handler, String host, String realm) {
        original.onReceivedHttpAuthRequest(view, handler, host, realm);
    }

    @Override
    public void onFormResubmission(WebView view, Message dontResend, Message resend) {
        original.onFormResubmission(view, dontResend, resend);
    }

    @Override
    public void doUpdateVisitedHistory(WebView view, String url, boolean isReload) {
        original.doUpdateVisitedHistory(view, url, isReload);
    }

    @Override
    public void onReceivedLoginRequest(WebView view, String realm, String account, String args) {
        original.onReceivedLoginRequest(view, realm, account, args);
    }

    @Override
    public boolean onRenderProcessGone(WebView view, RenderProcessGoneDetail detail) {
        return original.onRenderProcessGone(view, detail);
    }

    @Override
    public void onPageCommitVisible(WebView view, String url) {
        suppressLoadedConsent(view, url);
        original.onPageCommitVisible(view, url);
    }

    private static void suppressLoadedConsent(WebView view, String url) {
        if (WebPolicies.suppressConsentPage(url)) {
            view.evaluateJavascript(BrightConsentScript.SOURCE, null);
        }
    }

    @SuppressWarnings("deprecation")
    @Override
    public void onTooManyRedirects(WebView view, android.os.Message cancelMsg, android.os.Message continueMsg) {
        original.onTooManyRedirects(view, cancelMsg, continueMsg);
    }

    @Override
    public boolean shouldOverrideKeyEvent(WebView view, KeyEvent event) {
        return original.shouldOverrideKeyEvent(view, event);
    }

    @Override
    public void onUnhandledKeyEvent(WebView view, KeyEvent event) {
        original.onUnhandledKeyEvent(view, event);
    }

    @Override
    public void onScaleChanged(WebView view, float oldScale, float newScale) {
        original.onScaleChanged(view, oldScale, newScale);
    }

}
