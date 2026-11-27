package app.ayham.extension.music.features;

/**
 * BitChord's player backdrop (ArtworkMeshBackdrop.kt): no blur of the art and no reflection, a
 * tiny colour map of the cover drawn stretched over the whole screen. The cover is averaged into a
 * 6 x 6 grid; the grid row at the seam (the banner's bottom) stays, every row below it is the
 * cover flipped and turned sideways (its colours without reading as a mirror). Resampled to 32 px
 * on a smooth curve, box blurred (radius 1, 3 passes), 1.12 vibrance, lightness at least 0.045.
 * Pure functions on ARGB pixels.
 */
final class ArtMesh {
    static final int GRID = 6, TEX = 32, BLUR_RADIUS = 1, BLUR_PASSES = 3;
    static final float VIBRANCE = 1.12f, FLOOR = 0.045f;

    /** The brightest a backdrop may stay under white text (luma 0..255, the 90th percentile). */
    static final int GLARE_CAP = 128;

    private ArtMesh() {
    }

    /**
     * Extra black (alpha 0..255) over a backdrop made from these pixels: none while the cover's
     * bright tenth stays at or under GLARE_CAP, else enough to bring it there. BitChord's 6% to 30%
     * scrim left a near-white cover (Fortnight) light grey under the white title and controls.
     */
    static int glare(int[] px) {
        if (px == null || px.length == 0) return 0;
        int[] hist = new int[256];
        for (int p : px) hist[(299 * ((p >> 16) & 0xFF) + 587 * ((p >> 8) & 0xFF) + 114 * (p & 0xFF)) / 1000]++;
        int left = px.length / 10, l = 255;
        for (; l > 0; l--) if ((left -= hist[l]) < 0) break;
        return l <= GLARE_CAP ? 0 : Math.round(255 * (1 - GLARE_CAP / (float) l));
    }

    /** The cover's GRID x GRID cell means, as {r, g, b} 0..1. */
    static float[][][] cells(int[] px, int w, int h) {
        float[][][] g = new float[GRID][GRID][3];
        int[][] n = new int[GRID][GRID];
        int step = Math.max(1, Math.min(w, h) / 96);
        for (int y = 0; y < h; y += step) {
            int r = Math.min(GRID - 1, y * GRID / h);
            for (int x = 0; x < w; x += step) {
                int c = Math.min(GRID - 1, x * GRID / w);
                int p = px[y * w + x];
                g[r][c][0] += ((p >> 16) & 0xFF) / 255f;
                g[r][c][1] += ((p >> 8) & 0xFF) / 255f;
                g[r][c][2] += (p & 0xFF) / 255f;
                n[r][c]++;
            }
        }
        for (int r = 0; r < GRID; r++)
            for (int c = 0; c < GRID; c++)
                for (int k = 0; k < 3; k++) g[r][c][k] /= Math.max(1, n[r][c]);
        return g;
    }

    /**
     * The screen's grid: above the seam the cover as it is (hidden under the banner), the seam row
     * the cover's bottom row, each row below the cover flipped (bottom up) and turned a column sideways.
     */
    static float[][][] arrange(float[][][] cover, float seamFrac) {
        int seam = Math.max(1, Math.min(GRID - 1, Math.round(seamFrac * GRID) - 1));
        float[][][] g = new float[GRID][GRID][];
        for (int r = 0; r < GRID; r++) {
            for (int c = 0; c < GRID; c++) {
                if (r < seam) {
                    g[r][c] = cover[Math.min(GRID - 1, r * GRID / seam)][c];
                } else if (r == seam) {
                    g[r][c] = cover[GRID - 1][c];
                } else {
                    int k = r - seam; // 1.. below the seam
                    int src = GRID - 1 - k;
                    g[r][c] = cover[Math.max(0, src)][(c + k) % GRID];
                }
            }
        }
        return g;
    }

    private static float smooth(float t) {
        return t * t * (3 - 2 * t);
    }

    /** The mesh as a TEX x TEX ARGB bitmap's pixels. */
    static int[] texture(float[][][] g) {
        float[][] r = new float[3][TEX * TEX];
        for (int y = 0; y < TEX; y++) {
            float fy = (y + 0.5f) * GRID / TEX - 0.5f;
            int y0 = (int) Math.floor(fy);
            float ty = smooth(Math.max(0f, Math.min(1f, fy - y0)));
            int ya = clamp(y0), yb = clamp(y0 + 1);
            for (int x = 0; x < TEX; x++) {
                float fx = (x + 0.5f) * GRID / TEX - 0.5f;
                int x0 = (int) Math.floor(fx);
                float tx = smooth(Math.max(0f, Math.min(1f, fx - x0)));
                int xa = clamp(x0), xb = clamp(x0 + 1);
                for (int k = 0; k < 3; k++) {
                    float top = g[ya][xa][k] * (1 - tx) + g[ya][xb][k] * tx;
                    float bot = g[yb][xa][k] * (1 - tx) + g[yb][xb][k] * tx;
                    r[k][y * TEX + x] = top * (1 - ty) + bot * ty;
                }
            }
        }
        for (int k = 0; k < 3; k++) for (int p = 0; p < BLUR_PASSES; p++) r[k] = box(r[k]);
        int[] out = new int[TEX * TEX];
        float[] hsl = new float[3];
        for (int i = 0; i < out.length; i++) out[i] = lift(r[0][i], r[1][i], r[2][i], hsl);
        return out;
    }

    /** BitChord's lift of a colour (0..1 each): saturation x VIBRANCE (at most 1), lightness at least FLOOR. */
    static int lift(float red, float green, float blue, float[] hsl) {
        toHsl(red, green, blue, hsl);
        hsl[1] = Math.min(1f, hsl[1] * VIBRANCE);
        hsl[2] = Math.max(FLOOR, hsl[2]);
        return fromHsl(hsl);
    }

    /** All of it: a cover's pixels to the mesh for a seam at seamFrac of the screen's height. */
    static int[] mesh(int[] px, int w, int h, float seamFrac) {
        return texture(arrange(cells(px, w, h), seamFrac));
    }

    private static int clamp(int i) {
        return Math.max(0, Math.min(GRID - 1, i));
    }

    private static float[] box(float[] a) {
        float[] tmp = new float[a.length], out = new float[a.length];
        int R = BLUR_RADIUS;
        for (int y = 0; y < TEX; y++)
            for (int x = 0; x < TEX; x++) {
                float s = 0;
                for (int d = -R; d <= R; d++) s += a[y * TEX + Math.max(0, Math.min(TEX - 1, x + d))];
                tmp[y * TEX + x] = s / (2 * R + 1);
            }
        for (int y = 0; y < TEX; y++)
            for (int x = 0; x < TEX; x++) {
                float s = 0;
                for (int d = -R; d <= R; d++) s += tmp[Math.max(0, Math.min(TEX - 1, y + d)) * TEX + x];
                out[y * TEX + x] = s / (2 * R + 1);
            }
        return out;
    }

    static void toHsl(float r, float g, float b, float[] o) {
        float max = Math.max(r, Math.max(g, b)), min = Math.min(r, Math.min(g, b));
        float l = (max + min) / 2, h = 0, s = 0, d = max - min;
        if (d > 1e-6f) {
            s = l > 0.5f ? d / (2 - max - min) : d / (max + min);
            if (max == r) h = ((g - b) / d + (g < b ? 6 : 0));
            else if (max == g) h = (b - r) / d + 2;
            else h = (r - g) / d + 4;
            h /= 6;
        }
        o[0] = h;
        o[1] = s;
        o[2] = l;
    }

    static int fromHsl(float[] hsl) {
        float h = hsl[0], s = hsl[1], l = hsl[2];
        float r, g, b;
        if (s <= 0) {
            r = g = b = l;
        } else {
            float q = l < 0.5f ? l * (1 + s) : l + s - l * s, p = 2 * l - q;
            r = hue(p, q, h + 1f / 3);
            g = hue(p, q, h);
            b = hue(p, q, h - 1f / 3);
        }
        return 0xFF000000 | (to8(r) << 16) | (to8(g) << 8) | to8(b);
    }

    private static float hue(float p, float q, float t) {
        if (t < 0) t += 1;
        if (t > 1) t -= 1;
        if (t < 1f / 6) return p + (q - p) * 6 * t;
        if (t < 0.5f) return q;
        if (t < 2f / 3) return p + (q - p) * (2f / 3 - t) * 6;
        return p;
    }

    private static int to8(float v) {
        return Math.max(0, Math.min(255, Math.round(v * 255)));
    }
}
