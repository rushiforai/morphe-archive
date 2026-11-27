package dev.jason.gboardpatches.extension.customstickers;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class GboardCustomStickersCornersTest {
    private static final int RED = 0xFFFF0000;

    @Test public void roundingClearsCornersAndKeepsEdgesAndCenter() {
        int[] pixels = new int[20 * 20];
        java.util.Arrays.fill(pixels, RED);

        GboardCustomStickersCorners.round(pixels, 20, 20, 50);

        assertEquals(0, pixels[0] >>> 24);
        assertEquals(0, pixels[19] >>> 24);
        assertEquals(0, pixels[19 * 20 + 19] >>> 24);
        assertEquals(RED, pixels[10 * 20 + 10]);
        assertEquals(RED, pixels[10]);
        assertEquals(RED, pixels[10 * 20]);
    }

    @Test public void zeroPercentChangesNothing() {
        int[] pixels = new int[16];
        java.util.Arrays.fill(pixels, RED);

        GboardCustomStickersCorners.round(pixels, 4, 4, 0);

        for (int pixel : pixels) assertEquals(RED, pixel);
    }
}
