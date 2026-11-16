package app.morphed.extension.twitch.musicfilter;

/**
 * A song's clean copy as 16-bit stereo at 48 kHz, with its reduction for lining up (worked out once) and which
 * YouTube video it came from.
 */
public final class SongCopy {
    public final String videoId;
    public final short[] left;
    public final short[] right;
    private float[] reduced;

    public SongCopy(String videoId, short[] left, short[] right) {
        if (left.length != right.length) throw new IllegalArgumentException("channels differ in length");
        this.videoId = videoId;
        this.left = left;
        this.right = right;
    }

    public int length() {
        return left.length;
    }

    /** Mono samples [from, to) as floats, the way the reference reads a copy: the mean of both, / 32768. */
    public float[] mono(int from, int to) {
        float[] out = new float[to - from];
        for (int i = from; i < to; i++) out[i - from] = (float) ((left[i] + right[i]) / 2.0f) / 32768.0f;
        return out;
    }

    public float monoAt(int i) {
        return ((left[i] + right[i]) / 2.0f) / 32768.0f;
    }

    /** Align.reduce of the whole copy, worked out on first use. */
    public synchronized float[] reduced() {
        if (reduced == null) reduced = Align.reduce(mono(0, length()));
        return reduced;
    }
}
