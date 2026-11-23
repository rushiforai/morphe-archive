package nl.johninnl.deezer.auth;

/** Only process-local request state; never a persisted credential or authorization result. */
public final class ConsentAttempt {
    private enum State { PREPARED, OFFERED, AWAITING_RESULT, TERMINAL }
    private State state = State.PREPARED;
    private int requestCode = -1;

    public synchronized boolean isActive() { return state != State.TERMINAL; }
    public synchronized boolean isPrepared() { return state == State.PREPARED; }
    public synchronized boolean needsDecision() { return state == State.OFFERED; }

    public synchronized boolean offerResolution() {
        if (state != State.PREPARED) return false;
        state = State.OFFERED;
        return true;
    }

    public synchronized boolean beginLaunch(int code) {
        if (state != State.OFFERED || code < 0 || code > 0xffff) return false;
        requestCode = code;
        state = State.AWAITING_RESULT;
        return true;
    }

    public synchronized boolean matchesResult(int code) {
        return state == State.AWAITING_RESULT && code == requestCode;
    }

    public synchronized boolean finish() {
        if (state == State.TERMINAL) return false;
        state = State.TERMINAL;
        return true;
    }
}
