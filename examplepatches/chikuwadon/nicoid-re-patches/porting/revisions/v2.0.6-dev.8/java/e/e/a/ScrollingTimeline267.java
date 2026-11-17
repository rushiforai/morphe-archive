package e.e.a;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/** Owns scrolling instances independently of the current source list. Time is in centiseconds. */
final class ScrollingTimeline267 {
    static final class Entry {
        final Object channel;
        final String[] lines;
        final float leftAtStart, start, speed, width, size, top, baseline, height, padding;
        final int color;
        Entry(Object channel, String[] lines, int color, float x, float start, float speed,
              float width, float size, float top, float ascent, float height, float padding) {
            this.channel = channel;
            this.lines = lines;
            this.color = color;
            this.leftAtStart = x;
            this.start = start;
            this.speed = speed;
            this.width = width;
            this.size = size;
            this.top = top;
            this.baseline = top - ascent;
            this.height = height;
            this.padding = padding;
        }
        float left(float time) { return leftAtStart - (time - start) * speed; }
        float right(float time) { return left(time) + width + padding; }
    }

    final ArrayList<Entry> active = new ArrayList<>();
    final Set<Object> started = new HashSet<>();
    private long generation = Long.MIN_VALUE;
    float origin;

    void frame(long generation, float video, float visual) {
        if (this.generation != generation) {
            this.generation = generation;
            origin = video;
            active.clear();
            started.clear();
        }
        for (int i = active.size() - 1; i >= 0; i--) {
            if (active.get(i).right(visual) <= 0f) active.remove(i);
        }
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
        float bestScore = Float.POSITIVE_INFINITY;
        int best = 0;
        for (int row = 0; row < candidates; row++) {
            float top = row * step;
            float score = 0f;
            for (Entry other : active) {
                float overlap = Math.min(top + height, other.top + other.height) - Math.max(top, other.top);
                if (overlap <= 0f) continue;
                float horizon = Math.min((x + width + padding) / speed, other.right(now) / other.speed);
                // Relative motion is linear. Intersect the time intervals where both edges overlap.
                float delta = speed - other.speed;
                float separation = x - other.left(now);
                float leftLimit = -width - padding - other.padding;
                float rightLimit = other.width + other.padding + padding;
                if (delta == 0f) {
                    if (separation >= leftLimit && separation <= rightLimit) score += overlap * horizon;
                } else {
                    float first = (separation - rightLimit) / delta;
                    float last = (separation - leftLimit) / delta;
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
        return best * step;
    }
}
