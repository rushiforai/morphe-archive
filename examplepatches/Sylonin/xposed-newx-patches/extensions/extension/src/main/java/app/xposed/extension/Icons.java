package app.xposed.extension;

import android.graphics.Path;
import android.graphics.RectF;

/**
 * Line icons for the filter screens: Lucide 0.468.0 (ISC, see NOTICE), as X-Posed's settings
 * use them (dialog-icons.js). 24x24 viewBox, 2 unit strokes.
 */
final class Icons {
    private static final float STROKE = 2f;

    private Icons() {
    }

    private static Glyphs.Glyph lines(String... paths) {
        Glyphs.Layer[] layers = new Glyphs.Layer[paths.length];
        for (int i = 0; i < paths.length; i++) layers[i] = new Glyphs.Layer(Glyphs.svg(paths[i]), true, STROKE);
        return new Glyphs.Glyph(layers);
    }

    private static Glyphs.Layer circle(float cx, float cy, float r) {
        return new Glyphs.Layer(Glyphs.circle(cx, cy, r), true, STROKE);
    }

    private static Glyphs.Layer path(String d) {
        return new Glyphs.Layer(Glyphs.svg(d), true, STROKE);
    }

    private static Glyphs.Layer rect(float x, float y, float w, float h, float r) {
        Path p = new Path();
        p.addRoundRect(new RectF(x, y, x + w, y + h), r, r, Path.Direction.CW);
        return new Glyphs.Layer(p, true, STROKE);
    }

    static final Glyphs.Glyph GLOBE = new Glyphs.Glyph(
            path("M21.54 15H17a2 2 0 0 0-2 2v4.54"),
            path("M7 3.34V5a3 3 0 0 0 3 3a2 2 0 0 1 2 2c0 1.1.9 2 2 2a2 2 0 0 0 2-2c0-1.1.9-2 2-2h3.17"),
            path("M11 21.95V18a2 2 0 0 0-2-2a2 2 0 0 1-2-2v-1a2 2 0 0 0-2-2H2.05"),
            circle(12, 12, 10));

    static final Glyphs.Glyph MAP = lines(
            "M14.106 5.553a2 2 0 0 0 1.788 0l3.659-1.83A1 1 0 0 1 21 4.619v12.764a1 1 0 0 1-.553.894l-4.553 2.277"
                    + "a2 2 0 0 1-1.788 0l-4.212-2.106a2 2 0 0 0-1.788 0l-3.659 1.83A1 1 0 0 1 3 19.381V6.618"
                    + "a1 1 0 0 1 .553-.894l4.553-2.277a2 2 0 0 1 1.788 0z",
            "M15 5.764v15",
            "M9 3.236v15");

    static final Glyphs.Glyph USERS = new Glyphs.Glyph(
            path("M18 21a8 8 0 0 0-16 0"),
            circle(10, 8, 5),
            path("M22 20c0-3.37-2-6.5-4-8a5 5 0 0 0-.45-8.3"));

    static final Glyphs.Glyph NAME = new Glyphs.Glyph(
            path("M16 2v2"),
            path("M17.915 22a6 6 0 0 0-12 0"),
            path("M8 2v2"),
            circle(12, 12, 4),
            rect(3, 4, 18, 18, 2));

    static final Glyphs.Glyph BIO = lines("M17 6.1H3", "M21 12.1H3", "M15.1 18H3");

    static final Glyphs.Glyph LINK = lines(
            "M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71",
            "M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71");

    static final Glyphs.Glyph LABEL = lines(
            "M3.85 8.62a4 4 0 0 1 4.78-4.77 4 4 0 0 1 6.74 0 4 4 0 0 1 4.78 4.78 4 4 0 0 1 0 6.74 4 4 0 0 1-4.77 4.78"
                    + " 4 4 0 0 1-6.75 0 4 4 0 0 1-4.78-4.77 4 4 0 0 1 0-6.76Z",
            "m9 12 2 2 4-4");

    static final Glyphs.Glyph AFFILIATION = lines(
            "M6 22V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v18Z",
            "M6 12H4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h2",
            "M18 9h2a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2h-2",
            "M10 6h4", "M10 10h4", "M10 14h4", "M10 18h4");

    static final Glyphs.Glyph LANGUAGES = lines(
            "m5 8 6 6", "m4 14 6-6 2-3", "M2 5h12", "M7 2h1", "m22 22-5-10-5 10", "M14 18h6");

    static final Glyphs.Glyph CHART = lines("M18 20V10", "M12 20V4", "M6 20v-6");

    static final Glyphs.Glyph AT_SIGN = new Glyphs.Glyph(
            circle(12, 12, 4),
            path("M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-4 8"));

    static final Glyphs.Glyph SHIELD = lines(
            "M20 13c0 5-3.5 7.5-7.66 8.95a1 1 0 0 1-.67-.01C7.5 20.5 4 18 4 13V6a1 1 0 0 1 1-1c2 0 4.5-1.2 6.24-2.72"
                    + "a1.17 1.17 0 0 1 1.52 0C14.51 3.81 17 5 19 5a1 1 0 0 1 1 1z");

    static final Glyphs.Glyph CLOSE = lines("M18 6 6 18", "m6 6 12 12");

    static final Glyphs.Glyph PLUS = lines("M5 12h14", "M12 5v14");

    static final Glyphs.Glyph CHECK = lines("M20 6 9 17l-5-5");

    /** chevron-down.svg */
    static final Glyphs.Glyph EXPAND = lines("m6 9 6 6 6-6");

    /** chevron-up.svg */
    static final Glyphs.Glyph COLLAPSE = lines("m18 15-6-6-6 6");

    /** chevron-right.svg */
    static final Glyphs.Glyph NEXT = lines("m9 18 6-6-6-6");

    /** search.svg */
    static final Glyphs.Glyph SEARCH = new Glyphs.Glyph(circle(11, 11, 8), path("m21 21-4.3-4.3"));

    /** ellipsis-vertical.svg */
    static final Glyphs.Glyph MORE = new Glyphs.Glyph(circle(12, 12, 1), circle(12, 5, 1), circle(12, 19, 1));
}
