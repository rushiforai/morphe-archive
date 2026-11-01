package nl.johninnl.medium.privacy;

import android.webkit.WebResourceResponse;
import java.io.ByteArrayInputStream;
import java.util.Collections;

/** Return an empty successful subresource, avoiding remote analytics/widget loading. */
public final class WebPrivacy {
    private WebPrivacy() {}
    public static WebResourceResponse intercept(String url) {
        if (!WebPrivacyRules.blocked(url)) return null;
        return new WebResourceResponse("text/plain", "UTF-8", 204, "No Content",
            Collections.emptyMap(), new ByteArrayInputStream(new byte[0]));
    }
}
