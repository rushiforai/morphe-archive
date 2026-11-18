package app.afterglow.extension.settings;

/**
 * Reads the theme's semantic colors from the same {@code theme_*} keys the iOS
 * theme store uses (YTAGTheme.m YTAGThemeLegacyKeyForRole). Legacy lookups return
 * explicitly stored colors; semantic consumers use ThemeStore's resolved palette.
 *
 * <p>Storage: iOS keeps each legacy color as an archived UIColor blob. Android
 * stores an ARGB integer (Integer/Long) or
 * a "#RRGGBB" / "#AARRGGBB" string. A missing or unreadable value means "use
 * YouTube's native color", as on iOS.
 */
public final class ThemeColors {
    public static final String BACKGROUND = "theme_background";
    public static final String NAVIGATION = "theme_navBar";
    public static final String TEXT_PRIMARY = "theme_textPrimary";
    public static final String TEXT_SECONDARY = "theme_textSecondary";
    public static final String ACCENT = "theme_accent";
    public static final String TAB_ICONS = "theme_tabBarIcons";
    public static final String GRADIENT_START = "theme_gradientStart";
    public static final String GRADIENT_END = "theme_gradientEnd";
    public static final String GLOW = "theme_glowColor";

    private ThemeColors() {}

    /** The stored color as ARGB, or null when the key holds no readable color. */
    public static Integer color(String key) {
        ThemeRole role = ThemeRole.forLegacyKey(key);
        return role == null ? null : ThemeStore.snapshot().palette.explicit(role);
    }

    public static Integer decode(Object value) {
        if (value instanceof Integer) return (Integer) value;
        if (value instanceof Long) return (int) (long) (Long) value;
        if (value instanceof String) {
            String text = ((String) value).trim();
            if (text.matches("#[0-9A-Fa-f]{6}")) return 0xFF000000 | Integer.parseInt(text.substring(1), 16);
            if (text.matches("#[0-9A-Fa-f]{8}")) return (int) Long.parseLong(text.substring(1), 16);
        }
        return null;
    }

    /** "#RRGGBB" for a stored color (iOS themeHexFromColor), or null. */
    public static String hex(String key) {
        Integer color = color(key);
        return color == null ? null : String.format(java.util.Locale.ROOT, "#%06X", color & 0xFFFFFF);
    }

    /** YES when both gradient colors are set (iOS gradientEnabled). */
    public static boolean gradientEnabled() {
        return ThemeStore.snapshot().palette.hasGradient();
    }

    /**
     * iOS pageStyleOverride: when the theme owns the background (a background color or a
     * gradient) its foundation decides light (0) or dark (1); otherwise -1, follow the app.
     * Built-in presets retain their declared foundation; custom palettes use the iOS
     * perceived-brightness rule (average gradient endpoints first, threshold 0.55).
     */
    public static int pageStyleOverride() {
        return ThemeStore.snapshot().palette.pageStyleOverride();
    }

    /** WCAG relative luminance (YTAGContrastPolicy). */
    public static double luminance(int color) {
        return 0.2126 * channel((color >>> 16) & 255) + 0.7152 * channel((color >>> 8) & 255) + 0.0722 * channel(color & 255);
    }

    private static double channel(int value) {
        double c = value / 255.0;
        return c <= 0.03928 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4);
    }

    /** WCAG contrast ratio between two opaque colors. */
    public static double contrast(int a, int b) {
        double la = luminance(a);
        double lb = luminance(b);
        return (Math.max(la, lb) + 0.05) / (Math.min(la, lb) + 0.05);
    }

    /** Black or white, whichever reads better on {@code background} (YTAGContrastReadableForeground). */
    public static int blackOrWhite(int background) {
        return contrast(0xFF000000, background) >= contrast(0xFFFFFFFF, background) ? 0xFF000000 : 0xFFFFFFFF;
    }
}
