// SPDX-License-Identifier: AGPL-3.0-or-later
package okhttp3;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

/** Compile-only stand-in for the OkHttp 5 interceptor bundled in the app. */
public interface Interceptor {
    Response intercept(Chain chain) throws IOException;

    interface Chain {
        Request request();

        Response proceed(Request request) throws IOException;

        Call call();

        /** Null in an application interceptor. */
        Connection connection();

        Chain withReadTimeout(int timeout, TimeUnit unit);
    }
}
