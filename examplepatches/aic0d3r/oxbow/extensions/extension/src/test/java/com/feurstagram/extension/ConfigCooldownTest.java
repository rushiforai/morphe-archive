package com.feurstagram.extension;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

/** Table test for the stored-entry arithmetic in {@link Config#cooldownLeft(String, long, long, int)}. */
public class ConfigCooldownTest {

    private static final long MINUTE = 60_000L;
    private static final long HOUR = 60 * MINUTE;
    private static final long DAY = 24 * HOUR;
    /** Requested 20 min after boot 7, at wall-clock time 1 000 000, with a 24 h wait. */
    private static final String ENTRY = 20 * MINUTE + "|" + 1_000_000L + "|" + DAY + "|" + 7;

    @Test
    public void sameBootCountsOnTheElapsedClockAlone() {
        assertEquals(DAY - 10 * MINUTE, Config.cooldownLeft(ENTRY, 30 * MINUTE, 1_000_000L + 99 * DAY, 7));
    }

    @Test
    public void rebootDoesNotUnCountTheWaitOnceUptimePassesTheStoredOne() {
        // 23 h in, the phone reboots; half an hour later its uptime (30 min) exceeds the 20 min stored.
        assertEquals(HOUR, Config.cooldownLeft(ENTRY, 30 * MINUTE, 1_000_000L + 23 * HOUR, 8));
    }

    @Test
    public void readyForAsLongAsTheWaitWasThenLapses() {
        assertEquals(0, Config.cooldownLeft(ENTRY, 0, 1_000_000L + DAY, 8));
        assertEquals(0, Config.cooldownLeft(ENTRY, 0, 1_000_000L + 2 * DAY - 1, 8));
        assertEquals(-1, Config.cooldownLeft(ENTRY, 0, 1_000_000L + 2 * DAY, 8));
    }

    @Test
    public void entriesWithoutAKnownBootCountKeepTheOldRule() {
        String legacy = ENTRY.substring(0, ENTRY.lastIndexOf('|'));
        assertEquals(DAY - 10 * MINUTE, Config.cooldownLeft(legacy, 30 * MINUTE, 0, 8));
        assertEquals(DAY - 10 * MINUTE, Config.cooldownLeft(ENTRY, 30 * MINUTE, 0, -1));
        assertEquals(-1, Config.cooldownLeft(legacy, 0, 1_000_000L + 2 * DAY, 8));
    }

    @Test
    public void unreadableIsNeverReady() {
        assertEquals(Integer.MAX_VALUE, Config.cooldownLeft("junk", 1, 1, 1));
    }
}
