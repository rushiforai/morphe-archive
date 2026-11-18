// WebSocket client and event flow adapted from Lurk's TwitchSevenTvBadges, Copyright (C) 2026 Jordan Woodson, GPL-3.0; see NOTICE.
package io.github.sabopura.morphe.extension.twitch.chat;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

/**
 * 7TV badges and name paints pushed by channel over {@code wss://events.7tv.io/v3}. 7TV learns which
 * channel is open, as it already does from its emotes, and no chatter's ID is sent. One connection serves
 * both, follows the open channel and closes soon after no chat row is on screen.
 */
final class SevenTvBadges {
    private static final String HOST = "events.7tv.io", PATH = "/v3";
    private static final String[] TYPES = {"entitlement.*", "cosmetic.*"};
    private static final int READ_TIMEOUT_MS = 45_000, MAX_FRAME = 1 << 20;
    private static final long CHECK_MS = 15_000, MIN_RETRY_MS = 2_000, MAX_RETRY_MS = 5 * 60_000L, STEADY_MS = 60_000;
    private static final int MAX_IDLE_CHECKS = 2;

    private static final SevenTvEvents EVENTS = new SevenTvEvents();
    private static Connection current;
    private static long retryAt, retryDelay = MIN_RETRY_MS;
    private static int idleChecks;
    private static final Runnable WATCH = new Runnable() {
        @Override
        public void run() {
            try {
                if (current == null) return;
                boolean wanted = shown(false) || shown(true);
                idleChecks = wanted && ChatEnhancements.anyRowOnScreen() ? 0 : idleChecks + 1;
                if (idleChecks >= MAX_IDLE_CHECKS) stop();
                else PublicApi.UI.postDelayed(this, CHECK_MS);
            } catch (RuntimeException | LinkageError failure) {
                stop();
            }
        }
    };

    private SevenTvBadges() {}

    /** Whether the settings show 7TV's badges, or its name paints. */
    private static boolean shown(boolean paints) {
        ChatSettings settings = ChatSettings.peek();
        return settings != null && settings.enabled
                && (paints ? settings.paints : settings.badges && settings.badgeEnabled("7tv"));
    }

    /** On the main thread, for each row that wants 7TV badges or paints. */
    static void ensure(String channelId) {
        idleChecks = 0;
        if (channelId == null || current != null && current.alive() && current.channelId.equals(channelId)) return;
        boolean alive = current != null && current.alive();
        if (!alive && System.currentTimeMillis() < retryAt || !channelId.matches("[0-9]{1,20}")) return;
        if (alive) stop();
        current = new Connection(channelId);
        current.start();
        PublicApi.UI.removeCallbacks(WATCH);
        PublicApi.UI.postDelayed(WATCH, CHECK_MS);
    }

    static ChatMetadata.Badge badgeOf(String userId) {
        return EVENTS.badgeOf(userId);
    }

    static NamePaint paintOf(String userId) {
        return EVENTS.paintOf(userId);
    }

    private static void stop() {
        if (current != null) current.close();
        current = null;
        PublicApi.UI.removeCallbacks(WATCH);
    }

    private static void ended(Connection connection, boolean steady) {
        PublicApi.UI.post(() -> {
            if (current != connection) return;
            current = null;
            retryDelay = steady ? MIN_RETRY_MS : Math.min(MAX_RETRY_MS, retryDelay * 2);
            retryAt = System.currentTimeMillis() + retryDelay;
        });
    }

    private static final class Connection extends Thread {
        final String channelId;
        private volatile boolean closed;
        private volatile Socket socket;

        Connection(String channelId) {
            super("Sabopura7tvEvents");
            this.channelId = channelId;
            setDaemon(true);
        }

        boolean alive() {
            return !closed && isAlive();
        }

        /** Socket closing can touch the network, and this is called on the main thread. */
        void close() {
            closed = true;
            Socket open = socket;
            if (open != null) PublicApi.submit(() -> {
                try {
                    open.close();
                } catch (IOException ignored) {
                }
            });
        }

        @Override
        public void run() {
            long started = System.currentTimeMillis();
            try (WebSocket ws = new WebSocket(openTls())) {
                for (String type : TYPES) ws.send(SevenTvEvents.subscribe(type, channelId));
                while (!closed) {
                    String frame;
                    try {
                        frame = ws.receive();
                    } catch (SocketTimeoutException timeout) {
                        continue;
                    }
                    if (frame == null) break;
                    int result = EVENTS.handle(frame);
                    if (result == SevenTvEvents.RECONNECT) break;
                    if (result == SevenTvEvents.CHANGED && shown(false)
                            || result == SevenTvEvents.PAINTS_CHANGED && shown(true)) ChatMetadata.scheduleRefresh();
                }
            } catch (Throwable ignored) {
                // Unreachable service or a broken stream: the retry below decides what happens next.
            } finally {
                closed = true;
                ended(this, System.currentTimeMillis() - started >= STEADY_MS);
            }
        }

        private Socket openTls() throws IOException {
            SSLSocket tls = (SSLSocket) SSLSocketFactory.getDefault().createSocket(HOST, 443);
            socket = tls;
            tls.setSoTimeout(READ_TIMEOUT_MS);
            tls.startHandshake();
            if (!HttpsURLConnection.getDefaultHostnameVerifier().verify(HOST, tls.getSession())) {
                tls.close();
                throw new IOException("Certificate does not match " + HOST);
            }
            return tls;
        }
    }

    /** A minimal RFC 6455 client: text frames in and out, ping, pong and close; no extensions. */
    private static final class WebSocket implements AutoCloseable {
        private static final String GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";
        private final Socket socket;
        private final InputStream in;
        private final OutputStream out;
        private final SecureRandom random = new SecureRandom();

        WebSocket(Socket socket) throws IOException {
            this.socket = socket;
            in = new BufferedInputStream(socket.getInputStream());
            out = socket.getOutputStream();
            byte[] nonce = new byte[16];
            random.nextBytes(nonce);
            String key = Base64.getEncoder().encodeToString(nonce);
            out.write(("GET " + PATH + " HTTP/1.1\r\nHost: " + HOST + "\r\nUpgrade: websocket\r\nConnection: Upgrade\r\n"
                    + "Sec-WebSocket-Key: " + key + "\r\nSec-WebSocket-Version: 13\r\nUser-Agent: SabopuraChat/1.0\r\n\r\n")
                    .getBytes(StandardCharsets.US_ASCII));
            out.flush();
            String response = readHeaders();
            String expected = Base64.getEncoder().encodeToString(sha1((key + GUID).getBytes(StandardCharsets.US_ASCII)));
            if (!response.startsWith("HTTP/1.1 101")
                    || !response.toLowerCase(java.util.Locale.ROOT).contains("sec-websocket-accept: " + expected.toLowerCase(java.util.Locale.ROOT)))
                throw new IOException("Handshake refused");
        }

        private String readHeaders() throws IOException {
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            int matched = 0;
            while (matched < 4) {
                int b = in.read();
                if (b < 0) throw new EOFException("Handshake cut short");
                buffer.write(b);
                matched = b == "\r\n\r\n".charAt(matched) ? matched + 1 : b == '\r' ? 1 : 0;
                if (buffer.size() > 16384) throw new IOException("Handshake too long");
            }
            return buffer.toString("ISO-8859-1");
        }

        void send(String text) throws IOException {
            frame(1, text.getBytes(StandardCharsets.UTF_8));
        }

        private void frame(int opcode, byte[] payload) throws IOException {
            ByteArrayOutputStream frame = new ByteArrayOutputStream(payload.length + 14);
            frame.write(0x80 | opcode);
            if (payload.length < 126) {
                frame.write(0x80 | payload.length);
            } else {
                frame.write(0x80 | 126);
                frame.write(payload.length >>> 8);
                frame.write(payload.length);
            }
            byte[] mask = new byte[4];
            random.nextBytes(mask);
            frame.write(mask);
            for (int i = 0; i < payload.length; i++) frame.write(payload[i] ^ mask[i & 3]);
            out.write(frame.toByteArray());
            out.flush();
        }

        /** The next text message, or null once the server closed. Pings are answered here. */
        String receive() throws IOException {
            ByteArrayOutputStream message = null;
            while (true) {
                int first = read(), second = read();
                int opcode = first & 0x0f;
                long length = second & 0x7f;
                if (length == 126) length = ((long) read() << 8) | read();
                else if (length == 127) {
                    length = 0;
                    for (int i = 0; i < 8; i++) length = (length << 8) | read();
                }
                if (length > MAX_FRAME || length < 0) throw new IOException("Frame too large");
                byte[] mask = (second & 0x80) != 0 ? readFully(4) : null;
                byte[] payload = readFully((int) length);
                if (mask != null) for (int i = 0; i < payload.length; i++) payload[i] ^= mask[i & 3];
                switch (opcode) {
                    case 0:
                    case 1:
                        if (opcode == 1) message = new ByteArrayOutputStream();
                        if (message == null) throw new IOException("Continuation without a start");
                        message.write(payload);
                        if (message.size() > MAX_FRAME) throw new IOException("Message too large");
                        if ((first & 0x80) != 0) return message.toString("UTF-8");
                        break;
                    case 8:
                        return null;
                    case 9:
                        frame(10, payload);
                        break;
                    default:
                        break;
                }
            }
        }

        private int read() throws IOException {
            int b = in.read();
            if (b < 0) throw new EOFException("Connection closed");
            return b;
        }

        private byte[] readFully(int length) throws IOException {
            byte[] bytes = new byte[length];
            int at = 0;
            while (at < length) {
                int read = in.read(bytes, at, length - at);
                if (read < 0) throw new EOFException("Connection closed");
                at += read;
            }
            return bytes;
        }

        @Override
        public void close() throws IOException {
            socket.close();
        }

        private static byte[] sha1(byte[] bytes) throws IOException {
            try {
                return MessageDigest.getInstance("SHA-1").digest(bytes);
            } catch (java.security.NoSuchAlgorithmException failure) {
                throw new IOException(failure);
            }
        }
    }
}
