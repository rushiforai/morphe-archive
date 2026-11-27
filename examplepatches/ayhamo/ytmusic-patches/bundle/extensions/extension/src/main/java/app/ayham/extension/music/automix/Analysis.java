package app.ayham.extension.music.automix;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * One song's analysis, field for field the extension's (BitChord web's TrackAnalysis plus
 * contentEndSec and musicVideo), with the same JSON names so a saved analysis reads the same
 * on both. A missing value is NaN ("null" in the JSON).
 */
public final class Analysis {
    /** Bumped whenever the analysis changes: a saved one of another version is redone. */
    public static final String VERSION = "ayham.4";

    public String fileKey;
    public double durationSec = Double.NaN;
    public double contentEndSec = Double.NaN;
    /** The mix-in grid (the song's opening). */
    public double bpm = Double.NaN, beatIntervalSec = Double.NaN, firstDownbeatSec = Double.NaN;
    public double gridConfidence;
    /** The mix-out grid (the song's end); null when no beat was found there. */
    public LocalGrid tailGrid;
    /** False: the field was never filled in (an analysis from before tail grids). */
    public boolean tailGridKnown = true;
    public BeatSide headBeats, tailBeats;
    public double introEndSec = Double.NaN, outroStartSec = Double.NaN;
    public double energy;
    public double[] energyCurve = new double[0];
    public int camelotNum;          // 0: unknown
    public char camelotLetter;      // 'A' minor, 'B' major
    public String keyName;
    public double keyConfidence;
    public List<VocalWindow> vocals = new ArrayList<>();
    public boolean musicVideo;
    /**
     * Automix v2's evidence (the extension's host.js): the share of the low end under 60 Hz against
     * 60-120 Hz (log ratio), the bass level over time (of its usual), the whole-song pitch profile,
     * the pitch profile over time and the 100 ms K-weighted loudness (dB). NaN / null: unmeasured.
     */
    public double subBassRatio = Double.NaN;
    public Curve bassCurve, loudnessCurve;
    public double[] chroma;
    public ChromaCurve chromaCurve;
    /** A stand-in for a song with no analysis (the planner's stub). */
    public boolean stub;
    public String analysisVersion = VERSION;

    public static final class LocalGrid {
        public double bpm, beatIntervalSec, firstDownbeatSec, gridConfidence;
    }

    public static final class BeatSide {
        public double[] beats, downbeats;
        public double bpm, confidence;
    }

    /** Values every [step] seconds from [start]. */
    public static final class Curve {
        public double start, step;
        public double[] values;
    }

    /** 12-bin pitch profiles every [step] seconds from [start] (a null frame: none there), each with its weight. */
    public static final class ChromaCurve {
        public double start, step;
        public double[][] values;
        public double[] weights;
    }

    public static final class VocalWindow {
        public double startSec, fps;
        public float[] curve;
    }

    public Analysis copy() {
        Analysis a = new Analysis();
        a.fileKey = fileKey;
        a.durationSec = durationSec;
        a.contentEndSec = contentEndSec;
        a.bpm = bpm;
        a.beatIntervalSec = beatIntervalSec;
        a.firstDownbeatSec = firstDownbeatSec;
        a.gridConfidence = gridConfidence;
        a.tailGrid = tailGrid;
        a.tailGridKnown = tailGridKnown;
        a.headBeats = headBeats;
        a.tailBeats = tailBeats;
        a.introEndSec = introEndSec;
        a.outroStartSec = outroStartSec;
        a.energy = energy;
        a.energyCurve = energyCurve;
        a.camelotNum = camelotNum;
        a.camelotLetter = camelotLetter;
        a.keyName = keyName;
        a.keyConfidence = keyConfidence;
        a.vocals = vocals;
        a.musicVideo = musicVideo;
        a.subBassRatio = subBassRatio;
        a.bassCurve = bassCurve;
        a.loudnessCurve = loudnessCurve;
        a.chroma = chroma;
        a.chromaCurve = chromaCurve;
        a.stub = stub;
        a.analysisVersion = analysisVersion;
        return a;
    }

    // ---- JSON ----

    public Map<String, Object> toJson() {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("fileKey", fileKey);
        m.put("durationSec", durationSec);
        m.put("contentEndSec", contentEndSec);
        m.put("bpm", bpm);
        m.put("beatIntervalSec", beatIntervalSec);
        m.put("firstDownbeatSec", firstDownbeatSec);
        m.put("gridConfidence", gridConfidence);
        if (tailGridKnown) m.put("tailGrid", tailGrid == null ? null : grid(tailGrid));
        m.put("headBeats", side(headBeats));
        m.put("tailBeats", side(tailBeats));
        m.put("introEndSec", introEndSec);
        m.put("outroStartSec", outroStartSec);
        m.put("energy", energy);
        m.put("energyCurve", energyCurve);
        if (camelotNum > 0) {
            Map<String, Object> c = new LinkedHashMap<>();
            c.put("num", camelotNum);
            c.put("letter", String.valueOf(camelotLetter));
            m.put("camelot", c);
        } else {
            m.put("camelot", null);
        }
        m.put("keyName", keyName);
        m.put("keyConfidence", keyConfidence);
        List<Object> v = new ArrayList<>();
        for (VocalWindow w : vocals) {
            Map<String, Object> x = new LinkedHashMap<>();
            x.put("startSec", w.startSec);
            x.put("fps", w.fps);
            x.put("curve", w.curve);
            v.add(x);
        }
        m.put("vocals", v);
        m.put("musicVideo", musicVideo);
        if (!Double.isNaN(subBassRatio)) m.put("subBassRatio", subBassRatio);
        if (bassCurve != null) m.put("bassCurve", curve(bassCurve));
        if (chroma != null) m.put("chroma", chroma);
        if (chromaCurve != null) {
            Map<String, Object> c = new LinkedHashMap<>();
            c.put("start", chromaCurve.start);
            c.put("step", chromaCurve.step);
            List<Object> frames = new ArrayList<>();
            for (double[] f : chromaCurve.values) frames.add(f);
            c.put("values", frames);
            c.put("weights", chromaCurve.weights);
            m.put("chromaCurve", c);
        }
        if (loudnessCurve != null) m.put("loudnessCurve", curve(loudnessCurve));
        m.put("analysisVersion", analysisVersion);
        return m;
    }

    private static Map<String, Object> curve(Curve c) {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("start", c.start);
        m.put("step", c.step);
        m.put("values", c.values);
        return m;
    }

    @SuppressWarnings("unchecked")
    private static Curve curve(Object o) {
        if (!(o instanceof Map)) return null;
        Map<String, Object> m = (Map<String, Object>) o;
        Curve c = new Curve();
        c.start = zero(Json.num(m, "start"));
        c.step = Json.num(m, "step");
        c.values = Json.nums(m.get("values"));
        return c.values == null || !(c.step > 0) ? null : c;
    }

    @SuppressWarnings("unchecked")
    private static ChromaCurve chromaCurve(Object o) {
        if (!(o instanceof Map)) return null;
        Map<String, Object> m = (Map<String, Object>) o;
        if (!(m.get("values") instanceof List)) return null;
        List<Object> frames = (List<Object>) m.get("values");
        ChromaCurve c = new ChromaCurve();
        c.start = zero(Json.num(m, "start"));
        c.step = Json.num(m, "step");
        c.values = new double[frames.size()][];
        for (int i = 0; i < c.values.length; i++) c.values[i] = Json.nums(frames.get(i));
        c.weights = Json.nums(m.get("weights"));
        if (c.weights == null || c.weights.length < c.values.length || !(c.step > 0)) return null;
        return c;
    }

    private static Map<String, Object> grid(LocalGrid g) {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("bpm", g.bpm);
        m.put("beatIntervalSec", g.beatIntervalSec);
        m.put("firstDownbeatSec", g.firstDownbeatSec);
        m.put("gridConfidence", g.gridConfidence);
        return m;
    }

    private static Map<String, Object> side(BeatSide s) {
        if (s == null) return null;
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("beats", s.beats);
        m.put("downbeats", s.downbeats);
        m.put("bpm", s.bpm);
        m.put("confidence", s.confidence);
        return m;
    }

    @SuppressWarnings("unchecked")
    public static Analysis fromJson(Map<String, Object> m) {
        Analysis a = new Analysis();
        a.fileKey = (String) m.get("fileKey");
        a.durationSec = Json.num(m, "durationSec");
        a.contentEndSec = Json.num(m, "contentEndSec");
        a.bpm = Json.num(m, "bpm");
        a.beatIntervalSec = Json.num(m, "beatIntervalSec");
        a.firstDownbeatSec = Json.num(m, "firstDownbeatSec");
        a.gridConfidence = zero(Json.num(m, "gridConfidence"));
        a.tailGridKnown = m.containsKey("tailGrid");
        if (m.get("tailGrid") instanceof Map) {
            Map<String, Object> g = (Map<String, Object>) m.get("tailGrid");
            LocalGrid t = new LocalGrid();
            t.bpm = Json.num(g, "bpm");
            t.beatIntervalSec = Json.num(g, "beatIntervalSec");
            t.firstDownbeatSec = Json.num(g, "firstDownbeatSec");
            t.gridConfidence = zero(Json.num(g, "gridConfidence"));
            a.tailGrid = t;
        }
        a.headBeats = side(m.get("headBeats"));
        a.tailBeats = side(m.get("tailBeats"));
        a.introEndSec = Json.num(m, "introEndSec");
        a.outroStartSec = Json.num(m, "outroStartSec");
        a.energy = zero(Json.num(m, "energy"));
        double[] curve = Json.nums(m.get("energyCurve"));
        a.energyCurve = curve == null ? new double[0] : curve;
        if (m.get("camelot") instanceof Map) {
            Map<String, Object> c = (Map<String, Object>) m.get("camelot");
            a.camelotNum = (int) Json.num(c, "num");
            String letter = (String) c.get("letter");
            a.camelotLetter = letter == null || letter.isEmpty() ? 0 : letter.charAt(0);
        }
        a.keyName = (String) m.get("keyName");
        a.keyConfidence = zero(Json.num(m, "keyConfidence"));
        if (m.get("vocals") instanceof List) {
            for (Object o : (List<Object>) m.get("vocals")) {
                Map<String, Object> x = (Map<String, Object>) o;
                VocalWindow w = new VocalWindow();
                w.startSec = Json.num(x, "startSec");
                w.fps = Json.num(x, "fps");
                w.curve = Json.floats(x.get("curve"));
                a.vocals.add(w);
            }
        }
        a.musicVideo = Boolean.TRUE.equals(m.get("musicVideo"));
        a.subBassRatio = Json.num(m, "subBassRatio");
        a.bassCurve = curve(m.get("bassCurve"));
        a.loudnessCurve = curve(m.get("loudnessCurve"));
        double[] chroma = Json.nums(m.get("chroma"));
        a.chroma = chroma != null && chroma.length == 12 ? chroma : null;
        a.chromaCurve = chromaCurve(m.get("chromaCurve"));
        a.analysisVersion = (String) m.get("analysisVersion");
        // saved before the bar rule too: phased as it is loaded (it changes nothing a second time)
        barPhase(a);
        return a;
    }

    /**
     * analysis-cases.md "The bar [all]" (dedb2a2d): each grid's bars start where the beat model's
     * downbeats in its window vote, 0-3 beats after its first downbeat. The PC's withBarPhase.
     */
    static void barPhase(Analysis a) {
        a.firstDownbeatSec = votedDownbeat(a.beatIntervalSec, a.firstDownbeatSec, a.headBeats == null ? null : a.headBeats.downbeats);
        if (a.tailGrid != null)
            a.tailGrid.firstDownbeatSec = votedDownbeat(a.tailGrid.beatIntervalSec, a.tailGrid.firstDownbeatSec, a.tailBeats == null ? null : a.tailBeats.downbeats);
    }

    /** Each downbeat within a quarter beat of the grid votes for its place k mod 4; a tie keeps place 0. */
    static double votedDownbeat(double beatSec, double fd, double[] downs) {
        if (!(beatSec > 0) || Double.isNaN(fd) || downs == null || downs.length == 0) return fd;
        int[] votes = new int[4];
        for (double d : downs) {
            long k = Math.round((d - fd) / beatSec);
            if (Math.abs(fd + k * beatSec - d) <= beatSec / 4) votes[(int) (((k % 4) + 4) % 4)]++;
        }
        int best = 0;
        for (int p = 1; p < 4; p++) if (votes[p] > votes[best]) best = p;
        return fd + best * beatSec;
    }

    @SuppressWarnings("unchecked")
    private static BeatSide side(Object o) {
        if (!(o instanceof Map)) return null;
        Map<String, Object> m = (Map<String, Object>) o;
        BeatSide s = new BeatSide();
        s.beats = Json.nums(m.get("beats"));
        s.downbeats = Json.nums(m.get("downbeats"));
        if (s.beats == null) s.beats = new double[0];
        if (s.downbeats == null) s.downbeats = new double[0];
        s.bpm = Json.num(m, "bpm");
        s.confidence = zero(Json.num(m, "confidence"));
        return s;
    }

    private static double zero(double d) {
        return Double.isNaN(d) ? 0 : d;
    }
}
