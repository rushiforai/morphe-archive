// SPDX-License-Identifier: AGPL-3.0-or-later
package okhttp3;

import java.io.Closeable;

/** Compile-only stand-in for the OkHttp response bundled in the app. */
public class Response implements Closeable {
    public final int code() {
        throw new UnsupportedOperationException("stub");
    }

    public final String header(String name) {
        throw new UnsupportedOperationException("stub");
    }

    public final ResponseBody body() {
        throw new UnsupportedOperationException("stub");
    }

    public final Request request() {
        throw new UnsupportedOperationException("stub");
    }

    @Override
    public void close() {
        throw new UnsupportedOperationException("stub");
    }
}
