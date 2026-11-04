package app.tikkamasalla.stremio.oneahead.demux;

import java.nio.ByteBuffer;

/**
 * Downmix to mono and windowed-sinc low-pass decimation, block by block with fixed memory. Output
 * samples sit on a fixed time grid (whole multiples of the output period), interpolated from where
 * the decoder's timestamps say that time falls, so a consumer's index is exactly pts * rate. Small
 * jitter moves the anchor slowly; a larger jump restarts the filter and leaves a hole in the output.
 */
public final class MonoDownsampler implements AudioDecoder.Output {
    /** A timestamp jump above this is a real hole, not rounding. */
    static final long JUMP_US = 30_000;
    private static final long JITTER_US = 2_000;
    private static final int PHASES = 64, ZERO_CROSSINGS = 16, BLOCK = 4096, MAX_SRC_RATE = 192000;
    private static final float CUTOFF = 0.45f;
    /** Source samples kept behind the read point so a creeping anchor still finds its history. */
    private static final int KEEP_EXTRA = 256;

    private final int outRate;
    private final PcmSink sink;
    private final AudioDecoder.Output tap;
    private final short[] out = new short[BLOCK];
    private int outCount;
    private long outPtsUs;

    private int srcRate;
    private int half;
    private float[] kernel; // (PHASES + 1) rows of 2 * half taps
    private float[] hist;   // source samples, hist[0] is source index histBase
    private int histLen;
    private long histBase;
    private long anchorUs;  // time of source index 0
    private long pushed;    // source samples since the anchor
    private long nextIndex; // grid index of the next output sample
    private long lastPtsUs = Long.MIN_VALUE; // repeated stamps of one lace skip the drift adjust
    private boolean started;
    private long gateFromUs = Long.MIN_VALUE, gateToUs = Long.MAX_VALUE;

    /** @param tap sees the decoder's raw output first; used by the timestamp check. May be null. */
    public MonoDownsampler(int outRate, PcmSink sink, AudioDecoder.Output tap) {
        this.outRate = outRate;
        this.sink = sink;
        this.tap = tap;
    }

    /** Only samples in [from, to) reach the sink. */
    public void setGate(long fromUs, long toUs) {
        gateFromUs = fromUs;
        gateToUs = toUs;
    }

    /** Drops all state; the next buffer starts a new stretch. */
    public void reset() {
        started = false;
        lastPtsUs = Long.MIN_VALUE;
        outCount = 0;
        histLen = 0;
    }

    @Override
    public void onDecoded(ByteBuffer pcm, int encoding, int channels, int sampleRate, long ptsUs) throws DemuxException {
        if (sampleRate <= 0 || sampleRate > MAX_SRC_RATE || channels <= 0) {
            throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "bad output format " + sampleRate + "/" + channels);
        }
        if (encoding != AudioDecoder.PCM_16BIT && encoding != AudioDecoder.PCM_FLOAT && encoding != AudioDecoder.PCM_32BIT) {
            throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "bad output encoding " + encoding);
        }
        if (tap != null) tap.onDecoded(pcm, encoding, channels, sampleRate, ptsUs);
        if (sampleRate != srcRate) {
            flushBlock();
            buildKernel(sampleRate);
            started = false;
        }
        int width = encoding == AudioDecoder.PCM_16BIT ? 2 : 4;
        int frames = (pcm.limit() - pcm.position()) / (width * channels);
        if (frames == 0) return;
        if (!started) {
            start(ptsUs);
        } else if (ptsUs != lastPtsUs) {
            long drift = ptsUs - (anchorUs + Math.round(pushed * 1e6 / srcRate));
            if (Math.abs(drift) > JUMP_US) {
                flushBlock();
                start(ptsUs);
            } else {
                // The decoder's clock wins over our count. Matroska stamps are rounded to the
                // millisecond: that jitter is followed slowly, anything larger at once.
                anchorUs += Math.abs(drift) > JITTER_US ? drift : drift / 64;
            }
        }
        lastPtsUs = ptsUs;
        int at = pcm.position();
        for (int done = 0; done < frames; ) {
            int take = Math.min(frames - done, hist.length - histLen);
            for (int f = 0; f < take; f++) hist[histLen + f] = mix(pcm, at + (done + f) * width * channels, encoding, channels);
            histLen += take;
            pushed += take;
            done += take;
            produce();
            compact();
        }
    }

    private void start(long ptsUs) {
        anchorUs = ptsUs;
        pushed = 0;
        histBase = -half;
        histLen = half; // Silence before the stretch: the kernel centres on the first sample.
        java.util.Arrays.fill(hist, 0, histLen, 0f);
        nextIndex = -Math.floorDiv(-ptsUs * outRate, 1_000_000L); // First grid point at or after the stretch.
        started = true;
    }

    /** Equal-power-free mix: weights sum to 1 so it cannot clip; LFE is left out. */
    private static float mix(ByteBuffer b, int at, int encoding, int channels) {
        if (channels == 1) return sample(b, at, encoding);
        int w = encoding == AudioDecoder.PCM_16BIT ? 2 : 4;
        if (channels == 2) return 0.5f * (sample(b, at, encoding) + sample(b, at + w, encoding));
        if (channels >= 6) { // FL FR C LFE BL BR ...
            float front = sample(b, at, encoding) + sample(b, at + w, encoding);
            float rear = sample(b, at + 4 * w, encoding) + sample(b, at + 5 * w, encoding);
            return 0.3f * front + 0.3f * sample(b, at + 2 * w, encoding) + 0.05f * rear;
        }
        float sum = 0;
        for (int c = 0; c < channels; c++) sum += sample(b, at + c * w, encoding);
        return sum / channels;
    }

    private static float sample(ByteBuffer b, int at, int encoding) {
        if (encoding == AudioDecoder.PCM_16BIT) return b.getShort(at) / 32768f;
        if (encoding == AudioDecoder.PCM_FLOAT) return b.getFloat(at);
        return b.getInt(at) / 2147483648f;
    }

    private double gridUs() {
        return nextIndex * 1e6 / outRate;
    }

    /** Source index the next output sample falls on. */
    private double nextPos() {
        return (gridUs() - anchorUs) * srcRate / 1e6;
    }

    private void produce() throws DemuxException {
        while (true) {
            double pos = nextPos();
            int centre = (int) Math.floor(pos);
            int last = centre + half; // Highest source index the kernel touches.
            if (last - histBase >= histLen) return;
            int phase = (int) Math.round((pos - centre) * PHASES);
            int row = phase * 2 * half;
            int first = centre - half + 1;
            int h = Math.max(0, (int) (first - histBase)); // The anchor can creep back past what was kept.
            float sum = 0;
            for (int k = 0; k < 2 * half; k++) sum += hist[h + k] * kernel[row + k];
            emit(sum, Math.round(gridUs()));
            nextIndex++;
        }
    }

    private void emit(float value, long ptsUs) throws DemuxException {
        if (ptsUs < gateFromUs || ptsUs >= gateToUs) {
            flushBlock();
            return;
        }
        if (outCount == 0) outPtsUs = ptsUs;
        int v = Math.round(value * 32767f);
        out[outCount++] = (short) Math.max(-32768, Math.min(32767, v));
        if (outCount == BLOCK) flushBlock();
    }

    /** Hands over what is pending. Called at stretch ends and when the window is finished. */
    public void flushBlock() throws DemuxException {
        if (outCount > 0) sink.onPcm(out, outCount, outRate, outPtsUs);
        outCount = 0;
    }

    private void compact() {
        long keep = (long) Math.floor(nextPos()) - half + 1 - KEEP_EXTRA;
        int drop = (int) (keep - histBase);
        if (drop <= 0) return;
        drop = Math.min(drop, histLen);
        System.arraycopy(hist, drop, hist, 0, histLen - drop);
        histLen -= drop;
        histBase += drop;
    }

    private void buildKernel(int rate) {
        srcRate = rate;
        double cutoff = CUTOFF * Math.min(outRate, rate);
        half = (int) Math.ceil(ZERO_CROSSINGS * rate / (2 * cutoff));
        kernel = new float[(PHASES + 1) * 2 * half];
        for (int p = 0; p <= PHASES; p++) {
            double frac = (double) p / PHASES, gain = 0;
            int row = p * 2 * half;
            for (int k = 0; k < 2 * half; k++) {
                double x = k - half + 1 - frac; // Distance from the output point, in source samples.
                double arg = 2 * cutoff / rate * x;
                double sinc = Math.abs(arg) < 1e-9 ? 1 : Math.sin(Math.PI * arg) / (Math.PI * arg);
                double w = Math.abs(x) >= half ? 0 : 0.42 + 0.5 * Math.cos(Math.PI * x / half) + 0.08 * Math.cos(2 * Math.PI * x / half);
                double v = sinc * w;
                kernel[row + k] = (float) v;
                gain += v;
            }
            for (int k = 0; k < 2 * half; k++) kernel[row + k] = (float) (kernel[row + k] / gain);
        }
        hist = new float[2 * half + KEEP_EXTRA + 16384];
        histLen = 0;
    }
}
