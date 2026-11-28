package dev.rikunode.futatabi.bridge;

/** Inline thread layout metadata only. Never resizes or downloads image bytes. */
final class ThreadImageSize {
    static final int MAX_EDGE = 280;
    private ThreadImageSize() {}

    static String attributes(Object width, Object height) {
        double w = width instanceof Number ? ((Number)width).doubleValue() : 0;
        double h = height instanceof Number ? ((Number)height).doubleValue() : 0;
        if (!(w > 0 && h > 0 && w <= 16000 && h <= 16000 &&
                w == Math.floor(w) && h == Math.floor(h) && w*h <= 40_000_000))
            return "width=" + MAX_EDGE + " height=" + MAX_EDGE;
        double scale = MAX_EDGE / Math.max(w,h);
        return "width=" + Math.max(1, Math.round(w*scale)) +
                " height=" + Math.max(1, Math.round(h*scale));
    }
}
