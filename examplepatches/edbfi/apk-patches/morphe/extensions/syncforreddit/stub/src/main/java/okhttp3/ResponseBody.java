// SPDX-License-Identifier: AGPL-3.0-or-later
package okhttp3;

import java.io.InputStream;

/** Compile-only stand-in for the OkHttp response body bundled in the app. */
public abstract class ResponseBody {
    public final InputStream byteStream() {
        throw new UnsupportedOperationException("stub");
    }
}
