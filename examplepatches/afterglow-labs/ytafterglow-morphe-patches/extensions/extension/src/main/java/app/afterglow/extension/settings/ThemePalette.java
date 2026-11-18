package app.afterglow.extension.settings;

import java.util.Collections;
import java.util.EnumMap;
import java.util.Map;
import java.util.Objects;

/**
 * Immutable, Android-independent color snapshot. Missing colors remain null so adapters
 * can keep YouTube's original value. Derivations follow YTAGThemeCatalog, not a generic
 * Material palette. ARGB channels are quantized to Android's eight-bit color format.
 */
public final class ThemePalette {
    public final String identifier;
    public final String name;
    public final String summary;
    public final boolean builtIn;
    public final boolean lightFoundation;
    /** Preset preference only; this does not enable an uninstalled Glow tweak. */
    public final Boolean glowEnabled;
    private final Map<ThemeRole, Integer> explicit;
    private final Map<ThemeRole, Integer> resolved;

    ThemePalette(String identifier, String name, String summary, boolean builtIn,
                 boolean lightFoundation, Boolean glowEnabled, Map<ThemeRole, Integer> colors) {
        this.identifier = identifier;
        this.name = name;
        this.summary = summary;
        this.builtIn = builtIn;
        this.lightFoundation = lightFoundation;
        this.glowEnabled = glowEnabled;
        EnumMap<ThemeRole, Integer> source = new EnumMap<>(ThemeRole.class);
        for (Map.Entry<ThemeRole, Integer> entry : colors.entrySet()) {
            if (entry.getKey() != null && entry.getValue() != null) source.put(entry.getKey(), entry.getValue());
        }
        explicit = Collections.unmodifiableMap(source);
        EnumMap<ThemeRole, Integer> derived = new EnumMap<>(source);
        if (!source.isEmpty()) {
            inherit(derived, ThemeRole.SEEK_LIVE, first(ThemeRole.SEEK_PLAYED));
            inherit(derived, ThemeRole.SEEK_SCRUBBER, first(ThemeRole.SEEK_PLAYED));
            // This chain reads EXPLICIT roles, not previously derived roles (iOS behavior).
            inherit(derived, ThemeRole.SEEK_SCRUBBER_LIVE,
                    first(ThemeRole.SEEK_SCRUBBER, ThemeRole.SEEK_LIVE, ThemeRole.SEEK_PLAYED));
            inherit(derived, ThemeRole.ELEVATED_SURFACE, first(ThemeRole.NAVIGATION_SURFACE, ThemeRole.BACKGROUND));
            Integer secondary = explicit(ThemeRole.SECONDARY_TEXT);
            Integer primary = explicit(ThemeRole.PRIMARY_TEXT);
            Integer border = null;
            if (secondary != null) border = alpha(secondary, 0.22);
            else if (primary != null) border = alpha(primary, 0.18);
            inherit(derived, ThemeRole.BORDER, border);
            inherit(derived, ThemeRole.OVERLAY_BACKDROP, alpha(0xFF000000, 0.62));
            inherit(derived, ThemeRole.SEEK_BUFFERED, explicit(ThemeRole.SEEK_PLAYED) != null ? 0x99A6A6A6 : null);
            inherit(derived, ThemeRole.FOCUS, first(ThemeRole.ACCENT, ThemeRole.TAB_ICON));
            inherit(derived, ThemeRole.SHADOW, alpha(0xFF000000, lightFoundation ? 0.22 : 0.55));
        }
        resolved = Collections.unmodifiableMap(derived);
    }

    public Integer explicit(ThemeRole role) { return explicit.get(role); }
    public Integer color(ThemeRole role) { return resolved.get(role); }
    public Map<ThemeRole, Integer> explicitColors() { return explicit; }
    public boolean overridesNativeAppearance() { return !explicit.isEmpty(); }
    public boolean hasGradient() {
        return explicit.containsKey(ThemeRole.GRADIENT_START) && explicit.containsKey(ThemeRole.GRADIENT_END);
    }

    /** -1 follows YouTube; 0 light; 1 dark. Accent-only themes never force a foundation. */
    public int pageStyleOverride() {
        return explicit.containsKey(ThemeRole.BACKGROUND) || hasGradient() ? (lightFoundation ? 0 : 1) : -1;
    }

    public static ThemePalette system() {
        return new ThemePalette("system", "System", "YouTube's own colors with no Afterglow overrides.",
                false, false, null, Collections.emptyMap());
    }

    /** Resolve the legacy palette and recognize built-in identity, ignoring an independent glow color. */
    public static ThemePalette fromPreferences(Map<String, ?> preferences) {
        EnumMap<ThemeRole, Integer> colors = new EnumMap<>(ThemeRole.class);
        for (ThemeRole role : ThemeRole.values()) {
            if (role.legacyKey == null) continue;
            Integer color = ThemeColors.decode(preferences.get(role.legacyKey));
            if (color != null) colors.put(role, color);
        }
        return fromColors(colors);
    }

    /** Resolves explicit semantic roles, also used by the upcoming Theme Studio editor. */
    public static ThemePalette fromColors(Map<ThemeRole, Integer> colors) {
        EnumMap<ThemeRole, Integer> defined = new EnumMap<>(ThemeRole.class);
        for (Map.Entry<ThemeRole, Integer> entry : colors.entrySet()) {
            if (entry.getKey() != null && entry.getValue() != null) defined.put(entry.getKey(), entry.getValue());
        }
        if (defined.isEmpty()) return system();
        ThemePalette match = ThemeCatalog.match(defined);
        if (match != null) {
            return new ThemePalette(match.identifier, match.name, match.summary, true,
                    match.lightFoundation, match.glowEnabled, defined);
        }
        return new ThemePalette("custom", "Custom", null, false, suggestsLightFoundation(defined), null, defined);
    }

    private Integer first(ThemeRole... roles) {
        for (ThemeRole role : roles) {
            Integer color = explicit.get(role);
            if (color != null) return color;
        }
        return null;
    }

    private static void inherit(Map<ThemeRole, Integer> colors, ThemeRole role, Integer fallback) {
        if (!colors.containsKey(role) && fallback != null) colors.put(role, fallback);
    }

    static int alpha(int color, double alpha) {
        return ((int) Math.round(alpha * 255) << 24) | (color & 0xFFFFFF);
    }

    /** Rec.601 perceived brightness, as in YTAGContrastSimpleLuma; NOT WCAG luminance. */
    private static double luma(int color) {
        return (0.299 * ((color >>> 16) & 255) + 0.587 * ((color >>> 8) & 255) + 0.114 * (color & 255)) / 255.0;
    }

    private static boolean suggestsLightFoundation(Map<ThemeRole, Integer> colors) {
        Integer start = colors.get(ThemeRole.GRADIENT_START);
        Integer end = colors.get(ThemeRole.GRADIENT_END);
        if (start != null && end != null) return (luma(start) + luma(end)) / 2 >= 0.55;
        if (start != null) return luma(start) >= 0.55;
        Integer background = colors.get(ThemeRole.BACKGROUND);
        return background != null && luma(background) >= 0.55;
    }

    @Override public boolean equals(Object object) {
        if (!(object instanceof ThemePalette)) return false;
        ThemePalette other = (ThemePalette) object;
        return identifier.equals(other.identifier) && name.equals(other.name)
                && Objects.equals(summary, other.summary) && builtIn == other.builtIn
                && lightFoundation == other.lightFoundation && Objects.equals(glowEnabled, other.glowEnabled)
                && explicit.equals(other.explicit);
    }

    @Override public int hashCode() { return Objects.hash(identifier, lightFoundation, explicit); }
}
