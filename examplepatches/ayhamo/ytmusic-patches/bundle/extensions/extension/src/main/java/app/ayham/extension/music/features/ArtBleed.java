package app.ayham.extension.music.features;

/**
 * Metrolist's fullscreen artwork bleed (FullscreenArtworkBleed.kt), ported to plain int[] ARGB
 * pixels: the cover pinned to the top and zoomed so it fills 60% of the player's height (its sides
 * cropped), continuing below into a stretched, flipped copy of its bottom rows under a progressive
 * blur that pulls toward a dark muted tone of the cover. Pure functions; the caller makes the
 * bitmaps and draws them (PlayerScreen's background view, under YT's own art).
 *
 * <p>One difference: Metrolist fades its detail rows in over the art it draws itself. Here YT's art
 * is on top and fades out over the same rows (FullArt), so the rows below it are opaque.
 */
final class ArtBleed {
    // Blur radii in px at REFERENCE_WIDTH. Fine steps at the low end keep the first blurred rows from showing a band.
    static final float[] BLUR_RADII = {0f, 1f, 2f, 3.5f, 5.5f, 8f, 11f, 15f, 20f, 27f, 36f, 48f, 63f, 82f, 105f, 135f, 170f, 210f, 250f};
    static final float REFERENCE_WIDTH = 1080f;
    static final float BLUR_START = 0.70f, BLUR_END = 1.55f;
    /** A steep start keeps the first blurred rows indistinguishable from the sharp art. */
    static final float BLUR_CURVE = 1.8f;
    static final int BLUR_PASSES = 3;
    static final float TONE_START = 0.90f, TONE_SPAN = 0.95f, TONE_STRENGTH = 0.90f;
    static final float SHADOW_LOW = 0.10f, SHADOW_HIGH = 0.45f;
    /** Small blur radii need full resolution; below DETAIL_HEIGHT of the width the rest is a quarter-size render. */
    static final float DETAIL_HEIGHT = 0.40f;
    static final int SOFT_DIVISOR = 4;
    /** Blur strengths (px) from which a half or quarter size copy looks the same as a full size one. */
    static final float HALF_RES_SIGMA = 4f, QUARTER_RES_SIGMA = 8f;
    static final int GRAIN_TILE = 64, GRAIN_ALPHA = 3;
    /** Only the cover's bottom rows feed the area below it, so no large shape is reflected there. */
    static final float BLEED_SOURCE = 0.18f;
    static final int CROSSFADE_ROWS = 48;
    /** The cover reaches this share of the player's height, cropping its sides, within MAX_COVER_ZOOM. */
    static final float COVER_HEIGHT_FRACTION = 0.6f, MAX_COVER_ZOOM = 1.6f;

    private ArtBleed() {
    }

    /** The zoomed cover's width: its height (width x aspect) made 60% of the player's, 1 to 1.6 times the screen's width. */
    static int containerWidth(int viewportW, int viewportH, float aspect) {
        return Math.round(viewportW * coverZoom(viewportW, viewportH, aspect));
    }

    /** The cover's zoom: its height (width x aspect) made 60% of the player's, within 1 to MAX_COVER_ZOOM. */
    static float coverZoom(int viewportW, int viewportH, float aspect) {
        float coverHeight = viewportW * aspect;
        return Math.max(1f, Math.min(MAX_COVER_ZOOM, viewportH * COVER_HEIGHT_FRACTION / coverHeight));
    }

    /** Where the blur starts, on a multiple of SOFT_DIVISOR so the quarter-size part lines up. */
    static int detailTop(int width, int artHeight) {
        // wide video thumbnails can end before the usual blur start: overlap the fade with their bottom edge
        float start = Math.min(BLUR_START * width, Math.max(artHeight - CROSSFADE_ROWS, 0));
        return (int) (start / SOFT_DIVISOR) * SOFT_DIVISOR;
    }

    static int softTop(int width, int detailTop) {
        return detailTop + (int) Math.ceil(DETAIL_HEIGHT * width / SOFT_DIVISOR) * SOFT_DIVISOR;
    }

    /** The rendered bleed, rows from detailTop down; a coarse one has only the quarter-size preview. */
    static final class Bleed {
        int tone;
        int width, height, artHeight, detailTop, softTop;
        /** Quarter size, rows detailTop/4 .. height/4. */
        int[] preview;
        int previewW, previewH;
        /** Full size, rows detailTop .. softTop. */
        int[] detail;
        int detailH;
        /** Quarter size, rows softTop/4 .. height/4. */
        int[] soft;
        int softW, softH;
    }

    /**
     * A bleed from a quarter-size copy of the cover (small: ceil(width/4) x ceil(artHeight/4)),
     * ready within a few frames, so the cover's lower edge is never bare while the detailed one is made.
     */
    static Bleed coarse(int[] small, int width, int artHeight, int height) {
        Bleed b = new Bleed();
        b.width = width;
        b.height = height;
        b.artHeight = artHeight;
        b.detailTop = detailTop(width, artHeight);
        b.softTop = softTop(width, b.detailTop);
        int w = (width + SOFT_DIVISOR - 1) / SOFT_DIVISOR;
        int artRows = (artHeight + SOFT_DIVISOR - 1) / SOFT_DIVISOR;
        int h = (height + SOFT_DIVISOR - 1) / SOFT_DIVISOR;
        b.tone = bleedTone(small);
        if (height <= b.detailTop) return b;
        int[] canvas = bleedCanvas(small, w, artRows, h);
        int first = b.detailTop / SOFT_DIVISOR;
        b.preview = renderBleedRows(canvas, w, h, width / (float) SOFT_DIVISOR, first, h - 1, b.tone);
        b.previewW = w;
        b.previewH = h - first;
        return b;
    }

    /** The detailed bleed from the cover at its drawn size (art: width x artHeight). */
    static Bleed full(int[] art, int width, int artHeight, int height, Bleed coarse) {
        Bleed b = new Bleed();
        b.tone = coarse.tone;
        b.width = width;
        b.height = height;
        b.artHeight = artHeight;
        b.detailTop = detailTop(width, artHeight);
        b.softTop = softTop(width, b.detailTop);
        b.preview = coarse.preview;
        b.previewW = coarse.previewW;
        b.previewH = coarse.previewH;
        if (height <= b.detailTop) return b;
        int[] canvas = bleedCanvas(art, width, artHeight, height);
        int detailBottom = Math.min(b.softTop, height);
        b.detail = renderBleedRows(canvas, width, height, width, b.detailTop, detailBottom - 1, b.tone);
        b.detailH = detailBottom - b.detailTop;
        if (height <= b.softTop) return b;
        int softW = (width + SOFT_DIVISOR - 1) / SOFT_DIVISOR;
        int softH = (height + SOFT_DIVISOR - 1) / SOFT_DIVISOR;
        int[] softCanvas = downsampled(canvas, width, height, 0, height - 1, SOFT_DIVISOR);
        int first = b.softTop / SOFT_DIVISOR;
        b.soft = renderBleedRows(softCanvas, softW, softH, width / (float) SOFT_DIVISOR, first, softH - 1, b.tone);
        b.softW = softW;
        b.softH = softH - first;
        return b;
    }

    /** The grain tile: black or white at alpha 3, seeded so it never changes. */
    static int[] grain() {
        java.util.Random random = new java.util.Random(0);
        int[] px = new int[GRAIN_TILE * GRAIN_TILE];
        for (int i = 0; i < px.length; i++) px[i] = (GRAIN_ALPHA << 24) | (random.nextBoolean() ? 0xFFFFFF : 0);
        return px;
    }

    static float smootherstep(float x) {
        float t = Math.max(0f, Math.min(1f, x));
        return t * t * t * (t * (t * 6f - 15f) + 10f);
    }

    private static int luminance(int argb) {
        return 299 * ((argb >> 16) & 0xFF) + 587 * ((argb >> 8) & 0xFF) + 114 * (argb & 0xFF);
    }

    /** The cover's shadow colour, kept dark and muted so the bleed stays behind white controls on any cover. */
    static int bleedTone(int[] art) {
        Integer[] sorted = new Integer[art.length];
        for (int i = 0; i < art.length; i++) sorted[i] = art[i];
        java.util.Arrays.sort(sorted, (x, y) -> Integer.compare(luminance(x), luminance(y)));
        int from = (int) (art.length * SHADOW_LOW);
        int to = Math.max((int) (art.length * SHADOW_HIGH), from + 1);
        long red = 0, green = 0, blue = 0;
        for (int i = from; i < to; i++) {
            int p = sorted[i];
            red += (p >> 16) & 0xFF;
            green += (p >> 8) & 0xFF;
            blue += p & 0xFF;
        }
        float count = (to - from) * 255f;
        float r = red / count, g = green / count, b = blue / count;
        float high = Math.max(r, Math.max(g, b)), low = Math.min(r, Math.min(g, b));
        float delta = high - low;
        float lightness = (high + low) / 2f;
        float saturation = delta == 0f ? 0f : delta / (1f - Math.abs(2f * lightness - 1f));
        float hue;
        if (delta == 0f) hue = 0f;
        else if (high == r) hue = 60f * (((g - b) / delta + 6f) % 6f);
        else if (high == g) hue = 60f * ((b - r) / delta + 2f);
        else hue = 60f * ((r - g) / delta + 4f);
        return hsl(hue, Math.min(saturation, 0.5f), Math.max(0.07f, Math.min(0.30f, lightness * 1.15f)));
    }

    /** Compose's Color.hsl. */
    static int hsl(float hue, float saturation, float lightness) {
        float r = hslF(0, hue, saturation, lightness), g = hslF(8, hue, saturation, lightness), b = hslF(4, hue, saturation, lightness);
        return 0xFF000000 | (Math.round(r * 255) << 16) | (Math.round(g * 255) << 8) | Math.round(b * 255);
    }

    private static float hslF(int n, float h, float s, float l) {
        float k = (n + h / 30f) % 12f;
        float a = s * Math.min(l, 1f - l);
        return l - a * Math.max(-1f, Math.min(k - 3, Math.min(9 - k, 1f)));
    }

    /**
     * The cover followed by its bottom rows flipped and stretched down to height. The first row
     * below the cover is the cover's last row, so the seam is continuous, and the stretch turns
     * whatever is there into soft colour fields.
     */
    static int[] bleedCanvas(int[] art, int width, int artHeight, int height) {
        int[] canvas = new int[width * height];
        System.arraycopy(art, 0, canvas, 0, width * Math.min(artHeight, height));
        int stripRows = stripRows(artHeight);
        int below = height - artHeight;
        float[] weights = new float[4];
        for (int y = artHeight; y < height; y++) {
            // place in the flipped strip, 0 = the cover's last row; Catmull-Rom between the 4 nearest strip rows
            float at = (y - artHeight) * (stripRows - 1f) / below;
            int base = (int) at;
            float t = at - base;
            weights[0] = ((-0.5f * t + 1f) * t - 0.5f) * t;
            weights[1] = (1.5f * t - 2.5f) * t * t + 1f;
            weights[2] = ((-1.5f * t + 2f) * t + 0.5f) * t;
            weights[3] = (0.5f * t - 0.5f) * t * t;
            for (int x = 0; x < width; x++) {
                float red = 0, green = 0, blue = 0;
                for (int tap = 0; tap < 4; tap++) {
                    int row = artHeight - 1 - Math.max(0, Math.min(stripRows - 1, base - 1 + tap));
                    int p = art[row * width + x];
                    red += weights[tap] * ((p >> 16) & 0xFF);
                    green += weights[tap] * ((p >> 8) & 0xFF);
                    blue += weights[tap] * (p & 0xFF);
                }
                canvas[y * width + x] = 0xFF000000 | (clamp255(Math.round(red)) << 16) | (clamp255(Math.round(green)) << 8) | clamp255(Math.round(blue));
            }
        }
        return canvas;
    }

    private static int clamp255(int v) {
        return Math.max(0, Math.min(255, v));
    }

    /** Box-averages rows top..bottom by factor; the output grid is anchored at top. */
    static int[] downsampled(int[] src, int width, int height, int top, int bottom, int factor) {
        int outWidth = (width + factor - 1) / factor;
        int outHeight = (bottom - top + factor) / factor;
        int[] out = new int[outWidth * outHeight];
        for (int y = 0; y < outHeight; y++) {
            for (int x = 0; x < outWidth; x++) {
                int red = 0, green = 0, blue = 0, count = 0;
                int syEnd = Math.min(top + (y + 1) * factor, Math.min(bottom + 1, height));
                for (int sy = top + y * factor; sy < syEnd; sy++) {
                    int sxEnd = Math.min((x + 1) * factor, width);
                    for (int sx = x * factor; sx < sxEnd; sx++) {
                        int p = src[sy * width + sx];
                        red += (p >> 16) & 0xFF;
                        green += (p >> 8) & 0xFF;
                        blue += p & 0xFF;
                        count++;
                    }
                }
                out[y * outWidth + x] = 0xFF000000 | ((red / count) << 16) | ((green / count) << 8) | (blue / count);
            }
        }
        return out;
    }

    /** The cover's bottom rows that feed the area below it: BLEED_SOURCE of it, at least 2. */
    static int stripRows(int artHeight) {
        return Math.max(2, Math.min(artHeight, Math.round(artHeight * BLEED_SOURCE)));
    }

    /** {lower, upper}: the two pre-blurred levels of BLUR_RADII nearest [radius] (the first one at or above it, and the one before). */
    static int[] blurLevels(float radius) {
        int u = 0;
        while (BLUR_RADII[u] < radius) u++;
        return new int[]{Math.max(u - 1, 0), u};
    }

    /** The blur radius at a row, in container widths from the cover's top. */
    static float blurRadiusAt(float row) {
        if (row <= BLUR_START) return 0f;
        return BLUR_RADII[BLUR_RADII.length - 1] * (float) Math.pow(Math.min(1f, (row - BLUR_START) / (BLUR_END - BLUR_START)), BLUR_CURVE);
    }

    /**
     * Rows firstRow..lastRow of canvas: each row blended between the two pre-blurred levels nearest
     * its radius, then pulled toward tone. unit is how many canvas pixels one container width spans.
     */
    static int[] renderBleedRows(int[] canvas, int width, int height, float unit, int firstRow, int lastRow, int tone) {
        int rows = lastRow - firstRow + 1;
        float[] radii = new float[rows];
        int[] upper = new int[rows], lower = new int[rows];
        int maxLevel = 0;
        for (int r = 0; r < rows; r++) {
            radii[r] = blurRadiusAt((firstRow + r) / unit);
            int[] lu = blurLevels(radii[r]);
            lower[r] = lu[0];
            upper[r] = lu[1];
            maxLevel = Math.max(maxLevel, lu[1]);
        }
        // a level only feeds the rows between its neighbours: blur just those rows
        int[] usedFirst = new int[maxLevel + 1], usedLast = new int[maxLevel + 1];
        java.util.Arrays.fill(usedFirst, Integer.MAX_VALUE);
        java.util.Arrays.fill(usedLast, -1);
        for (int r = 0; r < rows; r++) {
            for (int level : new int[]{lower[r], upper[r]}) {
                usedFirst[level] = Math.min(usedFirst[level], firstRow + r);
                usedLast[level] = Math.max(usedLast[level], firstRow + r);
            }
        }
        int[][] levels = new int[maxLevel + 1][];
        for (int level = 0; level <= maxLevel; level++) {
            int top = usedFirst[level];
            if (usedLast[level] < 0) levels[level] = new int[0];
            else if (level == 0) levels[level] = java.util.Arrays.copyOfRange(canvas, top * width, (usedLast[level] + 1) * width);
            else levels[level] = blurredRows(canvas, width, height, top, usedLast[level], BLUR_RADII[level] * unit / REFERENCE_WIDTH / 2f);
        }
        int toneRed = (tone >> 16) & 0xFF, toneGreen = (tone >> 8) & 0xFF, toneBlue = tone & 0xFF;
        int[] out = new int[rows * width];
        for (int r = 0; r < rows; r++) {
            int low = lower[r], high = upper[r];
            float mix = high == low ? 0f : (radii[r] - BLUR_RADII[low]) / (BLUR_RADII[high] - BLUR_RADII[low]);
            int[] lowerLevel = levels[low], upperLevel = levels[high];
            int lowerStart = (firstRow + r - usedFirst[low]) * width;
            int upperStart = (firstRow + r - usedFirst[high]) * width;
            float toneMix = TONE_STRENGTH * smootherstep(((firstRow + r) / unit - TONE_START) / TONE_SPAN);
            for (int x = 0; x < width; x++) {
                int a = lowerLevel[lowerStart + x], b = upperLevel[upperStart + x];
                out[r * width + x] = 0xFF000000
                        | (towards(blend(a >> 16, b >> 16, mix), toneRed, toneMix) << 16)
                        | (towards(blend(a >> 8, b >> 8, mix), toneGreen, toneMix) << 8)
                        | towards(blend(a, b, mix), toneBlue, toneMix);
            }
        }
        return out;
    }

    private static float blend(int from, int to, float amount) {
        return (from & 0xFF) + ((to & 0xFF) - (from & 0xFF)) * amount;
    }

    private static int towards(float value, int target, float amount) {
        return clamp255(Math.round(value + (target - value) * amount));
    }

    /**
     * Blurs only the rows asked for, plus the margin the blur reaches into. A strong blur runs on a
     * reduced copy and is scaled back up: nothing fine is left to lose, and it is far cheaper.
     */
    static int[] blurredRows(int[] canvas, int width, int height, int firstRow, int lastRow, float sigma) {
        int factor = sigma >= QUARTER_RES_SIGMA ? 4 : sigma >= HALF_RES_SIGMA ? 2 : 1;
        // half-width of each box pass whose combined variance over BLUR_PASSES is sigma squared
        float scaled = sigma / factor;
        float half = ((float) Math.sqrt(1f + 4f * scaled * scaled) - 1f) / 2f;
        int margin = ((int) Math.ceil(BLUR_PASSES * half) + 1) * factor;
        int sliceTop = Math.max(firstRow - margin, 0) / factor * factor;
        int sliceBottom = Math.min(lastRow + margin, height - 1);
        int sliceWidth = (width + factor - 1) / factor;
        int sliceHeight = (sliceBottom - sliceTop + factor) / factor;
        int[] slice = downsampled(canvas, width, height, sliceTop, sliceBottom, factor);
        for (int i = 0; i < BLUR_PASSES; i++) {
            int[] horizontal = new int[slice.length];
            blurPass(slice, horizontal, sliceHeight, sliceWidth, 1, sliceWidth, half);
            int[] vertical = new int[slice.length];
            blurPass(horizontal, vertical, sliceWidth, sliceHeight, sliceWidth, 1, half);
            slice = vertical;
        }
        return upsampledRows(slice, sliceWidth, sliceHeight, width, firstRow - sliceTop, lastRow - sliceTop, factor);
    }

    /** A whole image blurred (3 box passes for a gaussian of sigma px), same size. */
    static int[] blurred(int[] px, int width, int height, float sigma) {
        float half = ((float) Math.sqrt(1f + 4f * sigma * sigma) - 1f) / 2f;
        int[] img = px;
        for (int i = 0; i < BLUR_PASSES; i++) {
            int[] horizontal = new int[img.length];
            blurPass(img, horizontal, height, width, 1, width, half);
            int[] vertical = new int[img.length];
            blurPass(horizontal, vertical, width, height, width, 1, half);
            img = vertical;
        }
        return img;
    }

    /** Bilinear: rows first..last of the full-size image small was reduced from by factor. */
    private static int[] upsampledRows(int[] small, int smallWidth, int smallHeight, int width, int first, int last, int factor) {
        int[] left = new int[width], right = new int[width];
        float[] rightWeight = new float[width];
        for (int x = 0; x < width; x++) {
            float at = Math.max(0f, Math.min(smallWidth - 1f, (x + 0.5f) / factor - 0.5f));
            left[x] = (int) at;
            right[x] = Math.min(left[x] + 1, smallWidth - 1);
            rightWeight[x] = at - left[x];
        }
        int[] out = new int[(last - first + 1) * width];
        for (int row = first; row <= last; row++) {
            float at = Math.max(0f, Math.min(smallHeight - 1f, (row + 0.5f) / factor - 0.5f));
            int top = (int) at * smallWidth;
            int bottom = Math.min((int) at + 1, smallHeight - 1) * smallWidth;
            float bottomWeight = at - (int) at;
            for (int x = 0; x < width; x++) {
                int a = small[top + left[x]], b = small[top + right[x]], c = small[bottom + left[x]], d = small[bottom + right[x]];
                float wx = rightWeight[x];
                out[(row - first) * width + x] = 0xFF000000
                        | (bilinear(a >> 16, b >> 16, c >> 16, d >> 16, wx, bottomWeight) << 16)
                        | (bilinear(a >> 8, b >> 8, c >> 8, d >> 8, wx, bottomWeight) << 8)
                        | bilinear(a, b, c, d, wx, bottomWeight);
            }
        }
        return out;
    }

    private static int bilinear(int a, int b, int c, int d, float x, float y) {
        float top = blend(a, b, x), bottom = blend(c, d, x);
        return clamp255(Math.round(top + (bottom - top) * y));
    }

    /**
     * Running-sum box blur along one axis with clamped edges; the fractional part of half weights
     * the two outer samples, so the strength changes continuously.
     */
    private static void blurPass(int[] src, int[] dst, int lines, int length, int stride, int lineStride, float half) {
        int whole = (int) half;
        float edge = half - whole;
        float norm = 1f / (2 * whole + 1 + 2f * edge);
        for (int line = 0; line < lines; line++) {
            int start = line * lineStride;
            int red = 0, green = 0, blue = 0;
            for (int i = -whole; i <= whole; i++) {
                int p = src[start + Math.max(0, Math.min(length - 1, i)) * stride];
                red += (p >> 16) & 0xFF;
                green += (p >> 8) & 0xFF;
                blue += p & 0xFF;
            }
            for (int i = 0; i < length; i++) {
                int before = src[start + Math.max(i - whole - 1, 0) * stride];
                int after = src[start + Math.min(i + whole + 1, length - 1) * stride];
                int r = Math.round((red + edge * (((before >> 16) & 0xFF) + ((after >> 16) & 0xFF))) * norm);
                int g = Math.round((green + edge * (((before >> 8) & 0xFF) + ((after >> 8) & 0xFF))) * norm);
                int b = Math.round((blue + edge * ((before & 0xFF) + (after & 0xFF))) * norm);
                dst[start + i * stride] = 0xFF000000 | (clamp255(r) << 16) | (clamp255(g) << 8) | clamp255(b);
                int leaving = src[start + Math.max(i - whole, 0) * stride];
                red += ((after >> 16) & 0xFF) - ((leaving >> 16) & 0xFF);
                green += ((after >> 8) & 0xFF) - ((leaving >> 8) & 0xFF);
                blue += (after & 0xFF) - (leaving & 0xFF);
            }
        }
    }

    /**
     * The animated cover's backdrop (Metrolist's mirrored blur canvas): the frame centre-cropped into
     * the zone above the seam, flipped below it, blurred. frame: fw x fh; out: w x h, seamRow in it.
     */
    static int[] mirroredBackdrop(int[] frame, int fw, int fh, int w, int h, int seamRow, float sigma) {
        int zone = Math.max(1, Math.min(h, seamRow));
        float scale = Math.max(w / (float) fw, zone / (float) fh);
        float offX = (w - fw * scale) / 2f, offY = (zone - fh * scale) / 2f;
        int[] out = new int[w * h];
        for (int y = 0; y < h; y++) {
            // below the seam: the zone mirrored (and mirrored back, should it run out)
            int zy = y;
            if (zy >= zone) {
                int k = (zy - zone) % (2 * zone);
                zy = k < zone ? zone - 1 - k : k - zone;
            }
            int sy = Math.max(0, Math.min(fh - 1, (int) ((zy + 0.5f - offY) / scale)));
            for (int x = 0; x < w; x++) {
                int sx = Math.max(0, Math.min(fw - 1, (int) ((x + 0.5f - offX) / scale)));
                out[y * w + x] = frame[sy * fw + sx] | 0xFF000000;
            }
        }
        return blurred(out, w, h, sigma);
    }
}
