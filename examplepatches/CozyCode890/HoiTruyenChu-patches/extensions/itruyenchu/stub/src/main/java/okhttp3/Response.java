package okhttp3;

import java.io.IOException;

/** Compile-time stub, the real class is in the patched app. */
public final class Response implements java.io.Closeable {
    public int code() {
        throw new UnsupportedOperationException("Stub");
    }

    public boolean isSuccessful() {
        throw new UnsupportedOperationException("Stub");
    }

    public ResponseBody body() {
        throw new UnsupportedOperationException("Stub");
    }

    public ResponseBody peekBody(long byteCount) throws IOException {
        throw new UnsupportedOperationException("Stub");
    }

    public String header(String name) {
        throw new UnsupportedOperationException("Stub");
    }

    public Builder newBuilder() {
        throw new UnsupportedOperationException("Stub");
    }

    @Override
    public void close() {
        throw new UnsupportedOperationException("Stub");
    }

    public static class Builder {
        public Builder body(ResponseBody body) {
            throw new UnsupportedOperationException("Stub");
        }

        public Builder removeHeader(String name) {
            throw new UnsupportedOperationException("Stub");
        }

        public Response build() {
            throw new UnsupportedOperationException("Stub");
        }
    }
}
