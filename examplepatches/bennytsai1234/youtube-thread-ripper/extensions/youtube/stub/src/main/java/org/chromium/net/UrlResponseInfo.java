package org.chromium.net;

import java.util.List;
import java.util.Map;

// Compile-time stub. The real class ships in the YouTube app.
public abstract class UrlResponseInfo {
    public abstract Map<String, List<String>> getAllHeaders();

    public abstract int getHttpStatusCode();

    public abstract String getNegotiatedProtocol();
}
