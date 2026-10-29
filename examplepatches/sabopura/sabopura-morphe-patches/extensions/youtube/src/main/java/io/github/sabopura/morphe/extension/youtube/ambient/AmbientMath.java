package io.github.sabopura.morphe.extension.youtube.ambient;

/**
 * Pure-Java image operations for the ambient light, working on small ARGB int buffers
 * (typically 64x36). Kept free of Android types so they can be unit tested on the JVM.
 */
final class AmbientMath {
    /** Rows/columns darker than this (0-255 luma) count as letterbox bars. */
    static final int BAR_LUMA_THRESHOLD = 18;
    /** Fraction of a row/column's pixels that may exceed the threshold (noise, logos). */
    static final float BAR_NOISE_FRACTION = 0.04f;

    private AmbientMath() {
    }

    static int luma(int argb) {
        int r = (argb >> 16) & 0xFF;
        int g = (argb >> 8) & 0xFF;
        int b = argb & 0xFF;
        return (r * 77 + g * 150 + b * 29) >> 8;
    }

    /**
     * Detects burned-in black bars and returns the content bounds as
     * {left, top, right, bottom} (right/bottom exclusive), or null for an all-dark frame
     * where no reliable decision is possible.
     */
    static int[] detectContentBounds(int[] pixels, int width, int height) {
        int top = 0;
        while (top < height && isDarkRow(pixels, width, top)) top++;
        if (top >= height) return null;
        int bottom = height;
        while (bottom > top + 1 && isDarkRow(pixels, width, bottom - 1)) bottom--;
        int left = 0;
        while (left < width && isDarkColumn(pixels, width, left, top, bottom)) left++;
        if (left >= width) return null;
        int right = width;
        while (right > left + 1 && isDarkColumn(pixels, width, right - 1, top, bottom)) right--;
        return new int[]{left, top, right, bottom};
    }

    /**
     * Content bounds found on a {@code scale}-times smaller sample, moved to the exact edge on
     * the full picture: each edge that has a bar is searched within one sample of where it
     * was found. Edges without a bar stay at the picture's border.
     */
    static int[] refineBounds(int[] picture, int width, int height, int[] coarse, int scale) {
        int left = Math.min(width, coarse[0] * scale);
        int top = Math.min(height, coarse[1] * scale);
        int right = Math.min(width, coarse[2] * scale);
        int bottom = Math.min(height, coarse[3] * scale);
        if (top > 0) {
            int y = Math.max(0, top - scale);
            while (y < Math.min(bottom - 1, top + scale) && isDarkRow(picture, width, y)) y++;
            top = y;
        }
        if (bottom < height) {
            int y = Math.min(height - 1, bottom - 1 + scale);
            while (y > Math.max(top, bottom - 1 - scale) && isDarkRow(picture, width, y)) y--;
            bottom = y + 1;
        }
        if (left > 0) {
            int x = Math.max(0, left - scale);
            while (x < Math.min(right - 1, left + scale)
                    && isDarkColumn(picture, width, x, top, bottom)) x++;
            left = x;
        }
        if (right < width) {
            int x = Math.min(width - 1, right - 1 + scale);
            while (x > Math.max(left, right - 1 - scale)
                    && isDarkColumn(picture, width, x, top, bottom)) x--;
            right = x + 1;
        }
        return new int[]{left, top, right, bottom};
    }

    private static boolean isDarkRow(int[] pixels, int width, int row) {
        int allowed = Math.max(0, (int) (width * BAR_NOISE_FRACTION));
        int bright = 0;
        int offset = row * width;
        for (int x = 0; x < width; x++) {
            if (luma(pixels[offset + x]) > BAR_LUMA_THRESHOLD && ++bright > allowed) return false;
        }
        return true;
    }

    private static boolean isDarkColumn(int[] pixels, int width, int column, int top, int bottom) {
        int allowed = Math.max(0, (int) ((bottom - top) * BAR_NOISE_FRACTION));
        int bright = 0;
        for (int y = top; y < bottom; y++) {
            if (luma(pixels[y * width + column]) > BAR_LUMA_THRESHOLD
                    && ++bright > allowed) return false;
        }
        return true;
    }

    /**
     * Paints the glow canvas. The source region is magnified around the video rectangle by
     * {@code spread} and clamped at its edges, so every pixel outside the video receives the
     * colour of the nearest (or, with spread, a slightly deeper) part of the picture.
     *
     * @param src       source pixels
     * @param srcBounds {left, top, right, bottom} region of the source to use
     * @param out       destination glow buffer (outWidth x outHeight) representing the player
     * @param video     {left, top, right, bottom} of the video in destination coordinates
     * @param spread    0 = pure edge extension, 1 = picture magnified to twice its size
     */
    static void composeGlow(int[] src, int srcWidth, int[] srcBounds,
                            int[] out, int outWidth, int outHeight,
                            float[] video, float spread) {
        float sLeft = srcBounds[0];
        float sTop = srcBounds[1];
        float sWidth = Math.max(1, srcBounds[2] - srcBounds[0]);
        float sHeight = Math.max(1, srcBounds[3] - srcBounds[1]);
        float centerX = (video[0] + video[2]) / 2f;
        float centerY = (video[1] + video[3]) / 2f;
        float halfWidth = Math.max(0.5f, (video[2] - video[0]) / 2f) * (1f + spread);
        float halfHeight = Math.max(0.5f, (video[3] - video[1]) / 2f) * (1f + spread);
        for (int y = 0; y < outHeight; y++) {
            float v = clamp((y + 0.5f - centerY) / halfHeight, -1f, 1f);
            float sy = sTop + (v + 1f) * 0.5f * (sHeight - 1);
            int rowOffset = y * outWidth;
            for (int x = 0; x < outWidth; x++) {
                float u = clamp((x + 0.5f - centerX) / halfWidth, -1f, 1f);
                float sx = sLeft + (u + 1f) * 0.5f * (sWidth - 1);
                out[rowOffset + x] = sampleBilinear(src, srcWidth, srcBounds, sx, sy);
            }
        }
    }

    /** Scratch length {@link #composeStraight} needs for a source region of this size. */
    static int straightScratchLength(int[] bounds) {
        int w = Math.max(1, bounds[2] - bounds[0]);
        int h = Math.max(1, bounds[3] - bounds[1]);
        return 3 * (w * (h + 1) + (w + 1) * h);
    }

    /**
     * Theater light: runs straight out of the picture, coloured from the whole picture. A point
     * below the video takes the average of the same picture column over a band that grows
     * from the lower {@code nearBand} of the picture right under it to the whole height at
     * {@code length} away, so a thin border or bar at the very edge cannot decide the colour.
     * Above, left and right of the video work the same way from their side.
     *
     * @param scratch at least {@link #straightScratchLength} ints
     */
    static void composeStraight(int[] src, int srcWidth, int[] fullBounds, int[] out,
                                int outWidth, int outHeight, float[] video, float nearBand,
                                float length, int[] scratch) {
        int[] bounds = trimUniformEdges(src, srcWidth, fullBounds);
        int w = Math.max(1, bounds[2] - bounds[0]);
        int h = Math.max(1, bounds[3] - bounds[1]);
        int columns = w * (h + 1); // per column: running sums down the rows
        int rows = (w + 1) * h;    // per row: running sums across the columns
        int channel = columns + rows;
        for (int x = 0; x < w; x++) {
            int base = x * (h + 1);
            scratch[base] = scratch[channel + base] = scratch[2 * channel + base] = 0;
            for (int y = 0; y < h; y++) {
                int c = src[(bounds[1] + y) * srcWidth + bounds[0] + x];
                scratch[base + y + 1] = scratch[base + y] + ((c >> 16) & 0xFF);
                scratch[channel + base + y + 1] = scratch[channel + base + y] + ((c >> 8) & 0xFF);
                scratch[2 * channel + base + y + 1] = scratch[2 * channel + base + y] + (c & 0xFF);
            }
        }
        for (int y = 0; y < h; y++) {
            int base = columns + y * (w + 1);
            scratch[base] = scratch[channel + base] = scratch[2 * channel + base] = 0;
            for (int x = 0; x < w; x++) {
                int c = src[(bounds[1] + y) * srcWidth + bounds[0] + x];
                scratch[base + x + 1] = scratch[base + x] + ((c >> 16) & 0xFF);
                scratch[channel + base + x + 1] = scratch[channel + base + x] + ((c >> 8) & 0xFF);
                scratch[2 * channel + base + x + 1] = scratch[2 * channel + base + x] + (c & 0xFF);
            }
        }
        float videoWidth = Math.max(1f, video[2] - video[0]);
        float videoHeight = Math.max(1f, video[3] - video[1]);
        float safeLength = Math.max(1f, length);
        float band = clamp(nearBand, 0.05f, 1f);
        for (int y = 0; y < outHeight; y++) {
            float cy = y + 0.5f;
            float above = video[1] - cy;
            float below = cy - video[3];
            float vertical = Math.max(0f, Math.max(above, below));
            // Inside the video (hidden by the player) take the nearer edge's colours, so the
            // light blends into the picture without a seam when it is enlarged.
            boolean lowerHalf = cy > (video[1] + video[3]) / 2f;
            int row = clamp((int) ((cy - video[1]) / videoHeight * h), 0, h - 1);
            for (int x = 0; x < outWidth; x++) {
                float cx = x + 0.5f;
                float left = video[0] - cx;
                float right = cx - video[2];
                float horizontal = Math.max(0f, Math.max(left, right));
                boolean rightHalf = cx > (video[0] + video[2]) / 2f;
                int column = clamp((int) ((cx - video[0]) / videoWidth * w), 0, w - 1);
                int base;
                int from;
                int to;
                if (vertical >= horizontal) {
                    float t = Math.min(1f, vertical / safeLength);
                    int size = clamp(Math.round(h * (band + (1f - band) * t)), 1, h);
                    base = column * (h + 1);
                    from = below > 0f || (vertical == 0f && lowerHalf) ? h - size : 0;
                    to = from + size;
                } else {
                    float t = Math.min(1f, horizontal / safeLength);
                    int size = clamp(Math.round(w * (band + (1f - band) * t)), 1, w);
                    base = columns + row * (w + 1);
                    from = right > 0f || (horizontal == 0f && rightHalf) ? w - size : 0;
                    to = from + size;
                }
                int count = to - from;
                int r = (scratch[base + to] - scratch[base + from]) / count;
                int g = (scratch[channel + base + to] - scratch[channel + base + from]) / count;
                int b = (scratch[2 * channel + base + to] - scratch[2 * channel + base + from])
                        / count;
                out[y * outWidth + x] = 0xFF000000 | (r << 16) | (g << 8) | b;
            }
        }
    }

    /** Largest share of the picture an edge trim may remove on each side. */
    private static final float MAX_TRIM = 0.12f;

    /**
     * Drops rows and columns at the picture's edges that are one flat colour (frame lines,
     * burned-in bars, a coloured border), so the light continues the picture itself.
     */
    static int[] trimUniformEdges(int[] src, int srcWidth, int[] bounds) {
        int left = bounds[0];
        int top = bounds[1];
        int right = bounds[2];
        int bottom = bounds[3];
        int maxRows = Math.round((bottom - top) * MAX_TRIM);
        int maxColumns = Math.round((right - left) * MAX_TRIM);
        for (int i = 0; i < maxRows
                && isUniform(src, srcWidth, left, bottom - 1, right - left, 1); i++) {
            bottom--;
        }
        for (int i = 0; i < maxRows && isUniform(src, srcWidth, left, top, right - left, 1); i++) {
            top++;
        }
        for (int i = 0; i < maxColumns
                && isUniform(src, srcWidth, right - 1, top, bottom - top, srcWidth); i++) {
            right--;
        }
        for (int i = 0; i < maxColumns
                && isUniform(src, srcWidth, left, top, bottom - top, srcWidth); i++) {
            left++;
        }
        return new int[]{left, top, right, bottom};
    }

    /** True when a line of pixels (start, count, step) stays within a narrow colour range. */
    private static boolean isUniform(int[] src, int srcWidth, int x, int y, int count, int step) {
        if (count <= 1) return false;
        int start = y * srcWidth + x;
        int minR = 255;
        int minG = 255;
        int minB = 255;
        int maxR = 0;
        int maxG = 0;
        int maxB = 0;
        for (int i = 0; i < count; i++) {
            int c = src[start + i * step];
            int r = (c >> 16) & 0xFF;
            int g = (c >> 8) & 0xFF;
            int b = c & 0xFF;
            minR = Math.min(minR, r);
            maxR = Math.max(maxR, r);
            minG = Math.min(minG, g);
            maxG = Math.max(maxG, g);
            minB = Math.min(minB, b);
            maxB = Math.max(maxB, b);
        }
        return maxR - minR <= 24 && maxG - minG <= 24 && maxB - minB <= 24;
    }

    /**
     * Blends a sharp and a soft copy of the light by the distance from the video: shapes stay
     * crisp right next to the picture and melt into soft light farther away.
     *
     * @param length distance (buffer pixels) at which only the soft copy is left
     */
    static void blendByDistance(int[] sharp, int[] soft, int width, int height, float[] video,
                                float length) {
        float safeLength = Math.max(1f, length);
        for (int y = 0; y < height; y++) {
            float cy = y + 0.5f;
            float dy = cy < video[1] ? video[1] - cy : cy > video[3] ? cy - video[3] : 0f;
            for (int x = 0; x < width; x++) {
                float cx = x + 0.5f;
                float dx = cx < video[0] ? video[0] - cx : cx > video[2] ? cx - video[2] : 0f;
                float t = Math.min(1f, (float) Math.sqrt(dx * dx + dy * dy) / safeLength);
                int weight = Math.round(t * t * (3f - 2f * t) * 256);
                if (weight == 0) continue;
                int index = y * width + x;
                int a = sharp[index];
                int b = soft[index];
                int keep = 256 - weight;
                int r = (((a >> 16) & 0xFF) * keep + ((b >> 16) & 0xFF) * weight) >> 8;
                int g = (((a >> 8) & 0xFF) * keep + ((b >> 8) & 0xFF) * weight) >> 8;
                int bl = ((a & 0xFF) * keep + (b & 0xFF) * weight) >> 8;
                sharp[index] = 0xFF000000 | (r << 16) | (g << 8) | bl;
            }
        }
    }

    private static int sampleBilinear(int[] src, int srcWidth, int[] bounds, float x, float y) {
        int x0 = clamp((int) Math.floor(x), bounds[0], bounds[2] - 1);
        int y0 = clamp((int) Math.floor(y), bounds[1], bounds[3] - 1);
        int x1 = Math.min(x0 + 1, bounds[2] - 1);
        int y1 = Math.min(y0 + 1, bounds[3] - 1);
        float fx = clamp(x - x0, 0f, 1f);
        float fy = clamp(y - y0, 0f, 1f);
        int c00 = src[y0 * srcWidth + x0];
        int c10 = src[y0 * srcWidth + x1];
        int c01 = src[y1 * srcWidth + x0];
        int c11 = src[y1 * srcWidth + x1];
        int r = mix(mix((c00 >> 16) & 0xFF, (c10 >> 16) & 0xFF, fx),
                mix((c01 >> 16) & 0xFF, (c11 >> 16) & 0xFF, fx), fy);
        int g = mix(mix((c00 >> 8) & 0xFF, (c10 >> 8) & 0xFF, fx),
                mix((c01 >> 8) & 0xFF, (c11 >> 8) & 0xFF, fx), fy);
        int b = mix(mix(c00 & 0xFF, c10 & 0xFF, fx), mix(c01 & 0xFF, c11 & 0xFF, fx), fy);
        return 0xFF000000 | (r << 16) | (g << 8) | b;
    }

    private static int mix(int a, int b, float t) {
        return Math.round(a + (b - a) * t);
    }

    /**
     * Area-average downscale. GPU readbacks scale with few taps, which makes small samples
     * sparkle between frames; averaging a larger copy gives stable, accurate colours.
     */
    static void downsample(int[] src, int srcWidth, int srcHeight,
                           int[] dst, int dstWidth, int dstHeight) {
        for (int y = 0; y < dstHeight; y++) {
            int y0 = y * srcHeight / dstHeight;
            int y1 = Math.max(y0 + 1, (y + 1) * srcHeight / dstHeight);
            for (int x = 0; x < dstWidth; x++) {
                int x0 = x * srcWidth / dstWidth;
                int x1 = Math.max(x0 + 1, (x + 1) * srcWidth / dstWidth);
                long r = 0;
                long g = 0;
                long b = 0;
                int count = 0;
                for (int sy = y0; sy < y1 && sy < srcHeight; sy++) {
                    int offset = sy * srcWidth;
                    for (int sx = x0; sx < x1 && sx < srcWidth; sx++) {
                        int c = src[offset + sx];
                        r += (c >> 16) & 0xFF;
                        g += (c >> 8) & 0xFF;
                        b += c & 0xFF;
                        count++;
                    }
                }
                if (count == 0) count = 1;
                dst[y * dstWidth + x] = 0xFF000000 | ((int) (r / count) << 16)
                        | ((int) (g / count) << 8) | (int) (b / count);
            }
        }
    }

    /** Three passes of a separable box blur approximate a Gaussian blur. */
    static void blur(int[] pixels, int width, int height, int radius, int[] scratch) {
        if (radius <= 0) return;
        for (int pass = 0; pass < 3; pass++) {
            boxBlurHorizontal(pixels, scratch, width, height, radius);
            boxBlurVertical(scratch, pixels, width, height, radius);
        }
    }

    private static void boxBlurHorizontal(int[] in, int[] out, int width, int height, int radius) {
        int window = radius * 2 + 1;
        for (int y = 0; y < height; y++) {
            int offset = y * width;
            int sumR = 0;
            int sumG = 0;
            int sumB = 0;
            for (int i = -radius; i <= radius; i++) {
                int c = in[offset + clamp(i, 0, width - 1)];
                sumR += (c >> 16) & 0xFF;
                sumG += (c >> 8) & 0xFF;
                sumB += c & 0xFF;
            }
            for (int x = 0; x < width; x++) {
                out[offset + x] = 0xFF000000 | ((sumR / window) << 16)
                        | ((sumG / window) << 8) | (sumB / window);
                int removed = in[offset + clamp(x - radius, 0, width - 1)];
                int added = in[offset + clamp(x + radius + 1, 0, width - 1)];
                sumR += ((added >> 16) & 0xFF) - ((removed >> 16) & 0xFF);
                sumG += ((added >> 8) & 0xFF) - ((removed >> 8) & 0xFF);
                sumB += (added & 0xFF) - (removed & 0xFF);
            }
        }
    }

    private static void boxBlurVertical(int[] in, int[] out, int width, int height, int radius) {
        int window = radius * 2 + 1;
        for (int x = 0; x < width; x++) {
            int sumR = 0;
            int sumG = 0;
            int sumB = 0;
            for (int i = -radius; i <= radius; i++) {
                int c = in[clamp(i, 0, height - 1) * width + x];
                sumR += (c >> 16) & 0xFF;
                sumG += (c >> 8) & 0xFF;
                sumB += c & 0xFF;
            }
            for (int y = 0; y < height; y++) {
                out[y * width + x] = 0xFF000000 | ((sumR / window) << 16)
                        | ((sumG / window) << 8) | (sumB / window);
                int removed = in[clamp(y - radius, 0, height - 1) * width + x];
                int added = in[clamp(y + radius + 1, 0, height - 1) * width + x];
                sumR += ((added >> 16) & 0xFF) - ((removed >> 16) & 0xFF);
                sumG += ((added >> 8) & 0xFF) - ((removed >> 8) & 0xFF);
                sumB += (added & 0xFF) - (removed & 0xFF);
            }
        }
    }

    /**
     * Darkens the glow towards the outer edges of the player. {@code strength} 0 keeps the
     * glow uniform, 1 fades it to black at the screen edge.
     */
    static void applyEdgeFade(int[] pixels, int width, int height, float[] video, float strength) {
        if (strength <= 0f) return;
        for (int y = 0; y < height; y++) {
            float cy = y + 0.5f;
            float dy = cy < video[1] ? (video[1] - cy) / Math.max(1f, video[1])
                    : cy > video[3] ? (cy - video[3]) / Math.max(1f, height - video[3]) : 0f;
            for (int x = 0; x < width; x++) {
                float cx = x + 0.5f;
                float dx = cx < video[0] ? (video[0] - cx) / Math.max(1f, video[0])
                        : cx > video[2] ? (cx - video[2]) / Math.max(1f, width - video[2]) : 0f;
                float distance = Math.min(1f, Math.max(dx, dy));
                if (distance <= 0f) continue;
                // Smoothstep keeps the light bright next to the picture.
                float eased = distance * distance * (3f - 2f * distance);
                float factor = 1f - strength * eased;
                int c = pixels[y * width + x];
                int r = (int) (((c >> 16) & 0xFF) * factor);
                int g = (int) (((c >> 8) & 0xFF) * factor);
                int b = (int) ((c & 0xFF) * factor);
                pixels[y * width + x] = 0xFF000000 | (r << 16) | (g << 8) | b;
            }
        }
    }

    /**
     * Turns the glow into light that leaks out of the player onto the page: alpha falls off
     * with the distance from the player rectangle and is zero over the player itself.
     *
     * @param player {left, top, right, bottom} of the player in buffer coordinates
     * @param length distance (buffer pixels) at which the light has fully faded
     */
    static void applyPageFalloff(int[] pixels, int width, int height, float[] player,
                                 float length, float strength) {
        applyPageFalloff(pixels, width, height, player, length, strength, 0f, 0, 0f);
    }

    /**
     * Page light with a configurable floor so the colour can reach the far screen edge.
     *
     * @param floor        fraction of the strength kept at {@code length} and beyond (0-1)
     * @param averageColor whole-frame colour the light drifts towards far from the player
     * @param averageMix   how far (0-1) distant pixels move towards {@code averageColor}
     */
    static void applyPageFalloff(int[] pixels, int width, int height, float[] player,
                                 float length, float strength, float floor,
                                 int averageColor, float averageMix) {
        float safeLength = Math.max(1f, length);
        float safeStrength = clamp(strength, 0f, 1f);
        float safeFloor = clamp(floor, 0f, 1f);
        float safeMix = clamp(averageMix, 0f, 1f);
        int ar = (averageColor >> 16) & 0xFF;
        int ag = (averageColor >> 8) & 0xFF;
        int ab = averageColor & 0xFF;
        for (int y = 0; y < height; y++) {
            float cy = y + 0.5f;
            float dy = cy < player[1] ? player[1] - cy : cy > player[3] ? cy - player[3] : 0f;
            for (int x = 0; x < width; x++) {
                float cx = x + 0.5f;
                float dx = cx < player[0] ? player[0] - cx : cx > player[2] ? cx - player[2] : 0f;
                int index = y * width + x;
                if (dx == 0f && dy == 0f) {
                    pixels[index] &= 0x00FFFFFF;
                    continue;
                }
                float t = Math.min(1f, (float) Math.sqrt(dx * dx + dy * dy) / safeLength);
                // Inverse smoothstep: bright next to the player, long soft tail.
                float eased = 1f - t * t * (3f - 2f * t);
                float level = safeFloor + (1f - safeFloor) * eased;
                int alpha = Math.round(255f * safeStrength * level);
                int c = pixels[index];
                int r = (c >> 16) & 0xFF;
                int g = (c >> 8) & 0xFF;
                int b = c & 0xFF;
                if (safeMix > 0f) {
                    float mix = safeMix * t;
                    r = Math.round(r + (ar - r) * mix);
                    g = Math.round(g + (ag - g) * mix);
                    b = Math.round(b + (ab - b) * mix);
                }
                pixels[index] = (alpha << 24) | (r << 16) | (g << 8) | b;
            }
        }
    }

    /**
     * Brightens the light so dark scenes still glow ({@code gain}) and optionally caps its
     * luminance ({@code lumaCap} 0-1) so white text drawn over it stays readable.
     * Alpha is preserved.
     */
    static void toneLight(int[] pixels, float gain, float lumaCap) {
        float cap = clamp(lumaCap, 0f, 1f) * 255f;
        for (int i = 0; i < pixels.length; i++) {
            int c = pixels[i];
            float r = Math.min(255f, ((c >> 16) & 0xFF) * gain);
            float g = Math.min(255f, ((c >> 8) & 0xFF) * gain);
            float b = Math.min(255f, (c & 0xFF) * gain);
            if (lumaCap < 1f) {
                float luma = r * 0.299f + g * 0.587f + b * 0.114f;
                if (luma > cap && luma > 0f) {
                    float scale = cap / luma;
                    r *= scale;
                    g *= scale;
                    b *= scale;
                }
            }
            pixels[i] = (c & 0xFF000000) | (Math.round(r) << 16) | (Math.round(g) << 8)
                    | Math.round(b);
        }
    }

    /** Average colour of the given source region. */
    static int averageColor(int[] src, int srcWidth, int[] bounds) {
        long r = 0;
        long g = 0;
        long b = 0;
        int count = 0;
        for (int y = bounds[1]; y < bounds[3]; y++) {
            for (int x = bounds[0]; x < bounds[2]; x++) {
                int c = src[y * srcWidth + x];
                r += (c >> 16) & 0xFF;
                g += (c >> 8) & 0xFF;
                b += c & 0xFF;
                count++;
            }
        }
        if (count == 0) return 0xFF000000;
        return 0xFF000000 | ((int) (r / count) << 16) | ((int) (g / count) << 8)
                | (int) (b / count);
    }

    /** Farthest distance from the player rectangle to any corner of the buffer. */
    static float farthestDistance(int width, int height, float[] player) {
        float best = 0f;
        float[][] corners = {{0f, 0f}, {width, 0f}, {0f, height}, {width, height}};
        for (float[] corner : corners) {
            float dx = corner[0] < player[0] ? player[0] - corner[0]
                    : corner[0] > player[2] ? corner[0] - player[2] : 0f;
            float dy = corner[1] < player[1] ? player[1] - corner[1]
                    : corner[1] > player[3] ? corner[1] - player[3] : 0f;
            best = Math.max(best, (float) Math.sqrt(dx * dx + dy * dy));
        }
        return Math.max(1f, best);
    }

    /** Exponential smoothing between frames; {@code keep} 0 = no smoothing, 0.9 = very slow. */
    static void blendInto(int[] accumulated, int[] next, float keep, boolean initialize) {
        if (initialize || keep <= 0f) {
            System.arraycopy(next, 0, accumulated, 0, Math.min(accumulated.length, next.length));
            return;
        }
        int keepWeight = Math.round(keep * 256);
        int nextWeight = 256 - keepWeight;
        for (int i = 0; i < accumulated.length && i < next.length; i++) {
            int a = accumulated[i];
            int n = next[i];
            int r = (((a >> 16) & 0xFF) * keepWeight + ((n >> 16) & 0xFF) * nextWeight) >> 8;
            int g = (((a >> 8) & 0xFF) * keepWeight + ((n >> 8) & 0xFF) * nextWeight) >> 8;
            int b = ((a & 0xFF) * keepWeight + (n & 0xFF) * nextWeight) >> 8;
            accumulated[i] = 0xFF000000 | (r << 16) | (g << 8) | b;
        }
    }

    /** Lays a white haze over the picture, like frosted glass in front of it. */
    static void frost(int[] pixels, int length, float amount) {
        int keep = Math.round((1f - amount) * 256);
        int add = Math.round(amount * 255 * 256);
        for (int i = 0; i < length; i++) {
            int c = pixels[i];
            int r = (((c >> 16) & 0xFF) * keep + add) >> 8;
            int g = (((c >> 8) & 0xFF) * keep + add) >> 8;
            int b = ((c & 0xFF) * keep + add) >> 8;
            pixels[i] = (c & 0xFF000000) | (r << 16) | (g << 8) | b;
        }
    }

    /**
     * Fills {@code out} with the picture scaled to cover it (centre-cropped, like a wallpaper),
     * sampling the nearest source pixel; the blur afterwards smooths it.
     */
    static void cover(int[] source, int sourceWidth, int sourceHeight, int[] out, int width,
                      int height) {
        float scale = Math.max(width / (float) sourceWidth, height / (float) sourceHeight);
        float offsetX = (sourceWidth - width / scale) / 2f;
        float offsetY = (sourceHeight - height / scale) / 2f;
        for (int y = 0; y < height; y++) {
            int sy = clamp(Math.round(offsetY + (y + 0.5f) / scale - 0.5f), 0, sourceHeight - 1);
            int row = sy * sourceWidth;
            for (int x = 0; x < width; x++) {
                int sx = clamp(Math.round(offsetX + (x + 0.5f) / scale - 0.5f), 0,
                        sourceWidth - 1);
                out[y * width + x] = 0xFF000000 | source[row + sx];
            }
        }
    }

    /** Sets every pixel fully opaque. */
    static void makeOpaque(int[] pixels, int length) {
        for (int i = 0; i < length; i++) pixels[i] |= 0xFF000000;
    }

    /** Multiplies the brightness of every pixel. */
    static void scaleBrightness(int[] pixels, int length, float factor) {
        int f = Math.round(factor * 256);
        for (int i = 0; i < length; i++) {
            int c = pixels[i];
            int r = Math.min(255, (((c >> 16) & 0xFF) * f) >> 8);
            int g = Math.min(255, (((c >> 8) & 0xFF) * f) >> 8);
            int b = Math.min(255, ((c & 0xFF) * f) >> 8);
            pixels[i] = (c & 0xFF000000) | (r << 16) | (g << 8) | b;
        }
    }

    /** Mean absolute channel difference (0-255) used to skip work on static pictures. */
    static int meanDifference(int[] first, int[] second, int length) {
        long total = 0;
        int step = Math.max(1, length / 256);
        int samples = 0;
        for (int i = 0; i < length; i += step) {
            int a = first[i];
            int b = second[i];
            total += Math.abs(((a >> 16) & 0xFF) - ((b >> 16) & 0xFF))
                    + Math.abs(((a >> 8) & 0xFF) - ((b >> 8) & 0xFF))
                    + Math.abs((a & 0xFF) - (b & 0xFF));
            samples++;
        }
        return samples == 0 ? 0 : (int) (total / (samples * 3L));
    }

    /** Opaque grey-scale colours: the only ones a page background or card can have. */
    static boolean isOpaqueNeutral(int colour) {
        if ((colour >>> 24) < 0xF0) return false;
        int r = (colour >> 16) & 0xFF;
        int g = (colour >> 8) & 0xFF;
        int b = colour & 0xFF;
        return Math.max(r, Math.max(g, b)) - Math.min(r, Math.min(g, b)) <= 12;
    }

    /**
     * What a background colour becomes on the see-through watch page. The page colour itself
     * turns fully transparent. A slightly raised surface (cards, chips, input fields) becomes
     * a translucent veil of the same relative strength, so it still reads as a surface over
     * the light. Everything else - buttons, badges, coloured fills - is returned unchanged.
     */
    static int seeThroughColour(int colour, int pageColour) {
        if (!isOpaqueNeutral(colour)) return colour;
        int difference = luma(colour) - luma(pageColour);
        if (Math.abs(difference) <= 6) return 0;
        boolean darkPage = luma(pageColour) < 128;
        // Raised surfaces are lighter than a dark page and darker than a light one.
        if (darkPage != (difference > 0) || Math.abs(difference) > 56) return colour;
        int alpha = Math.min(96, Math.abs(difference) * 2 + 8);
        return (alpha << 24) | (darkPage ? 0xFFFFFF : 0x000000);
    }

    static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }

    static float clamp(float value, float min, float max) {
        return Math.max(min, Math.min(max, value));
    }
}
