package semicoloncolonel.mobilestream.extension.nfl;

import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;

import java.io.ByteArrayInputStream;
import java.util.Collections;

/**
 * Stops the video ads in clips on NFL's article pages, which open in a web view.
 *
 * Those clips play in the website's own player, which gets its pre-rolls
 * through Google's IMA SDK. The SDK itself must load: the page checks for it
 * with a fetch of ima3.js and shows an ad-blocker message when that fails.
 * Only the SDK's video ad requests are answered with 404 Not Found, which IMA
 * treats as an ad error, so the player plays the clip without the ad. The
 * page's banner ads use other requests and are left alone.
 */
@SuppressWarnings("unused")
public final class NflWebAds {
    private static final String TAG = "MSP-NFL-WEB";
    private static final String VIDEO_AD_HOST = "pubads.g.doubleclick.net";
    private static final String VIDEO_AD_PATH = "/gampad/ads";
    private static final String DAI_HOST = "dai.google.com";

    private NflWebAds() {
    }

    /** Called from the web view client's added shouldInterceptRequest. */
    public static WebResourceResponse intercept(WebResourceRequest request) {
        try {
            if (request == null || request.getUrl() == null) return null;
            String host = request.getUrl().getHost();
            String path = request.getUrl().getPath();
            boolean videoAd = VIDEO_AD_HOST.equalsIgnoreCase(host) && path != null && path.startsWith(VIDEO_AD_PATH);
            boolean dai = host != null && (host.equalsIgnoreCase(DAI_HOST) || host.toLowerCase().endsWith("." + DAI_HOST));
            if (!videoAd && !dai) return null;
            Log.i(TAG, "blocked " + host + path);
            return new WebResourceResponse("text/plain", "utf-8", 404, "Not Found",
                    Collections.emptyMap(), new ByteArrayInputStream(new byte[0]));
        } catch (Throwable t) {
            return null;
        }
    }
}
