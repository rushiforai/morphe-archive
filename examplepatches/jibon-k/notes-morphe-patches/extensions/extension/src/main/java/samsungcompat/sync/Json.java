package samsungcompat.sync;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * Minimal JSON for manifests, without android.* so the sync core runs on the desktop too. Keys are
 * sorted, so an unchanged manifest gives identical bytes.
 */
final class Json {
    private Json() {}

    static String write(Object value) {
        StringBuilder out = new StringBuilder();
        write(value, out);
        return out.toString();
    }

    @SuppressWarnings("unchecked")
    private static void write(Object value, StringBuilder out) {
        if (value == null) {
            out.append("null");
        } else if (value instanceof String) {
            quote((String) value, out);
        } else if (value instanceof Long || value instanceof Integer || value instanceof Boolean) {
            out.append(value);
        } else if (value instanceof Map) {
            out.append('{');
            boolean first = true;
            for (Map.Entry<String, Object> e : new TreeMap<>((Map<String, Object>) value).entrySet()) {
                if (!first) out.append(',');
                first = false;
                quote(e.getKey(), out);
                out.append(':');
                write(e.getValue(), out);
            }
            out.append('}');
        } else if (value instanceof List) {
            out.append('[');
            boolean first = true;
            for (Object item : (List<Object>) value) {
                if (!first) out.append(',');
                first = false;
                write(item, out);
            }
            out.append(']');
        } else {
            throw new IllegalArgumentException("unsupported JSON value: " + value.getClass());
        }
    }

    private static void quote(String s, StringBuilder out) {
        out.append('"');
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            switch (c) {
                case '"': out.append("\\\""); break;
                case '\\': out.append("\\\\"); break;
                case '\n': out.append("\\n"); break;
                case '\r': out.append("\\r"); break;
                case '\t': out.append("\\t"); break;
                default:
                    if (c < 0x20) out.append(String.format("\\u%04x", (int) c));
                    else out.append(c);
            }
        }
        out.append('"');
    }

    static Object parse(String text) {
        Parser p = new Parser(text);
        p.skipSpace();
        Object value = p.value();
        p.skipSpace();
        if (p.pos != text.length()) throw p.error("trailing data");
        return value;
    }

    private static final class Parser {
        final String s;
        int pos;

        Parser(String s) {
            this.s = s;
        }

        Object value() {
            if (pos >= s.length()) throw error("unexpected end");
            char c = s.charAt(pos);
            if (c == '{') return object();
            if (c == '[') return array();
            if (c == '"') return string();
            if (c == '-' || (c >= '0' && c <= '9')) return number();
            if (s.startsWith("true", pos)) { pos += 4; return Boolean.TRUE; }
            if (s.startsWith("false", pos)) { pos += 5; return Boolean.FALSE; }
            if (s.startsWith("null", pos)) { pos += 4; return null; }
            throw error("unexpected character '" + c + "'");
        }

        Map<String, Object> object() {
            TreeMap<String, Object> map = new TreeMap<>();
            pos++;
            skipSpace();
            if (peek() == '}') { pos++; return map; }
            while (true) {
                skipSpace();
                if (peek() != '"') throw error("expected key");
                String key = string();
                skipSpace();
                expect(':');
                skipSpace();
                map.put(key, value());
                skipSpace();
                char c = next();
                if (c == '}') return map;
                if (c != ',') throw error("expected ',' or '}'");
            }
        }

        List<Object> array() {
            List<Object> list = new ArrayList<>();
            pos++;
            skipSpace();
            if (peek() == ']') { pos++; return list; }
            while (true) {
                skipSpace();
                list.add(value());
                skipSpace();
                char c = next();
                if (c == ']') return list;
                if (c != ',') throw error("expected ',' or ']'");
            }
        }

        String string() {
            expect('"');
            StringBuilder out = new StringBuilder();
            while (true) {
                char c = next();
                if (c == '"') return out.toString();
                if (c != '\\') { out.append(c); continue; }
                char e = next();
                switch (e) {
                    case '"': case '\\': case '/': out.append(e); break;
                    case 'n': out.append('\n'); break;
                    case 'r': out.append('\r'); break;
                    case 't': out.append('\t'); break;
                    case 'b': out.append('\b'); break;
                    case 'f': out.append('\f'); break;
                    case 'u':
                        if (pos + 4 > s.length()) throw error("bad \\u escape");
                        out.append((char) Integer.parseInt(s.substring(pos, pos + 4), 16));
                        pos += 4;
                        break;
                    default: throw error("bad escape");
                }
            }
        }

        Long number() {
            int start = pos;
            if (peek() == '-') pos++;
            while (pos < s.length() && Character.isDigit(s.charAt(pos))) pos++;
            if (pos < s.length() && ".eE".indexOf(s.charAt(pos)) >= 0) {
                throw error("only integers are supported");
            }
            try {
                return Long.parseLong(s.substring(start, pos));
            } catch (NumberFormatException e) {
                throw error("bad number");
            }
        }

        void skipSpace() {
            while (pos < s.length() && Character.isWhitespace(s.charAt(pos))) pos++;
        }

        char peek() {
            if (pos >= s.length()) throw error("unexpected end");
            return s.charAt(pos);
        }

        char next() {
            char c = peek();
            pos++;
            return c;
        }

        void expect(char c) {
            if (next() != c) throw error("expected '" + c + "'");
        }

        IllegalArgumentException error(String message) {
            return new IllegalArgumentException("JSON " + message + " at " + pos);
        }
    }
}
