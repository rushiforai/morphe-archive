package app.wordfeudwordfinder.extension.ui;

import app.wordfeudwordfinder.extension.core.WfError;
import app.wordfeudwordfinder.extension.play.MoveSubmitter.Result.Kind;

/**
 * Play button state (spec section 8.3), kept per controller so it outlives one open overlay. Not thread-safe: use it
 * from the main thread only.
 *
 * <ul>
 *   <li>Disabled while a request runs.</li>
 *   <li>After MV-NET (outcome unknown) disabled until the next processed games/detail. That is detected with
 *       {@code GameStore.detailGeneration()}: the count read right after the request ended is remembered, and Play
 *       comes back once the store reports a higher count. GameStore listeners also fire after a move response, so
 *       the listener call alone is not used as the signal.</li>
 *   <li>After any other result Play is enabled again.</li>
 * </ul>
 */
final class PlayState {
    enum Action { CLOSE_AND_REFRESH, SHOW_REJECTED, SHOW_ERROR }

    private boolean sending;
    private boolean blocked;
    private long blockedAtGeneration;

    /** Marks a request as started; false (and no change) when Play is not allowed right now. */
    boolean begin() {
        if (sending || blocked) return false;
        sending = true;
        return true;
    }

    /**
     * Records the result of a request. {@code detailGeneration} is the store's games/detail count read after the
     * request ended. Returns what the overlay should do.
     */
    Action onResult(Kind kind, WfError error, long detailGeneration) {
        sending = false;
        if (kind == Kind.SUCCESS) return Action.CLOSE_AND_REFRESH;
        if (kind == Kind.REJECTED) return Action.SHOW_REJECTED;
        if (error == null || "MV-NET".equals(error.code())) {
            blocked = true;
            blockedAtGeneration = detailGeneration;
        }
        return Action.SHOW_ERROR;
    }

    /** True while Play waits for a games/detail after MV-NET; clears itself once one has been processed. */
    boolean blocked(long detailGeneration) {
        if (blocked && detailGeneration > blockedAtGeneration) blocked = false;
        return blocked;
    }

    boolean canPlay(boolean hasSelection, boolean myTurn, boolean submitterBusy, long detailGeneration) {
        boolean waiting = blocked(detailGeneration);
        return hasSelection && myTurn && !submitterBusy && !sending && !waiting;
    }
}
