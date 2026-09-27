/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.io.InputStream;
import java.net.CookieHandler;
import java.net.CookieManager;
import java.net.CookieStore;
import java.net.HttpCookie;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * The release check's connection, through the platform's HttpURLConnection. With the media
 * downloader, the only code in the extension that opens one (ExtensionHostsTest).
 *
 * <p>{@link ReleaseCheck} decides what may be asked and reads what comes back. This sends one GET
 * and hands back the answer: no redirect followed, no cache, the connection closed after it, and
 * no cookie.
 *
 * <p>The cookie is the part HttpURLConnection doesn't let a caller turn off. It puts on every
 * request whatever the process's default CookieHandler offers for the address, and Facebook 580
 * makes a java.net.CookieManager that default when it builds its own HttpURLConnection request
 * handler (the one for its on-demand hosts). So the handler is asked first what it would add.
 * Whatever a CookieManager keeps for api.github.com is dropped, since only an answer from there
 * could have left it, and a handler that would still add a cookie stops the request before it goes
 * out. What an answer stores is dropped again when the exchange closes.
 */
final class ReleaseTransport implements ReleaseCheck.Transport {
    static final int CONNECT_TIMEOUT_MS = 10_000;
    static final int READ_TIMEOUT_MS = 10_000;

    /** A request refused before it went out. The message says why, and names no address. */
    static final class Refused extends IOException {
        Refused(String reason) {
            super(reason);
        }
    }

    @Override
    public ReleaseCheck.Exchange get(URL url, Map<String, String> headers) throws IOException {
        URI uri;
        try {
            uri = url.toURI();
        } catch (URISyntaxException malformed) {
            throw new Refused("the address isn't a URI");
        }
        CookieHandler cookies = CookieHandler.getDefault();
        String refusal = cookieRefusal(cookies, uri);
        if (refusal != null) throw new Refused(refusal);

        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        try {
            connection.setRequestMethod("GET");
            connection.setInstanceFollowRedirects(false);
            connection.setUseCaches(false);
            connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            // Nothing is left open in the pool for the rest of Facebook's run.
            connection.setRequestProperty("Connection", "close");
            for (Map.Entry<String, String> header : headers.entrySet()) {
                connection.setRequestProperty(header.getKey(), header.getValue());
            }
            return new Answer(connection, uri, connection.getResponseCode());
        } catch (IOException | RuntimeException failure) {
            connection.disconnect();
            forget(CookieHandler.getDefault(), uri);
            throw failure;
        }
    }

    /**
     * Why [handler] would put a cookie on a request to [uri], or null when it adds none. Anything a
     * CookieManager holds for [uri] is dropped first.
     */
    @Nullable
    static String cookieRefusal(@Nullable CookieHandler handler, URI uri) {
        if (handler == null) return null;
        forget(handler, uri);
        Map<String, List<String>> added;
        try {
            added = handler.get(uri, Collections.<String, List<String>>emptyMap());
        } catch (IOException | RuntimeException failure) {
            return "the phone's cookie handler couldn't be asked";
        }
        if (added == null) return null;
        for (Map.Entry<String, List<String>> header : added.entrySet()) {
            String name = header.getKey();
            List<String> values = header.getValue();
            if (name == null || values == null || !name.toLowerCase(Locale.ROOT).startsWith("cookie")) continue;
            for (String value : values) {
                if (value != null && !value.trim().isEmpty()) return "the phone's cookie handler would add a cookie";
            }
        }
        return null;
    }

    /** Drops what a CookieManager keeps for [uri]. Nothing but an answer from that host could have put it there. */
    static void forget(@Nullable CookieHandler handler, URI uri) {
        if (!(handler instanceof CookieManager)) return;
        try {
            CookieStore store = ((CookieManager) handler).getCookieStore();
            for (HttpCookie cookie : store.get(uri)) store.remove(uri, cookie);
        } catch (RuntimeException ignored) {
            // The check before a request still stops one that would carry a cookie.
        }
    }

    /** The answer on one connection, closed with it. */
    private static final class Answer implements ReleaseCheck.Exchange {
        private final HttpURLConnection connection;
        private final URI uri;
        private final int status;

        Answer(HttpURLConnection connection, URI uri, int status) {
            this.connection = connection;
            this.uri = uri;
            this.status = status;
        }

        @Override
        public int status() {
            return status;
        }

        @Nullable
        @Override
        public String header(String name) {
            return connection.getHeaderField(name);
        }

        @Override
        public long length() {
            return connection.getContentLengthLong();
        }

        @Override
        public InputStream body() throws IOException {
            return connection.getInputStream();
        }

        @Override
        public void close() {
            try {
                connection.disconnect();
            } catch (Throwable ignored) {
                // Nothing useful to do.
            }
            forget(CookieHandler.getDefault(), uri);
        }
    }
}
