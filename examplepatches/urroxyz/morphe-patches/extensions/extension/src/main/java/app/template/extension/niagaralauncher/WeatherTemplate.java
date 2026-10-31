package app.template.extension.niagaralauncher;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.net.URLEncoder;
import java.util.*;

/** Small expression language, not a Kotlin evaluator. No calls, members or external access. */
public final class WeatherTemplate {
    public static final class Vars {
        public final double lat, lon;
        public final long n;

        public Vars(double lat, double lon, long n) {
            this.lat = lat;
            this.lon = lon;
            this.n = n;
        }
    }

    private interface Node {
        Object get(Vars vars);
    }

    private static final class Parser {
        final String text;
        int pos, nodes, depth;

        Parser(String s) {
            if (s.length() > 1024) throw bad("Expression too long");
            text = s;
        }

        Node node(Node n) {
            if (++nodes > 256) throw bad("Expression too complex");
            return n;
        }

        void space() {
            while (pos < text.length() && Character.isWhitespace(text.charAt(pos))) pos++;
        }

        boolean take(String s) {
            space();
            if (!text.startsWith(s, pos)) return false;
            pos += s.length();
            return true;
        }

        boolean keyword(String s) {
            space();
            int end = pos + s.length();
            if (!text.startsWith(s, pos)
                    || (end < text.length() && Character.isJavaIdentifierPart(text.charAt(end))))
                return false;
            pos = end;
            return true;
        }

        void need(String s) {
            if (!take(s)) throw bad("Expected " + s + " at " + pos);
        }

        Node expression() {
            if (++depth > 32) throw bad("Expression nesting limit");
            Node r;
            if (keyword("if")) {
                need("(");
                Node c = expression();
                need(")");
                Node yes = expression();
                if (!keyword("else")) throw bad("Expected else");
                Node no = expression();
                r = node(v -> truth(c.get(v)) ? yes.get(v) : no.get(v));
            } else r = or();
            depth--;
            return r;
        }

        Node or() {
            Node a = and();
            while (take("||")) {
                Node l = a, r = and();
                a = node(v -> truth(l.get(v)) || truth(r.get(v)));
            }
            return a;
        }

        Node and() {
            Node a = compare();
            while (take("&&")) {
                Node l = a, r = compare();
                a = node(v -> truth(l.get(v)) && truth(r.get(v)));
            }
            return a;
        }

        Node compare() {
            Node a = add();
            for (; ; ) {
                String op = null;
                for (String s : new String[] {"==", "!=", "<=", ">=", "<", ">"})
                    if (take(s)) {
                        op = s;
                        break;
                    }
                if (op == null) return a;
                Node l = a, r = add();
                final String o = op;
                a =
                        node(
                                v -> {
                                    Object x = l.get(v), y = r.get(v);
                                    if (o.equals("==")) return equal(x, y);
                                    if (o.equals("!=")) return !equal(x, y);
                                    double d = num(x) - num(y);
                                    return o.equals("<")
                                            ? d < 0
                                            : o.equals(">")
                                                    ? d > 0
                                                    : o.equals("<=") ? d <= 0 : d >= 0;
                                });
            }
        }

        Node add() {
            Node a = mul();
            for (; ; ) {
                String op = take("+") ? "+" : take("-") ? "-" : null;
                if (op == null) return a;
                Node l = a, r = mul();
                a = binary(l, r, op);
            }
        }

        Node mul() {
            Node a = unary();
            for (; ; ) {
                String op = take("*") ? "*" : take("/") ? "/" : take("%") ? "%" : null;
                if (op == null) return a;
                Node l = a, r = unary();
                a = binary(l, r, op);
            }
        }

        Node unary() {
            if (++depth > 32) throw bad("Expression nesting limit");
            try {
                return unaryInner();
            } finally {
                depth--;
            }
        }

        Node unaryInner() {
            if (take("!")) {
                Node n = unary();
                return node(v -> !truth(n.get(v)));
            }
            if (take("-")) {
                Node n = unary();
                return node(
                        v -> {
                            Object x = n.get(v);
                            if (x instanceof Long) return Math.negateExact((Long) x);
                            return -num(x);
                        });
            }
            if (take("+")) return unary();
            return atom();
        }

        Node atom() {
            space();
            if (pos >= text.length()) throw bad("Missing expression");
            char c = text.charAt(pos);
            int saved = pos;
            if (keyword("if")) {
                pos = saved;
                return expression();
            }
            pos = saved;
            if (c == '(') {
                pos++;
                Node n = expression();
                need(")");
                return n;
            }
            if (c == '"' || c == '\'') {
                char quote = c;
                pos++;
                StringBuilder s = new StringBuilder();
                boolean ended = false;
                while (pos < text.length()) {
                    char ch = text.charAt(pos++);
                    if (ch == quote) {
                        ended = true;
                        break;
                    }
                    if (ch == '\\') {
                        if (pos == text.length()) throw bad("Incomplete escape");
                        ch = text.charAt(pos++);
                        if (ch == 'n') ch = '\n';
                        else if (ch == 't') ch = '\t';
                        else if (ch == 'r') ch = '\r';
                        else if (ch == 'u') {
                            if (pos + 4 > text.length()) throw bad("Incomplete unicode escape");
                            ch = (char) Integer.parseInt(text.substring(pos, pos + 4), 16);
                            pos += 4;
                        } else if (ch != '\\' && ch != '"' && ch != '\'')
                            throw bad("Unsupported escape");
                    }
                    s.append(ch);
                }
                if (!ended) throw bad("Unclosed string");
                String value = s.toString();
                return node(v -> value);
            }
            if (Character.isDigit(c)) {
                int start = pos;
                while (pos < text.length()
                        && (Character.isDigit(text.charAt(pos)) || text.charAt(pos) == '.')) pos++;
                String s = text.substring(start, pos);
                final Number n =
                        s.indexOf('.') >= 0 ? (Number) Double.valueOf(s) : (Number) Long.valueOf(s);
                return node(v -> n);
            }
            int start = pos;
            while (pos < text.length() && Character.isJavaIdentifierPart(text.charAt(pos))) pos++;
            String name = text.substring(start, pos);
            switch (name) {
                case "lat":
                    return node(v -> v.lat);
                case "lon":
                    return node(v -> v.lon);
                case "n":
                    return node(v -> v.n);
                case "true":
                    return node(v -> true);
                case "false":
                    return node(v -> false);
                default:
                    throw bad("Unknown variable: " + name);
            }
        }

        Node binary(Node a, Node b, String op) {
            return node(
                    v -> {
                        Object x = a.get(v), y = b.get(v);
                        if (op.equals("+") && (x instanceof String || y instanceof String))
                            return str(x) + str(y);
                        if (x instanceof Long && y instanceof Long) {
                            long l = (Long) x, r = (Long) y;
                            switch (op) {
                                case "+":
                                    return Math.addExact(l, r);
                                case "-":
                                    return Math.subtractExact(l, r);
                                case "*":
                                    return Math.multiplyExact(l, r);
                                case "/":
                                    if (r == 0 || (l == Long.MIN_VALUE && r == -1))
                                        throw bad("Invalid division");
                                    return l / r;
                                default:
                                    if (r == 0) throw bad("Division by zero");
                                    return l % r;
                            }
                        }
                        double l = num(x), r = num(y);
                        if ((op.equals("/") || op.equals("%")) && r == 0)
                            throw bad("Division by zero");
                        double z =
                                op.equals("+")
                                        ? l + r
                                        : op.equals("-")
                                                ? l - r
                                                : op.equals("*")
                                                        ? l * r
                                                        : op.equals("/") ? l / r : l % r;
                        if (!Double.isFinite(z)) throw bad("Nonfinite result");
                        return z;
                    });
        }
    }

    static IllegalArgumentException bad(String s) {
        return new IllegalArgumentException(s);
    }

    static double num(Object o) {
        if (!(o instanceof Number)) throw bad("Expected number");
        double d = ((Number) o).doubleValue();
        if (!Double.isFinite(d)) throw bad("Nonfinite number");
        return d;
    }

    static boolean truth(Object o) {
        if (!(o instanceof Boolean)) throw bad("Expected Boolean condition");
        return (Boolean) o;
    }

    static boolean equal(Object a, Object b) {
        return a instanceof Number && b instanceof Number
                ? Double.compare(num(a), num(b)) == 0
                : Objects.equals(a, b);
    }

    static String str(Object o) {
        if (o instanceof Number) {
            double d = num(o);
            return d == Math.rint(d) && d >= Long.MIN_VALUE && d <= Long.MAX_VALUE
                    ? Long.toString(((Number) o).longValue())
                    : Double.toString(d);
        }
        return String.valueOf(o);
    }

    public static Object evaluate(String expression, Vars vars) {
        Parser p = new Parser(expression);
        Node n = p.expression();
        p.space();
        if (p.pos != p.text.length()) throw bad("Unexpected syntax at " + p.pos);
        return n.get(vars);
    }

    public static String render(String template, Vars vars, boolean url) {
        if (template.length() > 8192) throw bad("Template too long");
        StringBuilder out = new StringBuilder();
        int expressions = 0;
        for (int i = 0; i < template.length(); ) {
            char c = template.charAt(i++);
            if (c != '{') {
                out.append(c);
                continue;
            }
            if (++expressions > 64) throw bad("Too many expressions");
            int start = i;
            char quote = 0;
            boolean escaped = false;
            for (; i < template.length(); i++) {
                char ch = template.charAt(i);
                if (escaped) {
                    escaped = false;
                    continue;
                }
                if (quote != 0) {
                    if (ch == '\\') escaped = true;
                    else if (ch == quote) quote = 0;
                } else if (ch == '"' || ch == '\'') quote = ch;
                else if (ch == '}') break;
                else if (ch == '{') throw bad("Nested interpolation is not supported");
            }
            if (i == template.length()) throw bad("Unclosed expression");
            String s = str(evaluate(template.substring(start, i), vars));
            i++;
            if (url)
                try {
                    s = URLEncoder.encode(s, "UTF-8").replace("+", "%20");
                } catch (Exception e) {
                    throw bad("URL encoding");
                }
            out.append(s);
            if (out.length() > 32768) throw bad("Expanded template too long");
        }
        return out.toString();
    }

    private static final class Segment {
        final String key;
        final boolean index;

        Segment(String key, boolean index) {
            this.key = key;
            this.index = index;
        }
    }

    private static List<Segment> segments(String path) {
        if (path.isEmpty() || path.charAt(0) != 'x') throw bad("Pointer must start at x");
        List<Segment> segments = new ArrayList<>();
        int p = 1;
        while (p < path.length()) {
            String key;
            boolean index = false;
            if (path.charAt(p) == '.') {
                int start = ++p;
                while (p < path.length() && path.charAt(p) != '.' && path.charAt(p) != '[') p++;
                if (start == p) throw bad("Empty object key");
                key = path.substring(start, p);
            } else if (path.charAt(p) == '[') {
                int start = ++p;
                char quote = p < path.length() ? path.charAt(p) : 0;
                if (quote == '"' || quote == '\'') {
                    p++;
                    boolean escape = false;
                    while (p < path.length()) {
                        char ch = path.charAt(p++);
                        if (escape) escape = false;
                        else if (ch == '\\') escape = true;
                        else if (ch == quote) break;
                    }
                    String literal = path.substring(start, p);
                    try {
                        key = (String) new JSONTokener(literal).nextValue();
                    } catch (Exception e) {
                        throw bad("Invalid quoted key");
                    }
                    if (p >= path.length() || path.charAt(p++) != ']') throw bad("Missing ]");
                } else {
                    while (p < path.length() && path.charAt(p) != ']') p++;
                    if (p == path.length()) throw bad("Missing ]");
                    key = path.substring(start, p++);
                    index = true;
                    if (!key.matches("[0-9]{1,6}"))
                        throw bad("Array index must be a nonnegative integer");
                }
            } else throw bad("Expected . or [ at " + p);
            segments.add(new Segment(key, index));
            if (segments.size() > 64) throw bad("Pointer nesting limit");
        }
        return segments;
    }

    public static void validatePointer(String template, Vars vars) {
        segments(render(template.isEmpty() ? "x" : template, vars, false));
    }

    public static Object resolve(Object root, String template, Vars vars) {
        Object value = root;
        for (Segment segment : segments(render(template.isEmpty() ? "x" : template, vars, false))) {
            try {
                if (value instanceof JSONObject && !segment.index)
                    value = ((JSONObject) value).get(segment.key);
                else if (value instanceof JSONArray && segment.index)
                    value = ((JSONArray) value).get(Integer.parseInt(segment.key));
                else throw bad("Pointer type mismatch");
            } catch (org.json.JSONException e) {
                throw bad("Pointer not found");
            }
            if (value == JSONObject.NULL) return null;
        }
        return value;
    }
}
