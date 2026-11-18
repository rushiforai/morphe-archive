// SPDX-License-Identifier: AGPL-3.0-or-later
package okhttp3;

/** Compile-only stand-in for the OkHttp request bundled in the app. */
public class Request {
    public final HttpUrl url() {
        throw new UnsupportedOperationException("stub");
    }

    public final Builder newBuilder() {
        throw new UnsupportedOperationException("stub");
    }

    public final boolean isHttps() {
        throw new UnsupportedOperationException("stub");
    }

    public final <T> T tag(Class<? extends T> type) {
        throw new UnsupportedOperationException("stub");
    }

    public static class Builder {
        public Builder url(String url) {
            throw new UnsupportedOperationException("stub");
        }

        public Builder header(String name, String value) {
            throw new UnsupportedOperationException("stub");
        }

        public <T> Builder tag(Class<? super T> type, T tag) {
            throw new UnsupportedOperationException("stub");
        }

        public Request build() {
            throw new UnsupportedOperationException("stub");
        }
    }
}
