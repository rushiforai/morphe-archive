package okhttp3;

import java.io.IOException;

import okio.BufferedSink;

/** Compile-time stub, the real class is in the patched app. */
public abstract class RequestBody {
    public abstract void writeTo(BufferedSink sink) throws IOException;

    public static RequestBody create(MediaType contentType, String content) {
        throw new UnsupportedOperationException("Stub");
    }
}
