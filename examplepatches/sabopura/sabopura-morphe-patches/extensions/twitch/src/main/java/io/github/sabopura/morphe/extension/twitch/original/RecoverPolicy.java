package io.github.sabopura.morphe.extension.twitch.original;

/**
 * Decides when a stalled player gets reloaded: after {@code threshold} of buffering, then twice and
 * four times that long, at most three times, until it has played smoothly again for a while.
 */
final class RecoverPolicy {
    static final int MAX_TRIES = 3;
    private static final long SETTLED_MS = 30_000;

    enum Action { NONE, RELOAD, GIVE_UP }

    private long stalledAt = -1, playingAt = -1;
    private int tries;
    private boolean gaveUp;

    /** @param watching false pauses the clock: paused, casting, an ad cover or the app in the background. */
    Action tick(String state, boolean watching, long thresholdMs, long now) {
        if ("PLAYING".equals(state)) {
            stalledAt = -1;
            if (playingAt < 0) playingAt = now;
            if (now - playingAt >= SETTLED_MS) {
                tries = 0;
                gaveUp = false;
            }
            return Action.NONE;
        }
        playingAt = -1;
        if (!"BUFFERING".equals(state) || !watching) {
            stalledAt = -1;
            return Action.NONE;
        }
        if (stalledAt < 0) stalledAt = now;
        if (tries >= MAX_TRIES) {
            if (gaveUp) return Action.NONE;
            gaveUp = true;
            return Action.GIVE_UP;
        }
        if (now - stalledAt < thresholdMs << tries) return Action.NONE;
        tries++;
        stalledAt = now;
        return Action.RELOAD;
    }

    int tries() {
        return tries;
    }

    void reset() {
        stalledAt = playingAt = -1;
        tries = 0;
        gaveUp = false;
    }
}
