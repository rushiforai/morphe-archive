package xyz.urro.transit;

/** Pure decision engine. Adapter must schedule tick with monotonic time and current session/leg. */
public final class BoardingDetector {
    public enum State { GO_INACTIVE, GO_ACTIVE_NOT_ON_BUS, GO_BUS_PENDING_45S, GO_BUS_CONFIRMED }
    public interface Control { boolean acquire(String owner); void release(String owner); }
    private final Control control;
    private String key;
    private long since = -1, last = -1;
    private boolean owned;
    private State state = State.GO_INACTIVE;
    public BoardingDetector(Control control) { this.control = control; }
    public State state() { return state; }
    public long remaining(long elapsed) { return since < 0 ? 45000 : Math.max(0, 45000 - (elapsed - since)); }
    private void reset() {
        if (owned) control.release(key);
        owned = false; since = -1; key = null;
    }
    public void update(long elapsed, String session, String leg, boolean active, boolean bus,
                       boolean onboard, boolean enabled) {
        if (elapsed < 0 || (last >= 0 && elapsed < last)) {
            reset(); state = State.GO_INACTIVE; last = elapsed; return;
        }
        last = elapsed;
        if (!active || session == null || leg == null || !enabled || !bus || !onboard) {
            reset(); state = active ? State.GO_ACTIVE_NOT_ON_BUS : State.GO_INACTIVE; return;
        }
        // Length-prefix avoids ambiguous concatenation identities.
        String next = session.length() + ":" + session + leg;
        if (!next.equals(key)) { reset(); key = next; since = elapsed; }
        if (elapsed - since < 45000) { state = State.GO_BUS_PENDING_45S; return; }
        state = State.GO_BUS_CONFIRMED;
        if (!owned) owned = control.acquire(key);
    }
    public void close() { reset(); state = State.GO_INACTIVE; }
}
