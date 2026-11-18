// SPDX-License-Identifier: AGPL-3.0-or-later
package okhttp3;

import java.net.InetSocketAddress;
import java.net.Proxy;

/** Compile-only stand-in for the OkHttp route bundled in the app. */
public final class Route {
    private Route() {}

    public final Proxy proxy() {
        throw new UnsupportedOperationException("stub");
    }

    public final InetSocketAddress socketAddress() {
        throw new UnsupportedOperationException("stub");
    }
}
