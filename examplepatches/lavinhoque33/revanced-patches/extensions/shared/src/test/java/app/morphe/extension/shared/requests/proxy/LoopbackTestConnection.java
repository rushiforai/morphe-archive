/*
 * Copyright (C) 2026 lavinhoque33.
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.shared.requests.proxy;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.Proxy;
import java.net.URL;

/** Sends real requests to a test server using the host JVM's HTTP implementation. */
public final class LoopbackTestConnection {
    private LoopbackTestConnection() {
    }

    public static HttpURLConnection open(URL url) throws IOException {
        if (!"http".equals(url.getProtocol()) || !"127.0.0.1".equals(url.getHost())) {
            throw new IOException("Expected a loopback test server: " + url);
        }

        return new DelegatingHttpURLConnection((HttpURLConnection) url.openConnection(Proxy.NO_PROXY)) {
            @Override
            public void setFixedLengthStreamingMode(int contentLength) {
                // Android accepts this for a bodyless request. OpenJDK tries to open an output
                // stream even for zero bytes, then rejects it because doOutput is false.
                if (contentLength != 0) {
                    super.setFixedLengthStreamingMode(contentLength);
                }
            }
        };
    }
}
