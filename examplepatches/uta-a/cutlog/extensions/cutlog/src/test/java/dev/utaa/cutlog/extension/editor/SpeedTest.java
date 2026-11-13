package dev.utaa.cutlog.extension.editor;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class SpeedTest {
    @Test
    public void computesOutputLength() {
        assertEquals(1033, Speed.outputMs(2066, 2f));
        assertEquals(4132, Speed.outputMs(2066, 0.5f));
        assertEquals(2066, Speed.outputMs(2066, 1f));
    }

    /** 書き出した長さが 1〜15 秒に収まる速度だけ選べる。 */
    @Test
    public void limitsOutputLength() {
        assertTrue(Speed.allowed(2066, 2f));
        assertTrue(Speed.allowed(2066, 0.5f));
        assertFalse(Speed.allowed(10_000, 0.5f));
        assertTrue(Speed.allowed(10_000, 0.75f));
        assertFalse(Speed.allowed(1500, 2f));
        assertTrue(Speed.allowed(15_000, 1f));
    }

    @Test
    public void rescalesRangesToSameScene() {
        // 1x で 1000ms の場面は、2x では 500ms、0.5x では 2000ms。
        assertEquals(500, Speed.rescale(1000, 1f, 2f));
        assertEquals(2000, Speed.rescale(1000, 1f, 0.5f));
        assertEquals(1000, Speed.rescale(500, 2f, 1f));
        assertEquals(Layer.UNTIL_END, Speed.rescale(Layer.UNTIL_END, 1f, 2f));
    }

    @Test
    public void labels() {
        assertEquals("2x", Speed.label(2f));
        assertEquals("0.75x", Speed.label(0.75f));
    }
}
