package app.jimaku.extension.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import app.jimaku.extension.shared.IconPaths;

/**
 * Each icon's path data, read by {@link SvgPath} into a {@link SvgPath.Sink} that only measures,
 * covers what the SVG covers: its bounds match those worked out from the path data on its own,
 * with each curve's extremes found exactly, within one unit of the 960 grid, and it sits inside the
 * viewBox the extension draws it in.
 */
public class IconPathsTest {
    /** The extension's viewBoxes: Material Symbols' {@code 0 -960 960 960}, the strokes' {@code 0 0 24 24}, spark()'s {@code 552 -910 358 358}. */
    private static final float[] MATERIAL = {0, -960, 960};
    private static final float[] STROKE = {0, 0, 24};
    private static final float[] SPARK = {552, -910, 358};

    @Test
    public void subtitles() {
        check(IconPaths.SUBTITLES, MATERIAL, 65.870f, -814.700f, 894.700f, -145.870f);
    }

    @Test
    public void tune() {
        check(IconPaths.TUNE, MATERIAL, 110.390f, -853.000f, 849.610f, -107.000f);
    }

    @Test
    public void translate() {
        check(IconPaths.TRANSLATE, MATERIAL, 23.040f, -894.700f, 922.293f, -65.870f);
    }

    @Test
    public void help() {
        check(IconPaths.HELP, MATERIAL, 60.780f, -899.220f, 899.220f, -60.780f);
    }

    @Test
    public void sparkle() {
        check(IconPaths.SPARKLE, SPARK, 552.430f, -909.430f, 909.430f, -552.430f);
    }

    @Test
    public void strokes() {
        check(IconPaths.STROKE_CHECK, STROKE, 5f, 7.5f, 19f, 17f);
        check(IconPaths.STROKE_NEXT, STROKE, 10f, 7f, 15f, 17f);
        check(IconPaths.STROKE_BACK, STROKE, 9f, 7f, 14f, 17f);
        // A circle of radius 6 about (10.5, 10.5) as two arcs, then the handle to (20, 20).
        check(IconPaths.STROKE_SEARCH, STROKE, 4.5f, 4.5f, 20f, 20f);
    }

    /** Within one unit of the 960 grid, as a share of the icon's own grid. */
    private static void check(String data, float[] grid, float left, float top, float right, float bottom) {
        Bounds bounds = new Bounds();
        SvgPath.parse(data, bounds);
        float tolerance = grid[2] / 960f;
        assertEquals("left", left, bounds.left, tolerance);
        assertEquals("top", top, bounds.top, tolerance);
        assertEquals("right", right, bounds.right, tolerance);
        assertEquals("bottom", bottom, bounds.bottom, tolerance);
        assertTrue("inside its viewBox", bounds.left >= grid[0] && bounds.top >= grid[1]
                && bounds.right <= grid[0] + grid[2] && bounds.bottom <= grid[1] + grid[2]);
    }

    /** The box a path covers, its curves followed in small steps. */
    private static final class Bounds implements SvgPath.Sink {
        private static final int STEPS = 256;
        float left = Float.POSITIVE_INFINITY, top = Float.POSITIVE_INFINITY;
        float right = Float.NEGATIVE_INFINITY, bottom = Float.NEGATIVE_INFINITY;
        float x, y, startX, startY;

        private void add(float px, float py) {
            left = Math.min(left, px);
            top = Math.min(top, py);
            right = Math.max(right, px);
            bottom = Math.max(bottom, py);
        }

        @Override
        public void moveTo(float x, float y) {
            this.x = startX = x;
            this.y = startY = y;
            add(x, y);
        }

        @Override
        public void lineTo(float x, float y) {
            this.x = x;
            this.y = y;
            add(x, y);
        }

        @Override
        public void quadTo(float x1, float y1, float x, float y) {
            for (int i = 1; i <= STEPS; i++) {
                float t = i / (float) STEPS, u = 1 - t;
                add(u * u * this.x + 2 * u * t * x1 + t * t * x, u * u * this.y + 2 * u * t * y1 + t * t * y);
            }
            this.x = x;
            this.y = y;
        }

        @Override
        public void cubicTo(float x1, float y1, float x2, float y2, float x, float y) {
            for (int i = 1; i <= STEPS; i++) {
                float t = i / (float) STEPS, u = 1 - t;
                add(u * u * u * this.x + 3 * u * u * t * x1 + 3 * u * t * t * x2 + t * t * t * x,
                        u * u * u * this.y + 3 * u * u * t * y1 + 3 * u * t * t * y2 + t * t * t * y);
            }
            this.x = x;
            this.y = y;
        }

        @Override
        public void close() {
            x = startX;
            y = startY;
        }
    }
}
