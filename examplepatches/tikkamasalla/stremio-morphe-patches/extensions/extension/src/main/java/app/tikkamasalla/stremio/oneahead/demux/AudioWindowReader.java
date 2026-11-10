package app.tikkamasalla.stremio.oneahead.demux;

import java.util.List;

/**
 * Gets decoded mono PCM for the slices a caller asks for. Runs on one low-priority thread that the
 * caller owns. Slices can be any size and in any order, so a probe stage saves real bytes.
 */
public final class AudioWindowReader {
    /** Frames fed ahead of a slice so the decoder has settled when the slice starts. */
    private static final long PREROLL_US = 250_000, POSTROLL_US = 100_000;
    private static final int GUARD_EVERY_FRAMES = 32;

    /** One slice's outcome. Only OK means the samples can be trusted to cover the slice. */
    public static final class SliceResult {
        public PtsCheck.Result pts;
        public Demuxer.ReadStats demux;
        public long bytesFetched;
        public int requests;
        /** The timestamps add up and the file was whole here. Only then does the slice count as covered. */
        public boolean ok() {
            return pts.status == PtsCheck.Status.OK && !demux.truncated && demux.resyncs == 0;
        }
    }

    private final RangeSource source;
    private final AudioDecoder.Factory decoders;
    private final PlaybackGuard guard;
    private final DemuxLog log;
    private final int outRate;
    private Demuxer demuxer;
    private TrackInfo track;
    private AudioDecoder decoder;
    private MonoDownsampler downsampler;
    private final CurrentSlice current = new CurrentSlice();
    private ByteBudget budget;
    private boolean needsFlush;
    private double trueEndSec = -1;

    public AudioWindowReader(RangeSource source, AudioDecoder.Factory decoders, PlaybackGuard guard,
                             ByteBudget budget, int outRate, DemuxLog log) {
        this.source = source;
        this.decoders = decoders;
        this.guard = guard;
        this.budget = budget;
        this.outRate = outRate;
        this.log = log;
    }

    /** Reads the index and picks the track; costs metadata only. Fails cleanly with NO_TRACK. */
    public TrackInfo prepare(TrackChooser.Request request) throws DemuxException {
        List<TrackInfo> tracks = tracks();
        track = TrackChooser.choose(tracks, request, decoders);
        if (track == null) {
            throw new DemuxException(DemuxException.Kind.NO_TRACK, tracks.size() + " audio tracks, none usable");
        }
        demuxer.select(track);
        log.log("track " + track + " of " + tracks.size() + " (" + TrackChooser.reason(tracks, track, request) + "), duration " + demuxer.durationSec());
        return track;
    }

    /** The file's audio tracks; opens the container on the first call. */
    public List<TrackInfo> tracks() throws DemuxException {
        if (demuxer == null) demuxer = openDemuxer(source, log);
        return demuxer.tracks();
    }

    /** MKV or MP4 by the file's first bytes. */
    static Demuxer openDemuxer(RangeSource source, DemuxLog log) throws DemuxException {
        byte[] head = new byte[12];
        int got = source.read(0, head, 0, head.length);
        if (got < 12) throw new DemuxException(DemuxException.Kind.MALFORMED, "file too short");
        Demuxer d;
        if (head[0] == 0x1A && head[1] == 0x45 && (head[2] & 0xFF) == 0xDF && (head[3] & 0xFF) == 0xA3) {
            d = new MkvDemuxer(source, log);
        } else {
            d = new Mp4Demuxer(source, log);
        }
        d.open();
        return d;
    }

    public Demuxer demuxer() {
        return demuxer;
    }

    /** Container's duration, or the real end once a read has found the stream stops earlier. */
    public double durationSec() {
        return trueEndSec > 0 ? trueEndSec : demuxer.durationSec();
    }

    /** Container's stated duration, whatever the stream does. */
    public double statedDurationSec() {
        return demuxer.durationSec();
    }

    /** Bytes the slices would span; -1 when not known. A caller checks this against its budget first. */
    public long estimateBytes(double[][] slices) {
        long sum = 0;
        for (double[] s : slices) {
            long one = demuxer.estimateBytes((long) (s[0] * 1e6) - PREROLL_US, (long) (s[1] * 1e6) + POSTROLL_US);
            if (one < 0) return -1;
            sum += one;
        }
        return sum;
    }

    /** Centre fractions for the current slice go here; null disables (stereo-safe). */
    public void setCenvSink(MonoDownsampler.CenvSink s) {
        current.csink = s;
        if (downsampler != null) downsampler.setCenvSink(current);
    }

    /** Decodes [startSec, endSec) into the sink. Refuses before fetching when the estimate is over budget. */
    public SliceResult read(double startSec, double endSec, PcmSink sink) throws DemuxException {
        long startUs = (long) (startSec * 1e6), endUs = (long) (endSec * 1e6);
        long estimate = demuxer.estimateBytes(startUs - PREROLL_US, endUs + POSTROLL_US);
        if (estimate > 0) budget.check(estimate);
        long bytesBefore = source.bytesFetched();
        int requestsBefore = source.requests();
        final PtsCheck check = new PtsCheck();
        if (decoder == null) {
            downsampler = new MonoDownsampler(outRate, current, current);
            downsampler.setCenvSink(current);
            decoder = decoders.create(track, downsampler);
        } else if (needsFlush) {
            decoder.flush();
        }
        needsFlush = true;
        current.check = check;
        current.sink = sink;
        downsampler.reset();
        downsampler.setGate(startUs, endUs);
        final int[] sinceGuard = {0};
        SliceResult r = new SliceResult();
        try {
            r.demux = demuxer.read(startUs - PREROLL_US, endUs + POSTROLL_US, new Demuxer.FrameSink() {
                @Override
                public void onFrame(byte[] data, int off, int len, long ptsUs) throws DemuxException {
                    if (++sinceGuard[0] >= GUARD_EVERY_FRAMES) {
                        sinceGuard[0] = 0;
                        awaitGuard();
                    }
                    check.fed(ptsUs);
                    decoder.queue(data, off, len, ptsUs);
                }
            });
            decoder.drainToEnd();
        } catch (DemuxException | RuntimeException error) {
            release();
            if (error instanceof DemuxException) throw (DemuxException) error;
            throw new DemuxException(DemuxException.Kind.DECODER_FAILED, error.getClass().getSimpleName());
        }
        downsampler.flushBlock();
        r.pts = check.finish(startUs, endUs, r.demux.endOfStream);
        r.bytesFetched = source.bytesFetched() - bytesBefore;
        r.requests = source.requests() - requestsBefore;
        if (r.pts.trueEndUs > 0) trueEndSec = r.pts.trueEndUs / 1e6;
        log.log("slice " + startSec + ".." + endSec + ": " + r.pts + ", " + r.bytesFetched + " bytes, " + r.requests + " requests");
        return r;
    }

    private void awaitGuard() throws DemuxException {
        try {
            while (true) {
                if (guard.isCancelled()) throw new DemuxException(DemuxException.Kind.CANCELLED, "cancelled");
                if (!guard.shouldPause()) return;
                Thread.sleep(250);
            }
        } catch (InterruptedException error) {
            Thread.currentThread().interrupt();
            throw new DemuxException(DemuxException.Kind.CANCELLED, "interrupted");
        }
    }

    /** Gives the decoder back. Call when done, and at once when the caller's guard says the player needs it. */
    public void release() {
        if (decoder != null) decoder.release();
        decoder = null;
        needsFlush = false;
    }

    /** The decoder and downsampler live across slices; this points them at the current slice's check and sink. */
    private static final class CurrentSlice implements AudioDecoder.Output, PcmSink, MonoDownsampler.CenvSink {
        PtsCheck check;
        PcmSink sink;
        MonoDownsampler.CenvSink csink;

        @Override
        public void onDecoded(java.nio.ByteBuffer pcm, int encoding, int channels, int sampleRate, long ptsUs) {
            check.onDecoded(pcm, encoding, channels, sampleRate, ptsUs);
        }

        @Override
        public void onPcm(short[] mono, int count, int sampleRate, long ptsUs) throws DemuxException {
            sink.onPcm(mono, count, sampleRate, ptsUs);
        }

        @Override
        public void onCenv(byte[] frac, int count, long ptsUs) {
            if (csink != null) csink.onCenv(frac, count, ptsUs);
        }
    }
}
