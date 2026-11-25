package dev.materialtidal.extension.tidal.player.lyrics;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Dependency-free JSON parser (no org.json) so pure-Java lyrics parsers
 * and matchers run identically on Android and desktop JVM unit tests.
 */
public final class SimpleJsonParser {

    private final String src;
    private final int len;
    private int pos;

    private SimpleJsonParser(String src) {
        this.src = src;
        this.len = src.length();
        this.pos = 0;
    }

    public static Object parse(String json) {
        if (json == null) {
            return null;
        }
        SimpleJsonParser p = new SimpleJsonParser(json);
        p.skipWhitespace();
        if (p.pos >= p.len) {
            return null;
        }
        try {
            Object value = p.readValue();
            p.skipWhitespace();
            return value;
        } catch (RuntimeException e) {
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    public static Map<String, Object> asMap(Object obj) {
        if (obj instanceof Map) {
            return (Map<String, Object>) obj;
        }
        return null;
    }

    @SuppressWarnings("unchecked")
    public static List<Object> asList(Object obj) {
        if (obj instanceof List) {
            return (List<Object>) obj;
        }
        return null;
    }

    public static String asString(Object obj) {
        return obj instanceof String ? (String) obj : null;
    }

    public static Long asLong(Object obj) {
        if (obj instanceof Number) {
            return ((Number) obj).longValue();
        }
        if (obj instanceof String) {
            try {
                return Math.round(Double.parseDouble(((String) obj).trim()));
            } catch (NumberFormatException ignored) {
            }
        }
        return null;
    }

    public static Double asDouble(Object obj) {
        if (obj instanceof Number) {
            return ((Number) obj).doubleValue();
        }
        if (obj instanceof String) {
            try {
                return Double.parseDouble(((String) obj).trim());
            } catch (NumberFormatException ignored) {
            }
        }
        return null;
    }

    public static boolean asBool(Object obj, boolean fallback) {
        if (obj instanceof Boolean) {
            return (Boolean) obj;
        }
        if (obj instanceof String) {
            String s = ((String) obj).trim();
            if ("true".equalsIgnoreCase(s)) return true;
            if ("false".equalsIgnoreCase(s)) return false;
        }
        return fallback;
    }

    private Object readValue() {
        skipWhitespace();
        if (pos >= len) {
            throw new IllegalStateException("Unexpected EOF");
        }
        char c = src.charAt(pos);
        switch (c) {
            case '{':
                return readObject();
            case '[':
                return readArray();
            case '"':
                return readString();
            case 't':
                expectLiteral("true");
                return Boolean.TRUE;
            case 'f':
                expectLiteral("false");
                return Boolean.FALSE;
            case 'n':
                expectLiteral("null");
                return null;
            default:
                if (c == '-' || (c >= '0' && c <= '9')) {
                    return readNumber();
                }
                throw new IllegalStateException("Unexpected char: " + c);
        }
    }

    private Map<String, Object> readObject() {
        pos++; // '{'
        skipWhitespace();
        Map<String, Object> map = new LinkedHashMap<>();
        if (pos < len && src.charAt(pos) == '}') {
            pos++;
            return map;
        }
        while (pos < len) {
            skipWhitespace();
            if (pos >= len || src.charAt(pos) != '"') {
                throw new IllegalStateException("Expected key string");
            }
            String key = readString();
            skipWhitespace();
            if (pos >= len || src.charAt(pos) != ':') {
                throw new IllegalStateException("Expected ':'");
            }
            pos++;
            Object val = readValue();
            map.put(key, val);
            skipWhitespace();
            if (pos < len && src.charAt(pos) == ',') {
                pos++;
                continue;
            }
            if (pos < len && src.charAt(pos) == '}') {
                pos++;
                return map;
            }
            throw new IllegalStateException("Expected ',' or '}'");
        }
        throw new IllegalStateException("Unterminated object");
    }

    private List<Object> readArray() {
        pos++; // '['
        skipWhitespace();
        if (pos < len && src.charAt(pos) == ']') {
            pos++;
            return Collections.emptyList();
        }
        List<Object> list = new ArrayList<>();
        while (pos < len) {
            list.add(readValue());
            skipWhitespace();
            if (pos < len && src.charAt(pos) == ',') {
                pos++;
                continue;
            }
            if (pos < len && src.charAt(pos) == ']') {
                pos++;
                return list;
            }
            throw new IllegalStateException("Expected ',' or ']'");
        }
        throw new IllegalStateException("Unterminated array");
    }

    private String readString() {
        pos++; // opening '"'
        StringBuilder sb = new StringBuilder();
        while (pos < len) {
            char c = src.charAt(pos++);
            if (c == '"') {
                return sb.toString();
            }
            if (c == '\\') {
                if (pos >= len) {
                    throw new IllegalStateException("Unterminated escape");
                }
                char esc = src.charAt(pos++);
                switch (esc) {
                    case '"': sb.append('"'); break;
                    case '\\': sb.append('\\'); break;
                    case '/': sb.append('/'); break;
                    case 'b': sb.append('\b'); break;
                    case 'f': sb.append('\f'); break;
                    case 'n': sb.append('\n'); break;
                    case 'r': sb.append('\r'); break;
                    case 't': sb.append('\t'); break;
                    case 'u':
                        if (pos + 4 > len) {
                            throw new IllegalStateException("Invalid unicode escape");
                        }
                        int code = Integer.parseInt(src.substring(pos, pos + 4), 16);
                        pos += 4;
                        sb.append((char) code);
                        break;
                    default:
                        sb.append(esc);
                        break;
                }
            } else {
                sb.append(c);
            }
        }
        throw new IllegalStateException("Unterminated string");
    }

    private Double readNumber() {
        int start = pos;
        if (src.charAt(pos) == '-') {
            pos++;
        }
        while (pos < len) {
            char c = src.charAt(pos);
            if ((c >= '0' && c <= '9') || c == '.' || c == 'e' || c == 'E' || c == '+' || c == '-') {
                pos++;
            } else {
                break;
            }
        }
        return Double.valueOf(src.substring(start, pos));
    }

    private void expectLiteral(String lit) {
        if (!src.startsWith(lit, pos)) {
            throw new IllegalStateException("Expected " + lit);
        }
        pos += lit.length();
    }

    private void skipWhitespace() {
        while (pos < len) {
            char c = src.charAt(pos);
            if (c == ' ' || c == '\t' || c == '\n' || c == '\r') {
                pos++;
            } else {
                break;
            }
        }
    }
}
