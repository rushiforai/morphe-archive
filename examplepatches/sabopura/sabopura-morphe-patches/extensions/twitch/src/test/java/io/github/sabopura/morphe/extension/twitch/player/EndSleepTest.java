package io.github.sabopura.morphe.extension.twitch.player;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class EndSleepTest {
    private static final String VOD = "playlist:/6a87209cc7e6_somebody_316709179505_1794618002/chunked";

    private final Object player = new Object();
    private final EndSleep sleep = new EndSleep();

    @Test
    public void nothingWaitsUntilItIsSet() {
        assertFalse(sleep.waiting());
        assertFalse(sleep.reached());
    }

    @Test
    public void theEndIsReachedOnce() {
        sleep.set(player, VOD);
        assertTrue(sleep.waiting());
        assertTrue(sleep.reached());
        assertFalse(sleep.waiting());
        assertFalse(sleep.reached());
    }

    @Test
    public void anotherVideoOnThePlayerForgetsTheWait() {
        sleep.set(player, VOD);
        sleep.loading(player, "/vod/123.m3u8");
        assertFalse(sleep.waiting());
        assertFalse(sleep.reached());
    }

    @Test
    public void theSameVideoLoadedAgainKeepsTheWait() {
        sleep.set(player, VOD);
        sleep.loading(player, VOD);
        assertTrue(sleep.waiting());
    }

    @Test
    public void whatAnotherPlayerLoadsOrLosesChangesNothing() {
        // A preview in the feed runs its own player while the video goes on.
        Object preview = new Object();
        sleep.set(player, VOD);
        sleep.loading(preview, "playlist:/v1/playlist");
        sleep.released(preview);
        assertTrue(sleep.waiting());
    }

    @Test
    public void closingThePlayerForgetsTheWait() {
        sleep.set(player, VOD);
        sleep.released(player);
        assertFalse(sleep.waiting());
    }

    @Test
    public void clearingForgetsTheWait() {
        sleep.set(player, VOD);
        sleep.clear();
        assertFalse(sleep.reached());
    }

    @Test
    public void aLoadBeforeAnythingWaitsIsIgnored() {
        sleep.loading(player, VOD);
        sleep.released(player);
        assertFalse(sleep.waiting());
    }
}
