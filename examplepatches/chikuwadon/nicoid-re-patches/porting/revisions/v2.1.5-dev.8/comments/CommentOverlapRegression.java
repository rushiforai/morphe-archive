package e.e.a;

import java.util.ArrayDeque;

/** Standalone regression tests for strict-mode viewport-aware admission. */
public final class CommentOverlapRegression {
    private static ScrollingTimeline267.Entry entry(float width, float height, float top, float start) {
        return new ScrollingTimeline267.Entry(new Object(), new String[]{"test"}, -1,
                302f, start, 1f, width, 20f, top, -18f, height, 2f);
    }
    private static void require(boolean ok, String message) {
        if (!ok) throw new AssertionError(message);
    }
    private static ScrollingTimeline267 base() {
        ScrollingTimeline267 timeline = new ScrollingTimeline267();
        timeline.resizeViewport(1L, 300, 100, 20f, 0f, new ArrayDeque<>());
        timeline.frame(1L, 0f, 0f);
        return timeline;
    }
    public static void main(String[] args) {
        ScrollingTimeline267 t = base();
        ScrollingTimeline267.Entry blocker = entry(100f, 70f, 0f, 0f);
        t.active.add(blocker);
        ArrayDeque<ScrollingTimeline267.Entry> wait = new ArrayDeque<>();
        ScrollingTimeline267.Entry tall = entry(100f, 100f, 0f, 0f);
        ScrollingTimeline267.Entry shortOne = entry(100f, 10f, 0f, 0f);
        wait.addLast(tall); wait.addLast(shortOne);
        t.showWaiting(wait, true, 300, 100, 10, 0f, new ScrollingTimeline267.FrameBudget());
        require(t.active.size() == 2, "fitting following comment should be admitted");
        require(t.active.get(1) == shortOne, "accepted comment identity must be preserved");
        require(wait.size() == 1 && wait.peekFirst() == tall, "blocked head must remain queued");
        require(t.skippedByOverlap == 0L, "must not discard before timeout");
        t.showWaiting(wait, true, 300, 100, 10, 9.9f, new ScrollingTimeline267.FrameBudget());
        require(t.skippedByOverlap == 0L, "not expired before 100ms of animation");
        t.showWaiting(wait, true, 300, 100, 10, 10.01f, new ScrollingTimeline267.FrameBudget());
        require(t.skippedByOverlap == 1L && wait.isEmpty(), "expired blocked item must be skipped");
        require(t.active.size() == 2, "skipping queued item must not erase active ones");

        ScrollingTimeline267 t2 = base();
        ArrayDeque<ScrollingTimeline267.Entry> w2 = new ArrayDeque<>();
        ScrollingTimeline267.Entry queued = entry(100f, 100f, 0f, 0f);
        w2.add(queued);
        t2.active.add(entry(100f, 100f, 0f, 0f));
        t2.showWaiting(w2, true, 300, 100, 10, 5f, new ScrollingTimeline267.FrameBudget());
        t2.resizeViewport(1L, 600, 200, 40f, 5f, w2);
        require(queued.waitOrigin == 0f, "viewport resize may not extend waiting deadline");
        t2.showWaiting(w2, true, 600, 200, 10, 5f, new ScrollingTimeline267.FrameBudget());
        require(t2.skippedByOverlap == 0, "paused clock must not expire");
        t2.showWaiting(w2, true, 600, 200, 10, 10.5f, new ScrollingTimeline267.FrameBudget());
        require(t2.skippedByOverlap == 1L, "time limit must survive viewport change");

        ScrollingTimeline267 t3 = base();
        t3.active.add(entry(100f, 100f, 0f, 0f));
        ArrayDeque<ScrollingTimeline267.Entry> w3 = new ArrayDeque<>();
        ScrollingTimeline267.Entry overlap = entry(100f, 100f, 0f, 0f);
        w3.add(overlap);
        t3.showWaiting(w3, false, 300, 100, 10, 20f, new ScrollingTimeline267.FrameBudget());
        require(w3.isEmpty() && t3.active.contains(overlap), "OFF mode must show all");
        require(t3.skippedByOverlap == 0L, "OFF mode must not discard");
        System.out.println("PASS: strict lookahead, collision timeout, resize/pause, and OFF-mode coverage");
    }
}
