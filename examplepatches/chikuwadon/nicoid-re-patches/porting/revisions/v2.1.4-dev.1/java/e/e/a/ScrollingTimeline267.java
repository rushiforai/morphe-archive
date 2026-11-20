package e.e.a;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/** Owns active paths independently of fetched lists. Time is in centiseconds. */
final class ScrollingTimeline267 {
    static final float MAX_LANE_WAIT = 10f; // 100 ms of animation time.

    static final class Entry {
        final Object channel;
        final String[] lines;
        final float width, size, ascent, height, padding;
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
            place(x, start, speed, top);
        }

        // Called only before admission. Active paths never change lanes or speed.
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
    private final float[] scores = new float[20];
    private long generation = Long.MIN_VALUE;
    float origin;

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
        Entry entry;
        while ((entry = waiting.peekFirst()) != null) {
            float x = width + entry.padding;
            float duration = (entry.leftAtStart + entry.width + entry.padding) / entry.speed;
            float speed = (x + entry.width + entry.padding) / duration;
            float top = top(x, speed, entry.width, entry.height, entry.padding, visual, rows, height);
            if (strict && visual - entry.start < MAX_LANE_WAIT && overlaps(top, rows, height)) return;
            waiting.removeFirst();
            entry.place(x, visual, speed, top);
            active.add(entry);
        }
    }

    // The caller reads the score immediately after top() for that candidate.
    boolean overlaps(float top, int rows, int viewportHeight) {
        return scores[Math.round(top / (viewportHeight / (float) rows))] > 0f;
    }
}
