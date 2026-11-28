package app.morphe.extension.sabp.read;

/**
 * Notices a skipped-passage crossing: normal playback running from before a skipped passage to
 * after it. Fed the book position on every UI tick. A seek, a jump backwards, or a step bigger than
 * playback makes in one tick only moves the watcher along.
 */
public final class SkipWatcher {
    public interface Passages {
        /** The first skipped passage {first, last word} that starts between two book times, or null. */
        int[] startingBetween(double from, double to);
    }

    private double last = -1;

    /**
     * @param maxStep the most the position moves in one tick of normal playback (seconds)
     * @return the passage just crossed, or null
     */
    public int[] update(double pos, boolean playing, double maxStep, Passages passages) {
        double prev = last;
        last = pos;
        if (!playing || prev < 0 || pos < 0 || pos <= prev || pos - prev > maxStep) return null;
        return passages.startingBetween(prev, pos);
    }

    public void reset() {
        last = -1;
    }
}
