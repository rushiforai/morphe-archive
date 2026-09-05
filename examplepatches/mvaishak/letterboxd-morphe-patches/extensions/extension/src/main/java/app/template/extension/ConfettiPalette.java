package app.template.extension;

/** The two colour sources the "Confetti color" Mod setting can pick between. */
final class ConfettiPalette {

    /** Letterboxd's own three brand hues (orange/green/blue) plus black/white for contrast. */
    static final int[] LETTERBOXD = {0xFFFF8000, 0xFF00E054, 0xFF40BCF4, 0xFFFFFFFF, 0xFF1A1A1A};

    /** A classic party-confetti red/gold, plus black/white for contrast. */
    static final int[] RED = {0xFFE63946, 0xFFFFC93C, 0xFFB3122A, 0xFFFFFFFF, 0xFF1A1A1A};

    private ConfettiPalette() {}

    /** The current accent colour, plus a lighter and a darker tone, plus black/white. */
    static int[] forAccent(int accentArgb) {
        int accent = 0xFF000000 | accentArgb;
        return new int[]{
                accent, mix(accent, 0xFFFFFFFF, 0.55f), mix(accent, 0xFF000000, 0.3f),
                0xFFFFFFFF, 0xFF1A1A1A,
        };
    }

    private static int mix(int a, int b, float amount) {
        int ar = (a >> 16) & 0xFF, ag = (a >> 8) & 0xFF, ab = a & 0xFF;
        int br = (b >> 16) & 0xFF, bg = (b >> 8) & 0xFF, bb = b & 0xFF;
        int r = Math.round(ar + (br - ar) * amount);
        int g = Math.round(ag + (bg - ag) * amount);
        int bl = Math.round(ab + (bb - ab) * amount);
        return 0xFF000000 | (r << 16) | (g << 8) | bl;
    }
}
