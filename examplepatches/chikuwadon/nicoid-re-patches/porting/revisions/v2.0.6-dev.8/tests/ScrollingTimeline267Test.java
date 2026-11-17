package e.e.a;

public final class ScrollingTimeline267Test {
    private static void check(boolean condition, String report) {
        if (!condition) throw new AssertionError(report);
    }

    public static void main(String[] args) {
        ScrollingTimeline267 timeline = new ScrollingTimeline267();
        Object channel = new Object();
        timeline.frame(0, 100, 100);
        ScrollingTimeline267.Entry slow = new ScrollingTimeline267.Entry(channel, new String[]{"long"}, -1,
                750, 100, 1, 160, 45, 0, -42, 100, 3);
        timeline.active.add(slow);
        timeline.started.add("thread/1");
        check(timeline.top(1000, 4, 100, 45, 3, 100, 10, 500) == 100,
                "Fast comment would catch up with the multiline comment on the first two rows");
        check(timeline.top(1000, 1, 100, 45, 3, 100, 10, 500) == 0,
                "A comment moving at the same speed can reuse the lane when there is room");
        for (int i = 0; i < 1500; i++) {
            float top = timeline.top(1000, 3, 120, 90, 3, 105, 10, 500);
            check(top >= 0 && top + 90 <= 500, "Every dense comment has a row");
            timeline.active.add(new ScrollingTimeline267.Entry(channel, new String[]{"many"}, -1,
                    1000, 105, 3, 120, 45, top, -42, 90, 3));
        }
        check(timeline.active.size() == 1501 && slow.left(105) == 745 && slow.baseline == 42,
                "New entries cannot retime, move or evict an existing entry");
        timeline.frame(0, 600, 200);
        check(timeline.active.size() == 1501, "Source time and a stalled frame cannot expire visual paths");
        timeline.frame(0, 1100, 1013);
        check(timeline.active.isEmpty() && timeline.started.contains("thread/1"),
                "Exit removes the instance while its duplicate key remains during this playback");
        timeline.frame(1, 155, 155);
        check(timeline.active.isEmpty() && timeline.started.isEmpty(), "Seek opens a new timeline");
        check(ScrollingTimeline267.start(120, 110, 135, 230, 1, 400, false) == 230,
                "Scheduled comment after a missed frame starts outside the right edge");
        check(ScrollingTimeline267.start(100, 120, 135, 230, 1, 400, true) == 230,
                "An observed future comment keeps its edge entry after stalling");
        check(ScrollingTimeline267.start(100, 120, 135, 230, 2, 400, false) == 212.5f,
                "Only a newly delivered, already-due comment can enter partway through");
        check(ScrollingTimeline267.start(100, 120, 700, 755, 1, 400, false) == 755,
                "A newly delivered comment past its original exit can still scroll from the edge");
        System.out.println("PASS: 1501 retained comments, predicted collisions, stable paths, late arrivals and seek reset");
    }
}
