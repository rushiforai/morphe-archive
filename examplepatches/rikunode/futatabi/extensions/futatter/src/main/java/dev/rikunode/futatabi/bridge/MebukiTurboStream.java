package dev.rikunode.futatabi.bridge;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONTokener;

/**
 * Bounded synchronous data subset of the publicly served turbo-stream decoder.
 * Objects, arrays, JSON scalars, D"date", u and completed @references.
 * Deferred streams, executable/plugin types and cyclic references fail closed.
 */
final class MebukiTurboStream {
    private final String source;
    private final List<Object> refs = new ArrayList<>();
    private final List<Boolean> complete = new ArrayList<>();
    private int pos, nodes;

    static Object decode(String source) throws Exception {
        if (source == null || source.length() > 2_000_000) throw invalid();
        MebukiTurboStream p = new MebukiTurboStream(source);
        Object data = p.value(0);
        p.space();
        if (p.pos != source.length()) throw invalid();
        return data;
    }
    private MebukiTurboStream(String source) { this.source = source; }
    private static IllegalArgumentException invalid() {
        return new IllegalArgumentException("Unsupported Turbo Stream data");
    }
    private void space() {
        while (pos < source.length() && " \r\n\t".indexOf(source.charAt(pos)) >= 0) pos++;
    }
    private char peek() { space(); return pos < source.length() ? source.charAt(pos) : '\0'; }
    private boolean take(char c) { if (peek() != c) return false; pos++; return true; }
    private void expect(char c) { if (!take(c)) throw invalid(); }
    private int register(Object value, boolean ready) {
        if (refs.size() >= 100_000) throw invalid();
        refs.add(value); complete.add(ready); return refs.size() - 1;
    }
    private String string() throws Exception {
        if (peek() != '"') throw invalid();
        int start = pos++;
        while (pos < source.length()) {
            char c = source.charAt(pos++);
            if (c == '\\') {
                if (pos >= source.length()) throw invalid();
                pos++;
            } else if (c == '"') {
                return (String)new JSONTokener(source.substring(start, pos)).nextValue();
            } else if (c < 32) throw invalid();
        }
        throw invalid();
    }
    private String number() {
        space(); int start = pos;
        while (pos < source.length() && "-+0123456789.eE".indexOf(source.charAt(pos)) >= 0) pos++;
        String n = source.substring(start, pos);
        if (!n.matches("-?(0|[1-9][0-9]*)(\\.[0-9]+)?([eE][+-]?[0-9]+)?") || n.length()>64)
            throw invalid();
        return n;
    }
    static long dateMillis(String s) {
        java.util.regex.Matcher m = java.util.regex.Pattern.compile(
                "([0-9]{4})-([0-9]{2})-([0-9]{2})T([0-9]{2}):([0-9]{2}):([0-9]{2})(?:\\.([0-9]{1,9}))?Z").matcher(s);
        if (!m.matches()) throw invalid();
        java.util.Calendar c = new java.util.GregorianCalendar(java.util.TimeZone.getTimeZone("UTC"));
        c.setLenient(false); c.clear();
        c.set(Integer.parseInt(m.group(1)),Integer.parseInt(m.group(2))-1,Integer.parseInt(m.group(3)),
              Integer.parseInt(m.group(4)),Integer.parseInt(m.group(5)),Integer.parseInt(m.group(6)));
        String fraction = m.group(7);
        c.set(java.util.Calendar.MILLISECOND, fraction==null ? 0 : Integer.parseInt((fraction+"000").substring(0,3)));
        return c.getTimeInMillis();
    }
    private boolean literal(String s) {
        if (!source.startsWith(s,pos)) return false;
        pos += s.length(); return true;
    }
    private Object value(int depth) throws Exception {
        if (depth > 48 || ++nodes > 150_000) throw invalid();
        char c = peek();
        if (c == '{') {
            pos++; Map<String,Object> map = new LinkedHashMap<>(); int id = register(map,false);
            if (!take('}')) {
                do {
                    String k = string(); expect(':');
                    if (map.containsKey(k)) throw invalid();
                    map.put(k,value(depth+1));
                } while (take(','));
                expect('}');
            }
            complete.set(id,true); return map;
        }
        if (c == '[') {
            pos++; List<Object> list = new ArrayList<>(); int id = register(list,false);
            if (!take(']')) {
                do { list.add(value(depth+1)); } while (take(','));
                expect(']');
            }
            complete.set(id,true); return list;
        }
        if (c == '"') return string();
        if (c == 'D') {
            pos++; String date = string();
            dateMillis(date); register(date,true); return date;
        }
        if (c == '@') {
            pos++; String n = number();
            if (!n.matches("[0-9]{1,6}")) throw invalid();
            int id = Integer.parseInt(n);
            if (id >= refs.size() || !complete.get(id)) throw invalid();
            return refs.get(id);
        }
        if (c == '-' || (c >= '0' && c <= '9')) {
            String n = number();
            if (n.indexOf('.') < 0 && n.indexOf('e') < 0 && n.indexOf('E') < 0) return Long.valueOf(n);
            double v = Double.parseDouble(n);
            if (Double.isInfinite(v) || Double.isNaN(v)) throw invalid();
            return v;
        }
        if (literal("null") || literal("u")) return null;
        if (literal("true")) return Boolean.TRUE;
        if (literal("false")) return Boolean.FALSE;
        throw invalid();
    }
}
