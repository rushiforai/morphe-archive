import app.afterglow.extension.playback.FullscreenSession;

/** Session races that could otherwise move a different video into or out of fullscreen. */
public final class FullscreenSessionTest {
    private static int checks;
    private static void check(boolean result, String message) {
        checks++;
        if (!result) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        FullscreenSession session = new FullscreenSession();
        Object first = new Object(), second = new Object();
        check(session.claimEntry() < 0, "No playback cannot claim entry");
        session.update(first, "");
        check(session.claimEntry() < 0, "A preloaded director without an ID cannot claim entry");
        session.update(first, "video-A");
        long initial = session.claimEntry();
        check(initial >= 0, "First content activation can enter");
        check(session.claimEntry() < 0, "Repeated status or manual fullscreen exit cannot reenter");
        check(session.matches(initial, first, "video-A"), "The delayed action keeps its original player");
        session.update(first, "video-B");
        session.update(first, "video-A");
        check(!session.matches(initial, first, "video-A"), "A to B to A invalidates the old callback");
        long revisited = session.claimEntry();
        check(revisited > initial, "Returning to a video starts a new activation");
        check(!session.matches(revisited, second, "video-A"), "A replacement director invalidates the old action");
        long replaced = session.claimEntry();
        check(replaced > revisited, "Reopened same-ID playback can enter");
        session.clear();
        check(!session.matches(replaced, second, "video-A"), "Closing the watch player cancels pending work");
        long reopened = session.claimEntry();
        check(reopened > replaced, "Reopening after close starts a fresh session");
        check(session.matches(reopened, second, "video-A"), "Repeated observation keeps the session");
        check(!session.matches(reopened, null, "video-A"), "Destroyed controller cancels pending work");
        check(session.claimEntry() < 0, "A dead controller never consumes an activation");
        session.update(first, null);
        check(session.claimEntry() < 0, "Missing video ID is tolerated");
        System.out.println("PASS fullscreen sessions: " + checks + " checks");
    }
}
