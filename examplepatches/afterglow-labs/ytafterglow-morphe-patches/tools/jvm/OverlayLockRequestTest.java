import app.afterglow.extension.playback.OverlayLockRequest;

/** User requests across asynchronous fullscreen, video changes and backgrounding. */
public final class OverlayLockRequestTest {
    private static int checks;
    private static void check(String label, Object expected, Object actual) {
        checks++;
        if (!expected.equals(actual)) throw new AssertionError(label + ": " + actual);
    }
    public static void main(String[] args) {
        Object owner = new Object(), another = new Object();
        OverlayLockRequest r = new OverlayLockRequest();
        check("no click cannot lock", r.CANCEL, r.advance(owner, "one", 0, true, true, true));
        r.begin(null, "one", 0); check("missing owner", false, r.pending());
        r.begin(owner, "", 0); check("missing video", false, r.pending());
        r.begin(owner, "one", 100);
        for (int time = 100; time < 900; time += 100) {
            check("native fullscreen still loading " + time, r.WAIT,
                    r.advance(owner, "one", time, true, true, false));
        }
        check("fullscreen completes for original video", r.APPLY, r.advance(owner, "one", 900, true, true, true));
        check("applies once", r.CANCEL, r.advance(owner, "one", 901, true, true, true));
        r.begin(owner, "one", 0);
        check("new native owner cancels", r.CANCEL, r.advance(another, "one", 1, true, true, true));
        r.begin(owner, "one", 0);
        check("next video cancels", r.CANCEL, r.advance(owner, "two", 1, true, true, true));
        r.begin(owner, "one", 0);
        check("background cancels", r.CANCEL, r.advance(owner, "one", 1, false, true, true));
        check("return to foreground cannot replay", r.CANCEL, r.advance(owner, "one", 2, true, true, true));
        r.begin(owner, "one", 0);
        check("live setting off cancels", r.CANCEL, r.advance(owner, "one", 1, true, false, true));
        r.begin(owner, "one", 0);
        check("deadline rejects late fullscreen", r.CANCEL, r.advance(owner, "one", 2000, true, true, true));
        r.begin(owner, "one", 0); r.cancel();
        check("explicit cancellation", r.CANCEL, r.advance(owner, "one", 1, true, true, true));
        r.begin(owner, "one", 0); r.begin(another, "two", 1000);
        check("new click uses its own video and deadline", r.APPLY, r.advance(another, "two", 2500, true, true, true));
        System.out.println(checks + " overlay button request checks passed");
    }
}
