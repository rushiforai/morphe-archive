package app.yydarlinker.aicaptions;

import java.math.BigDecimal;
import java.util.*;
import java.util.regex.*;

/**
 * Value-based numeric identity for one translated event.
 *
 * <p>The old gate compared literal decimal integers. That treats a correct reformulation such as
 * "4 and a half times" → "4.5倍" as a substitution (4 vs 4.5), rejects the complete block, and
 * leaves every cue in it on the placeholder. Numeric identity is a <em>value</em> question, not a
 * spelling question: fractions, decimals, grouped thousands and full-width digits must compare by
 * value, while dates retain their own equivalence. The gate stays deliberately conservative: it
 * only contradicts a definite one-to-one value mismatch, never a change in notation or a number
 * the translation legitimately omitted/kept implicit.
 */
final class RebuildNumbers {
    enum Result {
        EQUIVALENT,
        CONTRADICTED,
        UNKNOWN
    }

    static boolean hasDigits(String text) {
        return text != null
                && text.codePoints()
                        .anyMatch(c -> Character.getType(c) == Character.DECIMAL_DIGIT_NUMBER);
    }

    static final String MONTHS =
            "january february march april may june july august september october november december";
    static final Pattern EN =
            Pattern.compile(
                    "(?i)\\b(" + MONTHS.replace(" ", "|") + ")\\s+(\\d{1,2})(?:st|nd|rd|th)?\\b");
    static final Pattern ZH =
            Pattern.compile(
                    "(?<![0-9一二三四五六七八九十])([0-9]{1,2}|[一二三四五六七八九十]{1,3})月\\s*([0-9]{1,2}|[一二三四五六七八九十]{1,3})(?:日|号)");
    static final Pattern NUMBER =
            // Unsigned on purpose: whether a preceding '-' is a minus sign or a designation
            // separator (Т-14, МиГ-29, टी-14) is decided per match, not by a regex lookbehind.
            // This also keeps numbers adjacent to CJK text (约4.5倍, 有25艘) visible.
            Pattern.compile("\\d+(?:,\\d{3})*(?:\\.\\d+)?");

    /** A '-' is a sign only at a token start (start of text, whitespace, bracket or operator). */
    private static boolean minusSign(String text, int at) {
        if (at <= 0 || text.charAt(at - 1) != '-') return false;
        if (at == 1) return true;
        char before = text.charAt(at - 2);
        return !Character.isLetterOrDigit(before) && before != '.' && before != ',' && before != '_';
    }
    private static final Pattern HALF_AFTER =
            Pattern.compile(
                    "(?i)(?<![a-z0-9])(\\d+(?:[.,]\\d+)?)\\s*(?:and\\s+(?:a|one)\\s+)?half\\b");
    private static final Pattern ONE_AND_HALF =
            Pattern.compile("(?i)(?<![a-z0-9])(?:one|a)\\s+and\\s+(?:a\\s+)?half\\b");
    private static final Pattern HALF_BEFORE =
            Pattern.compile("(?i)(?<![a-z0-9])(?:(?:a|one)\\s+half|half)\\b");
    private static final Pattern CJK_HALF =
            Pattern.compile("(\\d+(?:[.,]\\d+)?)\\s*(?:个|個|つ)?\\s*半");
    private static final Pattern VULGAR_HALF = Pattern.compile("(\\d+)\\s*½");
    private static final Pattern SIMPLE_FRACTION =
            Pattern.compile("(?<![\\d.])(\\d+)\\s*/\\s*(\\d+)(?![\\d.])");

    /** A numeric value in the order it is spoken; notation is normalised, value is retained. */
    static List<BigDecimal> values(String text) {
        if (text == null || text.isEmpty()) return Collections.emptyList();
        String value = normalize(text);
        // Fractions first, so "4 and a half" becomes one value 4.5 rather than 4 and 0.5.
        value = replace(HALF_AFTER, value, 0.5, true);
        value = replace(VULGAR_HALF, value, 0.5, true);
        value = replace(CJK_HALF, value, 0.5, true);
        value = ONE_AND_HALF.matcher(value).replaceAll("1.5 ");
        value = replaceSimpleFractions(value);
        value = HALF_BEFORE.matcher(value).replaceAll("0.5 ");
        List<BigDecimal> out = new ArrayList<>();
        Matcher m = NUMBER.matcher(value);
        while (m.find()) {
            try {
                BigDecimal base =
                        new BigDecimal(m.group().replace(",", "")).stripTrailingZeros();
                if (minusSign(value, m.start())) base = base.negate();
                int after = m.end();
                while (after < value.length() && Character.isWhitespace(value.charAt(after)))
                    after++;
                BigDecimal scale = scale(value, after);
                out.add(scale == null ? base : base.multiply(scale).stripTrailingZeros());
            } catch (NumberFormatException ignored) {
                // A malformed token is not evidence of substitution.
            }
        }
        return out;
    }

    /** Scale words that are part of the number: 1万, 3千, 10k, 2 million, 2억, 20 करोड़. */
    private static BigDecimal scale(String text, int at) {
        if (at >= text.length()) return null;
        char c = text.charAt(at);
        if (c == '万' || c == '萬') return BigDecimal.valueOf(10_000);
        if (c == '亿' || c == '億') return BigDecimal.valueOf(100_000_000);
        if (c == '억') return BigDecimal.valueOf(100_000_000);
        if (c == '千') return BigDecimal.valueOf(1_000);
        if (c == '百') return BigDecimal.valueOf(100);
        String rest = text.substring(at).toLowerCase(Locale.ROOT);
        if (rest.startsWith("thousand")) return BigDecimal.valueOf(1_000);
        if (rest.startsWith("million")
                || rest.startsWith("millones")
                || rest.startsWith("millions")
                || rest.startsWith("milioni")
                || rest.startsWith("milhões")
                || rest.startsWith("millionen"))
            return BigDecimal.valueOf(1_000_000);
        if (rest.startsWith("billion")
                || rest.startsWith("billones")
                || rest.startsWith("miliardi"))
            return BigDecimal.valueOf(1_000_000_000);
        if (rest.startsWith("crore") || rest.startsWith("करोड़") || rest.startsWith("करोड"))
            return BigDecimal.valueOf(10_000_000);
        if (rest.startsWith("lakh")
                || rest.startsWith("lac ")
                || rest.startsWith("लाख"))
            return BigDecimal.valueOf(100_000);
        if (rest.startsWith("k") && wordEdge(rest, 1)) return BigDecimal.valueOf(1_000);
        return null;
    }

    private static boolean wordEdge(String text, int at) {
        return at >= text.length() || !Character.isLetter(text.charAt(at));
    }

    private static String normalize(String text) {
        StringBuilder out = new StringBuilder(text.length());
        for (int at = 0; at < text.length(); ) {
            int cp = text.codePointAt(at);
            at += Character.charCount(cp);
            int digit = Character.digit(cp, 10);
            if (digit >= 0 && Character.getType(cp) == Character.DECIMAL_DIGIT_NUMBER) {
                // Arabic-Indic, Devanagari and full-width digits all name the same value.
                out.append((char) ('0' + digit));
            } else if (cp == 0xff0c || cp == 0x060c || cp == 0x066c) {
                // Arabic comma and U+066C (Arabic thousands separator) group digits.
                out.append(',');
            } else if (cp == 0xff0e || cp == 0x066b || cp == 0x00a0) {
                // U+066B is the Arabic decimal separator, not a thousands separator.
                out.append(cp == 0x00a0 ? ' ' : '.');
            } else if (cp == 0xff0d || cp == 0x2212) {
                // Full-width hyphen-minus and the mathematical minus both express a sign.
                out.append('-');
            } else {
                out.appendCodePoint(cp);
            }
        }
        return out.toString();
    }

    private static String replace(
            Pattern pattern, String text, double add, boolean multiplyFirst) {
        Matcher m = pattern.matcher(text);
        StringBuffer out = new StringBuffer();
        while (m.find()) {
            String group = m.group(1);
            BigDecimal base;
            try {
                base = new BigDecimal(group.replace(",", ""));
            } catch (RuntimeException malformed) {
                continue;
            }
            BigDecimal value = base.add(BigDecimal.valueOf(add));
            m.appendReplacement(out, Matcher.quoteReplacement(value.stripTrailingZeros().toPlainString()));
        }
        m.appendTail(out);
        return out.toString();
    }

    private static String replaceSimpleFractions(String text) {
        Matcher m = SIMPLE_FRACTION.matcher(text);
        StringBuffer out = new StringBuffer();
        while (m.find()) {
            try {
                BigDecimal value =
                        new BigDecimal(m.group(1))
                                .divide(new BigDecimal(m.group(2)), 8, java.math.RoundingMode.HALF_UP)
                                .stripTrailingZeros();
                m.appendReplacement(
                        out, Matcher.quoteReplacement(value.toPlainString()));
            } catch (RuntimeException malformed) {
                // Zero denominator: leave the text untouched.
            }
        }
        m.appendTail(out);
        return out.toString();
    }

    /** Literal digit values, kept for diagnostics and unit tests that need the raw spelling. */
    static List<String> numbers(String text) {
        List<String> out = new ArrayList<>();
        for (BigDecimal value : values(text)) out.add(value.toPlainString());
        return out;
    }

    static int integer(String s) {
        if (s.matches("[0-9]+")) return Integer.parseInt(s);
        String digits = "零一二三四五六七八九";
        int t = s.indexOf('十');
        if (t >= 0) {
            int tens = t == 0 ? 1 : digits.indexOf(s.charAt(0));
            int units = t == s.length() - 1 ? 0 : digits.indexOf(s.charAt(t + 1));
            return tens < 0 || units < 0 ? -1 : tens * 10 + units;
        }
        return s.length() == 1 ? digits.indexOf(s.charAt(0)) : -1;
    }

    static List<String> dates(String text) {
        List<String> out = new ArrayList<>();
        Matcher en = EN.matcher(text), zh = ZH.matcher(text);
        List<String> names = Arrays.asList(MONTHS.split(" "));
        while (en.find()) {
            int d = integer(en.group(2));
            if (d >= 1 && d <= 31)
                out.add((names.indexOf(en.group(1).toLowerCase(Locale.ROOT)) + 1) + ":" + d);
        }
        while (zh.find()) {
            int m = integer(zh.group(1)), d = integer(zh.group(2));
            if (m >= 1 && m <= 12 && d >= 1 && d <= 31) out.add(m + ":" + d);
        }
        Collections.sort(out);
        return out;
    }

    /**
     * True when the two texts name the same numbers. It rejects only a definite one-to-one value
     * mismatch (24 vs 25). Multiple numbers, missing numbers and unparsed notation stay safe: a
     * partial reading is not proof of a substitution.
     */
    static boolean safe(String source, String target) {
        List<String> a = dates(source), b = dates(target);
        if (!a.isEmpty() && !b.isEmpty() && !a.equals(b)) return false;
        if (!a.isEmpty() || !b.isEmpty()) {
            if (a.isEmpty() || b.isEmpty()) return true;
            source = ZH.matcher(EN.matcher(source).replaceAll(" ")).replaceAll(" ");
            target = ZH.matcher(EN.matcher(target).replaceAll(" ")).replaceAll(" ");
        }
        List<BigDecimal> left = values(source), right = values(target);
        if (left.size() != 1 || right.size() != 1) return true;
        return left.get(0).compareTo(right.get(0)) == 0;
    }

    static Result compare(String source, String target, CaptionLanguageContext context) {
        if (datesContradict(source, target)) return Result.CONTRADICTED;
        List<BigDecimal> left = values(source), right = values(target);
        if (left.isEmpty() || right.isEmpty()) return Result.UNKNOWN;
        if (left.size() == 1 && right.size() == 1)
            return left.get(0).compareTo(right.get(0)) == 0
                    ? Result.EQUIVALENT
                    : Result.CONTRADICTED;
        // More than one value on a side: order/multiplicity can legitimately change with grammar
        // ("4 and a half" is one value, but "300 ... 500 ... a 56" is three). Compare multisets;
        // a partial mismatch is not a proven substitution.
        return multiset(left).equals(multiset(right)) ? Result.EQUIVALENT : Result.UNKNOWN;
    }

    private static boolean datesContradict(String source, String target) {
        List<String> a = dates(source), b = dates(target);
        return !a.isEmpty() && !b.isEmpty() && !a.equals(b);
    }

    private static Map<String, Integer> multiset(List<BigDecimal> values) {
        Map<String, Integer> out = new TreeMap<>();
        for (BigDecimal value : values)
            out.merge(value.stripTrailingZeros().toPlainString(), 1, Integer::sum);
        return out;
    }

    /** Diagnostics: the values the gate actually compared, never the whole private source. */
    static String describe(String source, String target) {
        return "source_values=" + values(source) + ";target_values=" + values(target);
    }

    /** One self-contained rejection detail; kept out of the pinned protocol literal surface. */
    static String detail(int from, int to, String source, String target) {
        return "range="
                + from
                + "-"
                + to
                + "; "
                + describe(source, target);
    }
}
