package dev.utaa.cutlog.extension.editor;

import static org.junit.Assert.assertArrayEquals;

import org.junit.Test;

public class StickerImagesTest {
    @Test
    public void keepsSmallImages() {
        assertArrayEquals(new int[] {800, 600}, StickerImages.scaledSize(800, 600, 1024));
    }

    @Test
    public void shrinksLongerSideKeepingAspect() {
        assertArrayEquals(new int[] {1024, 768}, StickerImages.scaledSize(4000, 3000, 1024));
        assertArrayEquals(new int[] {576, 1024}, StickerImages.scaledSize(2160, 3840, 1024));
    }

    @Test
    public void neverShrinksToZero() {
        assertArrayEquals(new int[] {1024, 1}, StickerImages.scaledSize(20000, 1, 1024));
    }
}
