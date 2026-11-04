package app.wordfeudwordfinder.extension.play;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Tiny pure-Java encoders for the Flutter platform message formats the refresh strategies send (the extension
 * cannot link Flutter's own codecs).
 *
 * <ul>
 *   <li>{@link #standard}: Flutter's {@code StandardMessageCodec} (pigeon channels), for null, Boolean, Integer
 *       (int32), Long (int64), String, List and Map. Little endian, like the Android embedding. Types that need
 *       alignment (doubles, typed arrays) are not supported.
 *   <li>{@link #standardMethodCall}: {@code StandardMethodCodec.encodeMethodCall}: method name, then arguments.
 *   <li>{@link #jsonMethodCall}: {@code JSONMethodCodec}: {@code {"method":…,"args":…}} as UTF-8.
 * </ul>
 */
public final class MessageCodecs {
    private static final int NULL = 0;
    private static final int TRUE = 1;
    private static final int FALSE = 2;
    private static final int INT = 3;
    private static final int LONG = 4;
    private static final int STRING = 7;
    private static final int LIST = 12;
    private static final int MAP = 13;

    private MessageCodecs() {}

    public static byte[] standard(Object value) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        write(out, value);
        return out.toByteArray();
    }

    public static byte[] standardMethodCall(String method, Object arguments) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        write(out, method);
        write(out, arguments);
        return out.toByteArray();
    }

    public static byte[] jsonMethodCall(String method, Map<String, ?> args) {
        StringBuilder sb = new StringBuilder("{\"method\":");
        json(sb, method);
        sb.append(",\"args\":");
        json(sb, args);
        sb.append('}');
        return sb.toString().getBytes(StandardCharsets.UTF_8);
    }

    private static void write(ByteArrayOutputStream out, Object v) {
        if (v == null) {
            out.write(NULL);
        } else if (v instanceof Boolean) {
            out.write(((Boolean) v) ? TRUE : FALSE);
        } else if (v instanceof Integer) {
            out.write(INT);
            le(out, ((Integer) v).longValue(), 4);
        } else if (v instanceof Long) {
            out.write(LONG);
            le(out, (Long) v, 8);
        } else if (v instanceof String) {
            byte[] b = ((String) v).getBytes(StandardCharsets.UTF_8);
            out.write(STRING);
            size(out, b.length);
            out.write(b, 0, b.length);
        } else if (v instanceof List) {
            List<?> l = (List<?>) v;
            out.write(LIST);
            size(out, l.size());
            for (Object o : l) write(out, o);
        } else if (v instanceof Map) {
            Map<?, ?> m = (Map<?, ?>) v;
            out.write(MAP);
            size(out, m.size());
            for (Map.Entry<?, ?> e : m.entrySet()) {
                write(out, e.getKey());
                write(out, e.getValue());
            }
        } else {
            throw new IllegalArgumentException("unsupported type: " + v.getClass().getName());
        }
    }

    private static void size(ByteArrayOutputStream out, int n) {
        if (n < 254) {
            out.write(n);
        } else if (n <= 0xFFFF) {
            out.write(254);
            le(out, n, 2);
        } else {
            out.write(255);
            le(out, n, 4);
        }
    }

    private static void le(ByteArrayOutputStream out, long v, int bytes) {
        for (int i = 0; i < bytes; i++) out.write((int) (v >>> (8 * i)) & 0xFF);
    }

    private static void json(StringBuilder sb, Object v) {
        if (v == null) {
            sb.append("null");
        } else if (v instanceof Boolean || v instanceof Integer || v instanceof Long) {
            sb.append(v);
        } else if (v instanceof String) {
            String s = (String) v;
            sb.append('"');
            for (int i = 0; i < s.length(); i++) {
                char c = s.charAt(i);
                switch (c) {
                    case '"': sb.append("\\\""); break;
                    case '\\': sb.append("\\\\"); break;
                    case '\n': sb.append("\\n"); break;
                    case '\r': sb.append("\\r"); break;
                    case '\t': sb.append("\\t"); break;
                    default:
                        if (c < 0x20) sb.append(String.format(Locale.ROOT, "\\u%04x", (int) c));
                        else sb.append(c);
                }
            }
            sb.append('"');
        } else if (v instanceof Map) {
            sb.append('{');
            boolean first = true;
            for (Map.Entry<?, ?> e : ((Map<?, ?>) v).entrySet()) {
                if (!first) sb.append(',');
                first = false;
                json(sb, String.valueOf(e.getKey()));
                sb.append(':');
                json(sb, e.getValue());
            }
            sb.append('}');
        } else {
            throw new IllegalArgumentException("unsupported type: " + v.getClass().getName());
        }
    }
}
