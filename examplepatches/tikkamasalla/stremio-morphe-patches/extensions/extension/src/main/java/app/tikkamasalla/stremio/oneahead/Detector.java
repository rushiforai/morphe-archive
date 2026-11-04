package app.tikkamasalla.stremio.oneahead;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Finds the intro and the credits of a target episode from audio shared with other episodes of the season. At least two
 * references must agree; an edge is the innermost edge of the references that saw it, always read on the target's own clock.
 * Anything uncertain gives no segment.
 *
 * The caller decides what is safe to compare: the same audio language on both sides, the file identity for duplicate rejection,
 * which episode is a finale, and a window's start time from the stream's own timestamps. A window with a timestamp gap or a short
 * decode must not reach this class. One instance at a time on one thread: it owns FFT work buffers.
 */
public final class Detector {

    public static final class Config {
        public double nccMin = 0.88, densityMin = 0.85, refLoose = 3.0;
        public int minRefs = 2, topLags = 3;
        public double introMin = 15, introMax = 240, creditsMin = 25, creditsMax = 700;
        public double dupFrac = 0.85;
        /** Probe every n-th block first, full correlation only when that gives no segment. 0 = always full. */
        public int probeEvery = 0;
        /** True: a probe result ends the search only with three references and tight edges. It cost 57 percent more CPU for one changed edge in testing. */
        public boolean probeStrict = false;
        /** References also agree when one edge matches this closely and the other does not; the inner intersection decides. */
        public double edgeTight = 0.35;
        /** Intro only: two accepted groups closer than this, at the same offset to two references, are one segment. */
        public double slotGap = 25;
        /** Inward search for a silence trough from the end of credits, the end of an intro, the start of either, seconds. */
        public double trimCredits = 20, trimIntro = 12, trimStart = 6;
        /** A trough is this many dB below the segment's median level for at least troughMin seconds. */
        public double troughDepth = 35, troughMin = 0.10;
        /** An end with no trough near it moves in this far, unless the file ends there. */
        public double noTroughCut = 1.0;
        /** Credits references at the same distance from the file end within this earn the eof_agree gate, required only in a finale. */
        public double eofTol = 3;
        /** Credits neither at the references' distance from the file end nor within this of it are not credits. */
        public double creditsFromEnd = 120;
        /** Credits with no silence at the start and no file-end agreement may start over a last scene: the start moves in this far. */
        public double leadInCut = 6;
    }

    public static final class Segment {
        public String type;
        public double start, end, confidence, nccMin, spreadStart, spreadEnd;
        public int refCount;
        public final List<String> gates = new ArrayList<>();
        Cand[] group;

        @Override
        public String toString() {
            return String.format(java.util.Locale.ROOT, "%s %.3f-%.3f refs=%d conf=%.2f %s", type, start, end, refCount, confidence, gates);
        }
    }

    public static final class Result {
        public final List<Segment> segments = new ArrayList<>();
        public final List<String> notes = new ArrayList<>();
    }

    /** One reference's stretch, on the target clock, with clip flags translated to file limits. */
    public static final class Cand {
        public int ref;
        public double start, end, ncc, density, off, eofTarget, eofRef;
        public boolean clipStart, clipEnd;

        public double len() {
            return end - start;
        }
    }

    private final Config cfg;
    private final Correlator corr = new Correlator();

    public Detector(Config cfg) {
        this.cfg = cfg;
    }

    /** Stretches of target against one reference at its top lags. dup[0] is set when the pair is the same audio. */
    public static List<Cand> candidates(Correlator.Lag[] lags, Track t, double tEnd, Track r, double rEnd, int refIndex, double dupFrac, boolean[] dup) {
        List<Cand> out = new ArrayList<>();
        double shorter = Math.min(t.n, r.n) / (double) Track.SR;
        for (Correlator.Lag l : lags) {
            double off = (t.offset - r.offset) + l.lag / (double) Track.SR;
            double matched = 0;
            for (Correlator.Stretch st : Correlator.stretches(t, r, l.lag)) {
                matched += st.len();
                Cand c = new Cand();
                c.ref = refIndex;
                c.start = st.start;
                c.end = st.end;
                c.ncc = st.ncc;
                c.density = st.density;
                c.off = off;
                c.eofTarget = tEnd - st.end;
                c.eofRef = rEnd - (st.end - off);
                // Only an analysis-window limit hides an edge. A file start is a real limit on that side, and on the
                // target's clock it can only move the edge inward.
                boolean atT = st.start - t.offset <= 0.3, atR = st.start - off - r.offset <= 0.3;
                c.clipStart = st.clipStart && ((atT && t.offset > 0) || (atR && r.offset > 0));
                c.clipEnd = st.clipEnd && !(Math.abs(st.end - tEnd) <= 0.8 || Math.abs(st.end - off - rEnd) <= 0.8);
                out.add(c);
            }
            if (matched > dupFrac * shorter) dup[0] = true;
        }
        return out;
    }

    /** The whole flow for one target. References that fail the identity, language or finale rules are dropped first. */
    public Result detect(EpisodeFeatures target, List<EpisodeFeatures> refs) {
        Result res = new Result();
        List<EpisodeFeatures> usable = new ArrayList<>();
        for (EpisodeFeatures r : refs) {
            if (r.sameFileAs(target)) res.notes.add("reference " + r.id + " dropped: same file");
            else if (target.language != null && r.language != null && !target.language.equals(r.language))
                res.notes.add("reference " + r.id + " dropped: language " + r.language);
            else usable.add(r);
        }
        boolean[] dupRef = new boolean[usable.size()];
        List<Cand> head = new ArrayList<>(), tail = new ArrayList<>();
        window(target, usable, true, head, dupRef, res);
        window(target, usable, false, tail, dupRef, res);
        Segment intro = decide(true, target, drop(head, dupRef), res.notes);
        Segment credits = decide(false, target, drop(tail, dupRef), res.notes);
        if (intro != null) res.segments.add(intro);
        if (credits != null) res.segments.add(credits);
        return res;
    }

    private void window(EpisodeFeatures target, List<EpisodeFeatures> refs, boolean head, List<Cand> out, boolean[] dupRef, Result res) {
        Track t = head ? target.head : target.tail;
        if (t == null) return;
        for (int pass = cfg.probeEvery > 0 ? 0 : 1; pass < 2; pass++) {
            boolean[] mask = pass == 0 ? Correlator.probeMask(t.n, cfg.probeEvery) : null;
            Correlator.Spec st = corr.spec(t, mask);
            out.clear();
            for (int i = 0; i < refs.size(); i++) {
                EpisodeFeatures r = refs.get(i);
                Track rt = head ? r.head : r.tail;
                if (rt == null || (!head && r.finale)) continue;
                Correlator.Spec sr = corr.spec(rt, null);
                Correlator.Lag[] lags = corr.topLags(st, sr, cfg.topLags);
                sr = null;
                boolean[] dup = new boolean[1];
                out.addAll(candidates(lags, t, target.fileEnd(), rt, r.fileEnd(), i, cfg.dupFrac, dup));
                if (dup[0] && !dupRef[i]) {
                    dupRef[i] = true;
                    res.notes.add("reference " + r.id + " dropped: same audio as the target");
                }
            }
            if (pass == 0) {
                Segment p = decide(head, target, drop(out, dupRef), new ArrayList<String>());
                if (p != null && (!cfg.probeStrict || (p.refCount >= 3 && p.gates.contains("tight")))) {
                    res.notes.add((head ? "head" : "tail") + ": probes were enough");
                    return;
                }
                res.notes.add((head ? "head" : "tail") + ": probes gave nothing, full correlation");
            }
        }
    }

    private static List<Cand> drop(List<Cand> all, boolean[] dupRef) {
        List<Cand> o = new ArrayList<>();
        for (Cand c : all) if (!dupRef[c.ref]) o.add(c);
        return o;
    }

    /** Clusters the candidates of one window and applies the gates. Returns the best segment, or null when uncertain. */
    public Segment decide(boolean head, EpisodeFeatures target, List<Cand> cands, List<String> notes) {
        List<Cand> pool = new ArrayList<>();
        for (Cand c : cands) {
            if (c.ncc < cfg.nccMin || c.density < cfg.densityMin) continue;
            pool.add(c);
        }
        boolean[] used = new boolean[pool.size()];
        List<Segment> accepted = new ArrayList<>();
        while (true) {
            Cand[] group = bestGroup(pool, used);
            if (group == null) break;
            double m0 = median(group, true), m1 = median(group, false);
            for (int i = 0; i < pool.size(); i++) {
                Cand c = pool.get(i);
                if (!used[i] && Math.min(c.end, m1) - Math.max(c.start, m0) > 0.5 * (m1 - m0)) used[i] = true;
            }
            Segment s = gate(head, target, group, notes);
            if (s != null) accepted.add(s);
        }
        if (accepted.isEmpty()) return null;
        Segment best = accepted.get(0);
        for (Segment s : accepted) if (better(s, best)) best = s;
        // Slot gaps bridged by the merge: no single candidate spans them, so the
        // clamp below must not let a one-sided candidate cut the merged span back.
        List<double[]> gaps = new ArrayList<>();
        if (head) merge(best, accepted, gaps);
        // a reference that left the group still overlaps: it may hold a shorter cut of the same song, so it limits the edges too
        for (Cand c : pool) {
            if (oneSided(c, gaps, best)) continue;
            double ov = Math.min(c.end, best.end) - Math.max(c.start, best.start);
            if (ov > 0.5 * (best.end - best.start)) {
                if (!c.clipStart) best.start = Math.max(best.start, c.start);
                if (!c.clipEnd) best.end = Math.min(best.end, c.end);
            }
        }
        if (best.end - best.start < (head ? cfg.introMin : cfg.creditsMin)) {
            notes.add((head ? "intro" : "credits") + " group: too short after the other references");
            return null;
        }
        edges(head, target, best);
        if (!head) {
            boolean agree = best.gates.contains("eof_agree");
            if (!agree && target.fileEnd() - best.end > cfg.creditsFromEnd) {
                notes.add("credits group " + round(best.start) + "-" + round(best.end) + ": far from the file end and no file-end agreement");
                return null;
            }
            if (!agree && !best.gates.contains("start_trough") && !best.gates.contains("start_at_trough") && best.end - best.start - cfg.leadInCut >= cfg.creditsMin) {
                best.start += cfg.leadInCut;
                best.gates.add("start_lead_in_cut");
            }
        }
        return best;
    }

    private boolean better(Segment a, Segment b) {
        if (a.refCount != b.refCount) return a.refCount > b.refCount;
        return a.end - a.start > b.end - b.start;
    }

    /** A clamp candidate lying wholly on one side of a merged slot gap: it cannot judge the merged span. */
    private static boolean oneSided(Cand c, List<double[]> gaps, Segment best) {
        for (double[] g : gaps) {
            if (best.start <= g[0] && best.end >= g[1] && (c.end <= g[0] || c.start >= g[1])) return true;
        }
        return false;
    }

    /** Parts of one title sequence around a slot that differs per episode: same offset to at least two references on both sides. */
    private void merge(Segment best, List<Segment> all, List<double[]> gaps) {
        boolean again = true;
        while (again) {
            again = false;
            for (Segment o : all) {
                if (o == best) continue;
                double gap = o.start >= best.end ? o.start - best.end : best.start - o.end;
                if (gap <= 0 || gap > cfg.slotGap) continue;
                int same = 0;
                for (Cand x : best.group) {
                    for (Cand y : o.group) {
                        if (x.ref == y.ref && Math.abs(x.off - y.off) <= 0.25) {
                            same++;
                            break;
                        }
                    }
                }
                if (same < 2) continue;
                gaps.add(o.start >= best.end
                        ? new double[]{best.end, o.start}
                        : new double[]{o.end, best.start});
                best.start = Math.min(best.start, o.start);
                best.end = Math.max(best.end, o.end);
                best.refCount = Math.min(best.refCount, o.refCount);
                best.nccMin = Math.min(best.nccMin, o.nccMin);
                if (!best.gates.contains("slot_merged")) best.gates.add("slot_merged");
                all.remove(o);
                again = true;
                break;
            }
        }
    }

    /** Runs of low level inside [from, to] of the target's level track, as {start, end}. */
    private List<double[]> troughs(Track t, double from, double to, int thr) {
        List<double[]> out = new ArrayList<>();
        double fr = Track.ENV_SAMPLES / (double) Track.SR;
        int i0 = Math.max(0, (int) ((from - t.offset) / fr)), i1 = Math.min(t.env.length, (int) Math.ceil((to - t.offset) / fr));
        int need = Math.max(1, (int) Math.round(cfg.troughMin / fr));
        for (int i = i0; i < i1; ) {
            if (t.env[i] < thr) {
                i++;
                continue;
            }
            int j = i;
            while (j < i1 && t.env[j] >= thr) j++;
            if (j - i >= need) out.add(new double[]{t.offset + i * fr, t.offset + j * fr});
            i = j;
        }
        return out;
    }

    private int medianLevel(Track t, double from, double to) {
        double fr = Track.ENV_SAMPLES / (double) Track.SR;
        int i0 = Math.max(0, (int) ((from - t.offset) / fr)), i1 = Math.min(t.env.length, (int) ((to - t.offset) / fr));
        int[] h = new int[128];
        for (int i = i0; i < i1; i++) h[t.env[i] & 127]++;
        int half = (i1 - i0) / 2, seen = 0;
        for (int v = 0; v < 128; v++) {
            seen += h[v];
            if (seen > half) return v;
        }
        return 0;
    }

    /** Audio-only edge step. It only moves an edge inward: a song ends in a fade or a gap, and what follows it in a shared stretch is a card or a jingle. */
    private void edges(boolean head, EpisodeFeatures target, Segment seg) {
        Track t = head ? target.head : target.tail;
        if (t == null || t.env == null) return;
        double lo = head ? cfg.introMin : cfg.creditsMin;
        int thr = (int) Math.round(medianLevel(t, seg.start, seg.end) + cfg.troughDepth);
        double span = head ? cfg.trimIntro : cfg.trimCredits;
        List<double[]> near = troughs(t, Math.max(seg.start + lo, seg.end - span), seg.end + 0.5, thr);
        if (!near.isEmpty()) {                                  // the earliest one: anything after it is the card or the jingle
            double e = near.get(0)[0];
            if (e < seg.end) {
                seg.end = e;
                seg.gates.add("end_trough");
            } else seg.gates.add("end_at_trough");
        } else if (target.fileEnd() - seg.end > 2.5 && seg.end - seg.start - cfg.noTroughCut >= lo) {
            seg.end -= cfg.noTroughCut;
            seg.gates.add("end_unconfirmed");
        }
        List<double[]> first = troughs(t, seg.start - 0.5, Math.min(seg.start + cfg.trimStart, seg.end - lo), thr);
        if (!first.isEmpty()) {                                 // the last one: what precedes it is a logo or a sting
            double b = first.get(first.size() - 1)[1] - 0.1;
            if (b > seg.start) {
                seg.start = b;
                seg.gates.add("start_trough");
            } else seg.gates.add("start_at_trough");
        }
    }

    /** Best-supported group: most references within refLoose of a seed at both edges, then the longest seed. */
    private Cand[] bestGroup(List<Cand> pool, boolean[] used) {
        Cand[] best = null;
        double bestLen = -1;
        for (int i = 0; i < pool.size(); i++) {
            if (used[i]) continue;
            Cand s = pool.get(i);
            Map<Integer, Cand> sup = new LinkedHashMap<>();
            for (int j = 0; j < pool.size(); j++) {
                Cand c = pool.get(j);
                if (used[j]) continue;
                double ds = Math.abs(c.start - s.start), de = Math.abs(c.end - s.end);
                boolean both = ds <= cfg.refLoose && de <= cfg.refLoose;
                boolean one = (ds <= cfg.edgeTight || de <= cfg.edgeTight)
                        && Math.min(c.end, s.end) - Math.max(c.start, s.start) >= 0.5 * Math.min(c.len(), s.len());
                if (!both && !one) continue;
                Cand have = sup.get(c.ref);
                if (have == null || c.ncc > have.ncc) sup.put(c.ref, c);
            }
            if (best == null || sup.size() > best.length || (sup.size() == best.length && s.len() > bestLen)) {
                best = sup.values().toArray(new Cand[0]);
                bestLen = s.len();
            }
        }
        return best;
    }

    private static double median(Cand[] g, boolean start) {
        double[] v = new double[g.length];
        for (int i = 0; i < g.length; i++) v[i] = start ? g[i].start : g[i].end;
        Arrays.sort(v);
        return v.length % 2 == 1 ? v[v.length / 2] : 0.5 * (v[v.length / 2 - 1] + v[v.length / 2]);
    }

    private Segment gate(boolean head, EpisodeFeatures target, Cand[] g, List<String> notes) {
        String kind = head ? "intro" : "credits";
        if (g.length < cfg.minRefs) {
            notes.add(kind + " group " + round(g[0].start) + "-" + round(g[0].end) + ": only " + g.length + " reference");
            return null;
        }
        // inner intersection; a reference clipped by its analysis window says nothing about that edge
        double s = Double.NEGATIVE_INFINITY, e = Double.POSITIVE_INFINITY, sMin = Double.POSITIVE_INFINITY, eMax = Double.NEGATIVE_INFINITY;
        int seenS = 0, seenE = 0;
        double nccMin = 1;
        boolean eofAgree = !head;
        for (Cand c : g) {
            nccMin = Math.min(nccMin, c.ncc);
            if (!c.clipStart) {
                s = Math.max(s, c.start);
                sMin = Math.min(sMin, c.start);
                seenS++;
            }
            if (!c.clipEnd) {
                e = Math.min(e, c.end);
                eMax = Math.max(eMax, c.end);
                seenE++;
            }
            eofAgree &= Math.abs(c.eofTarget - c.eofRef) <= cfg.eofTol;
        }
        if (seenS < cfg.minRefs || seenE < cfg.minRefs) {
            notes.add(kind + " group " + round(g[0].start) + "-" + round(g[0].end) + ": clipped");
            return null;
        }
        double len = e - s;
        double lo = head ? cfg.introMin : cfg.creditsMin, hi = head ? cfg.introMax : cfg.creditsMax;
        if (len < lo || len > hi) {
            notes.add(kind + " group " + round(s) + "-" + round(e) + ": length");
            return null;
        }
        double fileEnd = target.fileEnd();
        if (head ? s > 0.6 * fileEnd : s < 0.5 * fileEnd) {
            notes.add(kind + " group " + round(s) + "-" + round(e) + ": position");
            return null;
        }
        Segment seg = new Segment();
        seg.type = kind;
        seg.start = s;
        seg.end = e;
        seg.refCount = g.length;
        seg.group = g;
        seg.nccMin = nccMin;
        seg.spreadStart = s - sMin;
        seg.spreadEnd = eMax - e;
        seg.gates.addAll(Arrays.asList("refs", "ncc", "density", "length", "position", "not_clipped"));
        double conf = 0.55 + 0.20 * Math.min(1, Math.max(0, (nccMin - 0.90) / 0.08));
        if (g.length >= 3) conf += 0.10;
        if (Math.max(seg.spreadStart, seg.spreadEnd) <= 0.25) {
            conf += 0.10;
            seg.gates.add("tight");
        }
        if (eofAgree) seg.gates.add("eof_agree");
        if (target.finale) {
            // finales run the ending song over the last scene (Ghost Hound e22): credits must end where the season's do
            if (!head && !eofAgree) {
                notes.add(kind + " group " + round(s) + "-" + round(e) + ": finale without file-end agreement");
                return null;
            }
            conf -= 0.15;
            seg.gates.add("finale");
        }
        seg.confidence = Math.min(0.99, Math.max(0, conf));
        return seg;
    }

    private static String round(double v) {
        return String.format(java.util.Locale.ROOT, "%.1f", v);
    }
}
