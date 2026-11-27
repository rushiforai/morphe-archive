package app.ayham.extension.music.automix;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeSet;

/**
 * The synthetic analysis cases of spec/automix/analysis-cases.json, checked against the truth they
 * were built from: layer 1's tolerances (analysis-cases.md), measured as the extension's
 * scripts/analysis_cases.mjs measures them. A failed check with a knownMiss entry prints as KNOWN and
 * doesn't fail; a known miss this analyser gets right says so.
 */
@SuppressWarnings("unchecked")
final class AnalysisCases {
    private AnalysisCases() {
    }

    /** rules of analysis-cases.json. */
    static final class Rules {
        double tempoBpm, beatSec, beatShare, downbeatBarShare, vocalSung, vocalIoU;

        static Rules of(Map<String, Object> m) {
            Rules r = new Rules();
            r.tempoBpm = num(m, "tempoBpm");
            r.beatSec = num(m, "beatSec");
            r.beatShare = num(m, "beatShare");
            r.downbeatBarShare = num(m, "downbeatBarShare");
            r.vocalSung = num(m, "vocalSung");
            r.vocalIoU = num(m, "vocalIoU");
            return r;
        }
    }

    /** One synthetic case. */
    static final class Case {
        String name;
        AnalysisSignals.Song song;
        List<String> check = new ArrayList<>();
        Map<String, String> knownMiss = new LinkedHashMap<>();

        /** A length-only case (tooLong) isn't rendered or analysed (analysis-cases.md §6). */
        boolean rendered() {
            return !check.contains("tooLong");
        }
    }

    static File specFile() {
        for (File d = new File("").getAbsoluteFile(); d != null; d = d.getParentFile()) {
            File s = new File(d, "spec/automix/analysis-cases.json");
            if (s.isFile()) return s;
        }
        throw new AssertionError("spec/automix/analysis-cases.json not found above " + new File("").getAbsolutePath());
    }

    static Map<String, Object> spec() {
        try {
            return (Map<String, Object>) Json.parse(new String(Files.readAllBytes(specFile().toPath()), StandardCharsets.UTF_8));
        } catch (java.io.IOException e) {
            throw new AssertionError(e);
        }
    }

    static Rules rules() {
        return Rules.of((Map<String, Object>) spec().get("rules"));
    }

    static List<Case> cases() {
        List<Case> out = new ArrayList<>();
        for (Object o : (List<Object>) spec().get("synthetic")) {
            Map<String, Object> m = (Map<String, Object>) o;
            Case c = new Case();
            c.name = (String) m.get("name");
            c.song = AnalysisSignals.Song.of((Map<String, Object>) m.get("song"));
            for (Object w : (List<Object>) m.get("check")) c.check.add((String) w);
            if (m.get("knownMiss") != null)
                for (Map.Entry<String, Object> e : ((Map<String, Object>) m.get("knownMiss")).entrySet()) c.knownMiss.put(e.getKey(), (String) e.getValue());
            out.add(c);
        }
        return out;
    }

    // ---------------------------------------------------------------------------------------------
    // The measures (analysis_cases.mjs)

    /** Every beat a reading reports: the opening's and the end's, rounded to 0.1 ms, without repeats. */
    static double[] beatsOf(Analysis a) {
        TreeSet<Double> s = new TreeSet<>();
        for (Analysis.BeatSide side : new Analysis.BeatSide[]{a.headBeats, a.tailBeats})
            if (side != null && side.beats != null) for (double t : side.beats) s.add(Math.round(t * 1e4) / 1e4);
        double[] out = new double[s.size()];
        int i = 0;
        for (double t : s) out[i++] = t;
        return out;
    }

    /** The distance from t to the nearest time of a sorted list. */
    static double nearest(double[] sorted, double t) {
        int i = Arrays.binarySearch(sorted, t);
        if (i >= 0) return 0;
        i = -i - 1;
        double d = Double.POSITIVE_INFINITY;
        if (i < sorted.length) d = sorted[i] - t;
        if (i > 0) d = Math.min(d, t - sorted[i - 1]);
        return d;
    }

    /** The share of [want] with a time of [got] within [tol] (1 when nothing is wanted). */
    static double shareWithin(double[] want, double[] got, double tol) {
        if (want.length == 0) return 1;
        int n = 0;
        for (double t : want) if (got.length > 0 && nearest(got, t) <= tol) n++;
        return n / (double) want.length;
    }

    /** The bar starts a reading implies: its beats from the one nearest the first downbeat on, every 4th (and back before it). */
    static double[] barStarts(Analysis a) {
        double[] b = beatsOf(a);
        if (b.length == 0 || Double.isNaN(a.firstDownbeatSec)) return new double[0];
        int i0 = 0;
        for (int i = 0; i < b.length; i++) if (Math.abs(b[i] - a.firstDownbeatSec) < Math.abs(b[i0] - a.firstDownbeatSec)) i0 = i;
        List<Double> out = new ArrayList<>();
        for (int i = 0; i < b.length; i++) if ((i - i0) % 4 == 0) out.add(b[i]);
        double[] r = new double[out.size()];
        for (int i = 0; i < r.length; i++) r[i] = out.get(i);
        return r;
    }

    /** {time, sung 0/1} of every vocal frame (sung: the curve at VOCAL_SUNG or more). */
    static List<double[]> sungFrames(Analysis a, double vocalSung) {
        List<double[]> f = new ArrayList<>();
        for (Analysis.VocalWindow w : a.vocals)
            for (int i = 0; i < w.curve.length; i++) f.add(new double[]{w.startSec + i / w.fps, w.curve[i] >= vocalSung ? 1 : 0});
        return f;
    }

    /** IoU of {a, b} boolean pairs (1 when neither is ever set). */
    static double iou(List<boolean[]> pairs) {
        int both = 0, either = 0;
        for (boolean[] p : pairs) {
            if (p[0] && p[1]) both++;
            if (p[0] || p[1]) either++;
        }
        return either > 0 ? both / (double) either : 1;
    }

    // ---------------------------------------------------------------------------------------------
    // The verdicts

    static final class Verdict {
        final String what, text, knownMiss;
        final boolean ok;
        final double value;

        Verdict(String what, boolean ok, double value, String text, String knownMiss) {
            this.what = what;
            this.ok = ok;
            this.value = value;
            this.text = text;
            this.knownMiss = knownMiss;
        }

        /** Fails the case: wrong, and not a known miss. */
        boolean fails() {
            return !ok && knownMiss == null;
        }

        String label() {
            return ok ? "ok   " : knownMiss != null ? "KNOWN" : "DIFF ";
        }

        @Override
        public String toString() {
            return label() + " " + what + ": " + text
                    + (ok && knownMiss != null ? " (a known miss of the extension's analyser; right here)" : "");
        }
    }

    static final class Result {
        final String name;
        final List<Verdict> verdicts = new ArrayList<>();

        Result(String name) {
            this.name = name;
        }

        boolean failed() {
            for (Verdict v : verdicts) if (v.fails()) return true;
            return false;
        }

        Verdict get(String what) {
            for (Verdict v : verdicts) if (v.what.equals(what)) return v;
            return null;
        }

        @Override
        public String toString() {
            boolean known = false;
            for (Verdict v : verdicts) known |= !v.ok && v.knownMiss != null;
            StringBuilder sb = new StringBuilder(failed() ? "DIFF " : known ? "ok*  " : "ok   ").append(name);
            for (Verdict v : verdicts) sb.append("\n       ").append(v);
            return sb.toString();
        }
    }

    private static String pct(double x) {
        return String.format(Locale.US, "%.0f%%", x * 100);
    }

    /** One case's reading against its truth. */
    static Result check(Case c, Analysis a, Rules rule) {
        Result res = new Result(c.name);
        List<AnalysisSignals.Beat> truth = new ArrayList<>();
        for (AnalysisSignals.Beat b : AnalysisSignals.beatTimes(c.song)) if (b.t <= c.song.sec - 0.5) truth.add(b);
        for (String what : c.check) {
            String known = c.knownMiss.get(what);
            switch (what) {
                case "tempo": {
                    double want = c.song.parts.get(0)[1];
                    boolean ok = Math.abs(a.bpm - want) <= rule.tempoBpm;
                    String fold = Math.abs(a.bpm - want / 2) <= rule.tempoBpm ? ", a half-time reading"
                            : Math.abs(a.bpm - want * 2) <= rule.tempoBpm ? ", a double-time reading" : "";
                    res.verdicts.add(new Verdict(what, ok, a.bpm, String.format(Locale.US, "%.2f BPM for %s (±%s, no half or double%s)",
                            a.bpm, fmt(want), fmt(rule.tempoBpm), fold), known));
                    break;
                }
                case "beats": {
                    double[] want = new double[truth.size()];
                    for (int i = 0; i < want.length; i++) want[i] = truth.get(i).t;
                    double s = shareWithin(want, beatsOf(a), rule.beatSec);
                    res.verdicts.add(new Verdict(what, s >= rule.beatShare, s, String.format(Locale.US, "%s within %s ms (needs %s)",
                            pct(s), fmt(rule.beatSec * 1000), pct(rule.beatShare)), known));
                    break;
                }
                case "downbeat": {
                    List<Double> bars = new ArrayList<>();
                    for (AnalysisSignals.Beat b : truth) if (b.beatInBar == 0) bars.add(b.t);
                    double[] want = new double[bars.size()];
                    for (int i = 0; i < want.length; i++) want[i] = bars.get(i);
                    double s = shareWithin(want, barStarts(a), rule.beatSec);
                    res.verdicts.add(new Verdict(what, s >= rule.downbeatBarShare, s, String.format(Locale.US,
                            "%s of bars start on a reported downbeat (first %.3f s; needs %s)", pct(s), a.firstDownbeatSec, pct(rule.downbeatBarShare)), known));
                    break;
                }
                case "vocals": {
                    List<boolean[]> pairs = new ArrayList<>();
                    int sung = 0;
                    for (double[] f : sungFrames(a, rule.vocalSung)) {
                        double t = f[0];
                        boolean edge = false, inVoice = false;
                        for (double[] v : c.song.voice) {
                            edge |= Math.abs(t - v[0]) < 0.25 || Math.abs(t - v[1]) < 0.25;
                            inVoice |= t >= v[0] && t < v[1];
                        }
                        if (edge) continue;
                        pairs.add(new boolean[]{f[1] > 0, inVoice});
                        if (f[1] > 0) sung++;
                    }
                    double v = iou(pairs);
                    res.verdicts.add(new Verdict(what, v >= rule.vocalIoU, v, String.format(Locale.US,
                            "sung regions overlap %s (IoU, needs %s; %d of %d frames sung)", pct(v), pct(rule.vocalIoU), sung, pairs.size()), known));
                    break;
                }
                case "tooLong": {
                    // the phone's cap (Analyzer.MAX_SONG_SEC): over it, the song isn't analysed
                    boolean ok = c.song.sec > Analyzer.MAX_SONG_SEC;
                    res.verdicts.add(new Verdict(what, ok, c.song.sec, String.format(Locale.US, "%s s against the %s s cap: %s",
                            fmt(c.song.sec), fmt(Analyzer.MAX_SONG_SEC), ok ? "not analysed" : "analysed"), known));
                    break;
                }
                default:
                    throw new AssertionError(c.name + ": unknown check " + what);
            }
        }
        return res;
    }

    private static String fmt(double x) {
        return x == Math.rint(x) ? String.valueOf((long) x) : String.valueOf(x);
    }

    private static double num(Map<String, Object> m, String k) {
        Object v = m.get(k);
        if (!(v instanceof Number)) throw new AssertionError("rules." + k + " missing");
        return ((Number) v).doubleValue();
    }
}
