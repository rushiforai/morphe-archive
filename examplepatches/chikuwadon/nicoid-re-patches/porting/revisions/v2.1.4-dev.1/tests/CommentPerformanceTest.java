package e.e.a;

import java.lang.management.ManagementFactory;
import java.lang.reflect.Field;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;
import java.util.WeakHashMap;

/** JVM regression and workload benchmark. Android Canvas/Surface costs are outside this test. */
public final class CommentPerformanceTest {
    private static final com.sun.management.ThreadMXBean THREAD =
            (com.sun.management.ThreadMXBean) ManagementFactory.getThreadMXBean();
    private static final long TID = Thread.currentThread().getId();
    private static final Field J = field("j"), L = field("l"), D = field("d"), O = field("o"), K = field("k");
    private static volatile int sink;

    private static Field field(String name) {
        try { return q.class.getField(name); }
        catch (ReflectiveOperationException error) { throw new AssertionError(error); }
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static q comment(int time, boolean fixed) {
        q comment = new q();
        comment.d = time;
        comment.j = fixed ? 1 : 0;
        comment.l = 0;
        comment.a = "字幕\ncomment";
        return comment;
    }

    private static ScrollingTimeline267.Entry entry(float top, float width, float height, float speed,
                                                      float x, float time) {
        return new ScrollingTimeline267.Entry("channel", new String[]{"text"}, -1,
                x, time, speed, width, 25, top, -25, height, 3);
    }

    private static void sourceRegression() {
        CommentSource280 source = new CommentSource280();
        ArrayList<q> input = new ArrayList<>();
        q first = comment(20, false), second = comment(10, false), fixed = comment(1, true);
        input.add(first);
        input.add(fixed);
        input.add(second);
        check(source.update(input), "initial delivery indexed");
        source.fixedDuration(500);
        check(fixed.k == 500 && first.k == null, "fixed duration and no shared scrolling mutation");
        source.due(0, true, 0, 9);
        check(source.due.isEmpty(), "future comments do not start");
        source.due(0, false, 0, 25);
        check(source.due.size() == 2 && source.due.get(0).comment == first
                && source.due.get(1).comment == second, "same-frame admissions retain source order");
        check(!source.update(input), "stable list reused");
        source.due(0, false, 0, 25);
        check(source.due.isEmpty(), "paused frame has no re-admissions");
        q late = comment(15, false);
        input.set(2, late);
        check(source.update(input), "same-size in-place replacement detected");
        source.due(0, true, 0, 25);
        check(source.due.size() == 2 && source.due.get(1).comment == late, "eligible late arrival visible");
        source.due(1, false, 16, 25);
        check(source.due.size() == 1 && source.due.get(0).comment == first, "seek resets cursor with pre-roll");
        q appended = comment(30, false);
        input.add(appended);
        check(source.update(input), "in-place append detected");
        source.due(1, false, 25, 30);
        check(source.due.size() == 1 && source.due.get(0).comment == appended,
                "reindex during a zero-size viewport still resets the cursor");
        input.remove(0);
        check(source.update(input), "removal detected");
        source.fixedDuration(900);
        check(fixed.k == 900, "duration settings update native fixed comments");
    }

    private static void geometryRegression() {
        Random random = new Random(81202);
        int queries = 5000;
        for (int run = 0; run < queries; run++) {
            ScrollingTimeline267 timeline = new ScrollingTimeline267();
            int height = 250 + random.nextInt(900), rows = 1 + random.nextInt(20);
            int count = random.nextInt(100);
            for (int i = 0; i < count; i++) {
                timeline.active.add(entry(random.nextFloat() * height, 5 + random.nextInt(800),
                        10 + random.nextInt(height + 100), 1 + random.nextInt(6), 0 + random.nextInt(1600), -10));
            }
            int width = 20 + random.nextInt(1400), x = 500 + random.nextInt(900);
            float textHeight = 4 + random.nextInt(height + 30), speed = 1 + random.nextInt(6);
            float legacy = legacyTop(timeline.active, x, speed, width, textHeight, 3, 0, rows, height, false);
            float candidate = timeline.top(x, speed, width, textHeight, 3, 0, rows, height);
            check(legacy == candidate, "least-overlap row differs for case " + run);
            float strict = legacyTop(timeline.active, x, speed, width, textHeight, 3, 0, rows, height, true);
            check(Float.isNaN(strict) == timeline.overlaps(candidate, rows, height), "strict collision differs");
            if (!Float.isNaN(strict)) check(strict == candidate, "first clear lane differs");
        }

        ScrollingTimeline267 timeline = new ScrollingTimeline267();
        timeline.frame(0, 100, 100);
        ScrollingTimeline267.Entry first = entry(0, 160, 100, 1, 750, 100);
        timeline.active.add(first);
        for (int i = 0; i < 1500; i++) {
            float top = timeline.top(1000, 3, 120, 90, 3, 105, 10, 500);
            timeline.active.add(entry(top, 120, 90, 3, 1000, 105));
        }
        timeline.frame(0, 600, 200);
        check(timeline.active.size() == 1501 && first.left(200) == 650 && first.top == 0,
                "dense mode and stalls preserve every active path");
        timeline.frame(0, 1100, 1013);
        check(timeline.active.isEmpty(), "expired entries compacted");
        timeline.active.add(first);
        timeline.frame(1, 155, 155);
        check(timeline.active.isEmpty(), "seek retires old active paths");
        check(ScrollingTimeline267.start(120, 110, 135, 230, 1, 400, false) == 230,
                "due comments enter from the edge after a missed frame");
        check(ScrollingTimeline267.start(100, 120, 135, 230, 2, 400, false) == 212.5f,
                "late fetch uses current playback rate");
    }

    private static void queueRegression() {
        ScrollingTimeline267 timeline = new ScrollingTimeline267();
        ArrayDeque<ScrollingTimeline267.Entry> waiting = new ArrayDeque<>();
        ScrollingTimeline267.Entry active = entry(0, 300, 200, 3, 800, 100);
        ScrollingTimeline267.Entry queued = entry(0, 300, 200, 3, 800, 100);
        timeline.active.add(active);
        waiting.add(queued);
        timeline.showWaiting(waiting, true, 797, 200, 10, 105);
        check(timeline.active.size() == 1 && waiting.peek() == queued, "strict mode waits briefly for room");
        timeline.showWaiting(waiting, true, 797, 200, 10, 110);
        check(timeline.active.size() == 2 && waiting.isEmpty() && queued.left(110) == 800,
                "saturation presents every queued comment from the edge after 100 ms");
        ScrollingTimeline267.Entry toggled = entry(0, 300, 200, 3, 800, 110);
        waiting.add(toggled);
        timeline.showWaiting(waiting, false, 1200, 600, 20, 111);
        check(timeline.active.size() == 3 && waiting.isEmpty() && active.left(111) == 767
                && active.top == 0 && active.speed == 3 && queued.left(111) == 797,
                "switching overlap off and resizing keeps both existing trajectories");
    }

    // Reference lane algorithm from the v2.1.3 assembled renderer.
    private static float legacyTop(ArrayList<ScrollingTimeline267.Entry> active,
                                   float x, float speed, float width, float height, float pad, float now,
                                   int rows, int viewHeight, boolean strict) {
        float step = viewHeight / (float) rows;
        int candidates = Math.max(1, 1 + (int) Math.floor((viewHeight - height) / step));
        float bestScore = Float.POSITIVE_INFINITY;
        int best = 0;
        for (int row = 0; row < candidates; row++) {
            float top = row * step, score = 0f;
            for (ScrollingTimeline267.Entry other : active) {
                float overlap = Math.min(top + height, other.top + other.height) - Math.max(top, other.top);
                if (overlap <= 0f) continue;
                float horizon = Math.min((x + width + pad) / speed, other.right(now) / other.speed);
                if (horizon <= 0f) continue;
                float delta = speed - other.speed;
                float separation = x - other.left(now);
                float left = -width - pad - other.padding;
                float right = other.width + other.padding + pad;
                if (delta == 0f) {
                    if (separation >= left && separation <= right) score += overlap * horizon;
                } else {
                    float first = (separation - right) / delta, last = (separation - left) / delta;
                    score += overlap * Math.max(0f, Math.min(horizon, Math.max(first, last))
                            - Math.max(0f, Math.min(first, last)));
                }
                if (score >= bestScore) break;
            }
            if (score < bestScore) {
                bestScore = score;
                best = row;
                if (score == 0f) break;
            }
        }
        return strict && bestScore > 0f ? Float.NaN : best * step;
    }

    // v2.1.3 duration and discovery work on an unchanged source. Reflection members are cached.
    private static int legacyScan(ArrayList<q> input, WeakHashMap<q, Integer> durations,
                                  WeakHashMap<q, Boolean> future, float timestamp, float previous)
            throws IllegalAccessException {
        Integer duration = 500;
        for (q comment : input) {
            Integer applied = durations.get(comment);
            if (applied == null || applied.intValue() != duration) {
                K.set(comment, duration);
                durations.put(comment, duration);
            }
        }
        int due = 0;
        for (q comment : input) {
            if (((Integer) J.get(comment)) != 0 || ((Integer) L.get(comment)) != 0 || O.getBoolean(comment)) continue;
            int time = ((Integer) D.get(comment));
            if (time > timestamp) future.put(comment, Boolean.TRUE);
            else if (time > previous) {
                future.remove(comment);
                due++;
            }
        }
        return due;
    }

    private static long gc(boolean time) {
        return ManagementFactory.getGarbageCollectorMXBeans().stream()
                .mapToLong(gc -> time ? gc.getCollectionTime() : gc.getCollectionCount()).sum();
    }

    private static void benchmark(int count, boolean strict, boolean optimized, boolean measure) throws Exception {
        int active = count >= 50000 ? 320 : 16;
        int rate = count >= 50000 ? 24 : 4; // Number due per frame.
        ArrayList<q> comments = new ArrayList<>(count);
        for (int i = 0; i < count; i++) comments.add(comment(1 + 2 * (i / rate), i % 50 == 0));
        CommentSource280 source = new CommentSource280();
        WeakHashMap<q, Integer> durations = new WeakHashMap<>();
        WeakHashMap<q, Boolean> future = new WeakHashMap<>();
        ScrollingTimeline267 timeline = new ScrollingTimeline267();
        for (int i = 0; i < active; i++) {
            timeline.active.add(entry(i % 19 * 36, 140 + i % 300, 35 + i % 50, 2 + i % 6,
                    210 + ((i * 251) % 870), 0));
        }
        long initStart = System.nanoTime();
        if (optimized) {
            source.update(comments);
            source.fixedDuration(500);
        } else legacyScan(comments, durations, future, 0, 0);
        double init = (System.nanoTime() - initStart) / 1000.0;
        long[] frames = new long[700];
        long gcCount = gc(false), gcMs = gc(true);
        long allocated = THREAD.getThreadAllocatedBytes(TID), cpu = THREAD.getCurrentThreadCpuTime();
        int found = 0;
        for (int i = 0; i < frames.length; i++) {
            long start = System.nanoTime();
            int now = i * 2 + 1;
            int due;
            if (optimized) {
                boolean changed = source.update(comments);
                source.fixedDuration(500);
                source.due(0, changed, 0, now);
                due = source.due.size();
            } else due = legacyScan(comments, durations, future, now, now - 2);
            int admitted = 0;
            for (int index = 0; index < due; index++) {
                int x = 800 + index;
                float top = optimized
                        ? timeline.top(x, 4, 150 + index, 47, 3, i % 100, 20, 720)
                        : legacyTop(timeline.active, x, 4, 150 + index, 47, 3, i % 100, 20, 720, strict);
                if (strict && (optimized ? timeline.overlaps(top, 20, 720) : Float.isNaN(top))) break;
                admitted += (int) top + 1;
            }
            sink = admitted;
            found += due;
            frames[i] = System.nanoTime() - start;
        }
        cpu = THREAD.getCurrentThreadCpuTime() - cpu;
        allocated = THREAD.getThreadAllocatedBytes(TID) - allocated;
        check(found == Math.min(count, frames.length * rate) - (Math.min(count, frames.length * rate) + 49) / 50,
                "newly due counts differ");
        if (!measure) return;
        long slow = Arrays.stream(frames).filter(frame -> frame > 8_333_333).count();
        double mean = Arrays.stream(frames).average().orElseThrow() / 1000;
        Arrays.sort(frames);
        System.out.printf("%d,%s,%s,%.1f,%.1f,%.1f,%.1f,%d,%.2f,%.1f,%d,%d,%.1f%n",
                count, strict, optimized ? "optimized" : "baseline", mean, frames[349]/1000.0,
                frames[664]/1000.0, frames[692]/1000.0, slow, cpu/1_000_000.0,
                allocated/(double) frames.length, gc(false)-gcCount, gc(true)-gcMs, init);
    }

    public static void main(String[] args) throws Exception {
        sourceRegression();
        geometryRegression();
        queueRegression();
        System.out.println("PASS: source mutation, ordered admissions, duration, seek, 5,000 lane comparisons and 1,501 active paths");
        if (args.length == 0) return;
        System.out.println("comments,strict,variant,mean_us,p50_us,p95_us,p99_us,over_8_33ms,cpu_ms,alloc_B_per_frame,gc_count,gc_ms,init_us");
        for (int count : new int[]{1500, 50000}) {
            for (boolean strict : new boolean[]{false, true}) {
                benchmark(count, strict, false, false);
                benchmark(count, strict, true, false);
                for (int i = 0; i < 3; i++) {
                    benchmark(count, strict, false, true);
                    benchmark(count, strict, true, true);
                }
            }
        }
    }
}
