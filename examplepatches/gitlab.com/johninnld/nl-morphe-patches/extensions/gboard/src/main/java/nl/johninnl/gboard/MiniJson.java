package nl.johninnl.gboard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** A small JSON reader for the tokenizer file; org.json is not available in unit tests. */
final class MiniJson {
    private final String text;
    private int at;

    private MiniJson(String text) {
        this.text = text;
    }

    /** Objects become maps, arrays lists, numbers doubles. Throws on malformed input. */
    static Object parse(String text) {
        MiniJson reader = new MiniJson(text);
        Object value = reader.value();
        reader.space();
        if (reader.at != text.length()) throw reader.error("trailing data");
        return value;
    }

    private Object value() {
        space();
        if (at >= text.length()) throw error("unexpected end");
        char c = text.charAt(at);
        switch (c) {
            case '{': return object();
            case '[': return array();
            case '"': return string();
            case 't': return literal("true", Boolean.TRUE);
            case 'f': return literal("false", Boolean.FALSE);
            case 'n': return literal("null", null);
            default: return number();
        }
    }

    private Map<String, Object> object() {
        Map<String, Object> map = new HashMap<>();
        at++;
        space();
        if (peek() == '}') {
            at++;
            return map;
        }
        while (true) {
            space();
            if (peek() != '"') throw error("expected key");
            String key = string();
            space();
            expect(':');
            map.put(key, value());
            space();
            char c = next();
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
            list.add(value());
            space();
            char c = next();
            if (c == ']') return list;
            if (c != ',') throw error("expected , or ]");
        }
    }

    private String string() {
        expect('"');
        StringBuilder out = new StringBuilder();
        while (true) {
            char c = next();
            if (c == '"') return out.toString();
            if (c != '\\') {
                out.append(c);
                continue;
            }
            char e = next();
            switch (e) {
                case '"': out.append('"'); break;
                case '\\': out.append('\\'); break;
                case '/': out.append('/'); break;
                case 'b': out.append('\b'); break;
                case 'f': out.append('\f'); break;
                case 'n': out.append('\n'); break;
                case 'r': out.append('\r'); break;
                case 't': out.append('\t'); break;
                case 'u':
                    if (at + 4 > text.length()) throw error("short escape");
                    out.append((char) Integer.parseInt(text.substring(at, at + 4), 16));
                    at += 4;
                    break;
                default: throw error("bad escape");
            }
        }
    }

    private Object literal(String word, Object result) {
        if (!text.startsWith(word, at)) throw error("bad literal");
        at += word.length();
        return result;
    }

    private Double number() {
        int start = at;
        while (at < text.length() && "+-0123456789.eE".indexOf(text.charAt(at)) >= 0) at++;
        if (start == at) throw error("unexpected character");
        return Double.valueOf(text.substring(start, at));
    }

    private void space() {
        while (at < text.length() && Character.isWhitespace(text.charAt(at))) at++;
    }

    private char peek() {
        if (at >= text.length()) throw error("unexpected end");
        return text.charAt(at);
    }

    private char next() {
        char c = peek();
        at++;
        return c;
    }

    private void expect(char c) {
        if (next() != c) throw error("expected " + c);
    }

    private IllegalArgumentException error(String message) {
        return new IllegalArgumentException("JSON " + message + " at " + at);
    }
}
