package dev.jason.gboardpatches.extension.customstickers;

/**
 * Draws a solid outline around the visible shape of a sticker. The canvas grows by
 * {@code radius} on every side so the outline is never clipped; an opaque rectangle therefore
 * gets rounded transparent corners.
 */
final class GboardCustomStickersOutline {
    private static final int SHAPE_ALPHA = 128;

    private GboardCustomStickersOutline() { }

    /** Returns the outlined pixels, {@code (width + 2r) x (height + 2r)}, non-premultiplied. */
    static int[] apply(int[] argb, int width, int height, int radius, int color) {
        if (width <= 0 || height <= 0 || argb.length < width * height || radius <= 0) {
            throw new IllegalArgumentException("Invalid outline input");
        }
        int outWidth = width + 2 * radius;
        int outHeight = height + 2 * radius;
        float[] coverage = new float[outWidth * outHeight];
        // One disk of offsets, with a half-pixel soft rim so the outline is anti-aliased.
        int span = radius + 1;
        int diameter = 2 * span + 1;
        float[] disk = new float[diameter * diameter];
        for (int dy = -span; dy <= span; dy++) {
            for (int dx = -span; dx <= span; dx++) {
                double distance = Math.sqrt(dx * dx + dy * dy);
                disk[(dy + span) * diameter + dx + span] =
                        (float) Math.max(0, Math.min(1, radius + 0.5 - distance));
            }
        }
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < width; x++) {
                if (!inShape(argb, width, height, x, y)) continue;
                int centerX = x + radius;
                int centerY = y + radius;
                if (!isEdge(argb, width, height, x, y)) {
                    coverage[centerY * outWidth + centerX] = 1f;
                    continue;
                }
                for (int dy = -span; dy <= span; dy++) {
                    int row = centerY + dy;
                    if (row < 0 || row >= outHeight) continue;
                    for (int dx = -span; dx <= span; dx++) {
                        int column = centerX + dx;
                        if (column < 0 || column >= outWidth) continue;
                        float value = disk[(dy + span) * diameter + dx + span];
                        int index = row * outWidth + column;
                        if (value > coverage[index]) coverage[index] = value;
                    }
                }
            }
        }
        int[] out = new int[outWidth * outHeight];
        int outlineAlpha = color >>> 24;
        for (int y = 0; y < outHeight; y++) {
            for (int x = 0; x < outWidth; x++) {
                int index = y * outWidth + x;
                int sourceX = x - radius;
                int sourceY = y - radius;
                int source = sourceX >= 0 && sourceX < width && sourceY >= 0 && sourceY < height
                        ? argb[sourceY * width + sourceX] : 0;
                int border = Math.round(coverage[index] * outlineAlpha);
                out[index] = over(source, (border << 24) | (color & 0xFFFFFF));
            }
        }
        return out;
    }

    private static boolean inShape(int[] argb, int width, int height, int x, int y) {
        return x >= 0 && y >= 0 && x < width && y < height
                && (argb[y * width + x] >>> 24) >= SHAPE_ALPHA;
    }

    /** Shape pixels on the image border count as edges, so opaque photos get outlined too. */
    private static boolean isEdge(int[] argb, int width, int height, int x, int y) {
        return !inShape(argb, width, height, x - 1, y) || !inShape(argb, width, height, x + 1, y)
                || !inShape(argb, width, height, x, y - 1) || !inShape(argb, width, height, x, y + 1);
    }

    /** Non-premultiplied source-over. */
    private static int over(int top, int bottom) {
        int topAlpha = top >>> 24;
        int bottomAlpha = bottom >>> 24;
        int outAlpha = topAlpha + bottomAlpha * (255 - topAlpha) / 255;
        if (outAlpha == 0) return 0;
        int red = blend((top >> 16) & 0xFF, topAlpha, (bottom >> 16) & 0xFF, bottomAlpha, outAlpha);
        int green = blend((top >> 8) & 0xFF, topAlpha, (bottom >> 8) & 0xFF, bottomAlpha, outAlpha);
        int blue = blend(top & 0xFF, topAlpha, bottom & 0xFF, bottomAlpha, outAlpha);
        return (outAlpha << 24) | (red << 16) | (green << 8) | blue;
    }

    private static int blend(int top, int topAlpha, int bottom, int bottomAlpha, int outAlpha) {
        return (top * topAlpha + bottom * bottomAlpha * (255 - topAlpha) / 255) / outAlpha;
    }
}
