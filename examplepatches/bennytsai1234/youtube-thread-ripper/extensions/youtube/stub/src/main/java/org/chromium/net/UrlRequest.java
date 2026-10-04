package org.chromium.net;

import java.nio.ByteBuffer;

// Compile-time stub. The real class ships in the YouTube app.
public abstract class UrlRequest {
    public abstract void cancel();

    public abstract void followRedirect();

    public abstract void read(ByteBuffer buffer);

    public abstract void start();

    public abstract static class Builder {
        public abstract Builder addHeader(String header, String value);

        public abstract Builder allowDirectExecutor();

        public abstract Builder setHttpMethod(String method);

        public abstract Builder setPriority(int priority);

        public abstract UrlRequest build();
    }

    public abstract static class Callback {
        public abstract void onRedirectReceived(UrlRequest request, UrlResponseInfo info, String newLocationUrl) throws Exception;

        public abstract void onResponseStarted(UrlRequest request, UrlResponseInfo info) throws Exception;

        public abstract void onReadCompleted(UrlRequest request, UrlResponseInfo info, ByteBuffer byteBuffer) throws Exception;

        public abstract void onSucceeded(UrlRequest request, UrlResponseInfo info);

        public abstract void onFailed(UrlRequest request, UrlResponseInfo info, CronetException error);

        public void onCanceled(UrlRequest request, UrlResponseInfo info) {
        }
    }
}
