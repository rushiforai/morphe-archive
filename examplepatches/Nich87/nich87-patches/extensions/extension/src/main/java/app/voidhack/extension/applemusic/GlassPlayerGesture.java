package app.voidhack.extension.applemusic;

/** Recognition and release policy in screen pixels and event time. */
final class GlassPlayerGesture {
    private static final long VELOCITY_WINDOW_MS = 100;
    private final long[] times = new long[32];
    private final float[] positions = new float[times.length];
    private final float slop;
    private final float maxReleaseDistance;
    private final float flingVelocity;
    private float startX;
    private float startY;
    private float dx;
    private float dy;
    private float peakY;
    private float releaseDistance;
    private int next;
    private int count;

    GlassPlayerGesture(float slop, float density) {
        this.slop = slop;
        maxReleaseDistance = 40f * density;
        flingVelocity = 300f * density;
    }

    void start(long time, float x, float y, float availableDownwardTravel) {
        startX = x;
        startY = y;
        releaseDistance = Math.min(maxReleaseDistance, Math.max(2f * slop, availableDownwardTravel * 0.65f));
        peakY = 0f;
        next = count = 0;
        sample(time, x, y);
    }

    void sample(long time, float x, float y) {
        int last = (next + times.length - 1) % times.length;
        if (count != 0 && time < times[last]) return;
        dx = x - startX;
        dy = y - startY;
        peakY = Math.max(peakY, dy);
        if (count != 0 && time == times[last]) {
            positions[last] = dy;
            return;
        }
        times[next] = time;
        positions[next] = dy;
        next = (next + 1) % times.length;
        count = Math.min(count + 1, times.length);
    }

    boolean wantsDrag() {
        return dy > slop && dy >= Math.abs(dx) * 0.65f;
    }

    int dragDistance() {
        return Math.round(Math.max(0f, dy));
    }

    boolean shouldCollapse() {
        return dy > slop && peakY - dy <= slop * 0.75f
                && (dy >= releaseDistance || velocityY() >= flingVelocity);
    }

    private float velocityY() {
        int last = (next + times.length - 1) % times.length;
        for (int age = count - 1; age > 0; age--) {
            int index = (last - age + times.length) % times.length;
            long elapsed = times[last] - times[index];
            if (elapsed <= VELOCITY_WINDOW_MS) {
                return (dy - positions[index]) * 1000f / Math.max(8, elapsed);
            }
        }
        return 0f;
    }
}
