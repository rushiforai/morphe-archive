package dev.utaa.cutlog.extension.render;

import static org.junit.Assert.assertArrayEquals;

import org.junit.Test;

public class ReverseMathTest {
    /** ステレオでは左右の組を崩さずに逆順にする。 */
    @Test
    public void reversesPcmByFrame() {
        byte[] stereo = {1, 2, 3, 4, 5, 6, 7, 8};
        assertArrayEquals(new byte[] {5, 6, 7, 8, 1, 2, 3, 4}, ReverseMath.reversePcm16(stereo, 2));
        byte[] mono = {1, 2, 3, 4, 5, 6};
        assertArrayEquals(new byte[] {5, 6, 3, 4, 1, 2}, ReverseMath.reversePcm16(mono, 1));
    }

    @Test
    public void encodeSizeIsEvenAndBounded() {
        assertArrayEquals(new int[] {1280, 720}, ReverseMath.encodeSize(1280, 720, 1280));
        assertArrayEquals(new int[] {720, 1280}, ReverseMath.encodeSize(1080, 1920, 1280));
        assertArrayEquals(new int[] {640, 360}, ReverseMath.encodeSize(641, 361, 1280));
    }
}
