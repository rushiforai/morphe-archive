/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * Answers OriginalLookup's questions from a table, the way Pinterest's media host answered them on
 * 2026-10-06: an address it doesn't have gets 403 with an XML body. Installing it keeps every test
 * off the network; close() puts the real connection back.
 */
final class MediaHostForTests implements PinTransfer.Connection, AutoCloseable {
    /** A real pin's 736x address, and where the media host keeps its original without the type. */
    static final String STAND_IN = "https://i.pinimg.com/736x/0b/b2/5b/0bb25b05de960e1fee5da5e9c4e8f12e.jpg";
    static final String ORIGINALS = "https://i.pinimg.com/originals/0b/b2/5b/0bb25b05de960e1fee5da5e9c4e8f12e";

    private final PinTransfer.Connection previous = OriginalLookup.connection;
    private final Map<String, Object> answers = new ConcurrentHashMap<>();
    final List<Head> asked = new CopyOnWriteArrayList<>();

    static MediaHostForTests install() {
        MediaHostForTests host = new MediaHostForTests();
        OriginalLookup.connection = host;
        return host;
    }

    MediaHostForTests answer(String url, int status, String type) {
        answers.put(url, new Object[]{status, type});
        return this;
    }

    MediaHostForTests fail(String url, IOException failure) {
        answers.put(url, failure);
        return this;
    }

    @Override public HttpURLConnection open(URI uri) throws IOException {
        Object answer = answers.getOrDefault(uri.toString(), new Object[]{403, "application/xml"});
        Head head = answer instanceof IOException ? new Head(uri.toURL(), 0, null, (IOException) answer)
                : new Head(uri.toURL(), (Integer) ((Object[]) answer)[0], (String) ((Object[]) answer)[1], null);
        asked.add(head);
        return head;
    }

    @Override public void close() {
        OriginalLookup.connection = previous;
    }

    static final class Head extends HttpURLConnection {
        private final int status;
        private final String type;
        private final IOException failure;
        volatile boolean disconnected;

        private Head(URL url, int status, String type, IOException failure) {
            super(url);
            this.status = status;
            this.type = type;
            this.failure = failure;
        }

        String address() { return url.toString(); }

        String method() { return method; }

        boolean followsRedirects() { return instanceFollowRedirects; }

        int connectTimeout() { return getConnectTimeout(); }

        @Override public int getResponseCode() throws IOException {
            if (failure != null) throw failure;
            return status;
        }

        @Override public String getContentType() { return type; }

        @Override public void connect() {}

        @Override public void disconnect() { disconnected = true; }

        @Override public boolean usingProxy() { return false; }
    }
}
