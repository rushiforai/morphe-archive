package io.github.sabopura.morphe.extension.twitch.danmaku;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class StreamDelayTest {
    @Test
    public void aViewerAsCloseAsTheChattersDoesNotWait() {
        assertEquals(0L, StreamDelay.hold(2_000));
        assertEquals(0L, StreamDelay.hold(StreamDelay.TYPICAL_MS));
    }

    @Test
    public void aViewerFurtherBehindWaitsTheDifference() {
        assertEquals(9_000L, StreamDelay.hold(12_000));
    }

    @Test
    public void anUnknownLatencyDoesNotWait() {
        assertEquals(0L, StreamDelay.hold(0));
        assertEquals(0L, StreamDelay.hold(-1));
    }

    @Test
    public void aStalledPlayerDoesNotHoldCommentsForMinutes() {
        assertEquals(StreamDelay.MAX_MS, StreamDelay.hold(600_000));
    }
}
