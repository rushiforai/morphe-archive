package app.ayham.extension.music.automix;

/**
 * A player's clock from readings that move in steps: each change is an anchor (the reading less
 * the player's own time line when it was first seen); the line is the median anchor. The time
 * line is wall time integrated over the speed given with each reading, so a speed change (automix's
 * tempo glide) keeps the anchors good. Seen up to one tick late, the same for both players, so the
 * comparison isn't biased.
 */
final class StepClock {
    private final double[] anchors = new double[8];
    private int count, next;
    private long last = Long.MIN_VALUE;
    /** The time line (ms of media at the speeds seen) at lastNow. */
    private double line;
    private long lastNow = Long.MIN_VALUE;
    private float lastSpeed = 1f;

    private void advance(long now, float speed) {
        if (lastNow != Long.MIN_VALUE) line += (now - lastNow) * (double) lastSpeed;
        lastNow = now;
        lastSpeed = speed;
    }

    boolean see(long value, long now, float speed) {
        advance(now, speed);
        if (value == last) return false;
        boolean first = last == Long.MIN_VALUE;
        last = value;
        if (first) return false; // the first reading's change time is unknown
        anchors[next] = value - line;
        next = (next + 1) % anchors.length;
        count = Math.min(count + 1, anchors.length);
        return true;
    }

    /**
     * The speed changed now: the line runs at it from now on, not from the next reading (readings
     * skipped while a speed change settles would be booked at the old speed).
     */
    void speed(long now, float speed) {
        advance(now, speed);
    }

    int n() {
        return count;
    }

    double at(long now, float speed) {
        if (count == 0) return Double.NaN; // no anchor yet
        double[] a = java.util.Arrays.copyOf(anchors, count);
        java.util.Arrays.sort(a);
        double med = count % 2 == 1 ? a[count / 2] : (a[count / 2 - 1] + a[count / 2]) / 2;
        return med + line + (lastNow == Long.MIN_VALUE ? 0 : (now - lastNow) * (double) speed);
    }

    void reset() {
        count = 0;
        next = 0;
        last = Long.MIN_VALUE;
        line = 0;
        lastNow = Long.MIN_VALUE;
    }
}
