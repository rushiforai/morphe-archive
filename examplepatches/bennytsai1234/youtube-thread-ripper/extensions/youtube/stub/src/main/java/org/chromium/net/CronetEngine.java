package org.chromium.net;

import java.util.concurrent.Executor;

// Compile-time stub. The real class ships in the YouTube app.
public abstract class CronetEngine {
    public abstract UrlRequest.Builder newUrlRequestBuilder(String url, UrlRequest.Callback callback, Executor executor);
}
