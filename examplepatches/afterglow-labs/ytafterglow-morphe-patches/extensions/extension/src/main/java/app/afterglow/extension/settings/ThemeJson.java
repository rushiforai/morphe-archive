package app.afterglow.extension.settings;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Small, bounded JSON value codec so theme storage is identical on Android and the JVM. */
public final class ThemeJson {
    public static final int MAX_LENGTH = 4 * 1024 * 1024;
    private ThemeJson() {}

    public static Object parse(String text) {
        if (text == null || text.length() > MAX_LENGTH) throw new IllegalArgumentException("Theme file is too large.");
        Reader reader = new Reader(text);
        Object value = reader.value(0);
        reader.space();
        if (reader.position != text.length()) throw reader.error();
        return value;
    }

    public static String write(Object value) {
        StringBuilder out = new StringBuilder();
        append(out, value, 0);
        if (out.length() > MAX_LENGTH) throw new IllegalArgumentException("Theme library is too large.");
        return out.toString();
    }

    private static void append(StringBuilder out, Object value, int depth) {
        if (depth > 32) throw new IllegalArgumentException("Theme nesting is too deep.");
        if (value == null) out.append("null");
        else if (value instanceof String) {
            out.append('"');
            for (char c : ((String) value).toCharArray()) {
                switch (c) {
                    case '"': out.append("\\\""); break;
                    case '\\': out.append("\\\\"); break;
                    case '\n': out.append("\\n"); break;
                    case '\r': out.append("\\r"); break;
                    case '\t': out.append("\\t"); break;
                    default:
                        if (c < 32) out.append(String.format(java.util.Locale.ROOT, "\\u%04x", (int) c));
                        else out.append(c);
                }
            }
            out.append('"');
        } else if (value instanceof Boolean) out.append(value);
        else if (value instanceof Number) {
            if (!Double.isFinite(((Number) value).doubleValue())) throw new IllegalArgumentException("Non-finite number.");
            out.append(value);
        } else if (value instanceof Map) {
            out.append('{');
            boolean first = true;
            for (Map.Entry<?, ?> entry : ((Map<?, ?>) value).entrySet()) {
                if (!(entry.getKey() instanceof String)) throw new IllegalArgumentException("Expected a text key.");
                if (!first) out.append(',');
                first = false;
                append(out, entry.getKey(), depth + 1);
                out.append(':');
                append(out, entry.getValue(), depth + 1);
            }
            out.append('}');
        } else if (value instanceof Iterable) {
            out.append('[');
            boolean first = true;
            for (Object item : (Iterable<?>) value) {
                if (!first) out.append(',');
                first = false;
                append(out, item, depth + 1);
            }
            out.append(']');
        } else throw new IllegalArgumentException("Unsupported theme value.");
    }

    private static final class Reader {
        final String text;
        int position;
        Reader(String text) { this.text = text; }
        IllegalArgumentException error() { return new IllegalArgumentException("Invalid JSON at character " + position + "."); }
        void space() {
            while (position < text.length() && " \t\r\n".indexOf(text.charAt(position)) >= 0) position++;
        }
        boolean take(char c) {
            space();
            if (position < text.length() && text.charAt(position) == c) { position++; return true; }
            return false;
        }
        Object value(int depth) {
            space();
            if (depth > 32 || position >= text.length()) throw error();
            char c = text.charAt(position);
            if (c == '"') return string();
            if (take('{')) {
                Map<String, Object> result = new LinkedHashMap<>();
                if (take('}')) return result;
                do {
                    space();
                    if (position >= text.length() || text.charAt(position) != '"') throw error();
                    String key = string();
                    if (result.containsKey(key) || !take(':')) throw error();
                    result.put(key, value(depth + 1));
                    if (take('}')) return result;
                } while (take(','));
                throw error();
            }
            if (take('[')) {
                List<Object> result = new ArrayList<>();
                if (take(']')) return result;
                do {
                    result.add(value(depth + 1));
                    if (take(']')) return result;
                } while (take(','));
                throw error();
            }
            for (String token : new String[]{"true", "false", "null"}) {
                if (text.startsWith(token, position)) {
                    position += token.length();
                    return token.equals("null") ? null : token.equals("true");
                }
            }
            int start = position;
            if (position < text.length() && text.charAt(position) == '-') position++;
            if (position >= text.length()) throw error();
            if (text.charAt(position) == '0') position++;
            else {
                int digits = position;
                while (position < text.length() && digit(text.charAt(position))) position++;
                if (digits == position) throw error();
            }
            boolean real = false;
            if (position < text.length() && text.charAt(position) == '.') {
                real = true;
                int digits = ++position;
                while (position < text.length() && digit(text.charAt(position))) position++;
                if (digits == position) throw error();
            }
            if (position < text.length() && "eE".indexOf(text.charAt(position)) >= 0) {
                real = true;
                position++;
                if (position < text.length() && "+-".indexOf(text.charAt(position)) >= 0) position++;
                int digits = position;
                while (position < text.length() && digit(text.charAt(position))) position++;
                if (digits == position) throw error();
            }
            try {
                String number = text.substring(start, position);
                if (!real) return Long.parseLong(number);
                double result = Double.parseDouble(number);
                if (!Double.isFinite(result)) throw error();
                return result;
            } catch (NumberFormatException error) { throw error(); }
        }
        static boolean digit(char c) { return c >= '0' && c <= '9'; }
        String string() {
            position++;
            StringBuilder out = new StringBuilder();
            while (position < text.length()) {
                char c = text.charAt(position++);
                if (c == '"') return out.toString();
                if (c < 32) throw error();
                if (c == '\\') {
                    if (position >= text.length()) throw error();
                    c = text.charAt(position++);
                    switch (c) {
                        case '"': case '\\': case '/': break;
                        case 'b': c = '\b'; break;
                        case 'f': c = '\f'; break;
                        case 'n': c = '\n'; break;
                        case 'r': c = '\r'; break;
                        case 't': c = '\t'; break;
                        case 'u':
                            if (position + 4 > text.length()) throw error();
                            if (!text.substring(position, position + 4).matches("[0-9a-fA-F]{4}")) throw error();
                            try { c = (char) Integer.parseInt(text.substring(position, position + 4), 16); }
                            catch (NumberFormatException error) { throw error(); }
                            position += 4;
                            break;
                        default: throw error();
                    }
                }
                out.append(c);
            }
            throw error();
        }
    }
}
