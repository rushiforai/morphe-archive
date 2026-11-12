package app.template.extension.webviewads;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.net.Uri;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.util.Collections;
import java.util.Map;
import org.junit.Test;

// Runs on the android.jar stubs (isReturnDefaultValues): Uri.parse answers null there, so the
// ad path is covered through isAdHost and these tests pin the delegation of non-ad traffic.
public class AdBlockTest {

    private static final WebResourceResponse APP_RESPONSE = new WebResourceResponse(null, null, null);

    /** Stands in for the app's own client (Jyllands-Posten's WebViewClientCompat subclass). */
    private static final class AppClient extends WebViewClient {
        int intercepts;
        int overrides;

        @Override
        public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
            intercepts++;
            return APP_RESPONSE;
        }

        @Override
        @SuppressWarnings("deprecation")
        public WebResourceResponse shouldInterceptRequest(WebView view, String url) {
            intercepts++;
            return APP_RESPONSE;
        }

        @Override
        public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
            overrides++;
            return true;
        }

        @Override
        @SuppressWarnings("deprecation")
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            overrides++;
            return true;
        }
    }

    private static WebResourceRequest request() {
        return new WebResourceRequest() {
            @Override public Uri getUrl() { return null; }
            @Override public boolean isForMainFrame() { return false; }
            @Override public boolean isRedirect() { return false; }
            @Override public boolean hasGesture() { return false; }
            @Override public String getMethod() { return "GET"; }
            @Override public Map<String, String> getRequestHeaders() { return Collections.emptyMap(); }
        };
    }

    @Test
    public void nonAdRequestsReturnTheAppClientsAnswer() {
        AppClient app = new AppClient();
        AdBlock.BlockingClient client = new AdBlock.BlockingClient(app);

        assertSame(APP_RESPONSE, client.shouldInterceptRequest(null, request()));
        assertSame(APP_RESPONSE, client.shouldInterceptRequest(null, "https://jp.dk/article"));
        assertTrue(app.intercepts == 2);
    }

    @Test
    public void urlLoadingIsDecidedByTheAppClient() {
        AppClient app = new AppClient();
        AdBlock.BlockingClient client = new AdBlock.BlockingClient(app);

        assertTrue(client.shouldOverrideUrlLoading(null, request()));
        assertTrue(client.shouldOverrideUrlLoading(null, "jp://section"));
        assertTrue(app.overrides == 2);
    }

    @Test
    public void withoutAnAppClientTheFrameworkDefaultsApply() {
        AdBlock.BlockingClient client = new AdBlock.BlockingClient(null);

        assertNull(client.shouldInterceptRequest(null, request()));
        assertFalse(client.shouldOverrideUrlLoading(null, "https://jp.dk/article"));
    }

    @Test
    public void adHostsMatchBySuffix() {
        assertTrue(AdBlock.isAdHost("securepubads.g.doubleclick.net"));
        assertTrue(AdBlock.isAdHost("C.Jyllands-Posten.dk"));
        assertTrue(AdBlock.isAdHost("adservice.google.dk"));
        assertFalse(AdBlock.isAdHost("jyllands-posten.dk"));
        assertFalse(AdBlock.isAdHost("notdoubleclick.net"));
        assertFalse(AdBlock.isAdHost(null));
    }
}
