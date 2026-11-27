package dev.jason.gboardpatches.extension.customstickers;

import java.util.HashMap;
import java.util.Map;

/**
 * Removes a plain background by flood-filling from the image edges. Pixels connected to the edge
 * whose colour is within {@code tolerance} of the dominant edge colour become transparent, so
 * same-coloured areas enclosed by the subject survive.
 */
final class GboardCustomStickersBackgroundRemover {
    private static final int TRANSPARENT_ALPHA = 16;

    private GboardCustomStickersBackgroundRemover() { }

    /** Edits {@code argb} (non-premultiplied) in place; returns how many visible pixels it cleared. */
    static int remove(int[] argb, int width, int height, int tolerance) {
        int count = width * height;
        if (width <= 0 || height <= 0 || argb.length < count) {
            throw new IllegalArgumentException("Pixel buffer does not match its size");
        }
        int reference = edgeReference(argb, width, height);
        boolean[] background = new boolean[count];
        int[] queue = new int[count];
        int tail = 0;
        for (int x = 0; x < width; x++) {
            tail = seed(argb, background, queue, tail, x, reference, tolerance);
            tail = seed(argb, background, queue, tail, (height - 1) * width + x, reference, tolerance);
        }
        for (int y = 1; y < height - 1; y++) {
            tail = seed(argb, background, queue, tail, y * width, reference, tolerance);
            tail = seed(argb, background, queue, tail, y * width + width - 1, reference, tolerance);
        }
        for (int head = 0; head < tail; head++) {
            int index = queue[head];
            int x = index % width;
            int y = index / width;
            if (x > 0) tail = seed(argb, background, queue, tail, index - 1, reference, tolerance);
            if (x < width - 1) tail = seed(argb, background, queue, tail, index + 1, reference, tolerance);
            if (y > 0) tail = seed(argb, background, queue, tail, index - width, reference, tolerance);
            if (y < height - 1) tail = seed(argb, background, queue, tail, index + width, reference, tolerance);
        }
        // Soften the one-pixel rim that blends subject and background, before clearing it.
        for (int index = 0; index < count; index++) {
            if (background[index] || !touchesBackground(background, index, width, height)) continue;
            int distance = distance(argb[index], reference);
            if (tolerance > 0 && distance < tolerance * 2) {
                int alpha = argb[index] >>> 24;
                int softened = alpha * (distance - tolerance) / tolerance;
                argb[index] = (Math.max(0, softened) << 24) | (argb[index] & 0xFFFFFF);
            }
        }
        int removed = 0;
        for (int index = 0; index < count; index++) {
            if (!background[index]) continue;
            if ((argb[index] >>> 24) >= TRANSPARENT_ALPHA) removed++;
            argb[index] = 0;
        }
        return removed;
    }

    /**
     * Smallest box holding every visible pixel, as {left, top, right, bottom} with right and
     * bottom exclusive; null when nothing is visible.
     */
    static int[] visibleBounds(int[] argb, int width, int height) {
        int left = width;
        int top = height;
        int right = -1;
        int bottom = -1;
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < width; x++) {
                if ((argb[y * width + x] >>> 24) < TRANSPARENT_ALPHA) continue;
                if (x < left) left = x;
                if (x > right) right = x;
                if (y < top) top = y;
                if (y > bottom) bottom = y;
            }
        }
        return right < 0 ? null : new int[]{left, top, right + 1, bottom + 1};
    }

    private static int seed(int[] argb, boolean[] background, int[] queue, int tail, int index,
            int reference, int tolerance) {
        if (background[index]) return tail;
        int pixel = argb[index];
        boolean clear = (pixel >>> 24) < TRANSPARENT_ALPHA;
        if (!clear && (reference == 0 || distance(pixel, reference) > tolerance)) return tail;
        background[index] = true;
        queue[tail] = index;
        return tail + 1;
    }

    private static boolean touchesBackground(boolean[] background, int index, int width,
            int height) {
        int x = index % width;
        int y = index / width;
        return (x > 0 && background[index - 1])
                || (x < width - 1 && background[index + 1])
                || (y > 0 && background[index - width])
                || (y < height - 1 && background[index + width]);
    }

    /** Average colour of the most common (coarsely bucketed) opaque edge colour; 0 if none. */
    private static int edgeReference(int[] argb, int width, int height) {
        Map<Integer, long[]> buckets = new HashMap<>();
        long[] best = null;
        for (int index = 0; index < width * height; index++) {
            int x = index % width;
            int y = index / width;
            if (x != 0 && y != 0 && x != width - 1 && y != height - 1) continue;
            int pixel = argb[index];
            if ((pixel >>> 24) < TRANSPARENT_ALPHA) continue;
            int key = (pixel >> 4) & 0x0F0F0F;
            long[] bucket = buckets.get(key);
            if (bucket == null) buckets.put(key, bucket = new long[4]);
            bucket[0]++;
            bucket[1] += (pixel >> 16) & 0xFF;
            bucket[2] += (pixel >> 8) & 0xFF;
            bucket[3] += pixel & 0xFF;
            if (best == null || bucket[0] > best[0]) best = bucket;
        }
        if (best == null) return 0;
        return 0xFF000000
                | (int) (best[1] / best[0]) << 16
                | (int) (best[2] / best[0]) << 8
                | (int) (best[3] / best[0]);
    }

    private static int distance(int a, int b) {
        return Math.max(Math.abs(((a >> 16) & 0xFF) - ((b >> 16) & 0xFF)),
                Math.max(Math.abs(((a >> 8) & 0xFF) - ((b >> 8) & 0xFF)),
                        Math.abs((a & 0xFF) - (b & 0xFF))));
    }
}
