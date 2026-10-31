package org.chromium.net;

import b.c0;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.Executor;

/* loaded from: classes5.dex */
public final class Proxy {
    public static final int HTTP = 0;
    public static final int HTTPS = 1;
    private final Callback mCallback;
    private final Executor mExecutor;
    private final String mHost;
    private final int mPort;
    private final int mScheme;

    @Retention(RetentionPolicy.SOURCE)
    public @interface Scheme {
    }

    public Proxy(int i5, String str, int i11, Executor executor, Callback callback) {
        if (i5 != 0 && i5 != 1) {
            throw new IllegalArgumentException(c0.h(i5, "Unknown scheme "));
        }
        this.mScheme = i5;
        Objects.requireNonNull(str);
        this.mHost = str;
        this.mPort = i11;
        Objects.requireNonNull(executor);
        this.mExecutor = executor;
        Objects.requireNonNull(callback);
        this.mCallback = callback;
    }

    public Callback getCallback() {
        return this.mCallback;
    }

    public Executor getExecutor() {
        return this.mExecutor;
    }

    public String getHost() {
        return this.mHost;
    }

    public int getPort() {
        return this.mPort;
    }

    public int getScheme() {
        return this.mScheme;
    }

    public static abstract class Callback {

        public static abstract class Request implements AutoCloseable {
            @Override // java.lang.AutoCloseable
            public abstract void close();

            public abstract void proceed(List<Map.Entry<String, String>> list);
        }

        public void onBeforeTunnelRequest(Request request) {
            try {
                List<Map.Entry<String, String>> listOnBeforeTunnelRequest = onBeforeTunnelRequest();
                if (listOnBeforeTunnelRequest != null) {
                    request.proceed(listOnBeforeTunnelRequest);
                }
                if (request != null) {
                    request.close();
                }
            } catch (Throwable th2) {
                if (request != null) {
                    try {
                        request.close();
                    } catch (Throwable th3) {
                        th2.addSuppressed(th3);
                    }
                }
                throw th2;
            }
        }

        public abstract boolean onTunnelHeadersReceived(List<Map.Entry<String, String>> list, int i5);

        @Deprecated
        public List<Map.Entry<String, String>> onBeforeTunnelRequest() {
            throw new UnsupportedOperationException("At least one overload of onBeforeTunnelRequest must be overridden");
        }
    }

    @Deprecated
    public Proxy(int i5, String str, int i11, Callback callback) {
        this(i5, str, i11, new e(), callback);
    }
}
