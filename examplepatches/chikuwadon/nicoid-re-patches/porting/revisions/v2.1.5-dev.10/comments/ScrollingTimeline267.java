package e.e.a;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/** Owns active paths independently of fetched lists. Time is in centiseconds. */
final class ScrollingTimeline267 {
    static final float MAX_LANE_WAIT = 10f; // 100 ms of animation time.
    static final int MAX_LOOKAHEAD = 8;

    // This time budget covers both new arrivals and already waiting comments.
    // Count + elapsed-time bounds prevent an O(n^2) queue release on one frame.
    // At least one item is allowed per frame, even after an expensive source scan.
    static final class FrameBudget {
        static final int MAX_ITEMS = 48;
        static final long MAX_NANOS = 1_500_000L;
        private final long deadline = System.nanoTime() + MAX_NANOS;
        private int remaining = MAX_ITEMS;
        private int consumed;

        int remaining() {
            return remaining > 0 && (consumed == 0 || deadline - System.nanoTime() > 0)
                    ? remaining : 0;
        }

        boolean take() {
            if (remaining() == 0) return false;
            remaining--;
            consumed++;
            return true;
        }
    }

    static final class Entry {
        final Object channel;
        final String[] lines;
        final float padding;
        final float waitOrigin;
        float width, size, ascent, height;
        final int color;
        float leftAtStart, start, speed, top, baseline;

        Entry(Object channel, String[] lines, int color, float x, float start, float speed,
              float width, float size, float top, float ascent, float height, float padding) {
            this.channel = channel;
            this.lines = lines;
            this.color = color;
            this.width = width;
            this.size = size;
            this.ascent = ascent;
            this.height = height;
            this.padding = padding;
            this.waitOrigin = start;
            place(x, start, speed, top);
        }

        // Active paths keep their lane and speed until the viewport geometry changes.
        void place(float x, float time, float velocity, float lane) {
            leftAtStart = x;
            start = time;
            speed = velocity;
            top = lane;
            baseline = lane - ascent;
        }

        float left(float time) { return leftAtStart - (time - start) * speed; }
        float right(float time) { return left(time) + width + padding; }
    }

    final ArrayList<Entry> active = new ArrayList<>();
    final Set<Object> started = new HashSet<>();
    long skippedByOverlap, shownFromWaiting, blockedChecks;
    private final float[] scores = new float[20];
    private long generation = Long.MIN_VALUE;
    float origin;
    private int viewportWidth, viewportHeight;
    private float viewportFont;

    void resizeViewport(long generation, int width, int height, float font, float visual,
                        ArrayDeque<Entry> waiting) {
        if (width <= 0 || height <= 0 || !(font > 0f) || !Float.isFinite(font)) return;
        if (width == viewportWidth && height == viewportHeight && font == viewportFont) return;
        if (this.generation == generation && viewportFont > 0f) {
            float fontScale = font / viewportFont;
            float heightScale = height / (float) viewportHeight;
            for (int i = 0; i < active.size(); i++) {
                resize(active.get(i), viewportWidth, width, fontScale, heightScale, height, visual);
            }
            for (Entry entry : waiting) {
                resize(entry, viewportWidth, width, fontScale, heightScale, height, visual);
            }
        }
        viewportWidth = width;
        viewportHeight = height;
        viewportFont = font;
    }

    private static void resize(Entry entry, int oldWidth, int width, float fontScale,
                               float heightScale, int height, float visual) {
        float oldSpan = oldWidth + entry.width + 2f * entry.padding;
        entry.width *= fontScale;
        entry.size *= fontScale;
        entry.ascent = (entry.ascent + entry.padding) * fontScale - entry.padding;
        entry.height = (entry.height - 2f * entry.padding) * fontScale + 2f * entry.padding;
        float span = width + entry.width + 2f * entry.padding;
        float scale = span / oldSpan;
        // Preserve normalized scroll progress and the remaining time on screen.
        float x = width + entry.padding - (oldWidth + entry.padding - entry.left(visual)) * scale;
        float top = Math.min(entry.top * heightScale, Math.max(0f, height - entry.height));
        entry.place(x, visual, entry.speed * scale, top);
    }

    void frame(long generation, float video, float visual) {
        if (this.generation != generation) {
            this.generation = generation;
            origin = video;
            active.clear();
            started.clear();
            return;
        }
        int kept = 0;
        int count = active.size();
        for (int i = 0; i < count; i++) {
            Entry entry = active.get(i);
            if (entry.right(visual) <= 0f) continue;
            if (kept != i) active.set(kept, entry);
            kept++;
        }
        if (kept != count) active.subList(kept, count).clear();
    }

    static float start(float timestamp, float previousVideo, float video, float visual,
                       float rate, float duration, boolean knownBeforeDue) {
        if (knownBeforeDue || timestamp >= previousVideo) return visual;
        float age = (video - timestamp) / rate;
        return age < duration ? visual - age : visual;
    }

    static float admissionStart(boolean strict, float timestamp, float previousVideo,
                                float video, float batchVisual, float visual, float rate, float duration) {
        // A deferred comment enters from the edge on the frame that actually admits it.
        if (strict || visual != batchVisual) return visual;
        return start(timestamp, previousVideo, video, visual, rate, duration, false);
    }

    float top(float x, float speed, float width, float height, float padding, float now,
              int rows, int viewportHeight) {
        float step = viewportHeight / (float) rows;
        int candidates = Math.max(1, 1 + (int) Math.floor((viewportHeight - height) / step));
        Arrays.fill(scores, 0, candidates, 0f);
        float exit = (x + width + padding) / speed;
        for (int i = 0; i < active.size(); i++) {
            Entry other = active.get(i);
            float bottom = other.top + other.height;
            // Include the boundaries and check exact overlap below to preserve float rounding.
            int first = Math.max(0, (int) Math.floor((other.top - height) / step));
            int last = Math.min(candidates - 1, (int) Math.ceil(bottom / step));
            if (first > last) continue;
            float left = other.left(now);
            float otherExit = (left + other.width + other.padding) / other.speed;
            float horizon = Math.min(exit, otherExit);
            if (horizon <= 0f) continue;
            float delta = speed - other.speed;
            float separation = x - left;
            float leftLimit = -width - padding - other.padding;
            float rightLimit = other.width + other.padding + padding;
            float overlapTime;
            if (delta == 0f) {
                if (separation < leftLimit || separation > rightLimit) continue;
                overlapTime = horizon;
            } else {
                float entry = (separation - rightLimit) / delta;
                float exitTime = (separation - leftLimit) / delta;
                overlapTime = Math.min(horizon, Math.max(entry, exitTime))
                        - Math.max(0f, Math.min(entry, exitTime));
                if (overlapTime <= 0f) continue;
            }
            for (int row = first; row <= last; row++) {
                float top = row * step;
                float overlap = Math.min(top + height, bottom) - Math.max(top, other.top);
                if (overlap > 0f) scores[row] += overlap * overlapTime;
            }
        }
        int best = 0;
        for (int row = 1; row < candidates && scores[best] > 0f; row++) {
            if (scores[row] < scores[best]) best = row;
        }
        return best * step;
    }

    void showWaiting(ArrayDeque<Entry> waiting, boolean strict, int width, int height, int rows, float visual) {
        showWaiting(waiting, strict, width, height, rows, visual, null);
    }

    void showWaiting(ArrayDeque<Entry> waiting, boolean strict, int width, int height,
                     int rows, float visual, FrameBudget budget) {
        // Probe a bounded prefix so an oversized first comment cannot block
        // smaller comments that fit other lanes. Never reorder the queue.
        int checks = strict ? Math.min(MAX_LOOKAHEAD, waiting.size()) : waiting.size();
        Iterator<Entry> iterator = waiting.iterator();
        for (int i = 0; i < checks && iterator.hasNext(); i++) {
            if (budget != null && !budget.take()) return;
            Entry entry = iterator.next();
            float x = width + entry.padding;
            float duration = (entry.leftAtStart + entry.width + entry.padding) / entry.speed;
            float speed = (x + entry.width + entry.padding) / duration;
            float top = top(x, speed, entry.width, entry.height, entry.padding, visual, rows, height);
            if (strict && overlaps(top, rows, height)) {
                // The deadline is fixed at first admission, even if the viewport
                // resizes and entry.start is rewritten to preserve animation.
                if (visual - entry.waitOrigin < MAX_LANE_WAIT) {
                    blockedChecks++;
                    continue;
                }
                iterator.remove();
                skippedByOverlap++;
                continue;
            }
            iterator.remove();
            entry.place(x, visual, speed, top);
            active.add(entry);
            shownFromWaiting++;
        }
    }

    // The caller reads the score immediately after top() for that candidate.
    boolean overlaps(float top, int rows, int viewportHeight) {
        return scores[Math.round(top / (viewportHeight / (float) rows))] > 0f;
    }
}
