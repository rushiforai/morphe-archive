package okhttp3;

import java.io.IOException;

/** Compile-time stub, the real class is in the patched app. */
public abstract class ResponseBody implements java.io.Closeable {
    public abstract MediaType contentType();

    public final String string() throws IOException {
        throw new UnsupportedOperationException("Stub");
    }

    public final byte[] bytes() throws IOException {
        throw new UnsupportedOperationException("Stub");
    }

    public static ResponseBody create(MediaType contentType, String content) {
        throw new UnsupportedOperationException("Stub");
    }

    public static ResponseBody create(MediaType contentType, byte[] content) {
        throw new UnsupportedOperationException("Stub");
    }
}
