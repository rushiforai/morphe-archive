package app.morphed.extension.twitch.net;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * A small JSON reader: objects become Maps, arrays Lists, numbers Doubles. Android's org.json isn't available to
 * unit tests, and the answers read here (Shazam, YouTube, Twitch) only need plain reading.
 */
public final class JsonParser {
    private final String text;
    private int at;

    private JsonParser(String text) {
        this.text = text;
    }

    public static Object parse(String text) throws IllegalArgumentException {
        JsonParser parser = new JsonParser(text);
        parser.space();
        Object value = parser.value();
        parser.space();
        if (parser.at != text.length()) throw parser.error("text after the value");
        return value;
    }

    private IllegalArgumentException error(String what) {
        return new IllegalArgumentException("Bad JSON at " + at + ": " + what);
    }

    private void space() {
        while (at < text.length()) {
            char c = text.charAt(at);
            if (c != ' ' && c != '\n' && c != '\r' && c != '\t') break;
            at++;
        }
    }

    private Object value() {
        if (at >= text.length()) throw error("unexpected end");
        char c = text.charAt(at);
        switch (c) {
            case '{':
                return object();
            case '[':
                return array();
            case '"':
                return string();
            case 't':
                return word("true", Boolean.TRUE);
            case 'f':
                return word("false", Boolean.FALSE);
            case 'n':
                return word("null", null);
            default:
                return number();
        }
    }

    private Object word(String word, Object value) {
        if (!text.startsWith(word, at)) throw error("expected " + word);
        at += word.length();
        return value;
    }

    private Map<String, Object> object() {
        Map<String, Object> map = new LinkedHashMap<>();
        at++;
        space();
        if (peek() == '}') {
            at++;
            return map;
        }
        while (true) {
            space();
            if (peek() != '"') throw error("expected a key");
            String key = string();
            space();
            if (peek() != ':') throw error("expected :");
            at++;
            space();
            map.put(key, value());
            space();
            char c = peek();
            at++;
            if (c == '}') return map;
            if (c != ',') throw error("expected , or }");
        }
    }

    private List<Object> array() {
        List<Object> list = new ArrayList<>();
        at++;
        space();
        if (peek() == ']') {
            at++;
            return list;
        }
        while (true) {
            space();
            list.add(value());
            space();
            char c = peek();
            at++;
            if (c == ']') return list;
            if (c != ',') throw error("expected , or ]");
        }
    }

    private char peek() {
        if (at >= text.length()) throw error("unexpected end");
        return text.charAt(at);
    }

    private String string() {
        at++; // "
        StringBuilder out = new StringBuilder();
        while (true) {
            if (at >= text.length()) throw error("unterminated string");
            char c = text.charAt(at++);
            if (c == '"') return out.toString();
            if (c != '\\') {
                out.append(c);
                continue;
            }
            char e = text.charAt(at++);
            switch (e) {
                case 'n': out.append('\n'); break;
                case 't': out.append('\t'); break;
                case 'r': out.append('\r'); break;
                case 'b': out.append('\b'); break;
                case 'f': out.append('\f'); break;
                case 'u':
                    out.append((char) Integer.parseInt(text.substring(at, at + 4), 16));
                    at += 4;
                    break;
                default: out.append(e);
            }
        }
    }

    private Double number() {
        int start = at;
        while (at < text.length() && "+-0123456789.eE".indexOf(text.charAt(at)) >= 0) at++;
        if (start == at) throw error("unexpected character");
        return Double.parseDouble(text.substring(start, at));
    }

    // --- reading helpers: a path through maps (keys) and lists (indexes); null when anything is missing

    public static Object at(Object root, Object... path) {
        Object current = root;
        for (Object step : path) {
            if (step instanceof String && current instanceof Map) current = ((Map<?, ?>) current).get(step);
            else if (step instanceof Integer && current instanceof List) {
                List<?> list = (List<?>) current;
                int index = (Integer) step;
                current = index >= 0 && index < list.size() ? list.get(index) : null;
            } else return null;
            if (current == null) return null;
        }
        return current;
    }

    public static String string(Object root, Object... path) {
        Object value = at(root, path);
        return value instanceof String ? (String) value : null;
    }

    public static List<?> list(Object root, Object... path) {
        Object value = at(root, path);
        return value instanceof List ? (List<?>) value : null;
    }

    /** Every value under any key named {@code key}, anywhere below root, in document order. */
    public static void collect(Object root, String key, List<Object> into) {
        if (root instanceof Map) {
            for (Map.Entry<?, ?> entry : ((Map<?, ?>) root).entrySet()) {
                if (key.equals(entry.getKey())) into.add(entry.getValue());
                collect(entry.getValue(), key, into);
            }
        } else if (root instanceof List) {
            for (Object item : (List<?>) root) collect(item, key, into);
        }
    }

    /** A value as JSON text: strings quoted and escaped. */
    public static String quote(String value) {
        StringBuilder out = new StringBuilder("\"");
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
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
        return out.append('"').toString();
    }
}
