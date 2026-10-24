package app.morphe.extension.tiktok.download;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** #37: the size a screen recording is made at. */
public class ScreenSourceTest {
    @Test public void aPhoneScreenIsKeptAtItsOwnSizeWhenItFits() {
        assertArrayEquals(new int[]{1080, 1920}, ScreenSource.captureSize(1080, 1920));
    }

    @Test public void aLargerScreenIsScaledDownKeepingItsShape() {
        int[] size = ScreenSource.captureSize(1440, 3088);
        assertEquals(ScreenSource.MAX_SIDE, size[1] > size[0] ? size[1] : size[0]);
        assertEquals(0, size[0] % 2);
        assertEquals(0, size[1] % 2);
        assertTrue(Math.abs((double) size[0] / size[1] - 1440.0 / 3088.0) < 0.01);
    }

    @Test public void bothSidesAreEvenWhateverTheScreen() {
        int[][] screens = {{1081, 1921}, {721, 1281}, {1, 1}, {2561, 1441}, {3, 4000}};
        for (int[] screen : screens) {
            int[] size = ScreenSource.captureSize(screen[0], screen[1]);
            assertEquals(0, size[0] % 2);
            assertEquals(0, size[1] % 2);
            assertTrue(size[0] >= 2 && size[1] >= 2);
            assertTrue(Math.max(size[0], size[1]) <= ScreenSource.MAX_SIDE);
        }
    }
}
