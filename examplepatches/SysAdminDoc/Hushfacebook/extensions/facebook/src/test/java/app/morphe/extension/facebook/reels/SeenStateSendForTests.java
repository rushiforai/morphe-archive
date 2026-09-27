/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

/**
 * Stands in for the runnable Facebook's seen-state helper hands its executor. Redex leaves the
 * helper's name on that class in a static field, which is how the hook tells it from any other.
 */
public final class SeenStateSendForTests implements Runnable {
    @SuppressWarnings("unused")
    public static final String __redex_internal_original_name = ReelWatchHistory.SEEN_STATE_SEND;

    boolean ran;

    @Override
    public void run() {
        ran = true;
    }

    /**
     * Hands a fresh send to the hook, with an executor that runs it on the spot. True when the hook
     * held it back, which is the switch changing what Facebook would have done.
     */
    public static boolean heldBack() {
        SeenStateSendForTests send = new SeenStateSendForTests();
        ReelWatchHistory.send(Runnable::run, send);
        return !send.ran;
    }
}
