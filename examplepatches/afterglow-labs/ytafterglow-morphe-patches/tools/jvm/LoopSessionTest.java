import app.afterglow.extension.playback.LoopSession;

/** Delayed restores must not affect a new/closed player or record startup resets. */
public final class LoopSessionTest {
    private static int checks;
    private static void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        LoopSession s = new LoopSession();
        Object a = new Object(), b = new Object();
        check(s.claim() < 0, "No player cannot restore");
        s.update(a, null, true);
        check(s.claim() < 0, "A preloaded player without an ID cannot restore");
        s.update(a, "A", false);
        check(s.claim() < 0, "Disabled activation cannot restore");
        s.update(a, "A", true);
        check(s.claim() < 0, "Enabling during playback waits for the next activation");
        s.update(a, "B", true);
        long first = s.claim();
        check(first >= 0, "Enabled activation schedules restoration");
        check(!s.canRecord(a, "B"), "Startup changes cannot overwrite the saved mode");
        check(s.claim() < 0, "Repeated statuses cannot duplicate delayed work");
        s.invalidatePending();
        check(!s.matches(first, a, "B"), "A new host invalidates the old callback");
        long replacement = s.claim();
        check(replacement > first, "The replacement host can schedule work");
        s.finish(first, true);
        check(!s.canRecord(a, "B"), "A stale completion cannot mark the new host ready");
        check(s.claim() < 0, "A stale completion cannot clear current pending work");
        s.finish(replacement, false);
        check(!s.canRecord(a, "B"), "An interrupted restoration cannot record");
        long retry = s.claim();
        check(retry == replacement, "A later event can retry the current activation");
        s.finish(retry, true);
        check(s.canRecord(a, "B"), "Explicit choices can be saved after restoration");
        check(!s.canRecord(b, "B"), "A different director cannot save a choice");
        check(!s.canRecord(a, "C"), "A different video cannot save an old choice");
        check(s.claim() < 0, "Restoration does not repeat after a manual change");
        s.update(a, "C", true);
        s.update(a, "B", true);
        check(!s.matches(retry, a, "B"), "A to B to A rejects the old callback");
        check(!s.canRecord(a, "B"), "A new activation resets the recording guard");
        long revisit = s.claim();
        s.update(b, "B", true);
        check(!s.matches(revisit, b, "B"), "Same-ID player replacement rejects old work");
        long reopened = s.claim();
        check(reopened > revisit, "Same-ID replacement starts a fresh activation");
        s.clear();
        check(!s.matches(reopened, b, "B"), "Closing playback cancels delayed work");
        s.finish(reopened, true);
        check(!s.canRecord(b, "B"), "Completion after close cannot record");
        check(s.claim() < 0, "Closed playback cannot schedule more work");
        s.update(a, "A", true);
        long last = s.claim();
        s.update(null, "A", true);
        check(!s.matches(last, null, "A"), "A destroyed controller cancels restoration");
        check(s.claim() < 0, "A destroyed controller cannot restore");
        System.out.println("PASS loop sessions: " + checks + " checks");
    }
}
