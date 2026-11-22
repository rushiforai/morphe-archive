package dev.jason.gboardpatches.extension.wisprflow;

final class WisprFlowSessionState {
    enum Phase {
        STARTING(12_000), LISTENING(0), PROCESSING(30_000), CANCELING(8_000);

        private final long timeoutMs;

        Phase(long timeoutMs) {
            this.timeoutMs = timeoutMs;
        }
    }

    enum Action {
        FINISH("finish"), CANCEL("cancel");

        final String command;

        Action(String command) {
            this.command = command;
        }
    }

    private Phase phase;
    private Action queued;
    private Action sent;
    private long deadline;

    WisprFlowSessionState(long now) {
        enter(Phase.STARTING, now);
    }

    Phase phase() {
        return phase;
    }

    long deadline() {
        return deadline;
    }

    boolean canCancel() {
        return sent == null && (phase == Phase.STARTING || phase == Phase.LISTENING);
    }

    boolean canShowHeader() {
        return phase != Phase.CANCELING;
    }

    boolean queue(Action action, long now) {
        if (!canCancel() || queued == action) return false;
        queued = action;
        if (action == Action.CANCEL) enter(Phase.CANCELING, now);
        return true;
    }

    Action takeReadyAction(long now) {
        if (queued == null || (queued == Action.FINISH && phase != Phase.LISTENING)) return null;
        sent = queued;
        queued = null;
        if (sent == Action.FINISH) enter(Phase.PROCESSING, now);
        return sent;
    }

    boolean submitted() {
        return sent == Action.FINISH;
    }

    void update(Phase reported, boolean finishReply, long now) {
        if (finishReply && sent == Action.FINISH
                && (reported == Phase.STARTING || reported == Phase.LISTENING)) {
            sent = null;
            enter(reported, now);
            return;
        }
        if (phase == Phase.CANCELING || phase == Phase.PROCESSING || reported == phase) return;
        enter(reported, now);
        if (phase == Phase.PROCESSING || phase == Phase.CANCELING) queued = null;
    }

    private void enter(Phase next, long now) {
        phase = next;
        deadline = next.timeoutMs == 0 ? 0 : now + next.timeoutMs;
    }
}
