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
        public int minRefs = 2, topLags = 5;
        /** Unanchored H0 false alarms never reach 4 s (18 cross-show pairs, max peak 0.027);
         * the floor sits above the distributor/studio-card class (shared idents run to ~10 s:
         * the ST 8.1 s logo would otherwise report as intro) and below the shortest true
         * bumpers (11.4 s Lost, 10.1 s hospital: thin but measured on both sides). */
        public double introMin = 10, introMax = 240, creditsMin = 20, creditsMax = 700;
        /** Intros shorter than this (the released floor) must carry an audio-event edge: a silence
         * trough at either edge or a centre stop. The 10 s floor rests on H0 (unstructured audio never
         * reaches 4 s); it says nothing about structured echoes, i.e. a score cue the show reuses in
         * story, which is shared, short and has no boundary of its own (Loki e04 238-251: 12.6 s, two
         * references, no trough at either edge, cut 12.6 s of story; also the R3 D2 decoy). Mirrors
         * anchorMin for credits, where the file-end anchor plays the same role. 0 disables. */
        public double introAnchorBelow = 15;
        /** Short intro groups (under introAnchorBelow) must also be shared by the earliest earlier episode among the references. */
        public boolean shortNeedsPremiere = true;
        /** A short intro group never outranks a full-length one. */
        public boolean shortYields = true;
        /** A best group that fails a finishing rule hands over to the next accepted group. */
        public boolean fallback = true;
        /** Credits also group from the stretches at equal distance from both files' ends. */
        public boolean eofPool = true;
        /** Second tier when the strict gates find nothing: see loose(). */
        public boolean looseTier = true;
        /** A composite whose dissenters lie inside a unanimous subset of three or more reports that subset. */
        public boolean dropInner = true;
        /** File-end-anchored credits keep the anchored floor (anchorMin) after the clamp, as at the gate and after trimming. */
        public boolean anchoredFloor = true;
        /** Credits shorter than creditsMin need three references or a silence edge. */
        public boolean shortCreditsNeed3 = true;
        /** Anchored credits failing the floor may drop inner dissenters like intro composites. */
        public boolean dropInnerCredits = true;
        /** Same-lag stretches of one reference closer than this join (seconds); 0 disables. */
        public double stitchGap = 1.5;
        /** Intro end with no trough: a 1 s window this many dB below the segment median ends it; 0 disables. */
        public double dipDepth = 12;
        /** Both pieces must hold at least this ncc (and densityMin): a weak tail the correlator split off is not the same song. */
        public double stitchNcc = 0.80;
        public double nccLoose = 0.65, densityLoose = 0.70;
        public int looseMinRefs = 3;
        /** The loose tier also runs when every strict group failed a finishing rule. */
        public boolean looseAfterFail = true;
        /** Third tier when strict and loose find nothing: landmark-hash candidates (see hashCands).
         * Thresholds fitted leave-one-show-out (R7): q75 is the binding one (below 0.70 every
         * config cut story; at 0.70 none did, in all 32 folds). */
        public boolean hashTier = true;
        public double hashNccMin = 0.35, hashDensityMin = 0.45, hashQ75Min = 0.70, melMin = 0.70, hashCovMin = 0.65;
        /** Hash supporters must agree on both edges within this (cluster edges are coarser than waveform edges). */
        public double hashEdgeTol = 3.0;
        public int hashMinRefs = 3, hashMinVotes = 30, hashLags = 3;
        public double dupFrac = 0.85;
        /** Same audio means one lag matching dupFrac of a window (a duplicate file lines up at a single lag), not matches
         * summed over lags: a 135 s credits song seen at five near lags summed past 85 percent of a 240 s tail and dropped
         * real references (Mandalorian). A tail-only match must be confirmed by the head at this share: long credits
         * filling a tail window are shared by every episode, a duplicate file shares the head too. */
        public boolean dupOneLag = true;
        public double dupHeadConfirm = 0.5;
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
        /** Intro groups shorter than this must agree on both edges within refLoose; longer ones may assemble from staggered parts.
         * Unused, stays 0 (replaced by unanimous-pair agreement below): the cliff was fitted on
         * one show and cost 5 correct finds elsewhere. */
        public double agreeShort = 0;
        /** Credits with an end-of-file-anchored group (all refs agree on file-end distance)
         * may be shorter than creditsMin, down to anchorMin: BigBang's 12 s sting. Unanchored
         * H0 false alarms never reach 4 s (18 cross-show pairs, max peak 0.027), so 8 s is 2x
         * conservative for structured content with the guards below. */
        public double anchorMin = 8;
        /** Also evaluate stretches at the structurally expected lag: file-start alignment for heads, end-of-file
         * alignment for tails. A quiet shared theme under loud differing story (tag dialogue over the credits theme,
         * a cold open before the title) buries the whole-window correlation peak, so the top-lag search never visits
         * its lag and the shared audio is never examined (Office S3 credits: peak 0.026, 21 s shared at lag 0).
         * One extra stretches() call per pair and window; the gates decide as before. */
        public boolean anchorLags = false;
        /** best() prefers a decisively (2x) longer shared stretch over one more agreeing reference.
         * Kept true: length is the only axis that lets a 59 s title outrank a 10 s distributor
         * logo sharing more references (without it ST reports the logo, 6 real cuts). The D1
         * risk it created (57 s replayed premiere outranking the title) is closed structurally:
         * the replay is vetoed by the premiere-context check and the true title reports. */
        public boolean lenPrefer = true;
        /** Best-supported group: most references within refLoose of a seed at both edges, then the seed
         * with the latest start (a replayed cold open precedes the title it replays; on a tie the later
         * span is the title the veto needs). */
        public boolean tieLatest = false;
        /** A trough is this many dB below the segment's median level for at least troughMin seconds. */
        public double troughDepth = 24, troughMin = 0.10;
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
            return String.format(java.util.Locale.ROOT, "%s %.3f-%.3f refs=%d conf=%.2f nccMin=%.3f spread=%.2f/%.2f %s", type, start, end, refCount, confidence, nccMin, spreadStart, spreadEnd, gates);
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
        /** Top-quartile window NCC; centred log-band correlation; landmark bucket coverage (hash tier). */
        public double q75, mel, hcov;
        public boolean clipStart, clipEnd;
        /** From the structurally expected lag (see Config.anchorLags), not the top-lag search. */
        public boolean anchor;
        /** From a landmark-hash lag (see Config.hashTier); never enters the waveform tiers. */
        public boolean hash;

        public double len() {
            return end - start;
        }
    }

    private final Config cfg;
    private final Correlator corr = new Correlator();

    /** One reference's candidates for one window, as {@link #candidates} returns them. The bench replays cached
     * correlations through this; null (the app) correlates here. */
    public interface PairSource {
        /** frac[0]: the largest share of the shorter window matched at one lag; frac[1]: summed over the lags. */
        List<Cand> pair(EpisodeFeatures target, EpisodeFeatures ref, int refIndex, boolean head, double[] frac);
    }

    public PairSource pairSource;

    public Detector(Config cfg) {
        this.cfg = cfg;
    }

    /** Pass-1 detector for premiere-context hints: ranks by refcount only (no length preference), and on a
     * refcount tie fits the later span (a replayed cold open precedes the title it replays; the veto needs
     * the title), so a replay shared by fewer episodes cannot outrank the title when fitting the hint. */
    public static Detector hintDetector() {
        Config c = new Config();
        c.lenPrefer = false;
        c.tieLatest = true;
        c.hashTier = false; // hints stay waveform-fitted: a hash-fitted replay must not become the title
        return new Detector(c);
    }

    /** Stretches of target against one reference at its top lags. dup[0] is set when the pair is the same audio. */
    public static List<Cand> candidates(Correlator.Lag[] lags, Track t, double tEnd, Track r, double rEnd, int refIndex, double dupFrac, boolean[] dup) {
        double[] frac = new double[2];
        List<Cand> out = candidates(lags, t, tEnd, r, rEnd, refIndex, frac);
        if (frac[1] > dupFrac) dup[0] = true;
        return out;
    }

    /** As above; frac[0] is the largest share of the shorter window matched at one lag, frac[1] the share summed over lags. */
    public static List<Cand> candidates(Correlator.Lag[] lags, Track t, double tEnd, Track r, double rEnd, int refIndex, double[] frac) {
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
                c.q75 = st.q75;
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
            frac[0] = Math.max(frac[0], matched / shorter);
            frac[1] += matched / shorter;
        }
        return out;
    }

    /** The whole flow for one target. References that fail the identity, language or finale rules are dropped first. */
    public Result detect(EpisodeFeatures target, List<EpisodeFeatures> refs) {
        return detect(target, refs, null);
    }

    /** Two-pass flow: hints maps episode id to its pass-1 intro [start, end] (target clock of
     * that episode). An intro group in a non-premiere episode that maps into the earliest
     * episode's audio more than 2 s before its hinted title is a replayed cold open, not an
     * intro (structural cold-open check; replaces the start-spread rule). Null hints = pass 1. */
    public Result detect(EpisodeFeatures target, List<EpisodeFeatures> refs, java.util.Map<String, double[]> hints) {
        Result res = new Result();
        List<EpisodeFeatures> usable = new ArrayList<>();
        for (EpisodeFeatures r : refs) {
            if (r.sameFileAs(target)) res.notes.add("reference " + r.id + " dropped: same file");
            else if (target.language != null && r.language != null && !target.language.equals(r.language))
                res.notes.add("reference " + r.id + " dropped: language " + r.language);
            else usable.add(r);
        }
        boolean[] dupRef = new boolean[usable.size()];
        double[][] hf = new double[usable.size()][], tf = new double[usable.size()][];
        List<Cand> head = new ArrayList<>(), tail = new ArrayList<>();
        window(target, usable, true, head, hf, res);
        window(target, usable, false, tail, tf, res);
        for (int i = 0; i < usable.size(); i++) {
            boolean dup;
            if (!cfg.dupOneLag) dup = (hf[i] != null && hf[i][1] > cfg.dupFrac) || (tf[i] != null && tf[i][1] > cfg.dupFrac);
            else dup = (hf[i] != null && hf[i][0] > cfg.dupFrac)
                    || (tf[i] != null && tf[i][0] > cfg.dupFrac && (hf[i] == null || hf[i][0] >= cfg.dupHeadConfirm));
            if (dup) {
                dupRef[i] = true;
                res.notes.add("reference " + usable.get(i).id + " dropped: same audio as the target");
            }
        }
        Segment intro = decide(true, target, usable, drop(head, dupRef), hints, res.notes);
        if (intro == null) intro = hashRetry(true, target, usable, drop(head, dupRef), dupRef, hints, res.notes);
        Segment credits = decide(false, target, usable, drop(tail, dupRef), hints, res.notes);
        if (credits == null) credits = hashRetry(false, target, usable, drop(tail, dupRef), dupRef, hints, res.notes);
        if (intro != null) res.segments.add(intro);
        if (credits != null) res.segments.add(credits);
        return res;
    }

    /** Premiere-context replay test. Episode order comes from the id tail sXXeYY. A group
     * is a replay when it maps into the earliest episode mostly BEFORE its pass-1 title:
     * the non-overlapping pre-title part exceeds half the mapped span (logo/ident lead-ins
     * are short minorities and stay; cold-open recaps dominate their span). The 2 s margin
     * absorbs edge tolerance on both sides.
     *
     * The same test guards the earliest episode itself: a group starting before its own pass-1
     * title with a pre-title majority is the replay the hint pass fitted, not the title (the
     * title replays nothing before itself). The 2 s margin absorbs edge tolerance on both sides. */
    private boolean isReplay(EpisodeFeatures target, List<EpisodeFeatures> refs, Segment seg,
                             java.util.Map<String, double[]> hints, List<String> notes) {
        if (hints == null || hints.isEmpty() || seg.group == null) return false;
        int[] te = epOrder(target.id);
        int ei = -1;
        int[] be = new int[]{Integer.MAX_VALUE, Integer.MAX_VALUE};
        for (int i = 0; i < refs.size(); i++) {
            int[] re = epOrder(refs.get(i).id);
            if ((re[0] < te[0] || (re[0] == te[0] && re[1] < te[1]))
                    && (re[0] < be[0] || (re[0] == be[0] && re[1] < be[1]))) {
                ei = i;
                be = re;
            }
        }
        double[] hint;
        double ms, me;
        if (ei < 0) return isSelfReplay(target, seg, hints, notes);
        hint = hints.get(refs.get(ei).id);
        if (hint == null) return false; // no title found in the earliest episode: abstain, keep
        double off = 0;
        boolean mapped = false;
        for (Cand c : seg.group) {
            if (c.ref == ei && Math.abs(c.off) <= 2.0) {
                off = c.off;
                mapped = true;
                break;
            }
        }
        if (!mapped) return false;
        ms = seg.start - off;
        me = seg.end - off;
        if (ms < hint[0] - 2.0) {
            double ov = Math.min(me, hint[1]) - Math.max(ms, hint[0]);
            if (ov < 0.5 * (me - ms)) {
                notes.add("intro group " + round(seg.start) + "-" + round(seg.end)
                        + ": replay of premiere story (maps " + round(ms) + " before title " + round(hint[0]) + ")");
                return true;
            }
        }
        return false;
    }

    /** Self-replay test for the earliest episode itself: a group starting before its own pass-1 title with a
     * pre-title majority is the replay the hint pass fitted, not the title (the title replays nothing before
     * itself). The 2 s margin absorbs edge tolerance on both sides. */
    private boolean isSelfReplay(EpisodeFeatures target, Segment seg,
                                 java.util.Map<String, double[]> hints, List<String> notes) {
        if (hints == null || hints.isEmpty() || seg.group == null) return false;
        double[] hint = hints.get(target.id);
        if (hint == null) return false;
        double ms = seg.start, me = seg.end;
        if (ms < hint[0] - 2.0) {
            double ov = Math.min(me, hint[1]) - Math.max(ms, hint[0]);
            if (ov < 0.5 * (me - ms)) {
                notes.add("intro group " + round(seg.start) + "-" + round(seg.end)
                        + ": replay of own premiere story (starts " + round(ms) + " before own title " + round(hint[0]) + ")");
                return true;
            }
        }
        return false;
    }

    /** A short intro group that the earliest earlier episode among the references does not share at all: a title
     * sequence is in the premiere too, while a "previously on" sting or a reused score cue first exists in later
     * episodes (Mandalorian e03 80.9-92.5, e06 41.0-52.4: shared by e02-e06 at varying positions, absent from e01). */
    private boolean absentFromPremiere(EpisodeFeatures target, List<EpisodeFeatures> refs, Segment seg, List<Cand> cands, List<String> notes) {
        int[] te = epOrder(target.id);
        int ei = -1;
        int[] be = new int[]{Integer.MAX_VALUE, Integer.MAX_VALUE};
        for (int i = 0; i < refs.size(); i++) {
            int[] re = epOrder(refs.get(i).id);
            if ((re[0] < te[0] || (re[0] == te[0] && re[1] < te[1]))
                    && (re[0] < be[0] || (re[0] == be[0] && re[1] < be[1]))) {
                ei = i;
                be = re;
            }
        }
        if (ei < 0) return false;
        for (Cand c : cands) {
            if (c.ref == ei && Math.min(c.end, seg.end) - Math.max(c.start, seg.start) >= 0.5 * (seg.end - seg.start)) return false;
        }
        notes.add("intro group " + round(seg.start) + "-" + round(seg.end) + ": short and absent from " + refs.get(ei).id);
        return true;
    }

    /** [season, episode] from a bench id like show_s02e05 or a Stremio video id like tt0903747:5:3 (kitsu:7442:3 reads
     * the anime id as the season, which orders episodes of one show correctly). Unknown sorts last so it never counts as
     * earliest. Before R5 only the bench form parsed, so on the TV every id was unknown and the premiere checks
     * (replay veto, hint pass) never ran. */
    static int[] epOrder(String id) {
        int[] unknown = new int[]{Integer.MAX_VALUE, Integer.MAX_VALUE};
        if (id == null) return unknown;
        int at = id.lastIndexOf("_s");
        if (at >= 0) {
            try {
                String[] se = id.substring(at + 2).split("e");
                return new int[]{Integer.parseInt(se[0]), Integer.parseInt(se[1])};
            } catch (RuntimeException bad) {
                return unknown;
            }
        }
        String[] p = id.split(":");
        if (p.length < 3) return unknown;
        try {
            int ep = Integer.parseInt(p[p.length - 1]);
            // episode 0 is a special or a recap reel, never the premiere
            return ep < 1 ? unknown : new int[]{Integer.parseInt(p[p.length - 2]), ep};
        } catch (RuntimeException bad) {
            return unknown;
        }
    }

    /** True when episode order a comes before b (both known). */
    static boolean before(int[] a, int[] b) {
        if (a[0] == Integer.MAX_VALUE || b[0] == Integer.MAX_VALUE) return false;
        return a[0] < b[0] || (a[0] == b[0] && a[1] < b[1]);
    }

    private void window(EpisodeFeatures target, List<EpisodeFeatures> refs, boolean head, List<Cand> out, double[][] frac, Result res) {
        Track t = head ? target.head : target.tail;
        if (t == null) return;
        if (pairSource != null) {
            out.clear();
            for (int i = 0; i < refs.size(); i++) {
                EpisodeFeatures r = refs.get(i);
                Track rt = head ? r.head : r.tail;
                if (rt == null || (!head && r.finale)) continue;
                frac[i] = new double[2];
                out.addAll(pairSource.pair(target, r, i, head, frac[i]));
            }
            return;
        }
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
                frac[i] = new double[2];
                out.addAll(candidates(lags, t, target.fileEnd(), rt, r.fileEnd(), i, frac[i]));
                if (cfg.anchorLags) {
                    // File-start alignment for heads, end-of-file alignment for tails (see the flag).
                    // A throwaway frac: the anchor lag must not move duplicate decisions (a duplicate
                    // already matches at a top lag); it only contributes candidates for grouping.
                    long anchor = Math.round(((head ? 0 : target.fileEnd() - r.fileEnd()) - (t.offset - rt.offset)) * Track.SR);
                    List<Cand> ac = candidates(new Correlator.Lag[]{new Correlator.Lag((int) anchor, 1, 0)},
                            t, target.fileEnd(), rt, r.fileEnd(), i, new double[2]);
                    for (Cand c : ac) c.anchor = true;
                    out.addAll(ac);
                }
            }
            if (pass == 0) {
                boolean[] dupHere = new boolean[refs.size()];
                for (int i = 0; i < refs.size(); i++) dupHere[i] = frac[i] != null && frac[i][cfg.dupOneLag ? 0 : 1] > cfg.dupFrac;
                Segment p = decide(head, target, drop(out, dupHere), new ArrayList<String>());
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
        return decide(head, target, null, cands, null, notes);
    }

    /** Full path with the premiere-context replay veto: intro groups that map into the earliest
     * episode's audio before its pass-1 title are replays; they are dropped before best-pick so
     * a weaker true group (the title they precede) still reports. Null refs/hints skip the veto. */
    public Segment decide(boolean head, EpisodeFeatures target, List<EpisodeFeatures> refs, List<Cand> cands,
                          java.util.Map<String, double[]> hints, List<String> notes) {
        // Landmark candidates never enter the waveform tiers (their density counts a lower window
        // threshold); they get their turn only after every waveform path reported nothing.
        List<Cand> wave = new ArrayList<>(), hash = new ArrayList<>();
        for (Cand c : cands) (c.hash ? hash : wave).add(c);
        Segment got = decideWave(head, target, refs, wave, hints, notes);
        if (got != null || !cfg.hashTier || hash.isEmpty()) return got;
        return decideHash(head, target, refs, cands, hash, hints, notes);
    }

    private Segment decideWave(boolean head, EpisodeFeatures target, List<EpisodeFeatures> refs, List<Cand> cands,
                               java.util.Map<String, double[]> hints, List<String> notes) {
        if (cfg.stitchGap > 0) cands = stitch(cands);
        if (!cfg.anchorLags) return decideCore(head, target, refs, cands, hints, notes);
        // Anchor-lag stretches only get their turn when the top-lag search finds nothing: they expose
        // genuinely shared audio the lag ranking buries, but they must not disturb grouping that already
        // reports (a shared logo at lag 0 would otherwise consume the title's references).
        List<Cand> strict = new ArrayList<>(), anchor = new ArrayList<>();
        for (Cand c : cands) (c.anchor ? anchor : strict).add(c);
        Segment got = decideCore(head, target, refs, strict, hints, notes);
        if (got != null || anchor.isEmpty()) return got;
        notes.add((head ? "intro" : "credits") + ": top lags found nothing, retrying with anchor-lag stretches");
        got = decideCore(head, target, refs, cands, hints, notes);
        // The anchor retry can only add; when the top lags already accepted groups the retry never runs.
        // A replayed cold open is the one shape the retry must not newly report: it is the season's shared
        // prefix, so the anchor lag always exposes it, and the premiere-context veto cannot see it (the fitted
        // hint is the replay itself). Veto an anchor-only intro group that is a self-replay of its own pass-1
        // title: without the replay there is no second group to confuse it with (the title reports on the
        // strict path), and a title shared from the file start replays nothing before itself. Strict-tier groups
        // are untouched: the veto only fires on the anchor retry path.
        if (got != null && head && hints != null && isSelfReplay(target, got, hints, notes)) return null;
        return got;
    }

    private Segment decideCore(boolean head, EpisodeFeatures target, List<EpisodeFeatures> refs, List<Cand> cands,
                               java.util.Map<String, double[]> hints, List<String> notes) {
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
            if (s != null && head && refs != null && isReplay(target, refs, s, hints, notes)) continue;
            if (s != null) accepted.add(s);
        }
        if (!head && cfg.eofPool) {
            // Credits anchored to the file end: a song that repeats its bars matches several near lags, and the
            // best-ncc pick per reference can mix lags so no group agrees on the file-end distance (Mandalorian
            // e03-e06). Grouping only the stretches that sit at the same distance from both files' ends keeps the
            // anchored reading; it competes with the others under the same gates.
            List<Cand> anchored = new ArrayList<>();
            for (Cand c : pool) if (Math.abs(c.eofTarget - c.eofRef) <= cfg.eofTol) anchored.add(c);
            boolean[] used2 = new boolean[anchored.size()];
            while (true) {
                Cand[] group = bestGroup(anchored, used2);
                if (group == null) break;
                double m0 = median(group, true), m1 = median(group, false);
                for (int i = 0; i < anchored.size(); i++) {
                    Cand c = anchored.get(i);
                    if (!used2[i] && Math.min(c.end, m1) - Math.max(c.start, m0) > 0.5 * (m1 - m0)) used2[i] = true;
                }
                Segment s = gate(false, target, group, notes);
                if (s != null) accepted.add(s);
            }
        }
        List<Cand> clampPool = pool;
        boolean looseRan = false;
        if (accepted.isEmpty() && cfg.looseTier) {
            clampPool = loose(head, target, refs, cands, hints, accepted, notes);
            looseRan = true;
        }
        Segment got = pickFinish(head, target, refs, cands, clampPool, accepted, notes);
        if (got != null || looseRan || !cfg.looseTier || !cfg.looseAfterFail) return got;
        // every strict group failed a finishing rule: the second tier gets its turn
        List<Segment> second = new ArrayList<>();
        List<Cand> lp = loose(head, target, refs, cands, hints, second, notes);
        return pickFinish(head, target, refs, cands, lp, second, notes);
    }

    private Segment pickFinish(boolean head, EpisodeFeatures target, List<EpisodeFeatures> refs, List<Cand> cands,
                               List<Cand> pool, List<Segment> accepted, List<String> notes) {
        if (accepted.isEmpty()) return null;
        // Best first; with fallback, a best that fails a finishing rule hands over to the next accepted group, which must
        // pass every rule on its own (the replay veto already works this way: a weaker true title still reports).
        List<Segment> tried = new ArrayList<>();
        while (true) {
            Segment pick = null;
            for (Segment s : accepted) if (!tried.contains(s) && (pick == null || better(s, pick))) pick = s;
            if (pick == null) return null;
            tried.add(pick);
            List<Segment> rest = new ArrayList<>();
            for (Segment s : accepted) if (!tried.contains(s)) rest.add(copy(s));
            Segment out = finish(head, target, refs, cands, pool, copy(pick), rest, notes);
            if (out != null || !cfg.fallback) return out;
        }
    }

    /** Second tier, only when the strict gates found nothing in this window: the same music in a different mix
     * (credits over a changing tag, a re-recorded theme) correlates below nccMin. It is accepted only with more
     * structure than the strict tier asks for: looseMinRefs references, and credits anchored at the same distance from
     * both files' ends, intros agreeing on both edges in every pair and at least introAnchorBelow long. */
    private List<Cand> loose(boolean head, EpisodeFeatures target, List<EpisodeFeatures> refs, List<Cand> cands,
                             java.util.Map<String, double[]> hints, List<Segment> accepted, List<String> notes) {
        List<Cand> lp = new ArrayList<>();
        for (Cand c : cands) {
            if (c.ncc < cfg.nccLoose || c.density < cfg.densityLoose) continue;
            if (!head && Math.abs(c.eofTarget - c.eofRef) > cfg.eofTol) continue;
            lp.add(c);
        }
        boolean[] used = new boolean[lp.size()];
        while (true) {
            Cand[] group = bestGroup(lp, used);
            if (group == null) break;
            double m0 = median(group, true), m1 = median(group, false);
            for (int i = 0; i < lp.size(); i++) {
                Cand c = lp.get(i);
                if (!used[i] && Math.min(c.end, m1) - Math.max(c.start, m0) > 0.5 * (m1 - m0)) used[i] = true;
            }
            if (group.length < cfg.looseMinRefs) continue;
            if (head && !bothEdges(group)) {
                notes.add("intro group " + round(group[0].start) + "-" + round(group[0].end) + ": loose, edges disagree");
                continue;
            }
            Segment s = gate(head, target, group, notes);
            if (s == null) continue;
            if (head && s.end - s.start < cfg.introAnchorBelow) continue;
            if (head && refs != null && isReplay(target, refs, s, hints, notes)) continue;
            s.gates.add("loose");
            accepted.add(s);
        }
        return lp;
    }

    /** App path only (the bench precomputes): landmark candidates are built lazily, once the
     * waveform tiers reported nothing in this window, so their CPU is spent only on misses. */
    private Segment hashRetry(boolean head, EpisodeFeatures target, List<EpisodeFeatures> refs, List<Cand> wave,
                              boolean[] dupRef, java.util.Map<String, double[]> hints, List<String> notes) {
        if (!cfg.hashTier || pairSource != null) return null;
        List<Cand> hc = hashCands(head, target, refs, dupRef);
        if (hc.isEmpty()) return null;
        List<Cand> all = new ArrayList<>(wave);
        all.addAll(hc);
        return decide(head, target, refs, all, hints, notes);
    }

    private final Landmark landmark = new Landmark();

    /** Landmark candidates of one window against every usable reference (dup and finale rules as window()). */
    private List<Cand> hashCands(boolean head, EpisodeFeatures target, List<EpisodeFeatures> refs, boolean[] dupRef) {
        List<Cand> out = new ArrayList<>();
        Track t = head ? target.head : target.tail;
        if (t == null) return out;
        Landmark.Feat ft = landmark.feat(t);
        for (int i = 0; i < refs.size(); i++) {
            if (dupRef != null && dupRef[i]) continue;
            EpisodeFeatures r = refs.get(i);
            Track rt = head ? r.head : r.tail;
            if (rt == null || (!head && r.finale)) continue;
            Landmark.Feat fr = landmark.feat(rt);
            for (Landmark.Match m : landmark.match(t, ft, rt, fr, cfg.hashLags, cfg.hashMinVotes))
                out.addAll(candidatesHash(m, ft, fr, t, target.fileEnd(), rt, r.fileEnd(), i));
        }
        return out;
    }

    /** Relaxed waveform stretches at one landmark lag, verified per span: landmark coverage and
     * centred log-band correlation must both hold for the third tier to group the candidate. */
    public static List<Cand> candidatesHash(Landmark.Match m, Landmark.Feat ft, Landmark.Feat fr,
                                            Track t, double tEnd, Track r, double rEnd, int refIndex) {
        List<Cand> out = new ArrayList<>();
        double off = (t.offset - r.offset) + m.lag / (double) Track.SR;
        for (Correlator.Stretch st : Correlator.stretches(t, r, m.lag, 0.35, 48, 6.0, 0.55)) {
            // Span: the waveform core widened to its landmark hit cluster (anchors <=2 s apart).
            // Quiet onsets/tails match spectrally before the waveform reaches the edge threshold
            // (Lost: core 6-9 s, cluster 11-12 s); every added second holds matched peaks, and
            // the waveform stats below are recomputed over the widened span that would report.
            double cs = st.start, ce = st.end;
            int gapF = (int) Math.round(2.0 * Track.SR / 128);
            for (int i = 0; i < m.hitFrames.length; i++) {
                int j = i;
                while (j + 1 < m.hitFrames.length && m.hitFrames[j + 1] - m.hitFrames[j] <= gapF) j++;
                double a = t.offset + m.hitFrames[i] * 128.0 / Track.SR, b = t.offset + m.hitFrames[j] * 128.0 / Track.SR + 128.0 / Track.SR;
                if (a < st.end && b > st.start) { cs = Math.min(cs, a); ce = Math.max(ce, b); }
                i = j;
            }
            double[] ws = Correlator.stats(t, r, m.lag, cs - t.offset, ce - t.offset, 0.35);
            Cand c = new Cand();
            c.ref = refIndex;
            c.start = cs;
            c.end = ce;
            c.ncc = ws[0];
            c.density = ws[1];
            c.q75 = ws[2];
            st.start = cs;
            st.end = ce;
            st.clipStart |= cs - t.offset <= 0.15 || cs - off - r.offset <= 0.15;
            st.clipEnd |= t.end() - ce <= 0.15 || r.end() - (ce - off) <= 0.15;
            c.off = off;
            c.eofTarget = tEnd - st.end;
            c.eofRef = rEnd - (st.end - off);
            boolean atT = st.start - t.offset <= 0.3, atR = st.start - off - r.offset <= 0.3;
            c.clipStart = st.clipStart && ((atT && t.offset > 0) || (atR && r.offset > 0));
            c.clipEnd = st.clipEnd && !(Math.abs(st.end - tEnd) <= 0.8 || Math.abs(st.end - off - rEnd) <= 0.8);
            c.hash = true;
            c.hcov = Landmark.coverage(m, t, st.start, st.end);
            c.mel = Landmark.melCos(ft, fr, m.lagFrames, t, r, st.start, st.end);
            out.add(c);
        }
        // Dense hit clusters with no waveform core (same theme, waveform never sustains the edge
        // threshold: Office e01 title). The span is the cluster; stats are measured over it and
        // the third tier's verifiers decide. Clusters already carried by a core are skipped.
        int gapF = (int) Math.round(2.0 * Track.SR / 128);
        for (int i = 0; i < m.hitFrames.length; i++) {
            int j = i;
            while (j + 1 < m.hitFrames.length && m.hitFrames[j + 1] - m.hitFrames[j] <= gapF) j++;
            double a = t.offset + m.hitFrames[i] * 128.0 / Track.SR, b = t.offset + m.hitFrames[j] * 128.0 / Track.SR + 128.0 / Track.SR;
            int nh = j - i + 1;
            i = j;
            if (b - a < 8.0 || nh < 8 * (b - a)) continue;
            boolean covered = false;
            for (Cand c0 : out) if (Math.min(c0.end, b) - Math.max(c0.start, a) > 0.5 * (b - a)) covered = true;
            if (covered) continue;
            double[] ws = Correlator.stats(t, r, m.lag, a - t.offset, b - t.offset, 0.35);
            Cand c = new Cand();
            c.ref = refIndex;
            c.start = a;
            c.end = b;
            c.ncc = ws[0];
            c.density = ws[1];
            c.q75 = ws[2];
            c.off = off;
            c.eofTarget = tEnd - b;
            c.eofRef = rEnd - (b - off);
            c.clipStart = a - t.offset <= 0.15 && t.offset > 0;
            c.clipEnd = t.end() - b <= 0.15 && Math.abs(b - tEnd) > 0.8;
            c.hash = true;
            c.hcov = Landmark.coverage(m, t, a, b);
            c.mel = Landmark.melCos(ft, fr, m.lagFrames, t, r, a, b);
            out.add(c);
        }
        // Two cores widened to one cluster are one candidate.
        List<Cand> ded = new ArrayList<>();
        for (Cand c : out) {
            boolean dup = false;
            for (Cand d : ded) if (Math.min(d.end, c.end) - Math.max(d.start, c.start) > 0.8 * Math.min(d.len(), c.len())) dup = true;
            if (!dup) ded.add(c);
        }
        return ded;
    }

    /** Third tier: the same music in a different mix. More structure than the loose tier asks for:
     * hashMinRefs references agreeing on both edges (credits too, and EOF-anchored), intros at
     * least introAnchorBelow, and every supporter verified (top-quartile window NCC, landmark
     * coverage, centred log-band correlation). Edges and finishing rules are the existing ones. */
    private Segment decideHash(boolean head, EpisodeFeatures target, List<EpisodeFeatures> refs, List<Cand> all,
                               List<Cand> hash, java.util.Map<String, double[]> hints, List<String> notes) {
        List<Cand> hp = new ArrayList<>();
        for (Cand c : hash) {
            if (c.ncc < cfg.hashNccMin || c.density < cfg.hashDensityMin || c.q75 < cfg.hashQ75Min
                    || c.mel < cfg.melMin || c.hcov < cfg.hashCovMin) continue;
            if (!head && Math.abs(c.eofTarget - c.eofRef) > cfg.eofTol) continue;
            hp.add(c);
        }
        List<Segment> accepted = new ArrayList<>();
        boolean[] used = new boolean[hp.size()];
        while (true) {
            Cand[] group = bestGroup(hp, used);
            if (group == null) break;
            double m0 = median(group, true), m1 = median(group, false);
            for (int i = 0; i < hp.size(); i++) {
                Cand c = hp.get(i);
                if (!used[i] && Math.min(c.end, m1) - Math.max(c.start, m0) > 0.5 * (m1 - m0)) used[i] = true;
            }
            if (group.length < cfg.hashMinRefs) continue;
            group = tightSubset(group, cfg.hashEdgeTol);
            if (group == null) {
                notes.add((head ? "intro" : "credits") + " group " + round(m0) + "-" + round(m1) + ": hash, edges disagree");
                continue;
            }
            Segment s = gate(head, target, group, notes);
            if (s == null) continue;
            if (waveformContradicts(s, all)) {
                notes.add((head ? "intro" : "credits") + " group " + round(s.start) + "-" + round(s.end) + ": hash, waveform edges disagree");
                continue;
            }
            if (head && dissentsOutside(s, hp)) {
                notes.add("intro group " + round(s.start) + "-" + round(s.end) + ": hash, dissenting reference outside");
                continue;
            }
            // Short hash intros keep the detector's short-intro contract (premiere-shared in
            // finish()); their audio event is a silence trough within 5 s of an edge (hash spans
            // undercover, so the trough can sit just outside: Lost's bumper ends into black).
            // A story cue embedded in dialogue has no trough there (the D2 decoy).
            if (head && s.end - s.start < cfg.introAnchorBelow) {
                if (!premiereSupports(target, refs, s) || !nearTrough(target, s)) continue;
                s.gates.add("hash_event");
            }
            if (head && refs != null && isReplay(target, refs, s, hints, notes)) continue;
            s.gates.add("hash");
            accepted.add(s);
        }
        return pickFinish(head, target, refs, all, hp, accepted, notes);
    }

    /** Every pair of supporters agrees on both edges within refLoose (window-clipped sides excepted). */
    private boolean bothEdges(Cand[] g) {
        return bothEdges(g, cfg.refLoose);
    }

    private boolean bothEdges(Cand[] g, double tol) {
        for (int i = 0; i < g.length; i++) for (int j = i + 1; j < g.length; j++) {
            Cand a = g[i], b = g[j];
            if (!(a.clipStart || b.clipStart) && Math.abs(a.start - b.start) > tol) return false;
            if (!(a.clipEnd || b.clipEnd) && Math.abs(a.end - b.end) > tol) return false;
        }
        return true;
    }

    /** Largest subset of at least hashMinRefs supporters pairwise agreeing within tol (best sum ncc on ties). */
    private Cand[] tightSubset(Cand[] g, double tol) {
        int n = g.length;
        if (n > 12) return bothEdges(g, tol) ? g : null;
        Cand[] best = null;
        double bestScore = -1;
        for (int mask = (1 << n) - 1; mask > 0; mask--) {
            int k = Integer.bitCount(mask);
            if (k < cfg.hashMinRefs || (best != null && k < best.length)) continue;
            Cand[] sub = new Cand[k];
            double score = 0;
            for (int i = 0, j = 0; i < n; i++) if ((mask & (1 << i)) != 0) { sub[j++] = g[i]; score += g[i].ncc; }
            if (!bothEdges(sub, tol)) continue;
            if (best == null || k > best.length || score > bestScore) { best = sub; bestScore = score; }
        }
        return best;
    }

    /** Waveform stretches at loose strength covering most of the span whose edges disagree:
     * the same music edited differently per episode (a score cue), which cluster widening
     * must not paper over. Fragments covering half or less say nothing either way. */
    private boolean waveformContradicts(Segment s, List<Cand> all) {
        java.util.Map<Integer, Cand> byRef = new LinkedHashMap<>();
        for (Cand c : all) {
            if (c.hash || c.ncc < cfg.nccLoose || c.density < cfg.densityLoose) continue;
            double ov = Math.min(c.end, s.end) - Math.max(c.start, s.start);
            if (ov <= 0.5 * (s.end - s.start)) continue;
            Cand have = byRef.get(c.ref);
            if (have == null || ov > Math.min(have.end, s.end) - Math.max(have.start, s.start)) byRef.put(c.ref, c);
        }
        if (byRef.size() < 2) return false;
        return !bothEdges(byRef.values().toArray(new Cand[0]), cfg.refLoose);
    }

    /** A silence trough (the existing definition) within 5 s outside either edge of a short hash intro. */
    private boolean nearTrough(EpisodeFeatures target, Segment s) {
        Track t = target.head;
        if (t == null || t.env == null) return false;
        int thr = (int) Math.round(medianLevel(t, s.start, s.end) + cfg.troughDepth);
        return !troughs(t, Math.max(t.offset, s.start - 5), s.start + 2, thr).isEmpty()
                || !troughs(t, s.end - 2, Math.min(t.end(), s.end + 5), thr).isEmpty();
    }

    /** A non-supporter reference sharing most of the span but reaching outside it: a composite
     * the group hid by omission (the Mouse replay's fifth reference starts at the age card). */
    private boolean dissentsOutside(Segment s, List<Cand> hp) {
        java.util.Set<Integer> sup = new java.util.HashSet<>();
        for (Cand c : s.group) sup.add(c.ref);
        for (Cand c : hp) {
            if (sup.contains(c.ref)) continue;
            double ov = Math.min(c.end, s.end) - Math.max(c.start, s.start);
            if (ov > 0.5 * (s.end - s.start) && (c.start < s.start - cfg.refLoose || c.end > s.end + cfg.refLoose)) return true;
        }
        return false;
    }

    /** The earliest earlier reference is a supporter (or the target is itself the earliest). */
    private boolean premiereSupports(EpisodeFeatures target, List<EpisodeFeatures> refs, Segment s) {
        if (refs == null || s.group == null) return false;
        int[] te = epOrder(target.id);
        int ei = -1;
        int[] be = new int[]{Integer.MAX_VALUE, Integer.MAX_VALUE};
        for (int i = 0; i < refs.size(); i++) {
            int[] re = epOrder(refs.get(i).id);
            if ((re[0] < te[0] || (re[0] == te[0] && re[1] < te[1])) && (re[0] < be[0] || (re[0] == be[0] && re[1] < be[1]))) { ei = i; be = re; }
        }
        if (ei < 0) return true;
        for (Cand c : s.group) if (c.ref == ei) return true;
        return false;
    }

    /** Stretches of one reference at the same lag separated by less than stitchGap are one stretch: the montage under a
     * title can lose the match for a moment (a sound effect mixed over one episode) without leaving the alignment.
     * Kingdom e02 shares the 5.5-95.7 title with the other episodes in five parts with 0.6-0.9 s breaks; as parts its
     * shortest piece set the group's inner edge (9.8 s, rejected). ncc and density are length-weighted; both pieces must be strong. */
    private List<Cand> stitch(List<Cand> in) {
        List<Cand> out = new ArrayList<>();
        boolean[] gone = new boolean[in.size()];
        for (int i = 0; i < in.size(); i++) {
            if (gone[i]) continue;
            Cand a = in.get(i);
            Cand m = null;
            boolean grew = true;
            while (grew) {
                grew = false;
                for (int j = 0; j < in.size(); j++) {
                    if (j == i || gone[j]) continue;
                    Cand b = in.get(j);
                    Cand cur = m == null ? a : m;
                    if (b.ref != cur.ref || Math.abs(b.off - cur.off) > 0.01) continue;
                    if (b.ncc < cfg.stitchNcc || b.density < cfg.densityMin || cur.ncc < cfg.stitchNcc || cur.density < cfg.densityMin) continue;
                    double gap = b.start >= cur.end ? b.start - cur.end : cur.start - b.end;
                    if (gap < 0 || gap > cfg.stitchGap) continue;
                    Cand n = new Cand();
                    n.ref = cur.ref;
                    n.off = cur.off;
                    boolean bFirst = b.start < cur.start;
                    Cand first = bFirst ? b : cur, last = bFirst ? cur : b;
                    n.start = first.start;
                    n.clipStart = first.clipStart;
                    n.end = last.end;
                    n.clipEnd = last.clipEnd;
                    n.eofTarget = last.eofTarget;
                    n.eofRef = last.eofRef;
                    double la = cur.len(), lb = b.len();
                    n.ncc = (cur.ncc * la + b.ncc * lb) / (la + lb);
                    n.density = (cur.density * la + b.density * lb) / (la + lb); // the bridged gap is not a miss
                    m = n;
                    gone[j] = true;
                    grew = true;
                }
            }
            out.add(m == null ? a : m);
        }
        return out;
    }

    private static Segment copy(Segment s) {
        Segment c = new Segment();
        c.type = s.type;
        c.start = s.start;
        c.end = s.end;
        c.confidence = s.confidence;
        c.nccMin = s.nccMin;
        c.spreadStart = s.spreadStart;
        c.spreadEnd = s.spreadEnd;
        c.refCount = s.refCount;
        c.gates.addAll(s.gates);
        c.group = s.group;
        return c;
    }

    /** Merge, clamp, edge and anchor rules for one picked group; null when it fails any. */
    private Segment finish(boolean head, EpisodeFeatures target, List<EpisodeFeatures> refs, List<Cand> cands, List<Cand> pool,
                           Segment best, List<Segment> accepted, List<String> notes) {
        // Slot gaps bridged by the merge: no single candidate spans them, so the
        // clamp below must not let a one-sided candidate cut the merged span back.
        List<double[]> gaps = new ArrayList<>();
        if (head) merge(best, accepted, gaps);
        for (Segment s : accepted) {
            notes.add((head ? "intro" : "credits") + " group " + round(s.start) + "-" + round(s.end) + ": accepted, not best");
        }
        // a reference that left the group still overlaps: it may hold a shorter cut of the same song, so it limits the edges too
        for (Cand c : pool) {
            if (oneSided(c, gaps, best)) continue;
            double ov = Math.min(c.end, best.end) - Math.max(c.start, best.start);
            if (ov > 0.5 * (best.end - best.start)) {
                if (!c.clipStart) best.start = Math.max(best.start, c.start);
                if (!c.clipEnd) best.end = Math.min(best.end, c.end);
            }
        }
        if (best.end - best.start < (head ? cfg.introMin : (cfg.anchoredFloor && best.gates.contains("eof_agree") ? Math.min(cfg.anchorMin, cfg.creditsMin) : cfg.creditsMin))) {
            notes.add((head ? "intro" : "credits") + " group " + round(best.start) + "-" + round(best.end) + ": too short after the other references");
            return null;
        }
        edges(head, target, best);
        if (head && best.end - best.start < cfg.introAnchorBelow && !best.gates.contains("start_trough")
                && !best.gates.contains("start_at_trough") && !best.gates.contains("end_trough")
                && !best.gates.contains("end_at_trough") && !best.gates.contains("centre_stop")
                && !best.gates.contains("hash_event")) {
            notes.add("intro group " + round(best.start) + "-" + round(best.end) + ": short and no audio-event edge");
            return null;
        }
        if (head && cfg.shortNeedsPremiere && refs != null && best.end - best.start < cfg.introAnchorBelow
                && absentFromPremiere(target, refs, best, cands, notes)) return null;
        if (best.end - best.start < (head ? cfg.introMin : (best.gates.contains("eof_agree") ? Math.min(cfg.anchorMin, cfg.creditsMin) : cfg.creditsMin))) {
            // Edge trimming can shrink a group below the floor (the ST 8 s logo gates at 12 s,
            // then trims to 8): the floor binds on what would actually be skipped.
            notes.add((head ? "intro" : "credits") + " group " + round(best.start) + "-" + round(best.end) + ": too short after edge trim");
            return null;
        }
        if (!head && cfg.shortCreditsNeed3 && best.end - best.start < cfg.creditsMin && best.refCount < 3
                && !best.gates.contains("start_trough") && !best.gates.contains("start_at_trough")
                && !best.gates.contains("end_trough") && !best.gates.contains("end_at_trough")) {
            // Below creditsMin only the file-end anchor admits credits; with two references and no silence edge
            // that anchor alone also fits a preview bed at a fixed distance from the end (Mouse e02/e05 5058-5077).
            notes.add("credits group " + round(best.start) + "-" + round(best.end) + ": short, two references and no silence edge");
            return null;
        }
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
            if (!agree && !best.gates.contains("start_trough") && !best.gates.contains("start_at_trough")
                    && !best.gates.contains("end_trough") && !best.gates.contains("end_at_trough")) {
                // Credits with no silence boundary at either edge and no file-end anchor are not
                // provably credits (shared story montage, tag scenes): abstain. True credits in
                // this corpus always have a start trough (hospital band credits), an end trough,
                // or file-end agreement; the veto fired only on story montages and tag scenes.
                notes.add("credits group " + round(best.start) + "-" + round(best.end) + ": no silence boundary and no file-end anchor");
                return null;
            }
        }
        return best;
    }

    private boolean better(Segment a, Segment b) {
        if (cfg.shortYields && a.type.equals("intro")) {
            // A short shared stretch needs extra evidence even to report (introAnchorBelow); it never outranks a
            // full-length group that passed every gate (D2: a 12 s cue in three references over the 20 s title in two).
            boolean sa = a.end - a.start < cfg.introAnchorBelow, sb = b.end - b.start < cfg.introAnchorBelow;
            if (sa != sb) return sb;
        }
        if (a.refCount != b.refCount) {
            // A decisively longer shared stretch is more evidence than one more agreeing reference
            // (a 10 s distributor logo must not outrank the 59 s title theme it precedes).
            if (cfg.lenPrefer) {
                if (a.end - a.start >= 2 * (b.end - b.start)) return true;
                if (b.end - b.start >= 2 * (a.end - a.start)) return false;
            }
            return a.refCount > b.refCount;
        }
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

    /** Start of the first 1 s window inside [from, to] whose median level is at or below thr (env is dB below full
     * scale, so at or above the number), or -1. */
    private double dip(Track t, double from, double to, int thr) {
        double fr = Track.ENV_SAMPLES / (double) Track.SR;
        int w = (int) Math.round(1.0 / fr);
        int i0 = Math.max(0, (int) ((from - t.offset) / fr)), i1 = Math.min(t.env.length, (int) ((to - t.offset) / fr));
        int[] buf = new int[w];
        for (int i = i0; i + w <= i1; i += 5) {
            for (int j = 0; j < w; j++) buf[j] = t.env[i + j] & 127;
            Arrays.sort(buf);
            if (buf[w / 2] >= thr) return t.offset + i * fr;
        }
        return -1;
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
        } else if (head && cfg.dipDepth > 0 && dip(t, Math.max(seg.start + lo, seg.end - span), seg.end, (int) Math.round(thr - cfg.troughDepth + cfg.dipDepth)) >= 0) {
            // No silence, but the music fades well below its body before the shared audio ends: the title ended at
            // the fade and the music runs on under the next scene (Crown e02: 14 dB decay 244-247.5 at the picture cut).
            seg.end = dip(t, Math.max(seg.start + lo, seg.end - span), seg.end, (int) Math.round(thr - cfg.troughDepth + cfg.dipDepth));
            seg.gates.add("end_dip");
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
        if (head && t.cenv != null) centreStop(t, seg);
    }

    /** Hard stop at the first sustained centre-fraction step-up inside an intro: post-title
     * dialogue drives C ~7x over score (0.055 theme vs 0.38 dialogue, identical in 3
     * episodes) while the mono mix shows nothing. Regularized relative test on 5 s windows
     * (1.5 s windows ride dialogue pauses and theme swells): fire where the window exceeds
     * max(0.10 floor, 1.5x the segment median) AND 3x the 3 s before it (a level change,
     * not a swell), persisting 3 windows, moving the end only inward. The floor protects
     * zero-centre mixes; the ratio protects vocal themes (documented limit, no regression).
     * Stereo (cenv null) falls back to the trough path above. */
    private void centreStop(Track t, Segment seg) {
        double fr = Track.ENV_SAMPLES / (double) Track.SR; // cenv shares the 20 ms grid
        int i0 = Math.max(0, (int) ((seg.start - t.offset) / fr));
        int i1 = Math.min(t.cenv.length, (int) Math.ceil((Math.min(seg.end + 15.0, t.end()) - t.offset) / fr));
        if (i1 - i0 < 250) return;
        int n = i1 - i0;
        int[] s = new int[n];
        for (int i = 0; i < n; i++) s[i] = t.cenv[i0 + i] & 0xFF;
        Arrays.sort(s);
        double med = s[n / 2] / 127.0;
        double thr = Math.max(0.10, 1.5 * med);
        int win = (int) Math.round(5.0 / fr); // 5 s window median (1.5 s windows ride pauses/swells)
        int step = (int) Math.round(1.0 / fr); // 1 s stride
        int nm = (n - win) / step + 1;
        double[] m = new double[nm];
        int[] w = new int[win];
        for (int i = 0; i < nm; i++) {
            for (int j = 0; j < win; j++) w[j] = t.cenv[i0 + i * step + j] & 0xFF;
            Arrays.sort(w);
            m[i] = w[win / 2] / 127.0;
        }
        int need = 3; // persist 3 windows (~7 s of signal)
        int pre = (int) Math.round(3.0 / fr); // 3 s before the candidate step
        int fire = -1;
        for (int i = 0; i + need <= nm; i++) {
            if (m[i] <= thr) continue;
            int b0 = Math.max(0, i0 + i * step - pre), b1 = i0 + i * step;
            int bn = b1 - b0;
            if (bn < 50) continue;
            int[] b = new int[bn];
            for (int j = 0; j < bn; j++) b[j] = t.cenv[b0 + j] & 0xFF;
            Arrays.sort(b);
            double before = Math.max(0.02, b[bn / 2] / 127.0);
            if (m[i] < 3.0 * before) continue; // a level change, not a swell
            boolean ok = true;
            for (int k = i + 1; k < i + need; k++) {
                if (m[k] <= thr) {
                    ok = false;
                    break;
                }
            }
            if (ok) {
                fire = i;
                break;
            }
        }
        if (fire < 0) return;
        double at = t.offset + (i0 + fire * step) * fr;
        if (at < seg.end && seg.end - at >= 1.0 && at - seg.start >= cfg.introMin) {
            seg.end = at;
            seg.gates.add("centre_stop");
        }
    }

    /** Best-supported group: most references within refLoose of a seed at both edges, then the longest seed
     * (or the latest-starting seed when the hint pass fits premiere-context titles). */
    private Cand[] bestGroup(List<Cand> pool, boolean[] used) {
        Cand[] best = null;
        double bestLen = -1, bestStart = -1;
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
            if (best == null || sup.size() > best.length
                    || (sup.size() == best.length && (cfg.tieLatest ? s.start > bestStart : s.len() > bestLen))) {
                best = sup.values().toArray(new Cand[0]);
                bestLen = s.len();
                bestStart = s.start;
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

    /** Every pair of supporters must share the span under the bestGroup join condition.
     * Staggered composites fail (the echo's starts step 0.1/4.8/5.1/9.2 with pairwise gaps;
     * replayed cold opens mix premiere cards, idents and recaps) while true titles pass
     * (hospital's supporters share the title end; Lost/BCS shorts agree on both edges).
     * Window-clipped edges are uninformative on that side and skipped (clipped ends still
     * veto in gate); no new tolerance, no length cliff. */
    private boolean unanimous(Cand[] g) {
        for (int i = 0; i < g.length; i++) for (int j = i + 1; j < g.length; j++) {
            Cand a = g[i], b = g[j];
            double ds = Math.abs(a.start - b.start), de = Math.abs(a.end - b.end);
            boolean both = (a.clipStart || b.clipStart || ds <= cfg.refLoose)
                    && (a.clipEnd || b.clipEnd || de <= cfg.refLoose);
            boolean one = ((a.clipStart || b.clipStart || ds <= cfg.edgeTight)
                    || (a.clipEnd || b.clipEnd || de <= cfg.edgeTight))
                    && Math.min(a.end, b.end) - Math.max(a.start, b.start) >= 0.5 * Math.min(a.len(), b.len());
            if (!both && !one) return false;
        }
        return true;
    }

    /** The largest subset of at least three supporters agreeing on both edges whose dropped members each lie inside it (within
     * refLoose of the subset's inner intersection): a reference holding a shorter cut of the same theme (Adventure Time e05 0.6-12.6 against 0.1-24.9), or one
     * a hair past the tolerance (Death Note 81.3 against 84.3), is not a composite. A dissenter reaching outside the
     * others (Mouse: one reference matching from the age card at 0.1, the rest from 12.9) keeps the group a composite. */
    private Cand[] innerSubset(Cand[] g) {
        int n = g.length;
        for (int k = 1; n - k >= Math.max(3, cfg.minRefs); k++) {
            int[] idx = new int[k];
            for (int i = 0; i < k; i++) idx[i] = i;
            while (true) {
                boolean[] out = new boolean[n];
                for (int i : idx) out[i] = true;
                Cand[] keep = new Cand[n - k];
                double lo = Double.NEGATIVE_INFINITY, hi = Double.POSITIVE_INFINITY;
                for (int i = 0, j = 0; i < n; i++) if (!out[i]) {
                    keep[j++] = g[i];
                    lo = Math.max(lo, g[i].start);
                    hi = Math.min(hi, g[i].end);
                }
                boolean inside = true;
                for (int i : idx) if (g[i].start < lo - cfg.refLoose || g[i].end > hi + cfg.refLoose) inside = false;
                if (inside && bothEdges(keep)) return keep;
                int p = k - 1;
                while (p >= 0 && idx[p] == n - k + p) p--;
                if (p < 0) break;
                idx[p]++;
                for (int q = p + 1; q < k; q++) idx[q] = idx[q - 1] + 1;
            }
        }
        return null;
    }

    private Segment gate(boolean head, EpisodeFeatures target, Cand[] g, List<String> notes) {
        String kind = head ? "intro" : "credits";
        if (g.length < cfg.minRefs) {
            notes.add(kind + " group " + round(g[0].start) + "-" + round(g[0].end) + ": only " + g.length + " reference");
            return null;
        }
        // inner intersection; a reference clipped by its analysis window says nothing about that edge.
        // Clipped starts fall back to the innermost observed start (safe side, see below).
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
        boolean edgeClipped = false;
        if (seenS < cfg.minRefs || seenE < cfg.minRefs) {
            // A window-clipped start hides the true start on the safe side: the observed
            // position is window-cut, so the innermost observed start can only under-cover.
            // Count clipped starts only for EOF-anchored credits groups (all refs agree on the
            // file-end distance, so the extent is fixed): BigBang-type stings and window-cut
            // clean credits. Unanchored clipped starts say nothing (a genuinely agreeing but
            // early start would report a wrong). A clipped end still vetoes: the match continues
            // past the window, so the segment's true extent is unknown.
            if (!head && eofAgree) for (Cand c : g) {
                if (c.clipStart) {
                    s = Math.max(s, c.start);
                    sMin = Math.min(sMin, c.start);
                    seenS++;
                    edgeClipped = true;
                }
            }
        }
        if (seenS < cfg.minRefs || seenE < cfg.minRefs) {
            StringBuilder ms = new StringBuilder();
            for (Cand c : g) ms.append(" [r").append(c.ref).append(" ").append(round(c.start)).append("-").append(round(c.end)).append(c.clipStart ? "S" : "").append(c.clipEnd ? "E" : "").append("]");
            notes.add(kind + " group " + round(g[0].start) + "-" + round(g[0].end) + ": clipped" + ms);
            return null;
        }
        double len = e - s;
        // EOF-anchored credits groups (all refs agree on the file-end distance) may be as
        // short as anchorMin: the end-of-file anchor collapses the trial count, so the H0
        // floor applies. Unanchored groups keep the full minima.
        double lo = head ? cfg.introMin : (eofAgree ? Math.min(cfg.anchorMin, cfg.creditsMin) : cfg.creditsMin);
        double hi = head ? cfg.introMax : cfg.creditsMax;
        if (len < lo && !head && eofAgree && cfg.dropInnerCredits) {
            // File-end-anchored credits where some references hold a shorter cut of the closing song (Big Bang e05:
            // three references to 1235.1, two to 1229.0, all at their own file-end distance): the subset that agrees on
            // both edges reports, as for intros; the dissenters must lie inside it.
            Cand[] sub = innerSubset(g);
            if (sub != null) {
                notes.add(kind + " group " + round(s) + "-" + round(e) + ": " + (g.length - sub.length) + " inner dissent dropped");
                return gate(head, target, sub, notes);
            }
        }
        if (len < lo || len > hi) {
            notes.add(kind + " group " + round(s) + "-" + round(e) + ": length");
            return null;
        }
        if (head && !unanimous(g) && cfg.dropInner) {
            Cand[] sub = innerSubset(g);
            if (sub != null) {
                notes.add(kind + " group " + round(s) + "-" + round(e) + ": " + (g.length - sub.length) + " inner dissent dropped");
                return gate(head, target, sub, notes);
            }
        }
        if (head && !unanimous(g)) {
            // A shared span means every pair of supporters shares it: staggered composites
            // (the in-score echo, replayed cold opens) fail this while true titles pass, with
            // no length cliff and no new tolerance (reuses the join condition).
            notes.add(kind + " group " + round(s) + "-" + round(e) + ": composite");
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
        if (edgeClipped) seg.gates.add("edge_clipped");
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
