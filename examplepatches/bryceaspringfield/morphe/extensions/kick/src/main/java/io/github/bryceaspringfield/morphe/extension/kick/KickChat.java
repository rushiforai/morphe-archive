package io.github.bryceaspringfield.morphe.extension.kick;

import org.json.JSONObject;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import okhttp3.Response;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import okio.ByteString;

/**
 * A chat socket's listener, passing on every message but the chat messages the filters hide (Pusher events whose
 * data is a chat message from a hidden user or with a hidden word).
 */
final class KickChat extends WebSocketListener {

    private static final Set<String> EVENTS_SEEN = Collections.synchronizedSet(new HashSet<>());
    private final WebSocketListener inner;

    KickChat(WebSocketListener inner) {
        this.inner = inner;
    }

    @Override
    public void onOpen(WebSocket webSocket, Response response) {
        inner.onOpen(webSocket, response);
    }

    @Override
    public void onMessage(WebSocket webSocket, String text) {
        String out = filter(text);
        if (out != null) inner.onMessage(webSocket, out);
    }

    @Override
    public void onMessage(WebSocket webSocket, ByteString bytes) {
        ByteString out = filterBinary(bytes);
        if (out != null) inner.onMessage(webSocket, out);
    }

    @Override
    public void onClosing(WebSocket webSocket, int code, String reason) {
        inner.onClosing(webSocket, code, reason);
    }

    @Override
    public void onClosed(WebSocket webSocket, int code, String reason) {
        inner.onClosed(webSocket, code, reason);
    }

    @Override
    public void onFailure(WebSocket webSocket, Throwable t, Response response) {
        inner.onFailure(webSocket, t, response);
    }

    private static int framesLogged;

    /**
     * The frame without its hidden chat messages; null when every message of the frame is hidden. KICK's chat runs
     * on Centrifugo (one JSON reply a line, a publication at push.pub.data); Pusher frames (event and data) are read
     * too.
     */
    static String filter(String text) {
        try {
            if (text == null || text.length() > 500_000) return text;
            if (Kick.debug() && framesLogged < 6 && text.contains("content")) {
                framesLogged++;
                Kick.log("socket frame: " + text.substring(0, Math.min(900, text.length())));
            }
            KickHttp.Filters f = KickHttp.Filters.now();
            if (f.chatWords.isEmpty() && f.chatUsers.isEmpty()) return text;
            String[] lines = text.split("\n", -1);
            StringBuilder out = new StringBuilder();
            int kept = 0, hidden = 0;
            for (String line : lines) {
                if (hiddenLine(line, f)) {
                    hidden++;
                    continue;
                }
                if (kept++ > 0) out.append('\n');
                out.append(line);
            }
            if (hidden == 0) return text;
            return kept == 0 ? null : out.toString();
        } catch (Throwable t) {
            return text;
        }
    }

    private static boolean hiddenLine(String line, KickHttp.Filters f) {
        try {
            if (!line.startsWith("{") || !line.contains("content")) return false;
            JSONObject e = new JSONObject(line);
            Object d = null;
            JSONObject push = e.optJSONObject("push");
            JSONObject pub = push == null ? e.optJSONObject("pub") : push.optJSONObject("pub");
            if (pub != null) d = pub.opt("data");
            else if (e.has("event")) {
                String event = e.optString("event");
                if (Kick.debug() && EVENTS_SEEN.add(event)) Kick.log("socket event " + event);
                d = e.opt("data");
            }
            JSONObject data = d instanceof JSONObject j ? j : d instanceof String s && s.startsWith("{") ? new JSONObject(s) : null;
            if (data == null) return false;
            String why = f.hides(data);
            if (why != null) Kick.log("chat message hidden: " + why);
            return why != null;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * A binary frame without its hidden chat messages; null when every message is hidden. Centrifugo's protobuf
     * protocol sends replies one after another, each led by its length as a varint; a publication's data is the
     * chat message's JSON, kept as is inside the reply's bytes, and is read by matching its braces.
     */
    static ByteString filterBinary(ByteString bytes) {
        try {
            byte[] b = bytes.toByteArray();
            if (Kick.debug() && binaryLogged < 4 && contains(b, "\"content\"")) {
                binaryLogged++;
                String t = new String(b, java.nio.charset.StandardCharsets.UTF_8).replaceAll("[\\x00-\\x1f]", ".");
                Kick.log("socket binary chat frame, " + b.length + " bytes: " + t.substring(0, Math.min(700, t.length())));
            }
            KickHttp.Filters f = KickHttp.Filters.now();
            if (f.chatWords.isEmpty() && f.chatUsers.isEmpty()) return bytes;
            java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream(b.length);
            int i = 0, hidden = 0, kept = 0;
            while (i < b.length) {
                int start = i;
                long len = 0;
                int shift = 0;
                while (true) {
                    if (i >= b.length || shift > 28) return bytes;
                    int c = b[i++] & 0xff;
                    len |= (long) (c & 0x7f) << shift;
                    if (c < 0x80) break;
                    shift += 7;
                }
                if (len < 0 || i + len > b.length) return bytes;
                int end = (int) (i + len);
                if (hiddenReply(b, i, end, f)) hidden++;
                else {
                    out.write(b, start, end - start);
                    kept++;
                }
                i = end;
            }
            if (hidden == 0) return bytes;
            return kept == 0 ? null : ByteString.of(out.toByteArray());
        } catch (Throwable t) {
            return bytes;
        }
    }

    private static int binaryLogged;

    private static boolean contains(byte[] b, String what) {
        byte[] w = what.getBytes(java.nio.charset.StandardCharsets.UTF_8);
        outer:
        for (int i = 0; i + w.length <= b.length; i++) {
            for (int j = 0; j < w.length; j++) if (b[i + j] != w[j]) continue outer;
            return true;
        }
        return false;
    }

    /** True when the reply between from and to holds a chat message's JSON which the filters hide. */
    private static boolean hiddenReply(byte[] b, int from, int to, KickHttp.Filters f) {
        for (int i = from; i < to; i++) {
            if (b[i] != '{') continue;
            int depth = 0;
            boolean str = false, esc = false;
            for (int j = i; j < to; j++) {
                byte c = b[j];
                if (str) {
                    if (esc) esc = false;
                    else if (c == '\\') esc = true;
                    else if (c == '"') str = false;
                } else if (c == '"') str = true;
                else if (c == '{') depth++;
                else if (c == '}' && --depth == 0) {
                    String json = new String(b, i, j + 1 - i, java.nio.charset.StandardCharsets.UTF_8);
                    if (!json.contains("\"content\"")) {
                        i = j;
                        break;
                    }
                    try {
                        String why = f.hides(new JSONObject(json));
                        if (why != null) Kick.log("chat message hidden: " + why);
                        return why != null;
                    } catch (Throwable t) {
                        break;
                    }
                }
            }
        }
        return false;
    }
}
