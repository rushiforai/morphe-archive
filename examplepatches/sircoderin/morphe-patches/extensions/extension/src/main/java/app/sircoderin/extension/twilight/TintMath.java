package app.sircoderin.extension.twilight;

/**
 * Pure-Java maths for removing a uniform translucent overlay ("tint") from an image.
 *
 * <p>The overlay is modelled as {@code out_c = P_c + src_c * (1 - A)} for every channel c, where
 * {@code A} is the effective overlay opacity (0..1) and {@code P_c} the overlay's premultiplied
 * colour contribution (0..255), both expressed in the image's own colour space and encoding.
 * No android imports, so it can be unit-tested on a plain JVM.
 */
public final class TintMath {
    /** Above this opacity the source is not recoverable (range too narrow), so nothing is touched. */
    public static final double MAX_USABLE_ALPHA = 0.97;

    private final double alpha;
    private final double[] premul;

    public TintMath(double effectiveAlpha, double[] premultipliedRgb) {
        this.alpha = effectiveAlpha;
        this.premul = new double[] {premultipliedRgb[0], premultipliedRgb[1], premultipliedRgb[2]};
    }

    public double alpha() {
        return alpha;
    }

    public double[] premul() {
        return premul.clone();
    }

    /** True if this tint is a real, invertible overlay (not identity, not too opaque). */
    public boolean isUsable() {
        return alpha > 0.0 && alpha < MAX_USABLE_ALPHA;
    }

    /**
     * Effective opacity of: tint (alpha a), then black dim (alpha d), then window alpha w.
     * All in 0..1.
     */
    public static double effectiveAlpha(double window, double tintA, double dimA) {
        return window * (tintA + dimA - tintA * dimA);
    }

    /** Premultiplied factor: {@code P_c = factor * tintColour_c}. */
    public static double premulFactor(double window, double tintA, double dimA) {
        return window * tintA * (1.0 - dimA);
    }

    /**
     * Fraction of pixels (packed ARGB ints) having any channel outside the range a tinted image can
     * produce: [P_c - tol, P_c + 255 * (1 - A) + tol].
     */
    public double fitFraction(int[] argbPixels, int tolerance) {
        if (argbPixels.length == 0) {
            return 1.0;
        }
        double span = 255.0 * (1.0 - alpha);
        int bad = 0;
        for (int px : argbPixels) {
            for (int c = 0; c < 3; c++) {
                int v = (px >> (16 - 8 * c)) & 0xFF;
                if (v < premul[c] - tolerance || v > premul[c] + span + tolerance) {
                    bad++;
                    break;
                }
            }
        }
        return bad / (double) argbPixels.length;
    }

    /** Inverts the overlay in place: src = clamp(round((out - P_c) / (1 - A))). Alpha is kept. */
    public void invert(int[] argbRow) {
        double inv = 1.0 / (1.0 - alpha);
        for (int i = 0; i < argbRow.length; i++) {
            int px = argbRow[i];
            int out = px & 0xFF000000;
            for (int c = 0; c < 3; c++) {
                int shift = 16 - 8 * c;
                int v = (px >> shift) & 0xFF;
                long s = Math.round((v - premul[c]) * inv);
                if (s < 0) s = 0;
                if (s > 255) s = 255;
                out |= (int) s << shift;
            }
            argbRow[i] = out;
        }
    }
}
