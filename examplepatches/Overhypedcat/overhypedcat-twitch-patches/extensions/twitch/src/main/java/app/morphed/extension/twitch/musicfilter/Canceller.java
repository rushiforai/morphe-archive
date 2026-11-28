package app.morphed.extension.twitch.musicfilter;

/**
 * Subtracts a known song from one channel of a stream's sound, a slice at a time.
 * <p>
 * The stream holds the song as the streamer's setup changed it: an EQ and a delay that hardly ever change, and a
 * volume that does (their fader, ducking under their voice). So per frequency a short filter learns the song's
 * shape slowly, and one volume across all frequencies follows quickly. Both learn only from where the song is
 * what's heard. What's left of the song after subtracting is turned down where it still outweighs everything else.
 * <p>
 * A line-for-line port of Mor Assistant's canceller (Python reference, and its JavaScript port): the tests check it
 * against the reference's output sample for sample.
 */
public class Canceller {
    public static final int RATE = 48000;
    public static final int SIZE = 2048; // samples per analysis frame
    public static final int HOP = 512; // samples between frames: the slice the stream moves on by
    public static final int DELAY = SIZE - HOP; // how far the result runs behind the stream
    static final int TAPS = 2;
    static final double SHAPE_RATE = 0.01;
    static final double VOLUME_SECONDS = 0.2;
    static final int WARMUP_FRAMES = 50;
    static final double LEFTOVER_FLOOR = 0.15;
    static final double QUIET_VOLUME = 0.05;
    static final double MAX_VOLUME = 4.0;
    static final double LEARN_FLOOR = 0.05;
    static final double SHARE_GAIN = 4.0;
    static final double LEARN_VOLUME = 0.3;
    static final double SETTLE = 0.002;
    static final int BINS = SIZE / 2 + 1;

    /** numpy.hanning(SIZE + 1)[:SIZE] as float32: periodic, so overlapping frames sum evenly. */
    static final float[] WINDOW = new float[SIZE];
    static final double NORM;

    static {
        double total = 0;
        for (int i = 0; i < SIZE; i++) {
            WINDOW[i] = (float) (0.5 - 0.5 * Math.cos((2 * Math.PI * i) / SIZE));
            total += (float) ((double) WINDOW[i] * WINDOW[i]);
        }
        NORM = total / HOP;
    }

    private final double volumeKeep;
    private final double shapeKeep;
    private final float[] stream = new float[SIZE];
    private final float[] song = new float[SIZE];
    private final float[] overlap = new float[SIZE];
    private final double[] frame = new double[SIZE];
    private final double[] yr = new double[BINS], yi = new double[BINS];
    private final double[] xr = new double[BINS], xi = new double[BINS];
    private final double[] er = new double[BINS], ei = new double[BINS];
    private final double[] back = new double[SIZE];
    /** The HOP samples handed out by process: the same array each time (copied by the caller before the next). */
    private final float[] out = new float[HOP];
    private final double[] share = new double[BINS];
    private final double[] sr = new double[BINS], si = new double[BINS];
    private final double[] heard = new double[BINS];
    private final FrameFft fft = new FrameFft(SIZE);

    private double[] shapeRe, shapeIm, power;
    private double[] histRe, histIm;
    private double songPower, num, den, volume;
    private int frames;
    private boolean fresh;

    public Canceller() {
        this(RATE);
    }

    public Canceller(int rate) {
        volumeKeep = Math.exp(-HOP / (rate * VOLUME_SECONDS));
        shapeKeep = Math.exp(-HOP / (rate * 2.0));
        reset();
    }

    /** Forget everything learned, the streamer's setup too. */
    public void reset() {
        shapeRe = new double[BINS * TAPS];
        shapeIm = new double[BINS * TAPS];
        power = new double[BINS];
        songPower = 0.0;
        frames = 0;
        fresh = true;
        restart();
    }

    /** Another song, or the same one somewhere else: its frames and the volume start over; the shape is kept. */
    public void restart() {
        histRe = new double[BINS * TAPS]; // the song's latest frames, newest first: [bin * TAPS + tap]
        histIm = new double[BINS * TAPS];
        num = 0.0;
        den = 0.0;
        volume = 1.0;
        if (!fresh) frames = WARMUP_FRAMES;
    }

    /** HOP samples of the stream (and the song lined up with them, or null) in, HOP samples of the result out. */
    public float[] process(float[] streamHop, float[] songHop) {
        System.arraycopy(stream, HOP, stream, 0, SIZE - HOP);
        System.arraycopy(streamHop, 0, stream, SIZE - HOP, HOP);
        System.arraycopy(song, HOP, song, 0, SIZE - HOP);
        if (songHop != null) System.arraycopy(songHop, 0, song, SIZE - HOP, HOP);
        else java.util.Arrays.fill(song, SIZE - HOP, SIZE, 0f);
        for (int i = 0; i < SIZE; i++) frame[i] = (float) ((double) stream[i] * WINDOW[i]);
        if (songHop == null) {
            // No song: nothing to take out, the frame goes back as it is (an FFT there and back would give the
            // same, to rounding: most of the time no song plays, and that's two FFTs per channel each hop saved).
            for (int i = 0; i < SIZE; i++) back[i] = frame[i];
        } else {
            fft.rfft(frame, yr, yi);
            for (int i = 0; i < SIZE; i++) frame[i] = (float) ((double) song[i] * WINDOW[i]);
            fft.rfft(frame, xr, xi);
            cancel();
            fft.irfft(er, ei, back);
        }
        for (int i = 0; i < SIZE; i++) overlap[i] = (float) (overlap[i] + (double) (float) back[i] * WINDOW[i] / NORM);
        System.arraycopy(overlap, 0, out, 0, HOP); // (reused each hop: the caller copies it before the next)
        System.arraycopy(overlap, HOP, overlap, 0, SIZE - HOP);
        java.util.Arrays.fill(overlap, SIZE - HOP, SIZE, 0f);
        return out;
    }

    private void cancel() {
        for (int k = 0; k < BINS; k++) {
            for (int t = TAPS - 1; t > 0; t--) {
                histRe[k * TAPS + t] = histRe[k * TAPS + t - 1];
                histIm[k * TAPS + t] = histIm[k * TAPS + t - 1];
            }
            histRe[k * TAPS] = xr[k];
            histIm[k * TAPS] = xi[k];
            double a = 0, b = 0;
            for (int t = 0; t < TAPS; t++) { // the song as the shape predicts it, before the volume
                int i = k * TAPS + t;
                a += shapeRe[i] * histRe[i] - shapeIm[i] * histIm[i];
                b += shapeRe[i] * histIm[i] + shapeIm[i] * histRe[i];
            }
            sr[k] = a;
            si[k] = b;
        }
        frames += 1;
        if (fresh && frames > WARMUP_FRAMES) fresh = false;
        double heardAt = frames > WARMUP_FRAMES ? Math.max(volume, LEARN_VOLUME) : 1.0;
        double numSum = 0, denSum = 0;
        for (int k = 0; k < BINS; k++) {
            double value = 1;
            if (!fresh) {
                double gr = heardAt * sr[k], gi = heardAt * si[k];
                double guess = gr * gr + gi * gi;
                double dr = yr[k] - gr, di = yi[k] - gi;
                value = guess / (guess + dr * dr + di * di + 1e-12);
            }
            value = Math.min(value * SHARE_GAIN, 1.0);
            share[k] = value;
            numSum += value * (sr[k] * yr[k] + si[k] * yi[k]);
            denSum += value * (sr[k] * sr[k] + si[k] * si[k]);
        }
        num = volumeKeep * num + (1 - volumeKeep) * numSum;
        den = volumeKeep * den + (1 - volumeKeep) * denSum;
        if (frames > WARMUP_FRAMES && den > 1e-12) volume = Math.min(Math.max(num / den, 0.0), MAX_VOLUME);
        double vol = volume;
        double heardMean = 0;
        for (int k = 0; k < BINS; k++) {
            er[k] = yr[k] - vol * sr[k];
            ei[k] = yi[k] - vol * si[k];
            double h = 0;
            for (int t = 0; t < TAPS; t++) {
                int i = k * TAPS + t;
                h += histRe[i] * histRe[i] + histIm[i] * histIm[i];
            }
            heard[k] = h;
            heardMean += h;
        }
        heardMean /= BINS;
        if (frames == 1) { // the averages start from the song's first frame, not from silence
            System.arraycopy(heard, 0, power, 0, BINS);
            songPower = heardMean;
        }
        for (int k = 0; k < BINS; k++) power[k] = shapeKeep * power[k] + (1 - shapeKeep) * heard[k];
        songPower = shapeKeep * songPower + (1 - shapeKeep) * heardMean;
        double learnVolume = frames > WARMUP_FRAMES ? volume : 1.0;
        if (learnVolume >= QUIET_VOLUME) {
            double floor = 1e-3 * songPower + 1e-12;
            double scale = Math.max(learnVolume, LEARN_VOLUME);
            for (int k = 0; k < BINS; k++) {
                double step = SHAPE_RATE * Math.max(share[k], LEARN_FLOOR) / (power[k] + floor);
                double wr = yr[k] / scale - sr[k], wi = yi[k] / scale - si[k];
                for (int t = 0; t < TAPS; t++) {
                    int i = k * TAPS + t;
                    double cr = histRe[i], ci = -histIm[i]; // conj(x)
                    shapeRe[i] += step * (cr * wr - ci * wi);
                    shapeIm[i] += step * (cr * wi + ci * wr);
                }
            }
        }
        if (frames > WARMUP_FRAMES && volume >= QUIET_VOLUME) {
            double f = Math.pow(volume, SETTLE);
            for (int i = 0; i < shapeRe.length; i++) {
                shapeRe[i] *= f;
                shapeIm[i] *= f;
            }
            num *= f;
            den *= f * f;
            volume /= f;
        }
        // what's left of the song, turned down where it still outweighs the rest
        for (int k = 0; k < BINS; k++) {
            double mr = vol * sr[k], mi = vol * si[k];
            double music = mr * mr + mi * mi;
            double left = er[k] * er[k] + ei[k] * ei[k];
            double ratio = music / (left + music + 1e-12);
            double keep = Math.min(Math.max(1 - ratio, LEFTOVER_FLOOR), 1);
            er[k] *= keep;
            ei[k] *= keep;
        }
    }
}
