package dev.jason.gboardpatches.extension.longpressquickactions;

/** Version-independent ownership state for one globe-drag gesture. */
final class GboardGlobeDragGestureState {
    private enum Phase {
        ACTIVE,
        FAILED_ACTIVE,
        AWAITING_TERMINAL,
        AWAITING_REPLAY,
        COMPLETE
    }

    private final long releaseGraceMs;
    private Phase phase = Phase.ACTIVE;
    private long deadline;
    private boolean targetClaimed;
    private GboardEditingShortcutPolicy.Shortcut targetShortcut;

    GboardGlobeDragGestureState(long releaseGraceMs) {
        if (releaseGraceMs <= 0L) {
            throw new IllegalArgumentException("releaseGraceMs must be positive");
        }
        this.releaseGraceMs = releaseGraceMs;
    }

    void onTargetLongPress() {
        // A popup event is not a pointer release. Keep ownership until lifecycle completion.
    }

    void onGlobeOwner() {
        if (phase == Phase.ACTIVE || phase == Phase.AWAITING_TERMINAL) {
            targetClaimed = false;
            targetShortcut = null;
        }
    }

    void onTargetOwner(GboardEditingShortcutPolicy.Shortcut shortcut) {
        if (phase == Phase.ACTIVE || phase == Phase.AWAITING_TERMINAL) {
            targetClaimed = true;
            targetShortcut = shortcut;
        }
    }

    void onPointerFinish(long now) {
        if (phase == Phase.ACTIVE) {
            phase = Phase.AWAITING_TERMINAL;
            deadline = now + releaseGraceMs;
        } else if (phase == Phase.FAILED_ACTIVE) {
            phase = Phase.AWAITING_REPLAY;
            deadline = now + releaseGraceMs;
        }
    }

    void onFailure(long now) {
        if (phase == Phase.ACTIVE) {
            phase = Phase.FAILED_ACTIVE;
            deadline = 0L;
        } else if (isAwaitingTerminal(now)) {
            phase = Phase.AWAITING_REPLAY;
            deadline = now + releaseGraceMs;
        }
    }

    void onTerminalConsumed(long now) {
        if (canConsumeTerminal(now)) {
            phase = Phase.AWAITING_REPLAY;
            deadline = now + releaseGraceMs;
        }
    }

    void onReplayConsumed() {
        phase = Phase.COMPLETE;
        deadline = 0L;
    }

    boolean isActive() {
        return phase == Phase.ACTIVE;
    }

    boolean isFailedActive() {
        return phase == Phase.FAILED_ACTIVE;
    }

    boolean ownsPointer() {
        return phase == Phase.ACTIVE || phase == Phase.FAILED_ACTIVE;
    }

    boolean hasClaimedTarget() {
        return (phase == Phase.ACTIVE || phase == Phase.AWAITING_TERMINAL)
                && targetClaimed;
    }

    boolean canCommitClaimedTargetOnPointerFinish() {
        return phase == Phase.ACTIVE && targetClaimed;
    }

    boolean canAcceptTargetOwner(long now) {
        return phase == Phase.ACTIVE || isAwaitingTerminal(now);
    }

    GboardEditingShortcutPolicy.Shortcut targetShortcut() {
        return targetShortcut;
    }

    boolean canConsumeTerminal(long now) {
        return phase == Phase.ACTIVE || isAwaitingTerminal(now);
    }

    boolean isAwaitingTerminal(long now) {
        return phase == Phase.AWAITING_TERMINAL && deadline >= now;
    }

    boolean isAwaitingReplay(long now) {
        return phase == Phase.AWAITING_REPLAY && deadline >= now;
    }

    boolean isComplete() {
        return phase == Phase.COMPLETE;
    }

    boolean expire(long now) {
        if ((phase == Phase.AWAITING_TERMINAL || phase == Phase.AWAITING_REPLAY)
                && now > deadline) {
            phase = Phase.COMPLETE;
            deadline = 0L;
            return true;
        }
        return phase == Phase.COMPLETE;
    }
}
