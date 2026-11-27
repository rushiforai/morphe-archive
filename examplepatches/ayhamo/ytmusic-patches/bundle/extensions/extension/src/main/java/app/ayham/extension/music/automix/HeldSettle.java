package app.ayham.extension.music.automix;

/**
 * A held player's readings around YT's speed changes (a mix's next song; automix nudges YT's silent
 * player onto the deck and ours follows). The two players take a new speed at different moments, so
 * a reading while automix's nudge runs, or within {@link #SETTLE_MS} of a followed change, is that
 * lag and not the players' distance. After a change the player is in step again only once a
 * reading past the lag has confirmed it.
 */
final class HeldSettle {
    /** A followed change's lag (S21 FE, 2026-11-19: each nudge read -23..-25 ms for a while). */
    static final long SETTLE_MS = 800;

    private volatile long changedAt = Long.MIN_VALUE / 2;
    private volatile boolean confirmed = true;

    /** A speed of YT's was followed at [now]: the readings until it settles are its lag. */
    void speedChanged(long now) {
        changedAt = now;
        confirmed = false;
    }

    /** No nudge of automix's running, and past the last followed change's lag. */
    boolean settled(long now, boolean nudging) {
        return !nudging && now - changedAt >= SETTLE_MS;
    }

    /**
     * A reading [m] ms off YT at [now]: false when it is a speed change's lag (not used for anything).
     * A settled reading within [tolerance] confirms the lock.
     */
    boolean reading(long now, boolean nudging, long m, long tolerance) {
        if (!settled(now, nudging)) return false;
        if (Math.abs(m) <= tolerance) confirmed = true;
        return true;
    }

    /** Locked (again) on a settled reading. */
    void locked() {
        confirmed = true;
    }

    /** A hand-over can take it: settled, and a reading since the last change has confirmed the lock. */
    boolean inStep(long now, boolean nudging) {
        return confirmed && settled(now, nudging);
    }
}
