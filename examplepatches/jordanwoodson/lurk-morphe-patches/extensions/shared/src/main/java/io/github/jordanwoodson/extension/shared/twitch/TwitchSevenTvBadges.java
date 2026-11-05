package io.github.jordanwoodson.extension.shared.twitch;

import android.os.SystemClock;

import org.json.JSONArray;
import org.json.JSONObject;

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
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.BooleanSupplier;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * 7TV badges on chat lines (switch {@code badges_7tv}, off by default). 7TV publishes no list of badge
 * holders; its event service pushes the badge each chatter has chosen as 7TV sees them in a channel, which is
 * how 7TV's own browser extension learns them. While a channel's chat is open and the switch is on, one
 * WebSocket to events.7tv.io subscribes to that channel's cosmetics and entitlements. 7TV learns the channel,
 * as it does from the 7TV emotes switch, and nothing about the viewer or which chatters are on screen: no
 * chatter is looked up. The connection closes after ten minutes without a chat line.
 */
@SuppressWarnings({"rawtypes", "unchecked"})
final class TwitchSevenTvBadges {
    static final String KEY = "badges_7tv";
    static final String HOST = "events.7tv.io";
    static final String PATH = "/v3";
    static final long IDLE_MS = 10 * 60_000L;
    static final long RETRY_MS = 60_000L;
    private static final int MAX_USERS = 20_000;
    private static final int MAX_FRAME = 1 << 20;
    private static final int READ_TIMEOUT_MS = 45_000;
    private static final String USER_AGENT = "Lurk (+https://github.com/jordanwoodson/lurk-morphe-patches)";
    private static final String GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";

    /** 7TV badge ID -> the badge. Definitions arrive as cosmetic events, usually before their first holder. */
    private static final ConcurrentHashMap<String, TwitchBadges.Badge> BADGES = new ConcurrentHashMap<>();
    /** Twitch user ID -> 7TV badge ID of the chatters 7TV has reported; the oldest are dropped past the bound. */
    private static final Map<Long, String> USERS = Collections.synchronizedMap(
            new LinkedHashMap<Long, String>(256, 0.75f, true) {
                @Override protected boolean removeEldestEntry(Map.Entry<Long, String> eldest) {
                    return size() > MAX_USERS;
                }
            });
    /** The channel whose chat is open (a Twitch channel ID), for the subscription. */
    private static volatile String channel;
    private static volatile long lastUse;
    private static volatile long retryAt;
    /** Replaced by tests with a plain socket to a local server. */
    static volatile Transport transport = TwitchSevenTvBadges::openTls;
    private static Connection current;

    private TwitchSevenTvBadges() {
    }

    interface Transport {
        Socket open(String host) throws IOException;
    }

    // ---------------------------------------------------------------------------------------------
    // Provider API, called by TwitchBadges and the chat hooks

    /** Chat is opening {@code channelId}'s room: subscribe there once the switch asks for badges. */
    static void onChannel(String channelId) {
        if (channelId == null || channelId.isEmpty() || !enabled()) return;
        channel = channelId;
        Connection connection;
        synchronized (TwitchSevenTvBadges.class) {
            connection = current;
        }
        if (connection != null) connection.follow(channelId);
    }

    /** React Native chat rows of {@code room}: the same as a native chat line of that channel. */
    static void requestRn(String room, BooleanSupplier wanted) {
        if (!enabled() || wanted == null || !wanted.getAsBoolean()) return;
        onChannel(room);
        ensure();
    }

    /** A chat line is being drawn with the switch on: keep (or open) the connection for the open channel. */
    static void ensure() {
        lastUse = SystemClock.elapsedRealtime();
        String id = channel;
        if (id == null) return;
        synchronized (TwitchSevenTvBadges.class) {
            if (current != null && current.alive()) return;
            if (SystemClock.elapsedRealtime() < retryAt) return;
            current = new Connection(id);
            current.start();
        }
    }

    /** {@code out} (or a copy of {@code badges}) with the sender's 7TV badge appended, when 7TV reported one. */
    static List add(List out, List badges, long userId, Class<?> badgeClass) throws ReflectiveOperationException {
        TwitchBadges.Badge badge = badgeOf(userId);
        if (badge == null) return out;
        if (out == null) out = new ArrayList(badges);
        out.add(badge.model(badgeClass));
        return out;
    }

    /** { title, image URL } of {@code userId}'s 7TV badge, or null. Reads the maps only. */
    static String[] cachedRn(long userId) {
        TwitchBadges.Badge badge = badgeOf(userId);
        return badge == null ? null : new String[]{badge.title, badge.url};
    }

    /** Emote and badge info: { "7TV badge", title } for a 7TV badge image URL, or null. */
    static String[] describe(String url) {
        for (TwitchBadges.Badge badge : BADGES.values()) {
            if (badge.url.equals(url)) return new String[]{"7TV badge", badge.title};
        }
        return null;
    }

    static boolean enabled() {
        return Settings.isRegistered(KEY) && Settings.isEnabled(KEY);
    }

    private static TwitchBadges.Badge badgeOf(long userId) {
        String id = USERS.get(userId);
        return id == null ? null : BADGES.get(id);
    }

    // ---------------------------------------------------------------------------------------------
    // Event handling (no I/O; tests feed frames here directly)

    /** One text frame from the event service. Returns false when the service asked for a reconnect. */
    static boolean handle(String text) {
        JSONObject message;
        try {
            message = new JSONObject(text);
        } catch (org.json.JSONException | RuntimeException e) {
            return true;
        }
        switch (message.optInt("op", -1)) {
            case 0:
                dispatch(message.optJSONObject("d"));
                return true;
            case 4: // reconnect
            case 7: // end of stream
                return false;
            case 6:
                Logger.d("badges: 7TV event error: " + message.optJSONObject("d"));
                return true;
            default:
                return true;
        }
    }

    private static void dispatch(JSONObject d) {
        if (d == null) return;
        String type = d.optString("type");
        JSONObject body = d.optJSONObject("body");
        JSONObject object = body == null ? null : body.optJSONObject("object");
        if (object == null || !"BADGE".equals(object.optString("kind"))) return;
        boolean changed = false;
        if (type.startsWith("cosmetic.")) {
            JSONObject data = object.optJSONObject("data");
            String id = data == null ? null : data.optString("id", null);
            if (id == null || id.isEmpty()) return;
            if (type.equals("cosmetic.delete")) {
                changed = BADGES.remove(id) != null;
            } else {
                TwitchBadges.Badge badge = parseBadge(id, data);
                if (badge != null) {
                    TwitchBadges.Badge previous = BADGES.put(id, badge);
                    changed = previous == null || !previous.url.equals(badge.url);
                }
            }
        } else if (type.startsWith("entitlement.")) {
            String badgeId = object.optString("ref_id", null);
            long user = twitchUser(object.optJSONObject("user"));
            if (badgeId == null || badgeId.isEmpty() || user <= 0) return;
            if (type.equals("entitlement.delete")) {
                changed = USERS.remove(user, badgeId);
            } else {
                changed = !badgeId.equals(USERS.put(user, badgeId));
            }
        }
        if (changed) {
            TwitchThirdParty.catalogChanged();
            int holders = USERS.size();
            if (holders == 1 || holders % 100 == 0) Logger.d("badges: 7TV: " + BADGES.size() + " badges, " + holders + " holders");
        }
    }

    /**
     * A badge from its cosmetic data: { "id", "name", "tooltip", "host": { "url": "//cdn.7tv.app/badge/<id>",
     * "files": [ { "name": "3x.webp", "static_name", "width", "frame_count", ... } ] } }. The largest file up to
     * 3x is used, its still copy when it's animated.
     */
    private static TwitchBadges.Badge parseBadge(String id, JSONObject data) {
        JSONObject host = data.optJSONObject("host");
        JSONArray files = host == null ? null : host.optJSONArray("files");
        String base = host == null ? null : host.optString("url", null);
        if (files == null || base == null || !base.startsWith("//cdn.7tv.app/")) return null;
        String chosen = null;
        int chosenWidth = 0;
        for (int i = 0; i < files.length(); i++) {
            JSONObject file = files.optJSONObject(i);
            if (file == null) continue;
            String name = file.optString("name", "");
            int width = file.optInt("width", 0);
            if (!name.endsWith(".webp") && !name.endsWith(".png")) continue;
            if (name.startsWith("4x") || width > 72 || width <= chosenWidth) continue;
            if (file.optInt("frame_count", 1) > 1) name = file.optString("static_name", name);
            chosen = name;
            chosenWidth = width;
        }
        if (chosen == null || chosen.contains("/") || chosen.contains("?")) return null;
        String title = data.optString("tooltip", "");
        if (title.isEmpty()) title = data.optString("name", "7TV badge");
        return new TwitchBadges.Badge("7tv-" + id.toLowerCase(Locale.ROOT), "https:" + base + "/" + chosen,
                new long[0], title);
    }

    /** The Twitch user ID among a 7TV user's connections, or 0. */
    private static long twitchUser(JSONObject user) {
        JSONArray connections = user == null ? null : user.optJSONArray("connections");
        if (connections == null) return 0;
        for (int i = 0; i < connections.length(); i++) {
            JSONObject connection = connections.optJSONObject(i);
            if (connection == null || !"TWITCH".equals(connection.optString("platform"))) continue;
            try {
                return Long.parseLong(connection.optString("id", ""));
            } catch (NumberFormatException e) {
                return 0;
            }
        }
        return 0;
    }

    static String subscription(int op, String type, String channelId) {
        try {
            JSONObject condition = new JSONObject().put("platform", "TWITCH").put("ctx", "channel").put("id", channelId);
            return new JSONObject().put("op", op).put("d", new JSONObject().put("type", type)
                    .put("condition", condition)).toString();
        } catch (RuntimeException | org.json.JSONException e) {
            throw new IllegalStateException(e);
        }
    }

    // ---------------------------------------------------------------------------------------------
    // The connection

    private static Socket openTls(String host) throws IOException {
        SSLSocket socket = (SSLSocket) SSLSocketFactory.getDefault().createSocket(host, 443);
        socket.startHandshake();
        if (!HttpsURLConnection.getDefaultHostnameVerifier().verify(host, socket.getSession())) {
            socket.close();
            throw new IOException("certificate doesn't match " + host);
        }
        return socket;
    }

    /** One WebSocket session on its own daemon thread. */
    private static final class Connection extends Thread {
        private volatile String subscribed;
        private volatile boolean closed;
        private WebSocket socket;

        Connection(String channelId) {
            super("lurk-7tv-events");
            subscribed = channelId;
            setDaemon(true);
        }

        boolean alive() {
            return !closed && isAlive();
        }

        /** Moves the subscription to {@code channelId} from the reader thread's subscriptions. */
        void follow(String channelId) {
            WebSocket open = socket;
            String previous = subscribed;
            if (open == null || channelId.equals(previous)) return;
            subscribed = channelId;
            try {
                for (String type : new String[]{"entitlement.*", "cosmetic.*"}) {
                    open.send(subscription(36, type, previous));
                    open.send(subscription(35, type, channelId));
                }
            } catch (IOException e) {
                shutdown("resubscribe failed: " + e);
            }
        }

        @Override
        public void run() {
            try {
                socket = new WebSocket(transport.open(HOST), HOST, PATH);
                for (String type : new String[]{"entitlement.*", "cosmetic.*"}) socket.send(subscription(35, type, subscribed));
                Logger.d("badges: 7TV events connected for channel " + subscribed);
                while (!closed) {
                    String text;
                    try {
                        text = socket.receive();
                    } catch (SocketTimeoutException idle) {
                        if (SystemClock.elapsedRealtime() - lastUse > IDLE_MS || !enabled()) {
                            shutdown("idle");
                            socket.close();
                            return;
                        }
                        continue;
                    }
                    if (text == null) break;
                    if (!handle(text)) break;
                    if (!enabled()) {
                        shutdown("switched off");
                        socket.close();
                        return;
                    }
                }
                retryAt = SystemClock.elapsedRealtime() + (closed ? 0 : 1000);
                socket.close();
            } catch (IOException | RuntimeException e) {
                if (!closed) {
                    retryAt = SystemClock.elapsedRealtime() + RETRY_MS;
                    Logger.d("badges: 7TV events unavailable: " + e);
                }
            } finally {
                closed = true;
            }
        }

        private void shutdown(String why) {
            closed = true;
            Logger.d("badges: 7TV events closed: " + why);
        }
    }

    /** A minimal RFC 6455 client: text frames in and out, ping, pong and close; no extensions. */
    static final class WebSocket {
        private final Socket socket;
        private final InputStream in;
        private final OutputStream out;
        private final SecureRandom random = new SecureRandom();

        WebSocket(Socket socket, String host, String path) throws IOException {
            this.socket = socket;
            socket.setSoTimeout(READ_TIMEOUT_MS);
            in = new BufferedInputStream(socket.getInputStream());
            out = socket.getOutputStream();
            byte[] nonce = new byte[16];
            random.nextBytes(nonce);
            String key = Base64.getEncoder().encodeToString(nonce);
            out.write(("GET " + path + " HTTP/1.1\r\nHost: " + host + "\r\nUpgrade: websocket\r\nConnection: Upgrade\r\n"
                    + "Sec-WebSocket-Key: " + key + "\r\nSec-WebSocket-Version: 13\r\nUser-Agent: " + USER_AGENT
                    + "\r\n\r\n").getBytes(StandardCharsets.US_ASCII));
            out.flush();
            String response = readHeaders();
            String expected = Base64.getEncoder().encodeToString(sha1((key + GUID).getBytes(StandardCharsets.US_ASCII)));
            if (!response.startsWith("HTTP/1.1 101") || !response.toLowerCase(Locale.ROOT)
                    .contains("sec-websocket-accept: " + expected.toLowerCase(Locale.ROOT))) {
                socket.close();
                throw new IOException("handshake refused: " + response.split("\r\n", 2)[0]);
            }
        }

        private String readHeaders() throws IOException {
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            int matched = 0;
            while (matched < 4) {
                int b = in.read();
                if (b < 0) throw new EOFException("handshake cut short");
                buffer.write(b);
                matched = b == ("\r\n\r\n".charAt(matched)) ? matched + 1 : b == '\r' ? 1 : 0;
                if (buffer.size() > 16384) throw new IOException("handshake too long");
            }
            return buffer.toString("ISO-8859-1");
        }

        synchronized void send(String text) throws IOException {
            frame(1, text.getBytes(StandardCharsets.UTF_8));
        }

        private synchronized void frame(int opcode, byte[] payload) throws IOException {
            ByteArrayOutputStream frame = new ByteArrayOutputStream(payload.length + 14);
            frame.write(0x80 | opcode);
            if (payload.length < 126) {
                frame.write(0x80 | payload.length);
            } else if (payload.length < 65536) {
                frame.write(0x80 | 126);
                frame.write(payload.length >>> 8);
                frame.write(payload.length);
            } else {
                frame.write(0x80 | 127);
                for (int shift = 56; shift >= 0; shift -= 8) frame.write((int) ((long) payload.length >>> shift));
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
                int first = read();
                int second = read();
                boolean fin = (first & 0x80) != 0;
                int opcode = first & 0x0f;
                boolean masked = (second & 0x80) != 0;
                long length = second & 0x7f;
                if (length == 126) length = (read() << 8) | read();
                else if (length == 127) {
                    length = 0;
                    for (int i = 0; i < 8; i++) length = (length << 8) | read();
                }
                if (length > MAX_FRAME || length < 0) throw new IOException("frame too large: " + length);
                byte[] mask = masked ? readFully(4) : null;
                byte[] payload = readFully((int) length);
                if (mask != null) for (int i = 0; i < payload.length; i++) payload[i] ^= mask[i & 3];
                switch (opcode) {
                    case 0:
                    case 1:
                        if (opcode == 1) message = new ByteArrayOutputStream();
                        if (message == null) throw new IOException("continuation without a start");
                        message.write(payload);
                        if (message.size() > MAX_FRAME) throw new IOException("message too large");
                        if (fin) return message.toString("UTF-8");
                        break;
                    case 8:
                        try { frame(8, new byte[0]); } catch (IOException ignored) { }
                        return null;
                    case 9:
                        frame(10, payload);
                        break;
                    default:
                        break; // pong, binary
                }
            }
        }

        private int read() throws IOException {
            int b = in.read();
            if (b < 0) throw new EOFException("connection closed");
            return b;
        }

        private byte[] readFully(int length) throws IOException {
            byte[] bytes = new byte[length];
            int at = 0;
            while (at < length) {
                int read = in.read(bytes, at, length - at);
                if (read < 0) throw new EOFException("connection closed");
                at += read;
            }
            return bytes;
        }

        void close() {
            try {
                frame(8, new byte[0]);
            } catch (IOException ignored) {
                // Closing anyway.
            }
            try {
                socket.close();
            } catch (IOException ignored) {
                // Closed.
            }
        }

        private static byte[] sha1(byte[] bytes) throws IOException {
            try {
                return MessageDigest.getInstance("SHA-1").digest(bytes);
            } catch (java.security.NoSuchAlgorithmException e) {
                throw new IOException(e);
            }
        }
    }
}
