package io.github.sabopura.morphe.extension.twitch.original;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class StatsTest {
    private static final long MINUTE = 60_000;

    @Test
    public void watchedTimeReadsInMinutesUntilAnHour() {
        assertEquals("0", Stats.watchedNumber(0));
        assertEquals("59", Stats.watchedNumber(59 * MINUTE + 59_000));
        assertFalse(Stats.watchedInHours(59 * MINUTE));
    }

    @Test
    public void watchedTimeReadsInHoursWithOneDecimalFromAnHour() {
        assertTrue(Stats.watchedInHours(60 * MINUTE));
        assertEquals("1.0", Stats.watchedNumber(60 * MINUTE));
        assertEquals("1.5", Stats.watchedNumber(90 * MINUTE));
        assertEquals("1234.5", Stats.watchedNumber(1234 * 60 * MINUTE + 30 * MINUTE));
    }
}
