package io.github.sabopura.morphe.extension.twitch.original;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class RecoverPolicyTest {
    private static final long THRESHOLD = 10_000;

    private static RecoverPolicy.Action tick(RecoverPolicy policy, String state, long now) {
        return policy.tick(state, true, THRESHOLD, now);
    }

    @Test
    public void reloadsOnceBufferingOutlastsTheThreshold() {
        RecoverPolicy policy = new RecoverPolicy();
        assertEquals(RecoverPolicy.Action.NONE, tick(policy, "BUFFERING", 0));
        assertEquals(RecoverPolicy.Action.NONE, tick(policy, "BUFFERING", 9_000));
        assertEquals(RecoverPolicy.Action.RELOAD, tick(policy, "BUFFERING", 10_000));
    }

    @Test
    public void playingAgainStartsTheClockOver() {
        RecoverPolicy policy = new RecoverPolicy();
        tick(policy, "BUFFERING", 0);
        tick(policy, "PLAYING", 8_000);
        assertEquals(RecoverPolicy.Action.NONE, tick(policy, "BUFFERING", 9_000));
        assertEquals(RecoverPolicy.Action.NONE, tick(policy, "BUFFERING", 17_000));
    }

    @Test
    public void backsOffAndGivesUpAfterThreeTries() {
        RecoverPolicy policy = new RecoverPolicy();
        assertEquals(RecoverPolicy.Action.NONE, tick(policy, "BUFFERING", 0));
        assertEquals(RecoverPolicy.Action.RELOAD, tick(policy, "BUFFERING", 10_000));
        assertEquals(RecoverPolicy.Action.NONE, tick(policy, "BUFFERING", 25_000));
        assertEquals(RecoverPolicy.Action.RELOAD, tick(policy, "BUFFERING", 30_000));
        assertEquals(RecoverPolicy.Action.NONE, tick(policy, "BUFFERING", 60_000));
        assertEquals(RecoverPolicy.Action.RELOAD, tick(policy, "BUFFERING", 70_000));
        assertEquals(RecoverPolicy.Action.GIVE_UP, tick(policy, "BUFFERING", 80_000));
        assertEquals(RecoverPolicy.Action.NONE, tick(policy, "BUFFERING", 90_000));
    }

    @Test
    public void settlingAtPlayingEarnsTheTriesBack() {
        RecoverPolicy policy = new RecoverPolicy();
        tick(policy, "BUFFERING", 0);
        tick(policy, "BUFFERING", 10_000);
        tick(policy, "PLAYING", 12_000);
        tick(policy, "PLAYING", 45_000);
        tick(policy, "BUFFERING", 46_000);
        assertEquals(RecoverPolicy.Action.RELOAD, tick(policy, "BUFFERING", 56_000));
        assertEquals(1, policy.tries());
    }

    @Test
    public void pausedOrNotWatchingNeverReloads() {
        RecoverPolicy policy = new RecoverPolicy();
        assertEquals(RecoverPolicy.Action.NONE, policy.tick("BUFFERING", false, THRESHOLD, 0));
        assertEquals(RecoverPolicy.Action.NONE, policy.tick("BUFFERING", false, THRESHOLD, 60_000));
        assertEquals(RecoverPolicy.Action.NONE, tick(policy, "IDLE", 60_000));
        assertEquals(RecoverPolicy.Action.NONE, tick(policy, "BUFFERING", 61_000));
        assertEquals(RecoverPolicy.Action.RELOAD, tick(policy, "BUFFERING", 71_000));
    }
}
