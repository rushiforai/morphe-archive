package app.morphed.extension.twitch.musicfilter;

/** The latest seconds of the stream, mono, and how many samples came before them. */
public final class Heard {
    public static final int SECONDS = 12; // seconds of the stream kept for recognizing and lining up

    private final float[] buffer; // a ring: sample i sits at i % its length
    private long total;

    public Heard() {
        this(SECONDS, Canceller.RATE);
    }

    Heard(int seconds, int rate) {
        buffer = new float[seconds * rate];
    }

    public synchronized void add(float[] mono, int length) {
        int size = buffer.length;
        int from = Math.max(0, length - size); // only the newest fit
        int count = length - from;
        total += length;
        int at = (int) ((total - count) % size);
        int first = Math.min(count, size - at);
        System.arraycopy(mono, from, buffer, at, first);
        System.arraycopy(mono, from + first, buffer, 0, count - first);
    }

    public synchronized long total() {
        return total;
    }

    /** The latest length samples and the stream index of the first, or null when not that many came yet. */
    public synchronized Stretch latest(int length) {
        if (total < length || length > buffer.length) return null;
        long start = total - length;
        float[] out = new float[length];
        int at = (int) (start % buffer.length);
        int first = Math.min(length, buffer.length - at);
        System.arraycopy(buffer, at, out, 0, first);
        System.arraycopy(buffer, 0, out, first, length - first);
        return new Stretch(out, start);
    }

    public static final class Stretch {
        public final float[] samples;
        public final long start;

        Stretch(float[] samples, long start) {
            this.samples = samples;
            this.start = start;
        }
    }
}
