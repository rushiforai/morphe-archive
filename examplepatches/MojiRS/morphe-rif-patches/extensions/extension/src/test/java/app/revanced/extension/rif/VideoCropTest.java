package app.revanced.extension.rif;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** JVM tests for {@link VideoCrop#pictureRect}: cutting decoder padding out of a still frame. */
public class VideoCropTest {

    private static float[] matrix(float sx, float sy, float tx, float ty) {
        return new float[]{sx, 0, 0, 0, 0, sy, 0, 0, 0, 0, 1, 0, tx, ty, 0, 1};
    }

    // A 480x864 buffer cropped to 480x854 (YUV: crop shrunk 1 texel per side), copied at 508x904.
    @Test
    public void paddedBufferIsCropped() {
        int[] r = VideoCrop.pictureRect(matrix(1, -(852 / 864f), 0, 1 - 11 / 864f), 508, 904);
        assertTrue(r != null);
        assertArrayEquals(new int[]{0, 1}, new int[]{r[0], r[1]});
        assertTrue("bottom " + r[3], r[3] >= 892 && r[3] <= 893);
        assertTrue(r[2] == 508);
    }

    // The emulator's unpadded buffer: identity plus the vertical flip.
    @Test
    public void noCropLeavesFrame() {
        assertNull(VideoCrop.pictureRect(matrix(1, -1, 0, 1), 508, 904));
    }

    @Test
    public void rotatedOrMirroredLeftAlone() {
        float[] rotated = {0, -1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1};
        assertNull(VideoCrop.pictureRect(rotated, 508, 904));
        assertNull(VideoCrop.pictureRect(matrix(-1, -1, 1, 1), 508, 904));
    }

    @Test
    public void implausibleCropIgnored() {
        assertNull(VideoCrop.pictureRect(matrix(0.3f, -1, 0, 1), 508, 904));
    }
}
