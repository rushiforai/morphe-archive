package dev.jason.gboardpatches.extension.customstickers;

import org.junit.Test;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class GboardCustomStickersBackgroundRemoverTest {
    private static final int WHITE = 0xFFFFFFFF;
    private static final int NEAR_WHITE = 0xFFF4F6F2;
    private static final int RED = 0xFFFF0000;

    @Test public void clearsEdgeConnectedBackgroundButKeepsEnclosedAreas() {
        // 10x10 white canvas with a red ring (2..7) around a white hole (3..6).
        int[] pixels = new int[100];
        for (int y = 0; y < 10; y++) {
            for (int x = 0; x < 10; x++) {
                boolean ring = x >= 2 && x <= 7 && y >= 2 && y <= 7;
                boolean hole = x >= 3 && x <= 6 && y >= 3 && y <= 6;
                pixels[y * 10 + x] = ring && !hole ? RED : (x + y) % 2 == 0 ? WHITE : NEAR_WHITE;
            }
        }

        int removed = GboardCustomStickersBackgroundRemover.remove(pixels, 10, 10, 24);

        assertEquals(64, removed);
        assertEquals(0, pixels[0]);
        assertEquals(RED, pixels[2 * 10 + 2]);
        assertEquals(WHITE, pixels[4 * 10 + 4]);
    }

    @Test public void toleranceDecidesWhetherShadesCount() {
        int[] pixels = {WHITE, 0xFFC8C8C8, WHITE, WHITE};
        assertEquals(3, GboardCustomStickersBackgroundRemover.remove(pixels.clone(), 2, 2, 24));
        assertEquals(4, GboardCustomStickersBackgroundRemover.remove(pixels.clone(), 2, 2, 80));
    }

    @Test public void visibleBoundsFindTheSmallestBoxAroundContent() {
        int[] pixels = new int[5 * 4];
        pixels[1 * 5 + 1] = RED;
        pixels[2 * 5 + 3] = 0x08FF0000; // faint enough to count as transparent
        pixels[2 * 5 + 2] = RED;

        assertArrayEquals(new int[]{1, 1, 3, 3},
                GboardCustomStickersBackgroundRemover.visibleBounds(pixels, 5, 4));
        assertNull(GboardCustomStickersBackgroundRemover.visibleBounds(new int[4], 2, 2));
    }

    @Test public void alreadyTransparentEdgesRemoveNothing() {
        int[] pixels = {0, 0, 0, 0, RED, 0, 0, 0, 0};
        assertEquals(0, GboardCustomStickersBackgroundRemover.remove(pixels, 3, 3, 48));
        assertEquals(RED, pixels[4]);
    }
}
