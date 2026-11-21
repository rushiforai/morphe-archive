package e.e.a;

import java.util.ArrayDeque;

public final class CommentViewportRegression {
    public static void main(String[] args) {
        ScrollingTimeline267 timeline = new ScrollingTimeline267();
        ArrayDeque<ScrollingTimeline267.Entry> waiting = new ArrayDeque<>();
        timeline.resizeViewport(1L, 1440, 810, 60f, 0f, waiting);
        timeline.frame(1L, 0f, 0f);
        ScrollingTimeline267.Entry active = entry(1440, 60f);
        ScrollingTimeline267.Entry queued = entry(1440, 60f);
        timeline.active.add(active);
        waiting.add(queued);
        float exit = 2f + active.right(2f) / active.speed;
        float originalX = active.left(2f);

        timeline.resizeViewport(1L, 480, 270, 20f, 2f, waiting);
        close(20f, active.size);
        close(20f, queued.size);
        close(40f, active.top);
        close(exit, 2f + active.right(2f) / active.speed);

        float speed = active.speed;
        timeline.resizeViewport(1L, 480, 270, 20f, 2.5f, waiting);
        timeline.resizeViewport(1L, 0, 0, 0f, 2.5f, waiting);
        close(speed, active.speed);
        close(2f, active.start);

        timeline.resizeViewport(1L, 1440, 810, 60f, 2f, waiting);
        close(60f, active.size);
        close(60f, queued.size);
        close(originalX, active.left(2f));
        close(120f, active.top);
        if (timeline.active.get(0) != active || waiting.peekFirst() != queued) {
            throw new AssertionError("viewport changes must preserve comment identity");
        }

        timeline.resizeViewport(1L, 810, 1440, 90f, 3f, waiting);
        close(90f, active.size);
        close(exit, 3f + active.right(3f) / active.speed);
        timeline.frame(1L, exit + 1f, exit + 1f);
        if (!timeline.active.isEmpty()) throw new AssertionError("comment must expire");
        System.out.println("PASS: viewport resize preserves active and queued comments, progress, and expiration");
    }

    private static ScrollingTimeline267.Entry entry(int width, float size) {
        return new ScrollingTimeline267.Entry(new Object(), new String[]{"comment"}, -1,
                width + 2f, 0f, 320f, 160f, size, 120f, -52f, 64f, 2f);
    }

    private static void close(float expected, float actual) {
        if (Math.abs(expected - actual) > .01f) {
            throw new AssertionError("expected " + expected + ", got " + actual);
        }
    }
}
