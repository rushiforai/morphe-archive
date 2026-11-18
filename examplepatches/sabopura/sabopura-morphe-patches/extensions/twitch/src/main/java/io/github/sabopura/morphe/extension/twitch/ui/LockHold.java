package io.github.sabopura.morphe.extension.twitch.ui;

/** Tells a hold on the lock button from a tap. Times are milliseconds on one clock. */
final class LockHold {
    static final long HOLD_MS = 1000;

    enum Outcome {NOTHING, HINT, UNLOCK}

    private long since = -1;

    void press(long now) {
        since = now;
    }

    boolean pressed() {
        return since >= 0;
    }

    /** The finger slid off the button or the touch was taken away: neither a tap nor a hold. */
    void cancel() {
        since = -1;
    }

    /** The finger lifted: a hold the timer has not reported yet still unlocks. */
    Outcome release(long now) {
        if (!pressed()) return Outcome.NOTHING;
        boolean held = now - since >= HOLD_MS;
        since = -1;
        return held ? Outcome.UNLOCK : Outcome.HINT;
    }

    /** A timer set at a press came due. One left over from an earlier, shorter press changes nothing. */
    Outcome due(long now) {
        if (!pressed() || now - since < HOLD_MS) return Outcome.NOTHING;
        since = -1;
        return Outcome.UNLOCK;
    }
}
