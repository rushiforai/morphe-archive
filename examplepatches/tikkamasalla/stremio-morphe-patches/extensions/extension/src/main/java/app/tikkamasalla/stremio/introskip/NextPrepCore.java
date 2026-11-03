package app.tikkamasalla.stremio.introskip;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.zip.Deflater;
import java.util.zip.Inflater;

/**
 * Pure decisions and encodings of {@link NextPrep} (no Android classes), unit tested standalone.
 * Own Base64 (java.util.Base64 needs API 26), locale-free
 * hex and lower-casing, bounded inflate loop.
 */
final class NextPrepCore {
    static final long MAX_AGE_MS = 3L * 3600L * 1000L;
    static final long ABANDON_MS = 25000L;
    private static final char[] HEX = "0123456789ABCDEF".toCharArray();
    private static final char[] B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".toCharArray();
    private static final char[] B64URL = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_".toCharArray();

    private NextPrepCore() {
    }

    /** Transport URL to resource base: "https://a/x/manifest.json" -> "https://a/x"; "" unless http(s). */
    static String addonBase(String transportUrl) {
        try {
            if (transportUrl == null) return "";
            String base = transportUrl.trim();
            String lower = base.toLowerCase(Locale.ROOT);
            if (!lower.startsWith("http://") && !lower.startsWith("https://")) return "";
            if (lower.endsWith("/manifest.json")) base = base.substring(0, base.length() - "/manifest.json".length());
            while (base.endsWith("/")) base = base.substring(0, base.length() - 1);
            return base.toLowerCase(Locale.ROOT).matches("https?:/?/?") ? "" : base;
        } catch (Throwable t) {
            return "";
        }
    }

    /** encodeURIComponent / stremio-core URI_COMPONENT_ENCODE_SET. */
    static String encodeComponent(String s) {
        try {
            if (s == null) return "";
            byte[] bytes = s.getBytes("UTF-8");
            StringBuilder sb = new StringBuilder(bytes.length * 3);
            for (byte b : bytes) {
                int c = b & 0xFF;
                if ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9')
                        || c == '-' || c == '_' || c == '.' || c == '!' || c == '~' || c == '*' || c == '\''
                        || c == '(' || c == ')') {
                    sb.append((char) c);
                } else {
                    sb.append('%').append(HEX[c >> 4]).append(HEX[c & 0xF]);
                }
            }
            return sb.toString();
        } catch (Throwable t) {
            return "";
        }
    }

    /** Stremio addon protocol: base + "/stream/{type}/{id}.json". */
    static String streamRequestUrl(String transportUrl, String type, String videoId) {
        try {
            String base = addonBase(transportUrl);
            if (base.length() == 0 || type == null || type.length() == 0 || videoId == null || videoId.length() == 0) {
                return "";
            }
            return base + "/stream/" + encodeComponent(type) + "/" + encodeComponent(videoId) + ".json";
        } catch (Throwable t) {
            return "";
        }
    }

    /** Manifest rules for the "stream" resource (resource entry overrides manifest-level types/idPrefixes). */
    @SuppressWarnings("unchecked")
    static boolean supportsStream(List<Object> resources, List<String> types, List<String> idPrefixes, String type,
                                  String id) {
        try {
            if (resources == null || type == null || id == null) return false;
            boolean found = false;
            List<String> effTypes = types;
            List<String> effPrefixes = idPrefixes;
            for (Object res : resources) {
                if ("stream".equals(res)) {
                    found = true;
                    break;
                }
                if (res instanceof Map && "stream".equals(((Map<?, ?>) res).get("name"))) {
                    Map<?, ?> map = (Map<?, ?>) res;
                    found = true;
                    if (map.get("types") instanceof List) effTypes = (List<String>) map.get("types");
                    if (map.get("idPrefixes") instanceof List) effPrefixes = (List<String>) map.get("idPrefixes");
                    break;
                }
            }
            if (!found || effTypes == null || !effTypes.contains(type)) return false;
            if (effPrefixes == null) return true;
            for (String prefix : effPrefixes) {
                if (prefix != null && id.startsWith(prefix)) return true;
            }
            return false;
        } catch (Throwable t) {
            return false;
        }
    }

    /** One playable stream of an addon answer; json is the addon's own object, handed to the core unchanged. */
    static final class Cand {
        final String name, title, url, fileName, json;
        final boolean hasTorrent;

        Cand(String name, String title, String url, String fileName, String json, boolean hasTorrent) {
            this.name = name;
            this.title = title;
            this.url = url;
            this.fileName = fileName;
            this.json = json;
            this.hasTorrent = hasTorrent;
        }
    }

    static List<Cand> parseStreams(String body) {
        List<Cand> result = new ArrayList<Cand>();
        try {
            if (body == null || body.length() == 0) return result;
            JSONArray streams = new JSONObject(body).optJSONArray("streams");
            if (streams == null) return result;
            for (int i = 0; i < streams.length(); i++) {
                JSONObject obj = streams.optJSONObject(i);
                if (obj == null || obj.has("externalUrl") || obj.has("ytId") || obj.has("playerFrameUrl")) continue;
                String url = obj.optString("url", "");
                String lower = url.toLowerCase(Locale.ROOT);
                boolean isHttp = lower.startsWith("http://") || lower.startsWith("https://");
                boolean hasTorrent = obj.optString("infoHash", "").length() > 0;
                if (!isHttp && !hasTorrent) continue;
                String desc = obj.optString("description", "");
                String title = desc.length() == 0 ? obj.optString("title", "") : desc;
                JSONObject hints = obj.optJSONObject("behaviorHints");
                String fileName = hints == null ? "" : hints.optString("filename", "");
                result.add(new Cand(obj.optString("name", ""), title, isHttp ? url : "", fileName, obj.toString(),
                        hasTorrent));
            }
        } catch (Throwable t) {
            // Whatever parsed so far.
        }
        return result;
    }

    /** stremio-core Stream::encode: zlib (with header) of the JSON, then Base64 with padding. */
    static String encodeStreamData(String json, boolean urlSafe) {
        try {
            if (json == null || json.length() == 0) return "";
            Deflater deflater = new Deflater();
            deflater.setInput(json.getBytes("UTF-8"));
            deflater.finish();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[1024];
            while (!deflater.finished()) {
                int n = deflater.deflate(buf);
                out.write(buf, 0, n);
            }
            deflater.end();
            return base64(out.toByteArray(), urlSafe);
        } catch (Throwable t) {
            return "";
        }
    }

    /** Inverse of encodeStreamData (either alphabet); "" on failure. Tests only. */
    static String decodeStreamData(String data) {
        try {
            byte[] compressed = unbase64(data);
            if (compressed == null) return "";
            Inflater inflater = new Inflater();
            inflater.setInput(compressed);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[1024];
            for (int guard = 0; !inflater.finished() && guard < 100000; guard++) {
                int n = inflater.inflate(buf);
                if (n == 0 && (inflater.needsInput() || inflater.needsDictionary())) break;
                out.write(buf, 0, n);
            }
            boolean done = inflater.finished();
            inflater.end();
            return done ? new String(out.toByteArray(), "UTF-8") : "";
        } catch (Throwable t) {
            return "";
        }
    }

    static String base64(byte[] in, boolean urlSafe) {
        char[] a = urlSafe ? B64URL : B64;
        StringBuilder sb = new StringBuilder((in.length + 2) / 3 * 4);
        for (int i = 0; i < in.length; i += 3) {
            int b0 = in[i] & 0xFF;
            int b1 = i + 1 < in.length ? in[i + 1] & 0xFF : 0;
            int b2 = i + 2 < in.length ? in[i + 2] & 0xFF : 0;
            sb.append(a[b0 >> 2]).append(a[((b0 & 3) << 4) | (b1 >> 4)]);
            sb.append(i + 1 < in.length ? a[((b1 & 15) << 2) | (b2 >> 6)] : '=');
            sb.append(i + 2 < in.length ? a[b2 & 63] : '=');
        }
        return sb.toString();
    }

    static byte[] unbase64(String s) {
        if (s == null) return null;
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        int acc = 0, bits = 0;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            int v;
            if (c >= 'A' && c <= 'Z') v = c - 'A';
            else if (c >= 'a' && c <= 'z') v = c - 'a' + 26;
            else if (c >= '0' && c <= '9') v = c - '0' + 52;
            else if (c == '+' || c == '-') v = 62;
            else if (c == '/' || c == '_') v = 63;
            else if (c == '=') break;
            else return null;
            acc = (acc << 6) | v;
            bits += 6;
            if (bits >= 8) {
                bits -= 8;
                out.write((acc >> bits) & 0xFF);
            }
        }
        return out.toByteArray();
    }

    /** stremio-core StreamDeepLinks.player with stream and meta requests; "" when anything is missing. */
    static String playerLink(String streamData, String streamTransportUrl, String metaTransportUrl, String type,
                             String metaId, String videoId) {
        if (empty(streamData) || empty(streamTransportUrl) || empty(metaTransportUrl) || empty(type)
                || empty(metaId) || empty(videoId)) {
            return "";
        }
        return "stremio:///player/" + encodeComponent(streamData) + "/" + encodeComponent(streamTransportUrl) + "/"
                + encodeComponent(metaTransportUrl) + "/" + encodeComponent(type) + "/" + encodeComponent(metaId)
                + "/" + encodeComponent(videoId);
    }

    /** "tt0944947:1:2" -> "tt0944947", "kitsu:46474:5" -> "kitsu:46474"; other shapes unchanged. */
    static String metaIdOf(String videoId) {
        if (videoId == null) return "";
        String[] parts = videoId.split(":");
        if (parts.length != 3) return videoId;
        return videoId.startsWith("tt") ? parts[0] : parts[0] + ":" + parts[1];
    }

    /** Full video id from {show id, season, episode} parts: "tt0944947:1:2", "kitsu:46474:5"; "" when unknown. */
    static String fullVideoId(String[] parts) {
        if (parts == null || parts.length == 0 || empty(parts[0])) return "";
        if (parts.length < 3 || empty(parts[2]) || "0".equals(parts[2])) return parts[0];
        if (parts[0].startsWith("kitsu:")) return parts[0] + ":" + parts[2];
        return parts[0] + ":" + (empty(parts[1]) ? "0" : parts[1]) + ":" + parts[2];
    }

    /** Prefetch window: past 85 % of a 5 min+ episode, or inside a credits segment of its second half. */
    static boolean shouldPrepare(boolean enabled, boolean series, boolean hasNext, boolean done, double posSec,
                                 double durSec, double creditsStartSec) {
        if (!enabled || !series || !hasNext || done || durSec < 300 || posSec <= 0) return false;
        return posSec >= 0.85 * durSec || (creditsStartSec > 0.5 * durSec && posSec >= creditsStartSec);
    }

    /** 0 = start the prepared stream now, 1 = today's streams page and auto-pick. */
    static int useDecision(boolean prefOn, boolean autoPickOn, boolean showListOn, boolean haveLink,
                           String preparedFor, String requestedId, long ageMs, boolean expectedNext) {
        if (!prefOn || !autoPickOn || showListOn || !haveLink || !expectedNext) return 1;
        if (empty(preparedFor) || !preparedFor.equals(requestedId)) return 1;
        return ageMs >= 0 && ageMs <= MAX_AGE_MS ? 0 : 1;
    }

    /**
     * A prepared start with no first frame after 25 s (or a player error) leaves the player.
     * holdMs is the time the frame-rate pre-switch kept this start on the loading screen; while a switch
     * is settling, the effective wait does not grow, so a slow display change alone never abandons.
     */
    static boolean shouldAbandon(long sinceLaunchMs, boolean firstFrame, boolean playerError, boolean userActed) {
        return shouldAbandon(sinceLaunchMs, 0L, firstFrame, playerError, userActed);
    }

    static boolean shouldAbandon(long sinceLaunchMs, long holdMs, boolean firstFrame, boolean playerError,
                                 boolean userActed) {
        if (userActed || firstFrame) return false;
        long waited = sinceLaunchMs - (holdMs > 0L ? holdMs : 0L);
        return playerError || waited >= ABANDON_MS;
    }

    /** Time the viewer had the start paused does not count against the limit: hold grows by each paused poll gap. */
    static long pausedHold(long holdMs, long lastPollAtMs, long nowMs, boolean paused) {
        return paused && lastPollAtMs > 0L && nowMs > lastPollAtMs ? holdMs + (nowMs - lastPollAtMs) : holdMs;
    }

    private static boolean empty(String s) {
        return s == null || s.length() == 0;
    }
}
