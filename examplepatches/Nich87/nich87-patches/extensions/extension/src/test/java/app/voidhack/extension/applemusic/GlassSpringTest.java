package app.voidhack.extension.applemusic;

import org.junit.Test;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class GlassSpringTest {
    @Test public void settlesAtTheDestinationAcrossRefreshRates() {
        for (int rate : new int[]{30, 60, 90, 120, 240}) {
            GlassSpring spring = new GlassSpring(520f, 0.78f, 0.15f);
            spring.target = 1000f;

            for (int frame = 0; frame < rate * 4; frame++) {
                spring.advance(1f / rate);
                assertTrue("Unstable motion at " + rate + " Hz", Float.isFinite(spring.value));
                assertTrue("Unbounded overshoot at " + rate + " Hz", spring.value < 1050f);
            }

            assertEquals("Did not settle at " + rate + " Hz", 1000f, spring.value, 0.15f);
            assertEquals(0f, spring.velocity, 0.15f);
        }
    }

    @Test public void collisionCompressesThenReboundsAndSettles() {
        GlassSpring spring = new GlassSpring(360f, 0.38f, 0.001f);
        spring.velocity = -2.8f;
        float minimum = 0f;
        float maximum = 0f;

        for (int frame = 0; frame < 240; frame++) {
            spring.advance(1f / 120f);
            minimum = Math.min(minimum, spring.value);
            maximum = Math.max(maximum, spring.value);
        }

        assertTrue("Collision did not compress the lens", minimum < -0.04f);
        assertTrue("Lens did not rebound", maximum > 0.005f);
        assertEquals(0f, spring.value, 0.001f);
    }

    @Test public void changingDirectionPreservesMomentumBeforeReturning() {
        GlassSpring spring = new GlassSpring(520f, 0.78f, 0.15f);
        spring.target = 1000f;
        for (int frame = 0; frame < 6; frame++) spring.advance(1f / 120f);
        float before = spring.value;

        spring.target = 0f;
        spring.advance(1f / 240f);

        assertTrue("Retargeting discarded momentum", spring.value > before);
        for (int frame = 0; frame < 480; frame++) spring.advance(1f / 120f);
        assertEquals(0f, spring.value, 0.15f);
    }

    @Test public void trajectoryIsConsistentAcrossFrameRates() {
        GlassSpring slow = new GlassSpring(520f, 0.78f, 0.15f);
        GlassSpring fast = new GlassSpring(520f, 0.78f, 0.15f);
        slow.target = fast.target = 1000f;

        for (int frame = 0; frame < 9; frame++) slow.advance(1f / 30f);
        for (int frame = 0; frame < 36; frame++) fast.advance(1f / 120f);

        assertEquals("Motion depends on screen refresh rate", slow.value, fast.value, 3f);
    }
}
