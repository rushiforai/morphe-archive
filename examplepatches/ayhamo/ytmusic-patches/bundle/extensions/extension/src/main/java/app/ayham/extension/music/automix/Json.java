package app.ayham.extension.music.automix;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * A small JSON reader and writer (objects are maps, arrays lists, numbers doubles), so the
 * analysis cache and the planner need nothing from Android and run the same on a desktop JVM.
 */
public final class Json {
    private final String s;
    private int i;

    private Json(String s) {
        this.s = s;
    }

    public static Object parse(String text) {
        Json j = new Json(text);
        j.ws();
        Object v = j.value();
        j.ws();
        if (j.i != j.s.length()) throw new IllegalArgumentException("trailing text at " + j.i);
        return v;
    }

    private void ws() {
        while (i < s.length() && Character.isWhitespace(s.charAt(i))) i++;
    }

    /** The next character; a body cut short is bad input, not an index error. */
    private char at() {
        if (i >= s.length()) throw new IllegalArgumentException("unexpected end at " + i);
        return s.charAt(i);
    }

    private void expect(char c) {
        if (at() != c) throw new IllegalArgumentException("expected '" + c + "' at " + i);
        i++;
    }

    /** Nesting so far: a body of "[[[[..." from an addon must not overflow the stack. */
    private int depth;
    private static final int MAX_DEPTH = 64;

    private Object value() {
        char c = at();
        if (c == '{' || c == '[') {
            if (++depth > MAX_DEPTH) throw new IllegalArgumentException("nested deeper than " + MAX_DEPTH + " at " + i);
            try {
                return c == '{' ? object() : array();
            } finally {
                depth--;
            }
        }
        if (c == '"') return string();
        if (s.startsWith("true", i)) { i += 4; return Boolean.TRUE; }
        if (s.startsWith("false", i)) { i += 5; return Boolean.FALSE; }
        if (s.startsWith("null", i)) { i += 4; return null; }
        int start = i;
        while (i < s.length() && "+-0123456789.eE".indexOf(s.charAt(i)) >= 0) i++;
        if (start == i) throw new IllegalArgumentException("unexpected '" + c + "' at " + i);
        try {
            return Double.parseDouble(s.substring(start, i));
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("bad number at " + start);
        }
    }

    private Map<String, Object> object() {
        Map<String, Object> m = new LinkedHashMap<>();
        i++;
        ws();
        if (at() == '}') { i++; return m; }
        while (true) {
            ws();
            if (at() != '"') throw new IllegalArgumentException("expected a key at " + i);
            String k = string();
            ws();
            expect(':');
            ws();
            m.put(k, value());
            ws();
            char c = at();
            i++;
            if (c == '}') return m;
            if (c != ',') throw new IllegalArgumentException("expected ',' or '}' at " + (i - 1));
        }
    }

    private List<Object> array() {
        List<Object> l = new ArrayList<>();
        i++;
        ws();
        if (at() == ']') { i++; return l; }
        while (true) {
            ws();
            l.add(value());
            ws();
            char c = at();
            i++;
            if (c == ']') return l;
            if (c != ',') throw new IllegalArgumentException("expected ',' or ']' at " + (i - 1));
        }
    }

    private String string() {
        StringBuilder b = new StringBuilder();
        i++;
        while (true) {
            char c = at();
            i++;
            if (c == '"') return b.toString();
            if (c == '\\') {
                char e = at();
                i++;
                switch (e) {
                    case 'n': b.append('\n'); break;
                    case 't': b.append('\t'); break;
                    case 'r': b.append('\r'); break;
                    case 'b': b.append('\b'); break;
                    case 'f': b.append('\f'); break;
                    case 'u': {
                        // exactly four hex digits (parseInt alone takes "+12f", and a cut-off end throws)
                        int u = 0;
                        for (int k = 0; k < 4; k++) {
                            char h = at();
                            int d = h <= 'f' ? Character.digit(h, 16) : -1; // (ASCII only: digit() takes other scripts' digits)
                            if (d < 0) throw new IllegalArgumentException("bad escape at " + i);
                            u = u * 16 + d;
                            i++;
                        }
                        b.append((char) u);
                        break;
                    }
                    default: b.append(e);
                }
            } else {
                b.append(c);
            }
        }
    }

    // ---- writing ----

    public static String write(Object v) {
        StringBuilder b = new StringBuilder();
        write(b, v);
        return b.toString();
    }

    @SuppressWarnings("unchecked")
    private static void write(StringBuilder b, Object v) {
        if (v == null) {
            b.append("null");
        } else if (v instanceof Map) {
            b.append('{');
            boolean first = true;
            for (Map.Entry<String, Object> e : ((Map<String, Object>) v).entrySet()) {
                if (!first) b.append(',');
                first = false;
                quote(b, e.getKey());
                b.append(':');
                write(b, e.getValue());
            }
            b.append('}');
        } else if (v instanceof List) {
            b.append('[');
            boolean first = true;
            for (Object o : (List<Object>) v) {
                if (!first) b.append(',');
                first = false;
                write(b, o);
            }
            b.append(']');
        } else if (v instanceof double[]) {
            b.append('[');
            double[] a = (double[]) v;
            for (int k = 0; k < a.length; k++) {
                if (k > 0) b.append(',');
                number(b, a[k]);
            }
            b.append(']');
        } else if (v instanceof float[]) {
            b.append('[');
            float[] a = (float[]) v;
            for (int k = 0; k < a.length; k++) {
                if (k > 0) b.append(',');
                // the vocal curve: 4 decimals are plenty and keep the cache small. NaN / infinity
                // as null: "%.4f" would write NaN, which no JSON reader (this one included) reads
                if (Float.isNaN(a[k]) || Float.isInfinite(a[k])) b.append("null");
                else b.append(String.format(Locale.ROOT, "%.4f", a[k]));
            }
            b.append(']');
        } else if (v instanceof Number) {
            number(b, ((Number) v).doubleValue());
        } else if (v instanceof Boolean) {
            b.append(v.toString());
        } else {
            quote(b, v.toString());
        }
    }

    private static void number(StringBuilder b, double d) {
        if (Double.isNaN(d) || Double.isInfinite(d)) b.append("null");
        else if (d == Math.rint(d) && Math.abs(d) < 1e15) b.append((long) d);
        else b.append(d);
    }

    private static void quote(StringBuilder b, String str) {
        b.append('"');
        for (int k = 0; k < str.length(); k++) {
            char c = str.charAt(k);
            if (c == '"' || c == '\\') b.append('\\').append(c);
            else if (c == '\n') b.append("\\n");
            else if (c < 0x20) b.append(String.format(Locale.ROOT, "\\u%04x", (int) c));
            else b.append(c);
        }
        b.append('"');
    }

    // ---- reading helpers ----

    static double num(Map<String, Object> m, String k) {
        Object v = m.get(k);
        return v instanceof Number ? ((Number) v).doubleValue() : Double.NaN;
    }

    static double[] nums(Object list) {
        if (!(list instanceof List)) return null;
        List<?> l = (List<?>) list;
        double[] a = new double[l.size()];
        for (int k = 0; k < a.length; k++) a[k] = l.get(k) instanceof Number ? ((Number) l.get(k)).doubleValue() : Double.NaN;
        return a;
    }

    static float[] floats(Object list) {
        if (!(list instanceof List)) return new float[0];
        List<?> l = (List<?>) list;
        float[] a = new float[l.size()];
        for (int k = 0; k < a.length; k++) a[k] = l.get(k) instanceof Number ? ((Number) l.get(k)).floatValue() : 0f;
        return a;
    }
}
