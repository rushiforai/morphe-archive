package dev.jason.gboardpatches.extension.customstickers;

/** Makes the corners of a sticker transparent with anti-aliased round edges. */
final class GboardCustomStickersCorners {
    private GboardCustomStickersCorners() { }

    /**
     * Edits {@code argb} (non-premultiplied) in place. {@code percent} 100 rounds the shorter
     * side fully, turning a square into a circle.
     */
    static void round(int[] argb, int width, int height, int percent) {
        if (width <= 0 || height <= 0 || argb.length < width * height) {
            throw new IllegalArgumentException("Pixel buffer does not match its size");
        }
        float radius = Math.min(width, height) / 2f * Math.max(0, Math.min(100, percent)) / 100f;
        if (radius <= 0) return;
        for (int y = 0; y < height; y++) {
            float centerY = y + 0.5f;
            float dy = centerY < radius ? radius - centerY
                    : centerY > height - radius ? centerY - (height - radius) : 0;
            if (dy == 0) continue;
            for (int x = 0; x < width; x++) {
                float centerX = x + 0.5f;
                float dx = centerX < radius ? radius - centerX
                        : centerX > width - radius ? centerX - (width - radius) : 0;
                if (dx == 0) continue;
                double coverage = radius + 0.5 - Math.sqrt(dx * dx + dy * dy);
                if (coverage >= 1) continue;
                int index = y * width + x;
                int alpha = (int) Math.round((argb[index] >>> 24) * Math.max(0, coverage));
                argb[index] = (alpha << 24) | (argb[index] & 0xFFFFFF);
            }
        }
    }
}
