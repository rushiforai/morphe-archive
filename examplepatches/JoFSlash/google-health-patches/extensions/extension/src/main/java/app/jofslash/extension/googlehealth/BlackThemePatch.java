package app.jofslash.extension.googlehealth;

/**
 * Used by the Black theme patch. Every color of the app's Material color scheme passes through
 * here when the scheme is made, and the darkest grays become pure black: the dark theme's
 * background, surface and the lower surface containers (#131314 to #1e1f20), which the app uses
 * for screens and cards. Lighter surfaces, such as buttons and sheets, keep their colors.
 */
@SuppressWarnings("unused")
public final class BlackThemePatch {
    /** Compose's packed Color for opaque black in sRGB. */
    private static final long BLACK = 0xFF000000L << 32;

    /** The lightest channel value that still counts as the dark theme's background (#1e1f20). */
    private static final int DARKEST = 0x22;

    private BlackThemePatch() {
    }

    /**
     * @param color A Compose Color value: for sRGB, the ARGB int in the upper 32 bits and the
     *              color space id 0 in the lowest 6 bits.
     */
    public static long black(long color) {
        if ((color & 0x3FL) != 0) return color; // Not sRGB.
        int argb = (int) (color >>> 32);
        if ((argb >>> 24) != 0xFF) return color; // Translucent.
        int r = (argb >> 16) & 0xFF, g = (argb >> 8) & 0xFF, b = argb & 0xFF;
        int max = Math.max(r, Math.max(g, b));
        int min = Math.min(r, Math.min(g, b));
        // A dark, neutral gray. Dark colored tones (dark blue, dark red) keep their color.
        return max <= DARKEST && max - min <= 4 ? BLACK : color;
    }
}
