package app.morphe.extension.chmate;

/** Serializes asynchronous MediaPlayer seeks while keeping repeated skip targets cumulative. */
public final class VideoSeekState {
    private int desired = -1, submitted = -1;
    public int position(int actual) { return desired < 0 ? actual : desired; }
    public int request(int target) {
        desired = Math.max(0, target);
        if (submitted >= 0) return -1;
        submitted = desired;
        return submitted;
    }
    public int completed() {
        if (submitted < 0) return -1;
        if (desired != submitted) { submitted = desired; return submitted; }
        reset();
        return -1;
    }
    public void reset() { desired = submitted = -1; }
}
