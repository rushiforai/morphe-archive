package nl.johninnl.eclipse.auto.tree;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;

/**
 * The media ids of the classic browse tree. Every id this extension creates starts with
 * {@code eclipse:}; the app's own ids ({@code [library]}, {@code playlist::…}, {@code radio::…},
 * {@code queue::…}) never do, so the two never collide and the shipped ones keep working untouched.
 *
 * <pre>
 * eclipse:home | eclipse:discover | eclipse:queue | eclipse:dj (starts the Umbra DJ)
 * eclipse:h/&lt;row&gt;            a Home row (the parent of its songs' ids)   eclipse:d/&lt;section&gt;  a Discover section (likewise)
 * eclipse:c/&lt;type&gt;/&lt;key&gt;    a collection (album, artist, playlist, editorial, mix, card, favorites, facet, list, linkedlib, native, show)
 * eclipse:t/&lt;parent&gt;/&lt;i&gt;    song i of the list under &lt;parent&gt; (a parent id, percent-encoded)
 * eclipse:q/u/&lt;i&gt;  eclipse:q/c/&lt;i&gt;   Up Next position i / absolute context-queue index i
 * eclipse:live/&lt;station&gt;     tune a live station
 * eclipse:more/&lt;parent&gt;/&lt;n&gt;  the rest of &lt;parent&gt;'s list from item n
 * eclipse:retry/&lt;feed&gt;       refresh Home or Discover   eclipse:notice/&lt;kind&gt;  an informational leaf
 * </pre>
 *
 * Every variable part is percent-encoded (UTF-8; everything except {@code A-Za-z0-9-._~}), so
 * keys that contain {@code /}, {@code :} or {@code ::} survive and no id contains a token or a
 * capability URL. Parsing never throws: anything it does not recognise is {@link Kind#UNKNOWN}.
 */
public final class MediaIds {
    public static final String ROOT = "[root]";
    public static final String LIBRARY = "[library]";
    public static final String RADIO = "[radio]";
    public static final String PREFIX = "eclipse:";
    public static final String HOME = "eclipse:home";
    public static final String DISCOVER = "eclipse:discover";
    public static final String QUEUE = "eclipse:queue";
    /** The Umbra DJ card: a playable item that starts the DJ. */
    public static final String DJ = "eclipse:dj";

    public enum Kind {
        ROOT, LIBRARY, RADIO, HOME, DISCOVER, QUEUE, DJ,
        ROW, SECTION, COLLECTION, TRACK, UP_NEXT, CONTEXT, LIVE, MORE, RETRY, NOTICE,
        /** Starts with {@code eclipse:} but is not one of ours (or is malformed): answered with an empty list. */
        UNKNOWN,
        /** Not one of ours at all: the app's own code handles it. */
        SHIPPED
    }

    /** A parsed id: which kind, and its decoded parts. */
    public static final class Parsed {
        public final Kind kind;
        /** Type, key, parent id, station id or feed name, depending on {@link #kind}. */
        public final String a;
        public final String b;
        public final int index;

        Parsed(Kind kind, String a, String b, int index) {
            this.kind = kind;
            this.a = a;
            this.b = b;
            this.index = index;
        }
    }

    // ---- building ------------------------------------------------------------------------------

    public static String row(String key) { return PREFIX + "h/" + encode(key); }

    public static String section(String key) { return PREFIX + "d/" + encode(key); }

    public static String collection(String type, String key) { return PREFIX + "c/" + encode(type) + "/" + encode(key); }

    public static String track(String parentId, int index) { return PREFIX + "t/" + encode(parentId) + "/" + index; }

    public static String upNext(int position) { return PREFIX + "q/u/" + position; }

    public static String context(int absoluteIndex) { return PREFIX + "q/c/" + absoluteIndex; }

    public static String live(String stationId) { return PREFIX + "live/" + encode(stationId); }

    public static String more(String parentId, int offset) { return PREFIX + "more/" + encode(parentId) + "/" + offset; }

    public static String retry(String feed) { return PREFIX + "retry/" + encode(feed); }

    public static String notice(String kind) { return PREFIX + "notice/" + encode(kind); }

    // ---- parsing -------------------------------------------------------------------------------

    /** True for ids this class owns (the {@code eclipse:} prefix). */
    public static boolean isOurs(String id) { return id != null && id.startsWith(PREFIX); }

    /** True for the ids the browse hook answers instead of the app: ours, plus the three nodes whose shape changes. */
    public static boolean handles(String id) {
        return id != null && (isOurs(id) || ROOT.equals(id) || LIBRARY.equals(id) || RADIO.equals(id));
    }

    public static Parsed parse(String id) {
        if (id == null) return new Parsed(Kind.SHIPPED, null, null, 0);
        switch (id) {
            case ROOT: return new Parsed(Kind.ROOT, null, null, 0);
            case LIBRARY: return new Parsed(Kind.LIBRARY, null, null, 0);
            case RADIO: return new Parsed(Kind.RADIO, null, null, 0);
            case HOME: return new Parsed(Kind.HOME, null, null, 0);
            case DISCOVER: return new Parsed(Kind.DISCOVER, null, null, 0);
            case QUEUE: return new Parsed(Kind.QUEUE, null, null, 0);
            case DJ: return new Parsed(Kind.DJ, null, null, 0);
            default: break;
        }
        if (!isOurs(id)) return new Parsed(Kind.SHIPPED, null, null, 0);
        try {
            String[] parts = id.substring(PREFIX.length()).split("/", -1);
            switch (parts[0]) {
                case "h": return one(Kind.ROW, parts);
                case "d": return one(Kind.SECTION, parts);
                case "c":
                    if (parts.length != 3) break;
                    return new Parsed(Kind.COLLECTION, decode(parts[1]), decode(parts[2]), 0);
                case "t":
                    if (parts.length != 3) break;
                    return new Parsed(Kind.TRACK, decode(parts[1]), null, number(parts[2]));
                case "q":
                    if (parts.length != 3) break;
                    if (parts[1].equals("u")) return new Parsed(Kind.UP_NEXT, null, null, number(parts[2]));
                    if (parts[1].equals("c")) return new Parsed(Kind.CONTEXT, null, null, number(parts[2]));
                    break;
                case "live": return one(Kind.LIVE, parts);
                case "more":
                    if (parts.length != 3) break;
                    return new Parsed(Kind.MORE, decode(parts[1]), null, number(parts[2]));
                case "retry": return one(Kind.RETRY, parts);
                case "notice": return one(Kind.NOTICE, parts);
                default: break;
            }
        } catch (IllegalArgumentException malformed) {
            // Falls through to UNKNOWN.
        }
        return new Parsed(Kind.UNKNOWN, null, null, 0);
    }

    private static Parsed one(Kind kind, String[] parts) {
        if (parts.length != 2) throw new IllegalArgumentException("Expected one segment");
        return new Parsed(kind, decode(parts[1]), null, 0);
    }

    private static int number(String text) {
        if (text.isEmpty() || text.length() > 9) throw new IllegalArgumentException("Not an index");
        for (int i = 0; i < text.length(); i++) if (text.charAt(i) < '0' || text.charAt(i) > '9') throw new IllegalArgumentException("Not an index");
        return Integer.parseInt(text);
    }

    // ---- percent encoding ----------------------------------------------------------------------

    private static boolean unreserved(int c) {
        return (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9') || c == '-' || c == '.' || c == '_' || c == '~';
    }

    /** Percent-encodes every UTF-8 byte except the unreserved characters. */
    public static String encode(String value) {
        StringBuilder out = new StringBuilder();
        for (byte b : (value == null ? "" : value).getBytes(StandardCharsets.UTF_8)) {
            int c = b & 0xff;
            if (unreserved(c)) {
                out.append((char) c);
            } else {
                out.append('%').append(Character.toUpperCase(Character.forDigit(c >> 4, 16))).append(Character.toUpperCase(Character.forDigit(c & 15, 16)));
            }
        }
        return out.toString();
    }

    /** The inverse of {@link #encode}; throws {@link IllegalArgumentException} on a malformed escape. */
    public static String decode(String value) {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream(value.length());
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (c == '%') {
                if (i + 2 >= value.length()) throw new IllegalArgumentException("Truncated escape");
                int high = Character.digit(value.charAt(i + 1), 16);
                int low = Character.digit(value.charAt(i + 2), 16);
                if (high < 0 || low < 0) throw new IllegalArgumentException("Bad escape");
                bytes.write((high << 4) | low);
                i += 2;
            } else if (c < 0x80 && unreserved(c)) {
                bytes.write(c);
            } else {
                // An unescaped reserved or non-ASCII character is never produced by encode().
                throw new IllegalArgumentException("Unescaped character");
            }
        }
        return new String(bytes.toByteArray(), StandardCharsets.UTF_8);
    }

    private MediaIds() { }
}
