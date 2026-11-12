package app.template.extension.wemuslim;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Locale;

/**
 * Pure string logic (no Android types) that recognises the promotion shortcuts by their link: the
 * "Egg" smash campaign page, the "Rebates" gold page and the Trip.com affiliate link. A link may be
 * wrapped in an app deep link with the real target URL-encoded in a parameter, so every URL found
 * in the link, after up to three rounds of percent-decoding, is checked.
 */
public final class ShortcutLinks {

    private static final int DECODE_ROUNDS = 3;

    private ShortcutLinks() {
    }

    /** True when the link, or a URL embedded in it, points at a promotion page. */
    public static boolean isPromotion(String link) {
        if (link == null || link.isEmpty()) return false;
        String current = link;
        for (int round = 0; round <= DECODE_ROUNDS; round++) {
            String lower = current.toLowerCase(Locale.ROOT);
            int from = 0;
            int at;
            while ((at = lower.indexOf("://", from)) >= 0) {
                String[] hostPath = hostAndPath(lower, at + 3);
                if (matches(hostPath[0], hostPath[1])) return true;
                from = at + 3;
            }
            String decoded = percentDecode(current);
            if (decoded.equals(current)) break;
            current = decoded;
        }
        return false;
    }

    static boolean matches(String host, String path) {
        if (host.equals("activity.wemuapp.com")) return path.contains("smash-egg");
        if (host.equals("h5.wemuapp.com")) return path.startsWith("/front/ota/");
        return host.equals("trip.com") || host.endsWith(".trip.com");
    }

    /**
     * A log-safe form of the link: scheme://host/path of the outer link plus host/path of the first
     * embedded URL, never a query string or fragment (they carry the user id).
     */
    public static String describe(String link) {
        if (link == null || link.isEmpty()) return "-";
        String lower = link.toLowerCase(Locale.ROOT);
        int at = lower.indexOf("://");
        if (at < 0) {
            String[] local = hostAndPath(lower, 0);
            return local[0] + local[1];
        }
        String[] outer = hostAndPath(lower, at + 3);
        StringBuilder out = new StringBuilder(lower.substring(0, at)).append("://").append(outer[0]).append(outer[1]);
        String decoded = lower;
        for (int round = 0; round < DECODE_ROUNDS; round++) {
            String next = percentDecode(decoded);
            if (next.equals(decoded)) break;
            decoded = next;
        }
        int inner = decoded.indexOf("://", decoded.indexOf("://") + 3);
        if (inner >= 0) {
            String[] embedded = hostAndPath(decoded, inner + 3);
            out.append(" > ").append(embedded[0]).append(embedded[1]);
        }
        return out.toString();
    }

    /** Host (without user info or port) and path that start at {@code start}, a lower-case URL. */
    static String[] hostAndPath(String url, int start) {
        int end = start;
        while (end < url.length() && "/?#&".indexOf(url.charAt(end)) < 0 && !Character.isWhitespace(url.charAt(end))) {
            end++;
        }
        String host = url.substring(start, end);
        int user = host.lastIndexOf('@');
        if (user >= 0) host = host.substring(user + 1);
        int port = host.indexOf(':');
        if (port >= 0) host = host.substring(0, port);
        int pathEnd = end;
        if (end < url.length() && url.charAt(end) == '/') {
            while (pathEnd < url.length() && "?#&".indexOf(url.charAt(pathEnd)) < 0 && !Character.isWhitespace(url.charAt(pathEnd))) {
                pathEnd++;
            }
        }
        return new String[] {host, url.substring(end, pathEnd)};
    }

    /** Decodes %XX sequences as UTF-8 and '+' as a space; malformed escapes stay as they are. */
    static String percentDecode(String value) {
        if (value.indexOf('%') < 0 && value.indexOf('+') < 0) return value;
        ByteArrayOutputStream bytes = new ByteArrayOutputStream(value.length());
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (c == '%' && i + 2 < value.length()) {
                int high = Character.digit(value.charAt(i + 1), 16);
                int low = Character.digit(value.charAt(i + 2), 16);
                if (high >= 0 && low >= 0) {
                    bytes.write((high << 4) | low);
                    i += 2;
                    continue;
                }
            }
            if (c == '+') {
                bytes.write(' ');
            } else {
                int codePoint = value.codePointAt(i);
                byte[] encoded = new String(Character.toChars(codePoint)).getBytes(StandardCharsets.UTF_8);
                bytes.write(encoded, 0, encoded.length);
                i += Character.charCount(codePoint) - 1;
            }
        }
        return new String(bytes.toByteArray(), StandardCharsets.UTF_8);
    }
}
