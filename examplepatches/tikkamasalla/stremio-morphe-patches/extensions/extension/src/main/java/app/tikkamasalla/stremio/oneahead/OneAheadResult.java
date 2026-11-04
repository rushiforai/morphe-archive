package app.tikkamasalla.stremio.oneahead;

import java.util.ArrayList;
import java.util.List;

/** Result handed to the next job (skip wiring): segments for the lowest skip source. */
public final class OneAheadResult {
    public static final String SOURCE = "One-ahead";
    public static final String BORROWED = "Borrowed chapters";
    /** Theme-song backup inside the one-ahead job: same lowest priority, never auto over real sources. */
    public static final String THEME = "One-ahead themes";
    /** Bump when Detector gates/config change in a way that can move an edge. */
    public static final int DETECTOR_VERSION = 2;

    public static final class Segment {
        public final String type; // "intro" or "credits"
        public final double start, end;
        public final String source;
        public final boolean eofAgree;
        public Segment(String type, double start, double end, boolean eofAgree) {
            this(type, start, end, eofAgree, SOURCE);
        }
        public Segment(String type, double start, double end, boolean eofAgree, String source) {
            this.type = type; this.start = start; this.end = end; this.eofAgree = eofAgree; this.source = source;
        }
    }

    public final String videoId;
    public final long fileSize, headHash;
    public final int detectorVersion;
    public final List<Segment> segments = new ArrayList<>();
    /** The measured file's own duration, for the external hand-off; 0 on a result loaded from disk. */
    public double fileDurationSec;

    public OneAheadResult(String videoId, long fileSize, long headHash, int detectorVersion) {
        this.videoId = videoId; this.fileSize = fileSize; this.headHash = headHash;
        this.detectorVersion = detectorVersion;
    }

    /** A result applies only to the same file identity it was measured on. */
    public boolean appliesTo(long size, long hash) {
        return fileSize != 0 && fileSize == size && headHash != 0 && headHash == hash
                && detectorVersion == DETECTOR_VERSION;
    }

    static OneAheadResult fromDetector(String videoId, EpisodeFeatures target, Detector.Result r) {
        OneAheadResult out = new OneAheadResult(videoId, target.fileSize, target.headHash, DETECTOR_VERSION);
        out.fileDurationSec = target.duration;
        for (Detector.Segment s : r.segments)
            out.segments.add(new Segment(s.type, s.start, s.end, s.gates.contains("eof_agree")));
        return out;
    }
}
