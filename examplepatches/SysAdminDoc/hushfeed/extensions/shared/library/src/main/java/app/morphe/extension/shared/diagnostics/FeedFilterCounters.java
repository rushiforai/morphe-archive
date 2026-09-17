/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.shared.diagnostics;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicLong;

/**
 * How many lists each feed filter route has been handed, and how much it took out of them.
 *
 * <p>Every ad report so far has arrived without a single line saying which route delivered the
 * ad, because the filter only writes its lines while diagnostic logging is on and a reporter has
 * no reason to know that switch exists. Three different routes can put a video on a profile
 * page, and a screenshot cannot tell them apart. These counters are always on, cost an add per
 * list, and turn "an ad got through" into "the profile grid route ran 4 times over 56 items and
 * removed none", which names the route without anyone having to ask.
 *
 * <p>A route with no line has never run, and that is the more useful half: a hook that never
 * fired looks exactly like a filter that decided to keep everything.
 */
public final class FeedFilterCounters {
    /**
     * Sources are a fixed set plus one per late-insertion name, so this is well clear of what
     * the app produces. The cap is here because a source string arrives from the host.
     */
    private static final int MAX_SOURCES = 64;

    private static final class Counter {
        final AtomicLong lists = new AtomicLong();
        final AtomicLong itemsIn = new AtomicLong();
        final AtomicLong removed = new AtomicLong();
        /** Elements handed over that were not videos at all, so no rule ever saw them. */
        final AtomicLong unreadable = new AtomicLong();
        /** Lists this route handed back with nothing left in them. */
        final AtomicLong emptied = new AtomicLong();
        volatile String lastReason;
    }

    private static final ConcurrentHashMap<String, Counter> COUNTERS = new ConcurrentHashMap<>();
    /** Sources in the order the app first reached them; the map does not keep that. */
    private static final List<String> SEEN = new CopyOnWriteArrayList<>();
    private static final Object STATE_LOCK = new Object();

    private FeedFilterCounters() {
    }

    /** A deep copy for the diagnostic clear row's one-tap undo. */
    public static final class Snapshot {
        private final List<Line> lines;

        private Snapshot(List<Line> lines) {
            this.lines = lines;
        }

        public boolean isEmpty() {
            return lines.isEmpty();
        }
    }

    private static final class Line {
        final String source;
        final long lists, itemsIn, removed, unreadable, emptied;
        final String lastReason;

        Line(String source, Counter counter) {
            this.source = source;
            this.lists = counter.lists.get();
            this.itemsIn = counter.itemsIn.get();
            this.removed = counter.removed.get();
            this.unreadable = counter.unreadable.get();
            this.emptied = counter.emptied.get();
            this.lastReason = counter.lastReason;
        }
    }

    /**
     * A list this route was handed, counted before anything decides whether to filter it.
     *
     * <p>Counting it here rather than after the enablement check is the point: a route that ran
     * with every filter switched off still proves the hook is alive, and that is exactly the
     * question a report with no removals leaves open.
     */
    public static void sawList(String source, int size) {
        Counter counter = counter(source);
        if (counter == null) return;
        counter.lists.incrementAndGet();
        if (size > 0) counter.itemsIn.addAndGet(size);
    }

    /**
     * Elements this route was handed that it could not read as videos.
     *
     * <p>A route that kept everything reads the same whether nothing matched a rule or nothing
     * was ever tested, and issue #2's export was exactly that: 64 items, 0 removed, two ads
     * watched. This is the half that separates them.
     */
    public static void unreadable(String source, int count) {
        if (count <= 0) return;
        Counter counter = counter(source);
        if (counter == null) return;
        counter.unreadable.addAndGet(count);
    }

    /**
     * A list this route handed back with nothing left in it.
     *
     * <p>A batch filtered down to zero is not the same as a batch nothing matched, and from the
     * outside it does not look like filtering at all: the pager has nothing to advance to, and
     * whether TikTok asks for more is TikTok's decision. Upstream reported the feed freezing on
     * the swipe after a livestream was hidden, and an export that counts only removals cannot
     * tell that story from a healthy one. This is the line that can.
     */
    public static void emptied(String source) {
        Counter counter = counter(source);
        if (counter == null) return;
        counter.emptied.incrementAndGet();
    }

    /** What this route took out of the list it was just handed. */
    public static void removed(String source, int count, String reason) {
        if (count <= 0) return;
        Counter counter = counter(source);
        if (counter == null) return;
        counter.removed.addAndGet(count);
        if (reason != null) counter.lastReason = reason;
    }

    private static Counter counter(String source) {
        if (source == null) return null;
        Counter existing = COUNTERS.get(source);
        if (existing != null) return existing;
        synchronized (STATE_LOCK) {
            existing = COUNTERS.get(source);
            if (existing != null) return existing;
            if (COUNTERS.size() >= MAX_SOURCES) return null;
            Counter created = new Counter();
            COUNTERS.put(source, created);
            SEEN.add(source);
            return created;
        }
    }

    /** One line per route the app has reached, in the order it first reached them. */
    public static List<String> report() {
        synchronized (STATE_LOCK) {
            List<String> lines = new ArrayList<>();
            for (String source : SEEN) {
                Counter counter = COUNTERS.get(source);
                if (counter == null) continue;
                StringBuilder line = new StringBuilder(source)
                        .append(": ").append(counter.lists.get()).append(" lists, ")
                        .append(counter.itemsIn.get()).append(" items, ")
                        .append(counter.removed.get()).append(" removed");
                long unreadable = counter.unreadable.get();
                if (unreadable > 0) line.append(", ").append(unreadable).append(" not videos");
                long emptied = counter.emptied.get();
                if (emptied > 0) line.append(", ").append(emptied).append(" left empty");
                String reason = counter.lastReason;
                if (reason != null) line.append(". Last reason: ").append(reason);
                lines.add(line.toString());
            }
            return lines;
        }
    }

    /** Takes the state a diagnostic clear is about to remove. */
    public static Snapshot snapshot() {
        synchronized (STATE_LOCK) {
            return snapshotLocked();
        }
    }

    /** Atomically takes the state a diagnostic clear removes, then starts from zero. */
    public static Snapshot snapshotAndClear() {
        synchronized (STATE_LOCK) {
            Snapshot snapshot = snapshotLocked();
            COUNTERS.clear();
            SEEN.clear();
            return snapshot;
        }
    }

    private static Snapshot snapshotLocked() {
        List<Line> copy = new ArrayList<>();
        for (String source : SEEN) {
            Counter counter = COUNTERS.get(source);
            if (counter != null) copy.add(new Line(source, counter));
        }
        return new Snapshot(copy);
    }

    /**
     * Adds a cleared snapshot back on top of anything counted since.
     *
     * <p>The feed keeps scrolling while the row still offers Undo, so the counts move between
     * the clear and the tap that puts them back. Adding rather than replacing keeps Undo from
     * being a second destructive action.
     */
    public static void restore(Snapshot snapshot) {
        if (snapshot == null || snapshot.isEmpty()) return;
        synchronized (STATE_LOCK) {
            List<String> countedSince = new ArrayList<>(SEEN);
            for (Line saved : snapshot.lines) {
                Counter counter = counter(saved.source);
                if (counter == null) continue;
                counter.lists.addAndGet(saved.lists);
                counter.itemsIn.addAndGet(saved.itemsIn);
                counter.removed.addAndGet(saved.removed);
                counter.unreadable.addAndGet(saved.unreadable);
                counter.emptied.addAndGet(saved.emptied);
                if (counter.lastReason == null) counter.lastReason = saved.lastReason;
            }

            // The restored routes were reached first. Keep newer ones after them.
            SEEN.clear();
            for (Line saved : snapshot.lines) {
                if (COUNTERS.containsKey(saved.source) && !SEEN.contains(saved.source)) {
                    SEEN.add(saved.source);
                }
            }
            for (String source : countedSince) {
                if (!SEEN.contains(source)) SEEN.add(source);
            }
        }
    }

    /** Forgets everything, which is what clearing the diagnostic data does. */
    public static void clear() {
        synchronized (STATE_LOCK) {
            COUNTERS.clear();
            SEEN.clear();
        }
    }
}
