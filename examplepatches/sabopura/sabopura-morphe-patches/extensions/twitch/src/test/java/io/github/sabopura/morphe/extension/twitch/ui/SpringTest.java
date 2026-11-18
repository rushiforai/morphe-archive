package io.github.sabopura.morphe.extension.twitch.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class SpringTest {
    private static int settle(Spring spring) {
        int frames = 0;
        while (spring.step(1 / 60f, 8, 1e-3f, 1e-2f) && frames < 10000) frames++;
        return frames;
    }

    @Test
    public void settleSpringArrivesExactly() {
        Spring spring = new Spring(0).tune(380, 34, 1);
        spring.target = 100;
        settle(spring);
        assertEquals(100, spring.value, 0);
        assertEquals(0, spring.velocity, 0);
    }

    @Test
    public void underDampedSpringOvershootsOnce() {
        Spring spring = new Spring(0).tune(500, 18, .9f);
        spring.target = 100;
        float peak = 0;
        for (int i = 0; i < 300 && spring.step(1 / 60f, 8, 1e-3f, 1e-2f); i++) peak = Math.max(peak, spring.value);
        assertTrue("overshoots past the target, as the confirm pill springs open", peak > 100);
        assertTrue("but not wildly", peak < 150);
        assertEquals(100, spring.value, 1);
    }

    @Test
    public void frameRateDoesNotChangeWhereItEnds() {
        Spring coarse = new Spring(0).tune(380, 34, 1), fine = new Spring(0).tune(380, 34, 1);
        coarse.target = fine.target = 50;
        for (int i = 0; i < 60; i++) coarse.step(1 / 60f, 8, 1e-3f, 1e-2f);
        for (int i = 0; i < 120; i++) fine.step(1 / 120f, 8, 1e-3f, 1e-2f);
        assertEquals(coarse.value, fine.value, .5f);
    }

    @Test
    public void frameSpringMatchesTheFreeBlockFormula() {
        assertEquals(.112, FrameSpring.stiffnessOf(20), 1e-9);
        assertEquals(.66, FrameSpring.decayOf(20), 1e-9);
        FrameSpring spring = new FrameSpring(0);
        spring.target = 48;
        int frames = 0;
        while (spring.step(1, FrameSpring.stiffnessOf(20), FrameSpring.decayOf(20), .02) && frames < 1000) frames++;
        assertEquals(48, spring.position, 0);
        assertFalse(spring.step(1, FrameSpring.stiffnessOf(20), FrameSpring.decayOf(20), .02));
    }

    @Test
    public void easeEndsAreExactAndOvershootCurvesPassOne() {
        assertEquals(0, Ease.bezier(Ease.OUT, 0), 0);
        assertEquals(1, Ease.bezier(Ease.OUT, 1), 0);
        float max = 0;
        for (float t = 0; t <= 1; t += .01f) max = Math.max(max, Ease.bezier(.34f, 1.45f, .64f, 1f, t));
        assertTrue(max > 1);
        assertEquals(.5f, Ease.bezier(.25f, .25f, .75f, .75f, .5f), .02f);
    }
}
