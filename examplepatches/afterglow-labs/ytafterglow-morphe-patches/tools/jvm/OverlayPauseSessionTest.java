import app.afterglow.extension.playback.OverlayPauseSession;
import java.util.ArrayList;
import java.util.List;

/** Behavioral traces for duplicate callbacks, feedback, and player availability. */
public final class OverlayPauseSessionTest {
    private static int checks;
    private static void check(String label, Object want, Object got) {
        checks++;
        if (!want.equals(got)) throw new AssertionError(label + ": expected " + want + ", got " + got);
    }
    private static final class Owner {
        final OverlayPauseSession session = new OverlayPauseSession();
        final List<String> requests = new ArrayList<>();
        boolean enabled, foreground = true, ready = true, fail;
        long revision;
        Runnable feedback;
        void visibility(boolean shown) {
            if (!session.begin(enabled, foreground, revision, shown)) return;
            boolean accepted = false;
            try {
                if (fail) throw new IllegalStateException("native request failed");
                if (!ready) return;
                requests.add(shown ? "pause" : "play");
                if (feedback != null) feedback.run();
                accepted = true;
            } finally { session.end(accepted); }
        }
        void expect(String label, String... expected) { check(label, List.of(expected), requests); }
    }
    public static void main(String[] args) {
        Owner a = new Owner();
        a.visibility(true); a.visibility(false); a.expect("default off");
        a.enabled = true;
        a.visibility(true); a.expect("show pauses", "pause");
        for (int i = 0; i < 100; i++) a.visibility(true);
        a.expect("duplicate updates do not fight a native manual play", "pause");
        a.visibility(false); a.expect("hide plays", "pause", "play");
        for (int i = 0; i < 100; i++) a.visibility(false);
        a.expect("duplicate hidden update", "pause", "play");
        a.visibility(true); a.expect("next appearance", "pause", "play", "pause");

        Owner b = new Owner(); b.enabled = true;
        b.visibility(true); b.expect("owners are independent", "pause");
        a.expect("other owner unchanged", "pause", "play", "pause");
        b.enabled = false; b.visibility(false); b.expect("live off never resumes", "pause");
        b.enabled = true; b.visibility(true); b.expect("live on can observe same state", "pause", "pause");
        b.revision++; b.visibility(true); b.expect("preference replacement invalidates observation", "pause", "pause", "pause");
        b.visibility(true); b.expect("new revision still deduplicates", "pause", "pause", "pause");
        b.enabled = false; b.revision++; b.visibility(true); b.visibility(false);
        b.expect("reset remains off", "pause", "pause", "pause");

        Owner c = new Owner(); c.enabled = true; c.foreground = false;
        c.visibility(true); c.visibility(false); c.expect("background ignored");
        c.foreground = true; c.visibility(false); c.expect("foreground transition", "play");
        c.foreground = false; c.visibility(false); c.expect("detached callback ignored", "play");
        c.foreground = true; c.visibility(false); c.expect("reattached may retry", "play", "play");

        Owner d = new Owner(); d.enabled = true;
        d.feedback = () -> { d.visibility(false); d.visibility(true); };
        d.visibility(true); d.expect("synchronous feedback cannot recurse", "pause");
        d.visibility(true); d.expect("asynchronous same-state feedback ignored", "pause");
        d.visibility(false); d.expect("subsequent real dismissal works", "pause", "play");
        d.feedback = () -> { d.enabled = false; d.visibility(false); d.enabled = true; };
        d.visibility(true); d.visibility(true); d.expect("reentrant off does not clear active request", "pause", "play", "pause");

        Owner e = new Owner(); e.enabled = true; e.ready = false;
        e.visibility(true); e.expect("loading or ended native player rejects request");
        e.ready = true; e.visibility(true); e.expect("same state retries when ready", "pause");
        e.visibility(true); e.expect("accepted retry deduplicated", "pause");
        e.ready = false; e.visibility(false); e.expect("unavailable dismissal", "pause");
        e.ready = true; e.visibility(false); e.expect("ready dismissal retried", "pause", "play");
        e.fail = true;
        try { e.visibility(true); throw new AssertionError("expected native failure"); }
        catch (IllegalStateException expected) { checks++; }
        e.expect("failed request changes no playback", "pause", "play");
        e.fail = false; e.visibility(true); e.expect("exception releases guard", "pause", "play", "pause");
        System.out.println(checks + " overlay pause checks passed");
    }
}
