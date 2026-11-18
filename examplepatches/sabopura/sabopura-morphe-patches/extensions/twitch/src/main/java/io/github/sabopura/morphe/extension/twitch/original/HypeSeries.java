package io.github.sabopura.morphe.extension.twitch.original;

/** Chat messages per 10 seconds for the last five minutes, and when the rate jumps. */
final class HypeSeries {
    static final int POINTS = 30;
    static final long BUCKET_MS = 10_000;
    private static final int BASELINE = 12;
    private static final int MIN_PEAK = 8;
    private static final int SPIKE_RATIO = 3;

    private final int[] counts = new int[POINTS];
    private long newest = -1;

    private void advance(long now) {
        long bucket = now / BUCKET_MS;
        if (newest < 0) {
            newest = bucket;
            return;
        }
        long shift = Math.min(POINTS, bucket - newest);
        if (shift <= 0) return;
        System.arraycopy(counts, (int) shift, counts, 0, POINTS - (int) shift);
        java.util.Arrays.fill(counts, POINTS - (int) shift, POINTS, 0);
        newest = bucket;
    }

    synchronized void add(long now) {
        advance(now);
        counts[POINTS - 1]++;
    }

    /** Oldest first; the last value is the bucket still filling. */
    synchronized int[] snapshot(long now) {
        advance(now);
        return counts.clone();
    }

    synchronized void clear() {
        java.util.Arrays.fill(counts, 0);
        newest = -1;
    }

    /**
     * The last complete bucket against the average of those before it, or 0 when there is no spike.
     * Quiet channels need a floor, or two messages after silence would count as a burst.
     */
    static int spikeRatio(int[] series) {
        int latest = series[POINTS - 2];
        if (latest < MIN_PEAK) return 0;
        int sum = 0, samples = 0;
        for (int i = POINTS - 2 - BASELINE; i < POINTS - 2; i++) {
            if (series[i] == 0) continue;
            sum += series[i];
            samples++;
        }
        if (samples < BASELINE / 2) return 0;
        int average = Math.max(1, sum / samples);
        return latest >= average * SPIKE_RATIO ? latest / average : 0;
    }
}
