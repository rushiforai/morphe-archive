package app.ayham.extension.music.addons;

import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * JavaScript's string and number readings, spelled out so the addon code reads JSON values and
 * text exactly as the extension's JS does. Java's and Android ICU's regex classes differ from
 * JS's (ICU counts CJK as word characters), so the classes used here are written out by hand.
 */
final class Js {
    private Js() {
    }

    /** JS's {@code \s}: Unicode white space and line terminators (for use inside a [...] class). */
    static final String WS = "\\t\\n\\u000B\\f\\r \\u00A0\\u1680\\u2000-\\u200A\\u2028\\u2029\\u202F\\u205F\\u3000\\uFEFF";
    /** JS's {@code \w}, ASCII only. */
    static final String WORD = "A-Za-z0-9_";
    /** JS's {@code \b} in front of a word character. */
    static final String B0 = "(?<![" + WORD + "])";
    /** JS's {@code \b} after a word character. */
    static final String B1 = "(?![" + WORD + "])";

    static boolean isWs(char c) {
        return c == '\t' || c == '\n' || c == 0x0B || c == '\f' || c == '\r' || c == ' ' || c == 0xA0 || c == 0x1680
                || (c >= 0x2000 && c <= 0x200A) || c == 0x2028 || c == 0x2029 || c == 0x202F || c == 0x205F
                || c == 0x3000 || c == 0xFEFF;
    }

    /** String.prototype.trim. */
    static String trim(String s) {
        if (s == null) return "";
        int a = 0, b = s.length();
        while (a < b && isWs(s.charAt(a))) a++;
        while (b > a && isWs(s.charAt(b - 1))) b--;
        return s.substring(a, b);
    }

    static boolean blank(String s) {
        return trim(s).isEmpty();
    }

    /** {@code v == null ? '' : String(v)}. */
    static String text(Object v) {
        return v == null ? "" : string(v);
    }

    /** String(v) for a parsed JSON value. */
    static String string(Object v) {
        if (v == null) return "null";
        if (v instanceof String) return (String) v;
        if (v instanceof Boolean) return v.toString();
        if (v instanceof Number) return number(((Number) v).doubleValue());
        if (v instanceof List) {
            StringBuilder b = new StringBuilder();
            List<?> l = (List<?>) v;
            for (int i = 0; i < l.size(); i++) {
                if (i > 0) b.append(',');
                if (l.get(i) != null) b.append(string(l.get(i)));
            }
            return b.toString();
        }
        if (v instanceof Map) return "[object Object]";
        return v.toString();
    }

    /** Number.prototype.toString for the values JSON gives. */
    static String number(double d) {
        if (Double.isNaN(d)) return "NaN";
        if (Double.isInfinite(d)) return d > 0 ? "Infinity" : "-Infinity";
        if (d == 0) return "0";
        if (d == Math.rint(d) && Math.abs(d) < 1e21) return new BigDecimal(d).toBigInteger().toString();
        BigDecimal x = new BigDecimal(Double.toString(d)).stripTrailingZeros();
        double a = Math.abs(d);
        if (a >= 1e-6 && a < 1e21) return x.toPlainString();
        String digits = x.unscaledValue().abs().toString();
        int exp = digits.length() - 1 - x.scale();
        String m = digits.length() > 1 ? digits.charAt(0) + "." + digits.substring(1) : digits;
        return (d < 0 ? "-" : "") + m + "e" + (exp < 0 ? "-" : "+") + Math.abs(exp);
    }

    private static final Pattern FLOAT_PREFIX = Pattern.compile(
            "^[+-]?(?:Infinity|[0-9]+\\.?[0-9]*(?:[eE][+-]?[0-9]+)?|\\.[0-9]+(?:[eE][+-]?[0-9]+)?)");

    /** parseFloat: the longest number at the start ("320kbps" is 320); NaN when there is none. */
    static double parseFloat(String s) {
        int a = 0;
        while (a < s.length() && isWs(s.charAt(a))) a++;
        Matcher m = FLOAT_PREFIX.matcher(s.substring(a));
        if (!m.find()) return Double.NaN;
        String t = m.group();
        if (t.endsWith("Infinity")) return t.startsWith("-") ? Double.NEGATIVE_INFINITY : Double.POSITIVE_INFINITY;
        return Double.parseDouble(t);
    }

    /** The addon code's num(): a finite number, or a string parsed leniently; else null. */
    static Double num(Object v) {
        if (v == null) return null;
        double n = v instanceof Number ? ((Number) v).doubleValue() : parseFloat(string(v));
        return Double.isNaN(n) || Double.isInfinite(n) ? null : n;
    }

    /** protocol.md §2 flags: a boolean as is, "1 true yes on" / "0 false no off", numbers non-zero. */
    static Boolean flag(Object v, Boolean def) {
        if (v instanceof Boolean) return (Boolean) v;
        if (v instanceof Number) return ((Number) v).doubleValue() != 0;
        String s = trim(text(v)).toLowerCase(Locale.ROOT);
        if (s.equals("1") || s.equals("true") || s.equals("yes") || s.equals("on")) return true;
        if (s.equals("0") || s.equals("false") || s.equals("no") || s.equals("off")) return false;
        return def;
    }

    /** JS truthiness of a parsed JSON value. */
    static boolean truthy(Object v) {
        if (v == null) return false;
        if (v instanceof Boolean) return (Boolean) v;
        if (v instanceof Number) {
            double d = ((Number) v).doubleValue();
            return d != 0 && !Double.isNaN(d);
        }
        if (v instanceof String) return !((String) v).isEmpty();
        return true;
    }

    /** encodeURIComponent (never URLEncoder, which writes a space as '+'). */
    static String encode(String s) {
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < s.length(); ) {
            int cp = s.codePointAt(i);
            i += Character.charCount(cp);
            if ((cp >= 'A' && cp <= 'Z') || (cp >= 'a' && cp <= 'z') || (cp >= '0' && cp <= '9') || "-_.!~*'()".indexOf(cp) >= 0) {
                b.append((char) cp);
                continue;
            }
            // (a lone surrogate, which JS refuses, is sent as U+FFFD)
            if (cp >= 0xD800 && cp <= 0xDFFF) cp = 0xFFFD;
            for (byte x : new String(Character.toChars(cp)).getBytes(StandardCharsets.UTF_8)) {
                b.append('%').append(Character.toUpperCase(Character.forDigit((x >> 4) & 0xF, 16)))
                        .append(Character.toUpperCase(Character.forDigit(x & 0xF, 16)));
            }
        }
        return b.toString();
    }

    /** String.prototype.split with a pattern that never matches the empty string: every piece kept. */
    static List<String> split(String s, Pattern p) {
        List<String> out = new ArrayList<>();
        Matcher m = p.matcher(s);
        int last = 0;
        while (m.find()) {
            out.add(s.substring(last, m.start()));
            last = m.end();
        }
        out.add(s.substring(last));
        return out;
    }

    interface Replacer {
        String replace(Matcher m);
    }

    /** String.prototype.replace with a global pattern and a callback. */
    static String replace(String s, Pattern p, Replacer r) {
        Matcher m = p.matcher(s);
        StringBuffer b = new StringBuffer();
        while (m.find()) m.appendReplacement(b, Matcher.quoteReplacement(r.replace(m)));
        m.appendTail(b);
        return b.toString();
    }

    /** [...s].length. */
    static int length(String s) {
        return s.codePointCount(0, s.length());
    }

    /** The first group of the first match, or null (str.match(re)?.[1]). */
    static String group1(Pattern p, String s) {
        Matcher m = p.matcher(s);
        return m.find() ? m.group(1) : null;
    }
}
