package app.afterglow.extension.settings;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

/** Editable theme and portable version-1 schema from iOS YTAGTheme/YTAGThemeStore. */
public final class ThemeDocument {
    public static final String FORMAT = "YTAfterglowTheme";
    public static final String[] TYPOGRAPHY = {"fontMode", "fontSizeMode", "fontWeightMode", "fontStyleMode", "tabLabelSizeMode"};
    public static final String[] GLOW_FLAGS = {"enabled", "pivot", "overlay", "scrubber", "seekBar"};
    public String identifier;
    public String name;
    public String summary;
    public Boolean lightFoundation;
    public Boolean glowEnabled;
    public Boolean seekBarRainbow;
    public final EnumMap<ThemeRole, Integer> colors = new EnumMap<>(ThemeRole.class);
    /** Null groups preserve the user's existing scalar settings when activated. */
    public Map<String, Object> typography;
    public Map<String, Object> glow;

    public ThemeDocument() { identifier = freshIdentifier(); name = "Custom"; }
    public static String freshIdentifier() { return "custom-" + UUID.randomUUID().toString().replace("-", "").substring(0, 12); }
    public static String normalizedName(String value) {
        if (value == null) return "";
        String normalized = value.trim().replaceAll("\\s+", " ");
        return normalized.substring(0, Math.min(64, normalized.length()));
    }
    public static ThemeDocument fromPalette(ThemePalette palette) {
        ThemeDocument document = new ThemeDocument();
        document.identifier = palette.identifier;
        document.name = palette.name;
        document.summary = palette.summary;
        document.lightFoundation = palette.lightFoundation;
        document.glowEnabled = palette.glowEnabled;
        document.colors.putAll(palette.explicitColors());
        return document;
    }
    public ThemeDocument copy() { return fromMap(toMap()); }
    public ThemePalette palette() {
        boolean light = lightFoundation != null ? lightFoundation : ThemePalette.fromColors(colors).lightFoundation;
        return new ThemePalette(identifier, name, summary, ThemeCatalog.find(identifier) != null,
                light, glowEnabled, colors);
    }
    public void validate() {
        if (normalizedName(name).isEmpty()) throw new IllegalArgumentException("The theme needs a name.");
        if (colors.containsKey(ThemeRole.GRADIENT_START) != colors.containsKey(ThemeRole.GRADIENT_END))
            throw new IllegalArgumentException("A gradient needs both a start and an end color.");
    }
    public Map<String, Object> toMap() {
        validate();
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("format", FORMAT); result.put("version", 1);
        result.put("identifier", identifier); result.put("name", normalizedName(name));
        if (summary != null && !summary.isEmpty()) result.put("summary", summary);
        if (lightFoundation != null) result.put("lightFoundation", lightFoundation);
        Map<String, Object> roles = new LinkedHashMap<>();
        for (Map.Entry<ThemeRole, Integer> entry : colors.entrySet()) roles.put(entry.getKey().semanticName, components(entry.getValue()));
        result.put("colors", roles);
        if (glowEnabled != null) result.put("glowEnabled", glowEnabled);
        if (seekBarRainbow != null) result.put("seekBarRainbow", seekBarRainbow);
        if (typography != null) result.put("typography", new LinkedHashMap<>(typography));
        if (glow != null) result.put("glow", new LinkedHashMap<>(glow));
        return result;
    }
    public String json() { return ThemeJson.write(toMap()); }
    public static ThemeDocument parse(String json) { return fromMap(ThemeJson.parse(json)); }

    public static ThemeDocument fromMap(Object value) {
        Map<?, ?> root = map(value, "theme");
        only(root, "format", "version", "identifier", "name", "summary", "lightFoundation", "colors", "glowEnabled", "seekBarRainbow", "typography", "glow");
        if (!FORMAT.equals(root.get("format"))) throw new IllegalArgumentException("This is not an Afterglow theme file.");
        integer(root, "version", 1, 1);
        ThemeDocument result = new ThemeDocument();
        result.name = normalizedName(string(root.get("name"), "name"));
        if (root.containsKey("identifier")) result.identifier = string(root.get("identifier"), "identifier");
        if (root.containsKey("summary")) result.summary = normalizedName(string(root.get("summary"), "summary"));
        if (root.containsKey("lightFoundation")) result.lightFoundation = bool(root.get("lightFoundation"), "lightFoundation");
        if (root.containsKey("glowEnabled")) result.glowEnabled = bool(root.get("glowEnabled"), "glowEnabled");
        if (root.containsKey("seekBarRainbow")) result.seekBarRainbow = bool(root.get("seekBarRainbow"), "seekBarRainbow");
        Map<?, ?> colors = map(root.get("colors"), "colors");
        for (Map.Entry<?, ?> entry : colors.entrySet()) {
            ThemeRole role = null;
            for (ThemeRole candidate : ThemeRole.values()) if (candidate.semanticName.equals(entry.getKey())) role = candidate;
            if (role == null) throw new IllegalArgumentException("Unknown color role: " + entry.getKey());
            result.colors.put(role, color(entry.getValue()));
        }
        if (root.containsKey("typography")) {
            Map<?, ?> group = map(root.get("typography"), "typography");
            only(group, TYPOGRAPHY);
            result.typography = new LinkedHashMap<>();
            for (String key : TYPOGRAPHY) result.typography.put(key, integer(group, key, 0, 99));
        }
        if (root.containsKey("glow")) {
            Map<?, ?> group = map(root.get("glow"), "glow");
            only(group, "enabled", "strengthMode", "strengthCustom", "opacity", "radius", "layers", "pivot", "overlay", "scrubber", "seekBar");
            result.glow = new LinkedHashMap<>();
            for (String key : GLOW_FLAGS) result.glow.put(key, bool(group.get(key), key));
            result.glow.put("strengthMode", integer(group, "strengthMode", 0, 3));
            for (String key : new String[]{"strengthCustom", "opacity", "radius"}) result.glow.put(key, integer(group, key, 0, 100));
            result.glow.put("layers", integer(group, "layers", 1, 12));
        }
        result.validate();
        return result;
    }
    static List<Double> components(int color) {
        return Arrays.asList(((color >> 16) & 255) / 255.0, ((color >> 8) & 255) / 255.0,
                (color & 255) / 255.0, ((color >>> 24) & 255) / 255.0);
    }
    static int color(Object value) {
        if (!(value instanceof List) || (((List<?>) value).size() != 3 && ((List<?>) value).size() != 4))
            throw new IllegalArgumentException("Colors must list red, green, blue, and optional alpha.");
        List<?> components = (List<?>) value;
        int[] channels = {0, 0, 0, 255};
        for (int i = 0; i < components.size(); i++) {
            Object component = components.get(i);
            if (!(component instanceof Number)) throw new IllegalArgumentException("Color components must be numbers.");
            double number = ((Number) component).doubleValue();
            if (!Double.isFinite(number) || number < 0 || number > 1) throw new IllegalArgumentException("Color components must be between 0 and 1.");
            channels[i] = (int) Math.round(number * 255);
        }
        return (channels[3] << 24) | (channels[0] << 16) | (channels[1] << 8) | channels[2];
    }
    static Map<?, ?> map(Object value, String name) {
        if (!(value instanceof Map)) throw new IllegalArgumentException(name + " must be a dictionary.");
        return (Map<?, ?>) value;
    }
    static String string(Object value, String name) {
        if (!(value instanceof String)) throw new IllegalArgumentException(name + " must be text.");
        return (String) value;
    }
    static boolean bool(Object value, String name) {
        if (value instanceof Boolean) return (Boolean) value;
        if (value instanceof Number && Double.isFinite(((Number) value).doubleValue())) return ((Number) value).doubleValue() != 0;
        throw new IllegalArgumentException(name + " must be true or false.");
    }
    static int integer(Map<?, ?> map, String key, int min, int max) {
        Object value = map.get(key);
        if (value instanceof Number) {
            double number = ((Number) value).doubleValue();
            if (number >= min && number <= max && Math.floor(number) == number) return (int) number;
        }
        throw new IllegalArgumentException(key + " must be a whole number between " + min + " and " + max + ".");
    }
    static void only(Map<?, ?> map, String... allowed) {
        for (Object key : map.keySet()) if (!Arrays.asList(allowed).contains(key)) throw new IllegalArgumentException("Unexpected key: " + key);
    }
}
