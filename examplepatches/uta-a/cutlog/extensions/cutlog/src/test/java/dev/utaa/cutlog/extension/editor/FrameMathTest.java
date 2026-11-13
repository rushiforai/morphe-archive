package dev.utaa.cutlog.extension.editor;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class FrameMathTest {
    @Test
    public void hashIsStableAndInRange() {
        for (int a = -50; a < 50; a++) {
            for (int b = 0; b < 20; b++) {
                float value = FrameMath.hash(a, b);
                assertTrue(value >= 0f && value <= 1f);
                assertEquals(value, FrameMath.hash(a, b), 0f);
            }
        }
    }

    @Test
    public void hashSpreadsValues() {
        float sum = 0f;
        for (int i = 0; i < 1000; i++) {
            sum += FrameMath.hash(i, 7);
        }
        float mean = sum / 1000f;
        assertTrue("mean " + mean, mean > 0.4f && mean < 0.6f);
    }

    @Test
    public void formatsTimecode() {
        assertEquals("00:00:00:00", FrameMath.timecode(0));
        assertEquals("00:00:01:15", FrameMath.timecode(1500));
        assertEquals("00:01:05:00", FrameMath.timecode(65_000));
        assertEquals("00:00:00:00", FrameMath.timecode(-10));
    }

    @Test
    public void blinksRec() {
        assertTrue(FrameMath.recVisible(0));
        assertTrue(FrameMath.recVisible(499));
        assertFalse(FrameMath.recVisible(500));
        assertTrue(FrameMath.recVisible(1000));
    }

    @Test
    public void cinemaBarsLeaveWideBand() {
        // 1280x720 では 2.39:1 の帯は高さ約 535.6、片側の黒帯は約 92.2。
        assertEquals(92.18f, FrameMath.cinemaBar(1280, 720), 0.05f);
        // すでに 2.39:1 より横長なら黒帯は無い。
        assertEquals(0f, FrameMath.cinemaBar(1280, 400), 0f);
    }
}
