package dev.jason.gboardpatches.extension.customstickers;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class GboardCustomStickersOutlineTest {
    private static final int RED = 0xFFFF0000;
    private static final int WHITE = 0xFFFFFFFF;

    @Test public void opaqueSquareGetsOutlineAndTransparentRoundedCorners() {
        int[] square = new int[9];
        java.util.Arrays.fill(square, RED);

        int[] out = GboardCustomStickersOutline.apply(square, 3, 3, 2, WHITE);

        assertEquals(49, out.length);
        assertEquals(RED, out[3 * 7 + 3]);
        assertEquals(WHITE, out[3 * 7 + 1]);
        // The outermost ring is the half-covered anti-aliased rim.
        assertEquals(0x80, out[3 * 7] >>> 24);
        assertEquals(0, out[0] >>> 24);
    }

    @Test public void transparentPixelsAwayFromTheShapeStayClear() {
        int[] dot = new int[25];
        dot[12] = RED;

        int[] out = GboardCustomStickersOutline.apply(dot, 5, 5, 2, WHITE);

        assertEquals(RED, out[4 * 9 + 4]);
        assertEquals(WHITE, out[4 * 9 + 3]);
        assertEquals(0, out[0]);
    }
}
