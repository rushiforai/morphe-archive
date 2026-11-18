package io.github.sabopura.morphe.extension.twitch.app;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import org.junit.Test;

public class LatencyBadgeTest {
    @Test
    public void textUsesTenthsBelowTenSeconds() {
        assertEquals("1.8 s", LatencyBadge.text(1849));
        assertEquals("9.9 s", LatencyBadge.text(9900));
        assertEquals("10 s", LatencyBadge.text(10_999));
    }

    @Test
    public void colourChangesAtFiveAndTenSeconds() {
        assertEquals(LatencyBadge.color(1), LatencyBadge.color(4_999));
        assertEquals(LatencyBadge.color(5_000), LatencyBadge.color(9_999));
        assertEquals(LatencyBadge.color(10_000), LatencyBadge.color(60_000));
        assertNotEquals(LatencyBadge.color(4_999), LatencyBadge.color(5_000));
        assertNotEquals(LatencyBadge.color(9_999), LatencyBadge.color(10_000));
    }
}
