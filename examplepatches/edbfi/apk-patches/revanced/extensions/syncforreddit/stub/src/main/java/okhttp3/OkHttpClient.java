// SPDX-License-Identifier: AGPL-3.0-or-later
package okhttp3;

/** Compile-only stand-in for the OkHttp client bundled in the app. */
public class OkHttpClient {
    public final Dns dns() {
        throw new UnsupportedOperationException("stub");
    }

    public Builder newBuilder() {
        throw new UnsupportedOperationException("stub");
    }

    public static class Builder {
        public final Builder addInterceptor(Interceptor interceptor) {
            throw new UnsupportedOperationException("stub");
        }

        public final Builder addNetworkInterceptor(Interceptor interceptor) {
            throw new UnsupportedOperationException("stub");
        }

        public final Builder dns(Dns dns) {
            throw new UnsupportedOperationException("stub");
        }

        public final OkHttpClient build() {
            throw new UnsupportedOperationException("stub");
        }
    }
}
