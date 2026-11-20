package e.e.a;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashSet;

/** CPU-only regression: no Canvas, Android scheduler, or GPU time is simulated. */
public final class CommentBudgetRegression {
    private static void check(boolean ok, String why) {
        if (!ok) throw new AssertionError(why);
    }

    private static ScrollingTimeline267.Entry entry(int order) {
        return new ScrollingTimeline267.Entry("renderer", new String[]{"text-" + order},
                -1, 720, 0, 3, 150, 24, 0, -24, 32, 2);
    }

    private static void releaseTest(int count, boolean strict) {
        ScrollingTimeline267 timeline = new ScrollingTimeline267();
        timeline.frame(1, 0, 100);
        ArrayDeque<ScrollingTimeline267.Entry> queue = new ArrayDeque<>();
        ArrayList<ScrollingTimeline267.Entry> initial = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            ScrollingTimeline267.Entry item = entry(i);
            queue.addLast(item);
            initial.add(item);
        }
        int frames = 0;
        float firstSpeed = -1f;
        float firstTop = -1f;
        int maxAdmitted = 0;
        long maxFrameNanos = 0;
        while (!queue.isEmpty()) {
            ScrollingTimeline267.FrameBudget budget = new ScrollingTimeline267.FrameBudget();
            long begin = System.nanoTime();
            int before = timeline.active.size();
            timeline.showWaiting(queue, strict, 720, 480, 10, 100, budget);
            long nanos = System.nanoTime() - begin;
            int admitted = timeline.active.size() - before;
            check(admitted <= ScrollingTimeline267.FrameBudget.MAX_ITEMS, "too many in one frame");
            check(admitted > 0, "queue stalled");
            maxAdmitted = Math.max(maxAdmitted, admitted);
            maxFrameNanos = Math.max(maxFrameNanos, nanos);
            if (firstSpeed < 0) {
                firstSpeed = initial.get(0).speed;
                firstTop = initial.get(0).top;
            } else {
                check(initial.get(0).speed == firstSpeed && initial.get(0).top == firstTop,
                        "previously displayed comment trajectory changed");
            }
            if (++frames > count + 1) throw new AssertionError("queue did not empty");
        }
        check(timeline.active.size() == count, "comment lost in queue");
        for (int i = 0; i < count; i++) {
            ScrollingTimeline267.Entry item = timeline.active.get(i);
            check(item == initial.get(i), "FIFO order changed");
            check(item.speed > 0 && item.start == 100, "speed or admission time invalid");
        }
        System.out.printf("PASS: %s %,d waiting entries over %,d frames (max %,d/frame; max %.3f ms JVM)%n",
                strict ? "strict" : "non-strict", count, frames, maxAdmitted, maxFrameNanos/1e6);
    }

    private static q q(int time, boolean fixed) {
        q item = new q();
        item.d = time;
        item.j = fixed ? 1 : 0;
        item.l = 0;
        return item;
    }

    private static void indexTest() {
        final int count = 50_000;
        ArrayList<q> comments = new ArrayList<>();
        for (int i = 0; i < count; i++) comments.add(q(i / 10, false));
        CommentSource280 source = new CommentSource280();
        check(source.update(comments), "initial source was not indexed");
        HashSet<q> seen = new HashSet<>();
        int previous = Integer.MIN_VALUE;
        for (int frame = 0; seen.size() < count && frame <= count; frame++) {
            source.due(1, frame == 0, 0, 100_000, ScrollingTimeline267.FrameBudget.MAX_ITEMS);
            check(source.due.size() <= ScrollingTimeline267.FrameBudget.MAX_ITEMS, "due batch over budget");
            for (CommentSource280.Item item : source.due) {
                check(item.timestamp >= previous, "due order regressed");
                previous = item.timestamp;
                check(seen.add(item.comment), "duplicate admission");
            }
        }
        check(seen.size() == count, "comment lost during cursor continuation");
        source.due(1, false, 0, 100_000, 0);
        check(source.due.isEmpty(), "zero budget advanced comments");
        source.due(1, false, 0, 100_000, 48);
        check(source.due.isEmpty(), "expired cursor restarted");
        source.due(2, false, 40_000, 100_000, 48);
        check(source.due.isEmpty(), "future epoch did not reset cursor correctly");
        source.due(3, false, 100, 200, 48);
        check(source.due.size() == 48 && source.due.get(0).timestamp == 100, "seek did not restart from pre-roll");
        System.out.println("PASS: 50,000 due entries, bounded 48/item batches, no loss, no duplicates, seek reset");
    }

    private static void unorderedSourceTest() {
        final int count = 10_000;
        ArrayList<q> sourceList = new ArrayList<>();
        for (int i = count; i > 0; i--) sourceList.add(q(i, false));
        CommentSource280 indexed = new CommentSource280();
        indexed.update(sourceList);
        int index = 0;
        int emptySlices = 0;
        for (int frame = 0; index < count && frame < count; frame++) {
            indexed.due(1, frame == 0, 0, count, 48);
            if (indexed.due.isEmpty()) emptySlices++;
            for (CommentSource280.Item item : indexed.due) {
                check(item.index == index++, "original source order changed across a bounded batch");
            }
        }
        check(index == count && emptySlices > 0, "incremental source-order preparation failed");
        System.out.printf("PASS: %,d reverse-ordered timestamps, same-frame source order and incremental preparation%n", count);
    }

    private static void strictDelayTest() {
        ScrollingTimeline267 timeline = new ScrollingTimeline267();
        timeline.frame(1, 0, 0);
        timeline.active.add(entry(0));
        ArrayDeque<ScrollingTimeline267.Entry> queue = new ArrayDeque<>();
        ScrollingTimeline267.Entry waiting = entry(1);
        queue.addLast(waiting);
        timeline.showWaiting(queue, true, 720, 120, 1, 5, new ScrollingTimeline267.FrameBudget());
        check(!queue.isEmpty(), "strict did not wait 100ms");
        timeline.showWaiting(queue, true, 720, 120, 1, 10, new ScrollingTimeline267.FrameBudget());
        check(queue.isEmpty(), "strict did not release after 100ms");
        check(waiting.start == 10, "released entry not started at right edge");
        System.out.println("PASS: strict wait 100 ms, FIFO release and trajectory continuity");
    }

    private static void deferredAdmissionTest() {
        ArrayList<q> list = new ArrayList<>();
        list.add(q(100, false));
        list.add(q(100, false));
        list.add(q(120, false));
        CommentSource280 source = new CommentSource280();
        source.update(list);
        source.due(1, true, 0, 100, 1);
        check(source.hasBatch() && source.due.get(0).index == 0, "source batch not retained");
        source.due(1, false, 0, 140, 48);
        check(!source.hasBatch() && source.due.size() == 1 && source.due.get(0).index == 1,
                "new arrivals changed a partly delivered batch");
        source.due(1, false, 0, 140, 48);
        check(source.due.size() == 1 && source.due.get(0).timestamp == 120,
                "new window was not delivered after the pending batch");
        check(ScrollingTimeline267.admissionStart(false, 100, 110, 125, 125, 125, 1, 500)
                == 100, "immediate catch-up was changed");
        check(ScrollingTimeline267.admissionStart(false, 100, 110, 125, 125, 145, 1, 500)
                == 145, "deferred comment appeared mid-screen");
        check(ScrollingTimeline267.admissionStart(true, 100, 110, 125, 125, 145, 1, 500)
                == 145, "strict duration started before the comment was queued");
        System.out.println("PASS: stable delivery cutoff; delayed comments start from the right edge");
    }

    public static void main(String[] args) {
        indexTest();
        deferredAdmissionTest();
        unorderedSourceTest();
        strictDelayTest();
        releaseTest(5_000, true);
        releaseTest(5_000, false);
    }
}
