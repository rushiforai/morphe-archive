package org.chromium.net;

import java.util.List;
import java.util.concurrent.Executor;

public final class Proxy {
    public static final int HTTP = 0;
    public static final int HTTPS = 1;

    public Proxy(int scheme, String host, int port, Executor executor, Callback callback) {
    }

    public abstract static class Callback {
        public abstract static class Request implements AutoCloseable {
            @Override
            public abstract void close();

            public abstract void proceed(List<?> headers);
        }

        public void onBeforeTunnelRequest(Request request) {
        }

        public abstract boolean onTunnelHeadersReceived(List<?> headers, int statusCode);
    }
}
