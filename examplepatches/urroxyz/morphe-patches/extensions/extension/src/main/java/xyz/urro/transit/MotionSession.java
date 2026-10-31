package xyz.urro.transit;

/** Single-threaded, process-local ownership ledger. Never persist or infer ownership after restart.
 * Android adapter serializes calls on its main looper. Service observations are not overlay proof.
 */
public final class MotionSession {
    public enum State { UNKNOWN, OFF, ON }
    public enum Action { NONE, START, STOP }
    private long generation;
    private String session;
    private State observed = State.UNKNOWN;
    private boolean desired, owned, pending, pendingStart;
    private long dispatchedAt = -1, lastObservation = -1;

    public long generation() { return generation; }
    public boolean ownsActivation() { return owned; }
    public State observed() { return observed; }
    public boolean matchesOwner(String owner) { return java.util.Objects.equals(session, owner); }
    public boolean isCurrent(long token) { return token == generation; }

    /** Invalidates deferred work on every desired-state/session change. */
    public long desire(String trip, boolean active) {
        if (active && (trip == null || trip.isEmpty())) throw new IllegalArgumentException("trip required");
        if (desired != active || !java.util.Objects.equals(session, trip)) {
            generation++;
            // Keep confirmed ownership across a new trip so a superseded STOP cannot turn it off.
            pending = false;
            dispatchedAt = -1;
        }
        desired = active;
        session = trip;
        return generation;
    }

    /** Unknown initial state fails closed: don't claim or interrupt a manual activation. */
    public Action next(long token) {
        if (!isCurrent(token) || pending) return Action.NONE;
        if (desired && observed == State.OFF) return Action.START;
        if (!desired && owned && observed == State.ON) return Action.STOP;
        return Action.NONE;
    }

    /** Explains a decision without changing it; ON alone never proves a manual or owned session. */
    public String decision(long token) {
        if (!isCurrent(token)) return "stale_generation";
        if (pending) return pendingStart ? "pending_start" : "pending_stop";
        if (desired) {
            if (observed == State.UNKNOWN) return "external_state_unknown";
            if (observed == State.ON) return owned ? "already_owned_on" : "already_on_unowned";
            return "dispatch_start";
        }
        if (!owned) return "stop_unowned";
        return observed == State.ON ? "dispatch_stop" : "stop_state_" + observed.name().toLowerCase(java.util.Locale.ROOT);
    }
    public String diagnostic() {
        return "generation=" + generation + " desired=" + desired + " observed=" + observed
                + " owned=" + owned + " pending=" + pending + " dispatched_at=" + dispatchedAt;
    }

    public boolean dispatched(long token, Action action, long elapsed) {
        if (elapsed < 0 || action == Action.NONE || next(token) != action) return false;
        pending = true;
        pendingStart = action == Action.START;
        dispatchedAt = elapsed;
        return true;
    }

    /** timestamp must be mapped to elapsed time by adapter; only newer events confirm a command.
     * Duplicate observations must not be forwarded as fresh transitions by the adapter.
     */
    public void observe(State state, long eventElapsed) {
        if (eventElapsed < 0 || eventElapsed <= lastObservation || state == State.UNKNOWN) return;
        lastObservation = eventElapsed;
        observed = state;
        if (pending && eventElapsed > dispatchedAt) {
            if (pendingStart && state == State.ON && desired) {
                owned = true; pending = false;
            } else if (!pendingStart && state == State.OFF) {
                owned = false; pending = false;
            } else {
                // Contradictory transition: attribution lost, never blindly stop/retry.
                owned = false; pending = false;
            }
        } else if (state == State.OFF || owned) {
            // Unsolicited transitions invalidate conditional ownership, including another START.
            owned = false;
        }
    }

    public void uncertain(long token) {
        if (!isCurrent(token)) return;
        pending = false; owned = false; observed = State.UNKNOWN;
    }
}
