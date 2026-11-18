package io.github.sabopura.morphe.extension.twitch.danmaku;

import org.junit.Test;

import static org.junit.Assert.*;

public class LiveAgeGateTest {
    private static final long START = 1_700_000_000_000L;

    @Test
    public void replayedHistoryOnJoiningIsNotLive() {
        LiveAgeGate gate = new LiveAgeGate();
        assertFalse(gate.isLive(START - 600_000, START));
        assertFalse(gate.isLive(START - 20_000, START + 100));
        assertTrue(gate.isLive(START - 1_000, START + 200));
    }

    @Test
    public void aFastDeviceClockDoesNotHideLiveChatForever() {
        LiveAgeGate gate = new LiveAgeGate();
        long ahead = 60_000;
        assertFalse(gate.isLive(START - ahead, START));
        long later = START + 6_000;
        assertTrue(gate.isLive(later - ahead, later));
        assertTrue(gate.isLive(later + 1_000 - ahead, later + 1_000));
        assertFalse(gate.isLive(later - ahead - 20_000, later + 2_000));
    }

    @Test
    public void changingChannelStartsOver() {
        LiveAgeGate gate = new LiveAgeGate();
        gate.isLive(START, START);
        gate.isLive(START + 6_000 - 30_000, START + 6_000);
        gate.reset();
        assertFalse(gate.isLive(START + 7_000 - 30_000, START + 7_000));
    }
}
