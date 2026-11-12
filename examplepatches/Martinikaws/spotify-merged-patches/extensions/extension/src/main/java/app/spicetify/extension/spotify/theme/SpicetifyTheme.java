package app.spicetify.extension.spotify.theme;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Parses Spicetify themes: {@code color.ini} as desktop Spicetify reads it, or CSS {@code --spice-*} variables. */
public final class SpicetifyTheme {
    public static final class Scheme {
        public final String name;
        public final Map<String, Integer> colors;

        Scheme(String name, Map<String, Integer> colors) {
            this.name = name;
            this.colors = Collections.unmodifiableMap(colors);
        }
    }

    private static final Pattern HEX_RUN = Pattern.compile("[0-9a-fA-F]+");
    private static final Pattern DECIMAL = Pattern.compile("\\d{1,3}");
    private static final Pattern SPICE = Pattern.compile("--spice-([A-Za-z0-9-]+)\\s*:\\s*([^;}]+)");
    private static final Pattern RGB = Pattern.compile(
            "rgba?\\(\\s*(\\d{1,3})\\s*,\\s*(\\d{1,3})\\s*,\\s*(\\d{1,3})\\s*(?:,\\s*(\\d*\\.?\\d+)\\s*)?\\)");

    private SpicetifyTheme() {}

    public static List<Scheme> parse(String text) {
        if (text.contains("--spice-")) return Collections.singletonList(parseSpiceCss(text));
        return parseColorIni(text);
    }

    /**
     * Reads color.ini the way desktop Spicetify does (the CLI's go-ini and ParseColor):
     * case-insensitive names, "=" or ":", comment lines starting with ";" or "#", a section name
     * that ends at the last "]", and a value that ends at ";" or at a "#" after its first character. A leading byte order mark is ignored. Lines that don't parse
     * and values a phone can't use are skipped, never guessed.
     */
    public static List<Scheme> parseColorIni(String text) {
        Map<String, Map<String, Integer>> schemes = new LinkedHashMap<>();
        Map<String, Integer> current = null;
        String body = text.startsWith("\ufeff") ? text.substring(1) : text;
        for (String raw : body.split("\r?\n", -1)) {
            String line = raw.trim();
            if (line.isEmpty() || line.startsWith(";") || line.startsWith("#")) continue;
            if (line.startsWith("[")) {
                int end = line.lastIndexOf(']');
                String name = end < 0 ? "" : line.substring(1, end).trim().toLowerCase(Locale.ROOT);
                current = name.isEmpty() ? null : schemes.computeIfAbsent(name, ignored -> new LinkedHashMap<>());
                continue;
            }
            int delimiter = delimiter(line);
            if (delimiter < 1 || current == null) continue;
            Integer color = iniColor(value(line.substring(delimiter + 1)));
            if (color != null) current.put(line.substring(0, delimiter).trim().toLowerCase(Locale.ROOT), color);
        }
        if (schemes.isEmpty()) throw new ThemeException("No color schemes found.");
        List<Scheme> result = new ArrayList<>();
        for (Map.Entry<String, Map<String, Integer>> scheme : schemes.entrySet()) {
            result.add(new Scheme(scheme.getKey(), scheme.getValue()));
        }
        return result;
    }

    private static int delimiter(String line) {
        for (int i = 0; i < line.length(); i++) {
            char c = line.charAt(i);
            if (c == '=' || c == ':') return i;
        }
        return -1;
    }

    /** go-ini ends a value at ";" or "#"; a leading "#" stays, so "#RRGGBB" keeps working. */
    private static String value(String raw) {
        String value = raw.trim();
        int semicolon = value.indexOf(';');
        if (semicolon >= 0) value = value.substring(0, semicolon);
        int hash = value.indexOf('#', 1);
        if (hash >= 0) value = value.substring(0, hash);
        return value.trim();
    }

    /**
     * A color as the Spicetify CLI's ParseColor reads it: "r,g,b" decimals, or the first run of hex
     * digits (3 digits expand, 6 or more give the first 6, opaque). A leading "#" keeps this
     * project's #RGB, #RRGGBB and #AARRGGBB. Returns null when the value can't be used here:
     * ${xrdb:...} and ${ENV} read the desktop, and anything else would be a guess.
     */
    static Integer iniColor(String value) {
        if (value.isEmpty() || value.startsWith("${")) return null;
        if (value.startsWith("#")) return ArgbColors.parseHex(value.substring(1), false);
        if (value.indexOf(',') >= 0) return decimals(value);
        Matcher run = HEX_RUN.matcher(value);
        if (!run.find()) return null;
        String digits = run.group();
        if (digits.length() == 3) return ArgbColors.parseHex(digits, false);
        return digits.length() >= 6 ? ArgbColors.parseHex(digits.substring(0, 6), false) : null;
    }

    private static Integer decimals(String value) {
        String[] parts = value.split(",", 3);
        if (parts.length != 3) return null;
        int color = 0xFF000000;
        for (int i = 0; i < 3; i++) {
            String part = parts[i].trim();
            if (!DECIMAL.matcher(part).matches()) return null;
            int channel = Integer.parseInt(part);
            if (channel > 255) return null;
            color |= channel << (16 - 8 * i);
        }
        return color;
    }

    /** Every {@code --spice-<key>: <color>} declaration becomes one scheme; everything else is ignored. */
    static Scheme parseSpiceCss(String text) {
        Map<String, Integer> colors = new LinkedHashMap<>();
        Matcher match = SPICE.matcher(text);
        while (match.find()) {
            String key = match.group(1).toLowerCase(Locale.ROOT);
            if (key.startsWith("rgb-")) continue;
            colors.put(key, cssColor(key, match.group(2).trim()));
        }
        if (colors.isEmpty()) throw new ThemeException("No --spice-* colors found.");
        return new Scheme("css", colors);
    }

    private static int cssColor(String key, String value) {
        if (value.startsWith("#")) {
            Integer color = ArgbColors.parseHex(value.substring(1), true);
            if (color != null) return color;
        }
        Matcher rgb = RGB.matcher(value);
        if (rgb.matches()) {
            int red = Integer.parseInt(rgb.group(1));
            int green = Integer.parseInt(rgb.group(2));
            int blue = Integer.parseInt(rgb.group(3));
            double alpha = rgb.group(4) == null ? 1.0 : Double.parseDouble(rgb.group(4));
            if (red <= 255 && green <= 255 && blue <= 255 && alpha >= 0 && alpha <= 1) {
                return ((int) Math.round(alpha * 255) << 24) | (red << 16) | (green << 8) | blue;
            }
        }
        throw new ThemeException("--spice-" + key + " has unsupported color \"" + value + "\".");
    }
}
