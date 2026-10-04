package app.hushtelegram.extension.shared.fuzz;

import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.function.Predicate;

/** Fixed grammar budgets shared by host tests. This source is never part of the extension. */
public final class BoundedJsonGrammar {
    public static final int SAMPLES = 64;
    public static final int MAX_BYTES = 8_192;
    public static final long MAX_MILLIS = 15_000;
    private static final String[] SPACES = {"", " ", "\t", "\n", "\r\n ", " \n\t"};
    private static final String[] TEXT = {"ordinary", "} [ \\\" quoted", "caf\u00e9\u00a0\u732b",
            "\u044f\uD83D\uDE42", "line\nnext\r\tend", "literal \\" + "u0061", "\u0000\b\f"};

    private BoundedJsonGrammar() {}

    public static long[] seeds() { return new long[]{0x5eed17L, 0xc0ffee31L, 0x671ca55L, 0x52ad09L}; }

    public static Map<String, Object> object(Random random, int sample) {
        Map<String, Object> root = new LinkedHashMap<>();
        root.put("sample", sample);
        root.put("text", TEXT[sample % TEXT.length]);
        root.put("nested", value(random, 4));
        root.put("exact", new BigDecimal("9007199254740993.125"));
        return root;
    }

    private static Object value(Random random, int depth) {
        switch (random.nextInt(depth == 0 ? 5 : 7)) {
            case 0: return TEXT[random.nextInt(TEXT.length)];
            case 1: return random.nextBoolean();
            case 2: return null;
            case 3: return 9_007_199_254_740_993L + random.nextInt(100);
            case 4: return new BigDecimal(random.nextInt(100) + ".125e-4");
            case 5: return Arrays.asList(value(random, depth - 1), value(random, depth - 1));
            default:
                Map<String, Object> object = new LinkedHashMap<>();
                object.put("field\u00e9", value(random, depth - 1));
                object.put("other", value(random, depth - 1));
                return object;
        }
    }

    public static String render(Object value, Random random) {
        if (value == null) return "null";
        if (value instanceof String) return quote((String) value, random);
        if (value instanceof Map) {
            List<Map.Entry<?, ?>> entries = new ArrayList<>(((Map<?, ?>) value).entrySet());
            Collections.shuffle(entries, random);
            StringBuilder out = new StringBuilder("{").append(space(random));
            for (int i = 0; i < entries.size(); i++) {
                if (i > 0) out.append(',').append(space(random));
                Map.Entry<?, ?> entry = entries.get(i);
                out.append(quote((String) entry.getKey(), random)).append(space(random)).append(':')
                        .append(space(random)).append(render(entry.getValue(), random));
            }
            return out.append(space(random)).append('}').toString();
        }
        if (value instanceof List) {
            StringBuilder out = new StringBuilder("[").append(space(random));
            List<?> values = (List<?>) value;
            for (int i = 0; i < values.size(); i++) {
                if (i > 0) out.append(',').append(space(random));
                out.append(render(values.get(i), random));
            }
            return out.append(space(random)).append(']').toString();
        }
        return value.toString();
    }

    public static String quote(String value, Random random) {
        StringBuilder out = new StringBuilder("\"");
        for (int i = 0; i < value.length(); i++) {
            char letter = value.charAt(i);
            if (Character.isHighSurrogate(letter) && i + 1 < value.length()
                    && Character.isLowSurrogate(value.charAt(i + 1))) {
                char low = value.charAt(++i);
                if (random.nextBoolean()) { appendEscape(out, letter); appendEscape(out, low); }
                else out.append(letter).append(low);
                continue;
            }
            if (letter == '\\' || letter == '"') out.append('\\').append(letter);
            else if (letter < 0x20 || random.nextInt(4) == 0) appendEscape(out, letter);
            else out.append(letter);
        }
        return out.append('"').toString();
    }

    /** A semantic name with at least its first character escaped, so no raw-name rule can save it. */
    public static String escapedName(String value, Random random) {
        StringBuilder out = new StringBuilder("\"");
        appendEscape(out, value.charAt(0));
        for (int i = 1; i < value.length(); i++) {
            if (random.nextBoolean()) appendEscape(out, value.charAt(i));
            else out.append(value.charAt(i));
        }
        return out.append('"').toString();
    }

    private static void appendEscape(StringBuilder out, char letter) {
        out.append('\\').append('u');
        for (int shift = 12; shift >= 0; shift -= 4) out.append("0123456789abcdef".charAt((letter >> shift) & 15));
    }

    public static String space(Random random) { return SPACES[random.nextInt(SPACES.length)]; }

    public static String embedded(String json) {
        return "{\"ordinary\":\"" + json.replace("\\", "\\\\").replace("\"", "\\\"")
                .replace("\r", "\\r").replace("\n", "\\n").replace("\t", "\\t") + "\"}";
    }

    public static void requireSize(String text) {
        if (text.getBytes(StandardCharsets.UTF_8).length > MAX_BYTES) {
            throw new AssertionError("The generated case exceeded its byte budget");
        }
    }

    public static void requireTime(long started) {
        if ((System.nanoTime() - started) / 1_000_000 > MAX_MILLIS) {
            throw new AssertionError("The fixed grammar run exceeded its time budget");
        }
    }

    /** Bounded deletion reduction. A failure prints a small input to promote into a permanent test. */
    public static String minimize(String text, Predicate<String> stillFails) {
        int attempts = 0;
        for (int width = text.length() / 2; width > 0 && attempts < 128; width /= 2) {
            for (int at = 0; at + width <= text.length() && attempts++ < 128;) {
                String candidate = text.substring(0, at) + text.substring(at + width);
                if (stillFails.test(candidate)) text = candidate;
                else at += width;
            }
        }
        return text;
    }
}
