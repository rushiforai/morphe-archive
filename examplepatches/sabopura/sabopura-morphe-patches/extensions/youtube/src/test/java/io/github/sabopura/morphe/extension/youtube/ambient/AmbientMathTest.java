package io.github.sabopura.morphe.extension.youtube.ambient;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.Arrays;

public final class AmbientMathTest {
    private static final int BLACK = 0xFF000000;
    private static final int RED = 0xFFFF0000;
    private static final int BLUE = 0xFF0000FF;

    @Test
    public void detectsBurnedInLetterbox() {
        int width = 16;
        int height = 12;
        int[] pixels = new int[width * height];
        Arrays.fill(pixels, BLACK);
        for (int y = 2; y < 10; y++) {
            for (int x = 0; x < width; x++) pixels[y * width + x] = RED;
        }
        assertArrayEquals(new int[]{0, 2, 16, 10},
                AmbientMath.detectContentBounds(pixels, width, height));
    }

    @Test
    public void detectsPillarboxInsideTheFrame() {
        int width = 20;
        int height = 10;
        int[] pixels = new int[width * height];
        Arrays.fill(pixels, BLACK);
        for (int y = 0; y < height; y++) {
            for (int x = 5; x < 15; x++) pixels[y * width + x] = BLUE;
        }
        assertArrayEquals(new int[]{5, 0, 15, 10},
                AmbientMath.detectContentBounds(pixels, width, height));
    }

    @Test
    public void allDarkFrameGivesNoDecision() {
        int[] pixels = new int[8 * 8];
        Arrays.fill(pixels, 0xFF050505);
        assertNull(AmbientMath.detectContentBounds(pixels, 8, 8));
    }

    @Test
    public void glowExtendsTheNearestEdgeColour() {
        // Source: left half red, right half blue.
        int[] source = new int[4 * 2];
        for (int y = 0; y < 2; y++) {
            source[y * 4] = RED;
            source[y * 4 + 1] = RED;
            source[y * 4 + 2] = BLUE;
            source[y * 4 + 3] = BLUE;
        }
        int outWidth = 12;
        int outHeight = 2;
        int[] out = new int[outWidth * outHeight];
        // Video occupies the middle third of a pillarboxed player.
        AmbientMath.composeGlow(source, 4, new int[]{0, 0, 4, 2}, out, outWidth, outHeight,
                new float[]{4f, 0f, 8f, 2f}, 0f);
        assertEquals(RED, out[0]);
        assertEquals(BLUE, out[outWidth - 1]);
    }

    @Test
    public void straightLightRunsDownAndUsesTheWholePicture() {
        // 4 columns x 10 rows: left half red, right half blue, with a white border row at
        // the bottom edge.
        int w = 4;
        int h = 10;
        int[] source = new int[w * h];
        for (int y = 0; y < h; y++) {
            for (int x = 0; x < w; x++) {
                source[y * w + x] = y == h - 1 ? 0xFFFFFFFF : x < 2 ? RED : BLUE;
            }
        }
        int[] bounds = {0, 0, w, h};
        int width = 8;
        int height = 30;
        int[] out = new int[width * height];
        float[] video = {0f, 0f, 8f, 10f};
        AmbientMath.composeStraight(source, w, bounds, out, width, height, video, 0.3f, 10f,
                new int[AmbientMath.straightScratchLength(bounds)]);
        // Straight down: the left stays red-ish, the right blue-ish, all the way.
        for (int y = 11; y < height; y++) {
            int left = out[y * width + 1];
            int right = out[y * width + width - 2];
            assertTrue(((left >> 16) & 0xFF) > (left & 0xFF));
            assertTrue((right & 0xFF) > ((right >> 16) & 0xFF));
        }
        // The white border is only a small part of the colour, and less so farther away.
        int near = AmbientMath.luma(out[10 * width + 1]);
        int far = AmbientMath.luma(out[(height - 1) * width + 1]);
        assertTrue(near < 140);
        assertTrue(far <= near);
    }

    @Test
    public void refinedBoundsFindTheExactBarEdge() {
        // 16 x 8 picture: black bars 5 columns wide on the left and 3 on the right.
        int w = 16;
        int h = 8;
        int[] picture = new int[w * h];
        for (int y = 0; y < h; y++) {
            for (int x = 0; x < w; x++) picture[y * w + x] = x < 5 || x >= 13 ? BLACK : RED;
        }
        // A 4x smaller sample saw the picture from sample column 1 to 3 (4..12 here).
        int[] refined = AmbientMath.refineBounds(picture, w, h, new int[]{1, 0, 3, 2}, 4);
        assertEquals(5, refined[0]);
        assertEquals(13, refined[2]);
        assertEquals(0, refined[1]);
        assertEquals(h, refined[3]);
    }

    @Test
    public void flatBordersAreTrimmedButPictureIsKept() {
        // 6 x 10 picture with a flat white frame line at the bottom and a varied picture.
        int w = 6;
        int h = 10;
        int[] source = new int[w * h];
        for (int y = 0; y < h; y++) {
            for (int x = 0; x < w; x++) {
                source[y * w + x] = y == h - 1 ? 0xFFFFFFFF : (x + y) % 2 == 0 ? RED : BLUE;
            }
        }
        int[] trimmed = AmbientMath.trimUniformEdges(source, w, new int[]{0, 0, w, h});
        assertEquals(h - 1, trimmed[3]);
        assertEquals(0, trimmed[1]);
        assertEquals(0, trimmed[0]);
        assertEquals(w, trimmed[2]);
    }

    @Test
    public void distanceBlendKeepsSharpNearAndSoftFar() {
        int width = 1;
        int height = 20;
        int[] sharp = new int[height];
        int[] soft = new int[height];
        Arrays.fill(sharp, RED);
        Arrays.fill(soft, BLUE);
        AmbientMath.blendByDistance(sharp, soft, width, height, new float[]{0f, 0f, 1f, 5f}, 10f);
        assertEquals(RED, sharp[2]);
        assertEquals(RED, sharp[4]);
        assertEquals(BLUE, sharp[19]);
    }

    @Test
    public void blurPreservesUniformColourAndSmoothsEdges() {
        int width = 10;
        int height = 1;
        int[] uniform = new int[width];
        Arrays.fill(uniform, 0xFF336699);
        AmbientMath.blur(uniform, width, height, 2, new int[width]);
        for (int value : uniform) assertEquals(0xFF336699, value);

        int[] step = new int[width];
        for (int x = 0; x < width; x++) step[x] = x < 5 ? BLACK : 0xFFFFFFFF;
        AmbientMath.blur(step, width, height, 2, new int[width]);
        int middle = AmbientMath.luma(step[5]);
        assertTrue(middle > 30 && middle < 225);
    }

    @Test
    public void downsampleAveragesBlocks() {
        int[] source = {RED, BLUE, RED, BLUE};
        int[] out = new int[1];
        AmbientMath.downsample(source, 2, 2, out, 1, 1);
        assertEquals(0xFF7F007F, out[0]);
    }

    @Test
    public void edgeFadeDarkensTowardsTheScreenEdgeOnly() {
        int width = 10;
        int[] pixels = new int[width];
        Arrays.fill(pixels, 0xFFFFFFFF);
        AmbientMath.applyEdgeFade(pixels, width, 1, new float[]{4f, 0f, 6f, 1f}, 1f);
        assertEquals(0xFFFFFFFF, pixels[5]);
        assertTrue(AmbientMath.luma(pixels[0]) < AmbientMath.luma(pixels[3]));
    }

    @Test
    public void pageFalloffIsTransparentOverThePlayerAndFadesAway() {
        int width = 4;
        int height = 20;
        int[] pixels = new int[width * height];
        Arrays.fill(pixels, 0xFF8040C0);
        // Player occupies the top quarter of the page.
        AmbientMath.applyPageFalloff(pixels, width, height, new float[]{0f, 0f, 4f, 5f}, 10f, 1f);
        assertEquals(0, pixels[2 * width] >>> 24);
        int nearAlpha = pixels[5 * width] >>> 24;
        int midAlpha = pixels[10 * width] >>> 24;
        int farAlpha = pixels[19 * width] >>> 24;
        assertTrue(nearAlpha > 200);
        assertTrue(midAlpha < nearAlpha && midAlpha > 0);
        assertEquals(0, farAlpha);
        assertEquals(0x8040C0, pixels[5 * width] & 0x00FFFFFF);
    }

    @Test
    public void seeThroughClearsThePageColourInEitherTheme() {
        assertEquals(0, AmbientMath.seeThroughColour(0xFF0F0F0F, 0xFF0F0F0F));
        assertEquals(0, AmbientMath.seeThroughColour(0xFF000000, 0xFF000000));
        assertEquals(0, AmbientMath.seeThroughColour(0xFFFFFFFF, 0xFFFFFFFF));
        // A pure-black page must not clear the stock dark grey, and the reverse.
        assertTrue(AmbientMath.seeThroughColour(0xFF0F0F0F, 0xFF000000) != 0);
    }

    @Test
    public void seeThroughTurnsRaisedSurfacesIntoVeils() {
        int darkCard = AmbientMath.seeThroughColour(0xFF272727, 0xFF0F0F0F);
        assertEquals(0xFFFFFF, darkCard & 0x00FFFFFF);
        assertTrue((darkCard >>> 24) > 20 && (darkCard >>> 24) < 128);
        int lightCard = AmbientMath.seeThroughColour(0xFFF2F2F2, 0xFFFFFFFF);
        assertEquals(0x000000, lightCard & 0x00FFFFFF);
        assertTrue((lightCard >>> 24) > 20 && (lightCard >>> 24) < 128);
    }

    @Test
    public void seeThroughKeepsButtonsAndColours() {
        // Inverse button, coloured fill, translucent scrim.
        assertEquals(0xFFF1F1F1, AmbientMath.seeThroughColour(0xFFF1F1F1, 0xFF0F0F0F));
        assertEquals(RED, AmbientMath.seeThroughColour(RED, 0xFF0F0F0F));
        assertEquals(0x80000000, AmbientMath.seeThroughColour(0x80000000, 0xFF0F0F0F));
        assertEquals(0xFF0F0F0F, AmbientMath.seeThroughColour(0xFF0F0F0F, 0xFFFFFFFF));
    }

    @Test
    public void blendKeepsPreviousFrameWeight() {
        int[] accumulated = {BLACK};
        AmbientMath.blendInto(accumulated, new int[]{0xFFFFFFFF}, 0.5f, false);
        int luma = AmbientMath.luma(accumulated[0]);
        assertTrue(luma > 100 && luma < 150);
        AmbientMath.blendInto(accumulated, new int[]{RED}, 0f, false);
        assertEquals(RED, accumulated[0]);
    }
}
