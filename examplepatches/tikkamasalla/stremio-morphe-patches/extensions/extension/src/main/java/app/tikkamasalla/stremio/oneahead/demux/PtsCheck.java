package app.tikkamasalla.stremio.oneahead.demux;

import java.nio.ByteBuffer;

/**
 * Compares what went into the decoder (container timestamps) with what came out (decoder
 * timestamps). A decode whose start silently vanished looks fine by length and shifted every time
 * in its window in v2 (LOGH S1E02, -5.12 s); here it fails the window instead.
 */
public final class PtsCheck implements AudioDecoder.Output {
    public enum Status { OK, EMPTY, START_LOST, END_LOST, GAP, PTS_MISMATCH, SHORT_READ }

    /** A decoder may swallow this much at a start (priming, Opus seek pre-roll). */
    static final long EDGE_TOLERANCE_US = 150_000;
    /** A hole this long rejects the window. */
    static final long GAP_TOLERANCE_US = 50_000;

    /** Span against samples played may differ by this share: wrong rates and many small holes fail, muxer clock drift does not. */
    static final int DRIFT_SHARE_DIVISOR = 100;

    private long firstFed = Long.MIN_VALUE, lastFed = Long.MIN_VALUE, firstOut = Long.MIN_VALUE, outEnd = Long.MIN_VALUE, lastStart;
    private long maxFedGap, maxOutGap, maxStartAhead, samples;
    private int backwards;
    private int rate;

    public void fed(long ptsUs) {
        if (firstFed == Long.MIN_VALUE) firstFed = ptsUs;
        else maxFedGap = Math.max(maxFedGap, ptsUs - lastFed);
        lastFed = ptsUs;
    }

    @Override
    public void onDecoded(ByteBuffer pcm, int encoding, int channels, int sampleRate, long ptsUs) {
        int width = encoding == AudioDecoder.PCM_16BIT ? 2 : 4;
        int frames = (pcm.limit() - pcm.position()) / Math.max(1, width * channels);
        if (frames == 0 || sampleRate <= 0) return;
        rate = sampleRate;
        long durUs = frames * 1_000_000L / sampleRate;
        if (firstOut == Long.MIN_VALUE) {
            firstOut = ptsUs;
            outEnd = ptsUs + durUs;
        } else if (ptsUs == lastStart) {
            // Equal stamps advance one lace: frames of one lace share a time when the container gives no duration.
            outEnd += durUs;
        } else {
            if (ptsUs < lastStart - GAP_TOLERANCE_US) backwards++;
            maxOutGap = Math.max(maxOutGap, ptsUs - outEnd);
            outEnd = ptsUs + durUs;
        }
        // A buffer cannot be stamped later than what has been fed so far.
        if (lastFed != Long.MIN_VALUE) maxStartAhead = Math.max(maxStartAhead, ptsUs - lastFed);
        lastStart = ptsUs;
        outEnd = ptsUs + frames * 1_000_000L / sampleRate;
        samples += frames;
    }

    /** The verdict on one window. */
    public static final class Result {
        public Status status;
        public long firstFedUs, lastFedUs, firstOutUs, outEndUs, maxOutGapUs, maxFedGapUs, samples;
        /** Time span minus samples played: how much the two clocks disagree. */
        public long sampleDriftUs;
        /** Where the audio really stops, when the stream ended inside the window; else -1. */
        public long trueEndUs = -1;

        @Override
        public String toString() {
            return status + " fed " + firstFedUs + ".." + lastFedUs + " out " + firstOutUs + ".." + outEndUs
                    + " outGap " + maxOutGapUs + " fedGap " + maxFedGapUs + " drift " + sampleDriftUs + " trueEnd " + trueEndUs;
        }
    }

    public Result finish(long wantFromUs, long wantToUs, boolean endOfStream) {
        Result r = new Result();
        r.firstFedUs = firstFed;
        r.lastFedUs = lastFed;
        r.firstOutUs = firstOut;
        r.outEndUs = outEnd;
        r.maxOutGapUs = maxOutGap;
        r.maxFedGapUs = maxFedGap;
        r.samples = samples;
        if (firstOut == Long.MIN_VALUE) {
            r.status = firstFed == Long.MIN_VALUE && endOfStream ? Status.OK : Status.EMPTY;
            return r;
        }
        r.sampleDriftUs = (outEnd - firstOut) - samples * 1_000_000L / rate;
        if (endOfStream) r.trueEndUs = outEnd;
        long coveredFrom = Math.max(wantFromUs, firstFed);
        if (backwards > 0 || maxStartAhead > EDGE_TOLERANCE_US || firstOut < firstFed - EDGE_TOLERANCE_US) {
            r.status = Status.PTS_MISMATCH;
        } else if (firstOut > coveredFrom + EDGE_TOLERANCE_US) {
            r.status = Status.START_LOST;
        } else if (maxOutGap > GAP_TOLERANCE_US
                || Math.abs(r.sampleDriftUs) > Math.max(GAP_TOLERANCE_US, (outEnd - firstOut) / DRIFT_SHARE_DIVISOR)) {
            r.status = Status.GAP;
        } else if (outEnd < lastFed - EDGE_TOLERANCE_US) {
            r.status = Status.END_LOST;
        } else if (!endOfStream && outEnd < wantToUs - EDGE_TOLERANCE_US) {
            r.status = Status.SHORT_READ;
        } else {
            r.status = Status.OK;
        }
        return r;
    }
}
