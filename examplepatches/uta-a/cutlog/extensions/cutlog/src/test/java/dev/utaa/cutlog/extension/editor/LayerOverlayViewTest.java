package dev.utaa.cutlog.extension.editor;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class LayerOverlayViewTest {
    /** 2 本指で何周回しても、角度は -180〜180 度に収める（角度のスライダーの範囲）。 */
    @Test
    public void normalizesDegreesIntoSliderRange() {
        assertEquals(0f, LayerOverlayView.normalizeDegrees(0f), 0.001f);
        assertEquals(180f, LayerOverlayView.normalizeDegrees(180f), 0.001f);
        assertEquals(180f, LayerOverlayView.normalizeDegrees(-180f), 0.001f);
        assertEquals(-170f, LayerOverlayView.normalizeDegrees(190f), 0.001f);
        assertEquals(170f, LayerOverlayView.normalizeDegrees(-190f), 0.001f);
        assertEquals(30f, LayerOverlayView.normalizeDegrees(750f), 0.001f);
        assertEquals(-30f, LayerOverlayView.normalizeDegrees(-750f), 0.001f);
    }
}
