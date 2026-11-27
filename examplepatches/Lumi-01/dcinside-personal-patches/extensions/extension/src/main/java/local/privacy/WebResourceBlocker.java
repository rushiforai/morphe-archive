package local.privacy;

import android.net.Uri;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import java.io.ByteArrayInputStream;
import java.util.Locale;

/** Blocks only known ad/tracking subresources in the app's WebView. */
public final class WebResourceBlocker {
    private WebResourceBlocker() { }

    public static boolean allowNaverAnalytics(boolean requested) {
        return requested && !SettingsState.get("block_naver_web_tracking");
    }

    public static WebResourceResponse intercept(WebResourceRequest request) {
        if (request == null) return null;
        try {
            if (request.isForMainFrame()) return null;
            Uri uri = request.getUrl();
            if (uri == null) return null;
            String host = uri.getHost();
            if (host == null) return null;
            String scheme = uri.getScheme();
            if (!"http".equalsIgnoreCase(scheme) && !"https".equalsIgnoreCase(scheme)) return null;
            host = host.toLowerCase(Locale.ROOT);
            boolean tracking = (host.equals("wcs.naver.com") || host.equals("wcs.naver.net"))
                    && SettingsState.get("block_naver_web_tracking");
            boolean advertising = (host.equals("adcr.naver.com")
                    || host.equals("m.searchad.naver.com")
                    || host.equals("pagead2.googlesyndication.com")
                    || host.equals("googleads.g.doubleclick.net")
                    || host.equals("tpc.googlesyndication.com"))
                    && SettingsState.get("block_web_ad_requests");
            if (!tracking && !advertising) return null;
            return new WebResourceResponse("text/plain", "UTF-8",
                    new ByteArrayInputStream(new byte[0]));
        } catch (RuntimeException ignored) {
            return null;
        }
    }
}
