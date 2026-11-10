package app.tikkamasalla.stremio.oneahead;

import app.tikkamasalla.stremio.oneahead.demux.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Runner fetcher over the existing demux package: one AudioWindowReader per file,
 * plan slices decoded at 4 kHz and placed on the file clock by their timestamps.
 * Every plan slice is a full window: target and references are correlated in full.
 * The stream URL lives only in the RangeSource built by the factory — never logged.
 */
public final class DemuxFeatureFetcher implements OneAheadRunner.FeatureFetcher {
    /** Builds the paced, budgeted source for one file (its URL stays inside). */
    public interface SourceFactory {
        RangeSource open(OneAheadPlanner.FileRef ref, ByteBudget budget, PlaybackGuard guard);
    }

    private final SourceFactory sources;
    private final AudioDecoder.Factory decoders;
    private final DemuxLog log;
    /** How the wanted audio language was learned (TrackChooser.SELECTED, PREVIOUS, UNKNOWN); "" for the plain rule. */
    private final String audioSource;

    public DemuxFeatureFetcher(SourceFactory sources, AudioDecoder.Factory decoders, DemuxLog log) {
        this(sources, decoders, log, "");
    }

    public DemuxFeatureFetcher(SourceFactory sources, AudioDecoder.Factory decoders, DemuxLog log, String audioSource) {
        this.sources = sources; this.decoders = decoders; this.log = log; this.audioSource = audioSource;
    }

    @Override
    public EpisodeFeatures fetch(OneAheadPlanner.FilePlan fp, ByteBudget budget, PlaybackGuard guard) throws DemuxException {
        OneAheadPlanner.FileRef ref = fp.ref;
        RangeSource source = sources.open(ref, budget, guard);
        AudioWindowReader reader = new AudioWindowReader(source, decoders, guard, budget, Track.SR, log);
        try {
            TrackInfo track = reader.prepare(new TrackChooser.Request(ref.language, ref.channels(), audioSource));
            // The features are stored under the probed identity: a link that moved to another file is not used.
            if (ref.fileSize > 0 && source.length() > 0 && source.length() != ref.fileSize) {
                throw new DemuxException(DemuxException.Kind.FILE_CHANGED, "size differs from the probe");
            }
            lowHeapStop(HeapGate.FETCH_BYTES);
            // The file's own clock, never the show's meta runtime: the detector's file-end rules read it.
            double dur = reader.statedDurationSec();
            if (dur <= 0) throw new DemuxException(DemuxException.Kind.MALFORMED, "no duration");
            float[] head = new float[(int) (OneAheadPlanner.headSec(dur) * Track.SR)];
            double tailStart = Math.max(0, dur - OneAheadPlanner.tailSec(dur));
            float[] tail = new float[(int) ((dur - tailStart) * Track.SR)];
            // Centre fractions share the 20 ms grid; stereo files leave these null (fallback).
            byte[][] cenvHead = new byte[][] { new byte[head.length / Track.ENV_SAMPLES] };
            byte[][] cenvTail = new byte[][] { new byte[tail.length / Track.ENV_SAMPLES] };
            final boolean[][] cenvSeen = new boolean[][] { { false } };
            reader.setCenvSink((frac, count, ptsUs) -> {
                cenvSeen[0][0] = true;
                double atSec = ptsUs / 1e6;
                double hs = OneAheadPlanner.headSec(dur);
                if (atSec < hs) cfill(cenvHead[0], 0, frac, count, ptsUs);
                if (atSec + count * 0.02 > tailStart) cfill(cenvTail[0], tailStart, frac, count, ptsUs);
            });
            // Slices are re-derived from the measured duration, so container drift cannot misalign windows.
            List<double[]> slices = OneAheadPlanner.slices(dur, fp.mode);
            // Re-price with the real index: over the episode cap is a clean refusal, not a partial fetch.
            long est = reader.estimateBytes(slices.toArray(new double[0][]));
            if (est > 0) budget.check(est);
            List<AudioWindowReader.SliceResult> bad = new ArrayList<>();
            for (double[] s : slices) {
                AudioWindowReader.SliceResult r = reader.read(s[0], s[1], (mono, n, sr, ptsUs) -> {
                    double atSec = ptsUs / 1e6;
                    // A slice can overlap both windows on a short file: it fills each it overlaps.
                    if (atSec < OneAheadPlanner.headSec(dur)) fill(head, 0, mono, n, ptsUs);
                    if (atSec + n / (double) sr > tailStart) fill(tail, tailStart, mono, n, ptsUs);
                });
                if (!r.ok()) bad.add(r);
            }
            if (!bad.isEmpty()) throw new DemuxException(DemuxException.Kind.MALFORMED, "untrusted slice");
            double audioEnd = reader.durationSec();
            lowHeapStop(HeapGate.BUILD_BYTES); // the read may have taken an hour
            Track h = Track.build(0, head, 8), t = Track.build(tailStart, tail, 8);
            if (cenvSeen[0][0]) {
                h = h.withCenv(cenvHead[0]);
                t = t.withCenv(cenvTail[0]);
            }
            return new EpisodeFeatures(ref.episodeId, ref.fileSize, ref.headHash,
                    track.language == null || track.language.isEmpty() ? ref.language : track.language,
                    dur, audioEnd, ref.finale, h, t);
        } finally {
            reader.release();
        }
    }

    private static void lowHeapStop(long bytes) throws DemuxException {
        if (!HeapGate.fits(bytes)) throw new DemuxException(DemuxException.Kind.CANCELLED, "low heap");
    }

    private static void fill(float[] win, double baseSec, short[] mono, int n, long ptsUs) {
        int at = (int) Math.round(ptsUs / 1e6 * Track.SR - baseSec * Track.SR);
        for (int i = 0; i < n; i++) {
            int j = at + i;
            if (j >= 0 && j < win.length) win[j] = mono[i] / 32768f;
        }
    }

    private static void cfill(byte[] win, double baseSec, byte[] frac, int n, long ptsUs) {
        int at = (int) Math.round(ptsUs / 1e6 * (Track.SR / Track.ENV_SAMPLES) - baseSec * (Track.SR / Track.ENV_SAMPLES));
        for (int i = 0; i < n; i++) {
            int j = at + i;
            if (j >= 0 && j < win.length) win[j] = frac[i];
        }
    }
}
