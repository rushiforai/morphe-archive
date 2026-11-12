/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.URL;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/**
 * How {@link FreeProxies} goes online: an HTTPS GET of a proxy list, and a plain TCP connect to a
 * proxy to time it. Nothing is sent over that connect, and it's closed as soon as it's open.
 */
final class FreeProxyTransport implements FreeProxies.Transport {
    static final int CONNECT_MS = 6000;
    static final int READ_MS = 8000;

    @Override
    public String get(String address, int limit, long deadline) throws IOException {
        URL url = new URL(address);
        if (!"https".equals(url.getProtocol())) throw new IOException("a proxy list is only read over https");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        ScheduledFuture<?> watchdog = GoogleTranslate.closeAt(connection, deadline);
        try {
            connection.setConnectTimeout(CONNECT_MS);
            connection.setReadTimeout(READ_MS);
            // The list comes from the address asked for and nowhere else.
            connection.setInstanceFollowRedirects(false);
            connection.setUseCaches(false);
            connection.setRequestProperty("User-Agent", "HushTelegram");
            int code = connection.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) throw new IOException("the proxy list answered " + code);
            return GoogleTranslate.read(connection.getInputStream(), limit, "the proxy list is too large", deadline);
        } finally {
            watchdog.cancel(false);
            connection.disconnect();
        }
    }

    @Override
    public long connectMs(String host, int port, int timeoutMs) throws IOException {
        long start = System.nanoTime();
        try (Socket socket = new Socket()) {
            socket.connect(new InetSocketAddress(host, port), timeoutMs);
        }
        return Math.max(1L, TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - start));
    }
}
