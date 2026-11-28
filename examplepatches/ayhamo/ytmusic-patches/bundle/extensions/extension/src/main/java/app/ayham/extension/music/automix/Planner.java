package app.ayham.extension.music.automix;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

/**
 * The YT Music Extension's automix planner (src/automix/automix.js: plan, filterMix, fallback,
 * the AutoDJ v2 additions, planLoopMix and loopSchedule), ported line by line. Times are song
 * seconds. Pure Java: it runs the same on a desktop JVM, where it is checked against automix.js.
 *
 * Version 1 is the extension's "Original AutoDJ" (BitChord web), version 2 its "Advanced
 * AutoDJ" (plus the BitChord phone's ideas); the loop mix is the same in both.
 */
public final class Planner {
    private Planner() {
    }

    /** The extension's automix settings. */
    public static final class Settings {
        /** 1: Original AutoDJ, 2: Advanced AutoDJ, 3: Automix v2 (AutoDJ plus Orchard's rules). */
        public int version = 1;
        /** Advanced AutoDJ's key-aware blend length. */
        public boolean keyAware;
        /** 0: Auto; else "Up to N bars". */
        public int bars;
        /** bars is a length the user picked for this pair: played as picked, whatever move plays it (editor.md §6). */
        public boolean userBars;
    }

    /** An anchor's kind (change, outro, end, downbeat), its second, Orchard's score, and the mix-out it gives. */
    public static final class Anchor {
        public String kind;
        public double sec, score, mixOut;
    }

    /** Echo out: [beats] of A's beat, a delay of [delaySec] with [feedback], the dry sound cut in [cutSec]. */
    public static final class Echo {
        public int beats;
        public double delaySec, feedback, cutSec;
    }

    /** Sung spans of each song from synced lyrics ([start, end] seconds), or null: the vocal mask. */
    public static final class Sung {
        public double[][] out, in;
    }

    public static final class Plan implements Cloneable {
        public String style;            // blend | filter | crossfade | loop
        public boolean fallback;
        public String reason;
        /** The editor's preset whose curves replaced the planner's (editor.md §9), or null. */
        public String preset;
        /** What an override asked for that the planner would have refused or had to move (editor.md §6). */
        public List<String> warnings;
        /** The mix-in was placed in the editor: Automix v2's kick lock leaves it (editor.md §6). */
        public boolean windowIn;
        public boolean v2;
        /** Automix v2's blend (its evidence fields below are set). */
        public boolean v3;
        /** Automix v2's hand-over (the boundary switch) or beatless bridge, both crossfades. */
        public boolean handoff, bridge;
        /** The fallback ladder's shape: dropin | muffle, or null. */
        public String shape;
        public double muffleLead = Double.NaN;
        public double subBassContrast = Double.NaN, swapAt = Double.NaN;
        public String swapMoved;
        public Glide glide;
        public Harmonic harmonic;
        public Trim trim;
        public double clash;
        public String rerouted, vocalsBy, keyClash;
        /** Automix v2's curator blend (analysis-cases.md "The curator blend", plan.schema.json). */
        public boolean curator;
        public double mixOutTrackTime, durationSec, mixInTrackTime;
        /** B's late entry (mix-file.md rule 2, plan.schema.json): silent and unstarted this long into the mix, then from mixInTrackTime; 0: with the mix. */
        public double inDelaySec;
        public double rate = 1, outRate = 1;
        public int rampBeats;
        public double rampSongSec, beatSec = Double.NaN;
        /** The Looping lane (editor.md §13): A's seconds looped from mixOutTrackTime, 0: none. */
        public double loopSec;
        /** Each song's playlist speed (spotify-mixes.md rule 10, plan.schema.json), NaN: none. */
        public double speedOut = Double.NaN, speedIn = Double.NaN;
        public int bars;
        public double swapDb, barSec, bpm = Double.NaN, outBpm = Double.NaN, inBpm = Double.NaN;
        public LoopPlan loop;
        /** What each deck does over the transition (spec/automix/plan.schema.json "curves"). */
        public Curves curves;
        /** Automix v2's kick lock applied to mixInTrackTime, or null. */
        public KickLock.Result kick;
        /** Where Automix v2 placed its own blend, filter mix or echo out (versions.md "Where the blend sits"), or null. */
        public Anchor anchor;
        /** The echo out's delay line (shape "echo"; editor.md §5), or null. */
        public Echo echo;

        /** A shallow copy (the kick lock moves the copy's cue). */
        public Plan copy() {
            try {
                return (Plan) clone();
            } catch (CloneNotSupportedException e) {
                throw new AssertionError(e);
            }
        }

        @Override
        public String toString() {
            if (loop != null) return loop.toString();
            StringBuilder b = new StringBuilder();
            b.append(String.format(Locale.US, "%s from %.2f s for %.2f s", style, mixOutTrackTime, durationSec));
            if (!style.equals("crossfade")) b.append(String.format(Locale.US, ", %d bars at %.1f BPM", bars, bpm));
            b.append(String.format(Locale.US, ", next song from %.2f s at x%.3f", mixInTrackTime, rate));
            if (inDelaySec > 0) b.append(String.format(Locale.US, ", %.2f s into the mix", inDelaySec));
            if (!Double.isNaN(speedOut)) b.append(String.format(Locale.US, ", playlist speeds x%.5f / x%.5f", speedOut, speedIn));
            else if (outRate > 1.0001) b.append(String.format(Locale.US, ", playing song up to x%.4f over %d beats", outRate, rampBeats));
            if (shape != null) b.append(", ").append(shape);
            if (echo != null) b.append(String.format(Locale.US, " (%d beats, delay %.3f s, feedback %.2f)", echo.beats, echo.delaySec, echo.feedback));
            if (anchor != null) b.append(String.format(Locale.US, ", anchored on the %s at %.2f s (score %.3f)", anchor.kind, anchor.sec, anchor.score));
            if (curator) b.append(", the curator's (8 bars, 31 s before the music ends)");
            if (glide != null) b.append(String.format(Locale.US, ", glide x%.4f over %d beats", glide.q, glide.beats));
            if (trim != null && (trim.outDb != 0 || trim.inDb != 0)) b.append(String.format(Locale.US, ", trim out %.1f / in %.1f dB", trim.outDb, trim.inDb));
            if (reason != null) b.append(" (").append(reason).append(')');
            if (preset != null || warnings != null) {
                b.append(" [editor: ").append(preset != null ? preset : "auto");
                if (warnings != null) for (String w : warnings) b.append("; ").append(w);
                b.append(']');
            }
            if (v2 && !style.equals("crossfade")) {
                b.append(String.format(Locale.US, " [AutoDJ: both sing %d%%", Math.round(clash * 100)));
                if (vocalsBy != null) b.append(" (").append(vocalsBy).append(')');
                if (rerouted != null) b.append("; ").append(rerouted);
                if (keyClash != null) b.append("; keys clash (").append(keyClash).append("), short blend");
                b.append(']');
            }
            return b.toString();
        }
    }

    // ───────── grid (BitChord engine/grid.ts) ─────────
    static final int BEATS_PER_BAR = 4;
    static final int BEATS_PER_PHRASE = 32;

    static final class Grid {
        double beatSec, barSec, phraseSec, downbeatSec, bpm;
    }

    static Grid gridOf(Analysis a) {
        if (a == null || !(a.bpm > 0) || !(a.beatIntervalSec > 0) || Double.isNaN(a.firstDownbeatSec)) return null;
        Grid g = new Grid();
        g.beatSec = a.beatIntervalSec;
        g.barSec = g.beatSec * BEATS_PER_BAR;
        g.phraseSec = g.beatSec * BEATS_PER_PHRASE;
        g.downbeatSec = a.firstDownbeatSec;
        g.bpm = a.bpm;
        return g;
    }

    /** The analysis as the outgoing side sees it: its grid fields swapped for the tail grid. */
    public static Analysis asOutgoing(Analysis a) {
        if (!a.tailGridKnown) return a;
        Analysis o = a.copy();
        Analysis.LocalGrid t = a.tailGrid;
        if (t != null) {
            o.bpm = t.bpm;
            o.beatIntervalSec = t.beatIntervalSec;
            o.firstDownbeatSec = t.firstDownbeatSec;
            o.gridConfidence = t.gridConfidence;
        } else {
            o.beatIntervalSec = Double.NaN;
            o.firstDownbeatSec = Double.NaN;
            o.gridConfidence = 0;
        }
        return o;
    }

    static double phraseAtOrAfter(Grid g, double t) {
        return g.downbeatSec + Math.ceil((t - g.downbeatSec) / g.phraseSec) * g.phraseSec;
    }

    static double downbeatAtOrAfter(Grid g, double t) {
        return g.downbeatSec + Math.ceil((t - g.downbeatSec) / g.barSec) * g.barSec;
    }

    static double downbeatAtOrBefore(Grid g, double t) {
        return g.downbeatSec + Math.floor((t - g.downbeatSec) / g.barSec) * g.barSec;
    }

    static double naturalMixOut(Grid g, Analysis cur, double dur) {
        return downbeatAtOrBefore(g, cur.durationSec - g.barSec - dur);
    }

    // ───────── Auto blend length (BitChord phone, TransitionPlanner.kt) ─────────
    static final int[] AUTO_BAR_CHOICES = {32, 16, 8, 4};
    static final int AUTO_BEATS = 16;
    static final double AUTO_MAX_SEC = 12, AUTO_CALM_MAX_SEC = 16, AUTO_FILTER_MAX_SEC = 8;
    static final double CALM_ENERGY = 0.7;
    static final int ENERGY_WINDOW_BEATS = 8;
    static final double MAX_NEXT_SHARE = 0.4;

    /** The song's energy over [from, to] as a share of its mean; NaN: no curve. */
    static double energyShare(Analysis a, double from, double to) {
        double[] c = a == null ? null : a.energyCurve;
        if (c == null || c.length == 0 || !(a.durationSec > 0) || !(a.energy > 0)) return Double.NaN;
        double w = a.durationSec / c.length;
        int i0 = (int) Math.max(0, Math.min(c.length - 1, Math.floor(from / w)));
        int i1 = (int) Math.max(i0, Math.min(c.length - 1, Math.floor(Math.max(from, to - 1e-6) / w)));
        double sum = 0;
        for (int i = i0; i <= i1; i++) sum += c[i];
        return sum / (i1 - i0 + 1) / a.energy;
    }

    static int autoBars(Analysis cur, Analysis next, Grid g, double entrySec, boolean filter) {
        double window = ENERGY_WINDOW_BEATS * g.beatSec;
        double exit = cur.durationSec - g.barSec;
        double out = energyShare(cur, exit - window, exit);
        double into = energyShare(next, entrySec, entrySec + window);
        boolean calm = !Double.isNaN(out) && !Double.isNaN(into) && out < CALM_ENERGY && into < CALM_ENERGY;
        int beats = AUTO_BEATS * (calm ? 2 : 1);
        double cap = Math.min(Math.min(beats * g.beatSec, filter ? AUTO_FILTER_MAX_SEC : calm ? AUTO_CALM_MAX_SEC : AUTO_MAX_SEC),
                next.durationSec > 0 ? next.durationSec * MAX_NEXT_SHARE : Double.POSITIVE_INFINITY);
        for (int b : AUTO_BAR_CHOICES) if (b * g.barSec <= cap + 1e-6) return b;
        return AUTO_BAR_CHOICES[AUTO_BAR_CHOICES.length - 1];
    }

    static int requestedBars(Settings s, Analysis cur, Analysis next, Grid g, double entrySec, boolean filter) {
        return s.bars <= 0 ? autoBars(cur, next, g, entrySec, filter) : s.bars;
    }

    // ───────── transition planner (BitChord engine/transition-scheduler.ts) ─────────
    static final double MIN_GRID_CONFIDENCE = 0.2;
    static final double KILL_DB = -12, SHORT_BLEND_KILL_DB = -6;
    static final int FULL_SWAP_MIN_BARS = 8;
    static final double MAX_SLOW_DOWN = 0.1, MAX_SPEED_UP = 0.25;
    public static final double TEMPO_STEP_PER_BEAT = 0.0075;
    static final int FILTER_MAX_BARS = 8;

    /** The length picked for the pair being planned, in bars (automix.js pinnedBars); 0: none. */
    private static final ThreadLocal<Integer> PINNED = ThreadLocal.withInitial(() -> 0);

    /**
     * A length picked (editor.md §6 "A length picked is kept", ruled 2026-11-26 [all]): whichever move
     * Automix picks plays at it. In seconds of A: its bars on A's end grid, else on A's own tempo; NaN
     * with no length picked, or for a song with no tempo at all (then the move keeps its own length).
     */
    static double pinnedSec(int bars, Analysis a) {
        if (bars <= 0 || a == null) return Double.NaN;
        Grid g = gridOf(asOutgoing(a));
        double bar = g != null && g.barSec > 0 ? g.barSec : a.beatIntervalSec > 0 ? a.beatIntervalSec * 4 : 0;
        return bar > 0 ? bars * bar : Double.NaN;
    }

    private static double pinnedSec(Analysis a) {
        return pinnedSec(PINNED.get(), a);
    }
    static final double FALLBACK_SEC = 12;

    static int effectiveBlendBars(int requested, double fromConf, double toConf) {
        double conf = Math.min(fromConf, toConf);
        if (conf >= 0.6) return requested;
        if (conf >= 0.45) return Math.min(requested, 8);
        return Math.min(requested, 4);
    }

    static boolean stretchAllowed(double rate) {
        return rate >= 1 ? rate - 1 <= MAX_SPEED_UP : 1 - rate <= MAX_SLOW_DOWN;
    }

    static double foldRate(double raw) {
        double best = raw;
        for (double r : new double[]{raw / 2, raw * 2}) if (Math.abs(r - 1) < Math.abs(best - 1)) best = r;
        return best;
    }

    static Analysis stub(String id, double durationSec) {
        Analysis a = new Analysis();
        a.fileKey = id;
        a.durationSec = durationSec;
        a.gridConfidence = 0;
        a.energy = 0.5;
        a.energyCurve = new double[0];
        a.stub = true;
        a.tailGridKnown = false;
        return a;
    }

    /**
     * The blend from the playing song into the next. from, to: analyses (null: not analysed yet);
     * durationSec: the playing song's length as the player reports it; pos: where it is now;
     * earliest: the first song time the blend can start.
     */
    public static Plan plan(Settings s, String fromId, String toId, Analysis from, Analysis to, double durationSec,
                            double pos, double earliest, Sung sung) {
        return plan(s, fromId, toId, from, to, durationSec, pos, earliest, sung, null);
    }

    /**
     * With the editor's override for this pair (editor.md §9; a pick from before the editor is
     * migrated as it's read). Its length comes before the setting; a preset other than Auto
     * replaces the plan's gain, shelves and filters, and the planner's tempo stays.
     */
    public static Plan plan(Settings s, String fromId, String toId, Analysis from, Analysis to, double durationSec,
                            double pos, double earliest, Sung sung, MixOverride ov) {
        return plan(s, fromId, toId, from, to, durationSec, pos, earliest, sung, ov, 1, 1);
    }

    /**
     * With each song's playlist speed (spotify-mixes.md rule 10, MixOverride.songSpeed): either one
     * off x1 and the blend plays A at speedOut and B at speedIn, no ramp or glide; a filter mix or
     * fade plays B at speedIn.
     */
    public static Plan plan(Settings s, String fromId, String toId, Analysis from, Analysis to, double durationSec,
                            double pos, double earliest, Sung sung, MixOverride ov, double speedOut, double speedIn) {
        return plan(s, fromId, toId, from, to, durationSec, pos, earliest, sung, ov, speedOut, speedIn, false);
    }

    /**
     * [curator]: Automix v2's blend placed the curator's way (analysis-cases.md "The curator blend"),
     * asked for once Auto picked the blend over the loop mix; the plan falls back to the usual blend
     * (no `curator` flag) where it doesn't fit.
     */
    public static Plan plan(Settings s, String fromId, String toId, Analysis from, Analysis to, double durationSec,
                            double pos, double earliest, Sung sung, MixOverride ov, double speedOut, double speedIn, boolean curator) {
        double sOut = speedOut > 0 ? speedOut : 1, sIn = speedIn > 0 ? speedIn : 1;
        double[] sp = Math.abs(sOut - 1) >= 1e-4 || Math.abs(sIn - 1) >= 1e-4 ? new double[]{sOut, sIn} : null;
        List<String> notes = new ArrayList<>();
        // a preset no longer offered plays as Automatic, and says so (editor.md §6)
        if (ov != null && ov.retiredPreset != null) {
            notes.add("the preset \"" + ov.retiredPreset + "\" is no longer offered: Automatic plays");
        }
        // beats counted on another app's grid at half or double time: on this one's (mix-file.md rule 4)
        if (ov != null && ov.gridBpm > 0) {
            Grid fg = from != null ? gridOf(asOutgoing(from)) : null;
            MixOverride.Fold f = MixOverride.fold(ov, fg != null ? fg.bpm : Double.NaN);
            if (f.note != null) notes.add(f.note);
            ov = f.ov;
        }
        // an imported mix beat-matches as Sync unless its file says otherwise (mix-file.md rule 6)
        if (ov != null && ov.beatMatch == null && !"auto".equals(ov.beatMatchOf())) {
            ov = ov.copy();
            ov.beatMatch = ov.beatMatchOf();
        }
        // a length the user picked is played as picked: only the songs' ends bound it (editor.md §6, only Automix has rules)
        int pinned = ov != null ? ov.pinnedBars() : 0;
        if (pinned > 0) {
            Settings p = new Settings();
            p.version = s.version;
            p.keyAware = s.keyAware;
            p.bars = pinned;
            p.userBars = true;
            s = p;
        }
        List<String> warnings = new ArrayList<>(notes);
        Integer pinnedBefore = PINNED.get();
        PINNED.set(pinned);
        Plan p;
        try {
            p = planFor(s, fromId, toId, from, to, durationSec, pos, earliest, sung, ov, warnings, sp, curator);
        } finally {
            PINNED.set(pinnedBefore);
        }
        // each song's speed: A plays at its own from before the mix (the blend's outRate is it), B at its own
        if (sp != null) {
            p.speedOut = sp[0];
            p.speedIn = sp[1];
            // (a filter mix or fade: B at its speed, and A on at its own on our deck)
            // (an echo out is a blend in name only: no beat match, each song at its own speed)
            if (!"blend".equals(p.style) || "echo".equals(p.shape)) {
                p.rate = sp[1];
                p.outRate = sp[0];
            }
        }
        // B's late entry, set before the curves so A's trim follows B's heard rise (mix-file.md rule 2,
        // automix.js plan, extension audit 2026-11-27 M1); its warnings still go last
        List<String> lateNotes = null;
        if (ov != null && !ov.loop()) {
            List<String> before = p.warnings;
            p.warnings = null;
            lateEntry(p, ov);
            lateNotes = p.warnings;
            p.warnings = before;
        }
        p.curves = Curves.blend(p);
        // a length picked is kept whatever the move (editor.md §6); only a song with no tempo can't take it
        if (ov != null && ov.bars > 0 && !ov.loop() && warnings.size() == notes.size()
                && Double.isNaN(pinnedSec(pinned, from)) && (p.handoff || p.bridge || p.fallback))
            warnings.add(ov.bars + " bars not used: " + (p.reason != null ? p.reason : "a plain fade here") + " (no tempo for this song)");
        if (ov != null && !ov.loop()) {
            if (ov.out != null || ov.in != null) {
                String u = undecoded(p, from, to);
                if (u != null) warnings.add(u);
            }
            if (!warnings.isEmpty()) p.warnings = warnings;
            if (ov.in != null && "blend".equals(p.style)) p.windowIn = true; // placed by the user: the kick lock leaves it
            boolean both = from != null && to != null;
            // a drawing's beats (editor.md §10 rule 4): the mix's beat of A, its glide steps; with no beat match, A's own beat
            boolean matched = !p.style.equals("crossfade") && p.barSec > 0;
            Grid aGrid = matched || from == null ? null : gridOf(asOutgoing(from));
            double drawBeat = matched ? p.barSec / 4 : aGrid != null && aGrid.beatSec > 0 ? aGrid.beatSec : 0.5;
            Curves pc = !(p.fallback && !both) ? MixOverride.presetCurves(ov, p.durationSec, p.style.equals("crossfade") ? Double.NaN : p.beatSec,
                    drawBeat, matched ? p.glide : null) : null;
            if (pc != null) {
                // the preset's gain, shelves and filters; the planner's tempo stays
                if (p.curves.out.containsKey("rate")) pc.out.put("rate", p.curves.out.get("rate"));
                if (p.curves.in.containsKey("rate")) pc.in.put("rate", p.curves.in.get("rate"));
                p.curves = pc;
                p.preset = ov.preset;
                // the Looping lane (editor.md §13): N of A's beats, in A's song seconds
                if (pc.loopBeats > 0) {
                    Grid g = p.beatSec > 0 || from == null ? null : gridOf(asOutgoing(from));
                    p.loopSec = pc.loopBeats * (p.beatSec > 0 ? p.beatSec : g != null && g.beatSec > 0 ? g.beatSec : 0.5);
                }
                // the phone: Morphe's crossfade can't play a preset, our decks can
                if (both) p.fallback = false;
            }
            if (lateNotes != null) for (String w : lateNotes) note(p, w);
        }
        return p;
    }

    /**
     * B's late entry (mix-file.md rule 2 [all], automix.js plan): B stays silent that long into the mix,
     * then starts at its mix-in; the curves stay where they are. Only a plain blend or crossfade plays it.
     */
    static void lateEntry(Plan p, MixOverride ov) {
        double late = ov != null && !ov.loop() && ov.in != null ? ov.in.delaySec : 0;
        if (!(late > 0)) return;
        if (p.fallback || p.handoff || p.bridge || p.shape != null || p.glide != null || p.loop != null
                || !("blend".equals(p.style) || "crossfade".equals(p.style))) {
            note(p, "B's late start (" + num(late) + " s) isn't played in this kind of mix: B starts with it");
            return;
        }
        double most = Math.max(0, p.durationSec - 0.5);
        if (late > most + 1e-6) note(p, "B's late start of " + num(late) + " s is past the mix's end: " + String.format(Locale.US, "%.1f", most) + " s");
        p.inDelaySec = Math.round(Math.min(late, most) * 1e3) / 1e3;
    }

    private static void note(Plan p, String w) {
        List<String> l = p.warnings != null ? new ArrayList<>(p.warnings) : new ArrayList<>();
        l.add(w);
        p.warnings = l;
    }

    /** A number as JS prints it (3, 3.2, 14.486). */
    private static String num(double v) {
        return v == Math.rint(v) ? String.valueOf((long) v) : String.valueOf(v);
    }

    /**
     * Beat match Off (or Sync/Glide out of range): both songs at their own speed, overlapping over
     * the window and length asked for; with neither asked for, the plain crossfade at the song's end.
     */
    /**
     * Why the phone can't play a placed window, or null: each song's opening (Analyzer.HEAD_SEC) and
     * end (TAIL_SEC) are kept decoded, so a window in the middle of a longer song has no audio here,
     * and B's player needs about 2 s of B after the mix to take over. Morphe's crossfade then plays.
     */
    static String undecoded(Plan p, Analysis a, Analysis b) {
        if (p == null || p.fallback || !(p.durationSec > 0)) return null;
        if (a != null && a.durationSec > 0 && !kept(a.durationSec, p.mixOutTrackTime - 1, p.mixOutTrackTime + p.durationSec * p.outRate + 1))
            return "the mix-out at " + clock(p.mixOutTrackTime) + " is in the middle of a long song, which isn't kept decoded: Morphe's crossfade plays";
        if (b == null || !(b.durationSec > 0)) return null;
        double inEnd = p.mixInTrackTime + p.durationSec * p.rate;
        if (inEnd + 2.5 > b.durationSec)
            return "the window ends " + String.format(Locale.US, "%.1f", Math.max(0, b.durationSec - inEnd)) + " s before the next song's end, too close to hand it over: Morphe's crossfade plays";
        if (!kept(b.durationSec, p.mixInTrackTime - 1, inEnd + 3))
            return "the mix-in at " + clock(p.mixInTrackTime) + " is in the middle of a long song, which isn't kept decoded: Morphe's crossfade plays";
        return null;
    }

    /** Song seconds [from, to) lie in what is kept decoded of a song this long. */
    private static boolean kept(double dur, double from, double to) {
        if (dur <= Analyzer.HEAD_SEC + Analyzer.TAIL_SEC) return true;
        return to <= Analyzer.HEAD_SEC || from >= dur - Analyzer.TAIL_SEC;
    }

    private static String clock(double sec) {
        int s = (int) Math.max(0, Math.round(sec));
        return s / 60 + ":" + (s % 60 < 10 ? "0" : "") + s % 60;
    }

    static Plan overlap(Analysis cur, Analysis next, Grid fromGrid, MixOverride ov, double earliest, String reason, List<String> warnings) {
        Plan base = fallback(cur, next, earliest, reason);
        MixOverride.Resolved outW = ov != null ? MixOverride.resolveWindow(ov.out, null) : null;
        MixOverride.Resolved inW = ov != null ? MixOverride.resolveWindow(ov.in, null) : null;
        // the length asked for (no preset sets one, editor.md §2)
        int bars = ov != null ? ov.pinnedBars() : 0;
        if (bars == 0 && outW == null && inW == null) return base;
        // a placed mix-out may run to A's real end; a length alone stays within A's music (editor.md §6)
        double end = outW != null ? cur.durationSec : musicEnd(cur).durationSec, room = end - 0.3 - earliest;
        if (room < 1) {
            if (warnings != null) warnings.add("no room left in this song for the window asked for");
            return base;
        }
        double want = bars > 0 && fromGrid != null ? bars * fromGrid.barSec : base.durationSec > 0 ? base.durationSec : FALLBACK_SEC;
        if (bars > 0 && fromGrid != null && want > room + 0.01 && warnings != null) {
            warnings.add(String.format(Locale.US, "%d bars don't fit before the end: %.1f s", bars, room));
        }
        double D = Math.min(want, room), hi = Math.max(earliest, end - 0.3 - D);
        double mixOut = hi;
        if (outW != null && outW.sec < earliest - 0.01) {
            if (warnings != null) warnings.add(playedNote(outW.sec));
        } else if (outW != null) {
            mixOut = clampWindow(outW.sec, earliest, hi, "the mix-out", warnings, fromGrid);
        }
        double mixIn = inW != null ? clampWindow(inW.sec, 0, Math.max(0, next.durationSec - 0.3 - D), "the mix-in", warnings, gridOf(next)) : base.mixInTrackTime;
        base.fallback = false;
        base.mixOutTrackTime = mixOut;
        base.durationSec = D;
        base.mixInTrackTime = mixIn;
        base.trim = loudnessTrim(cur, mixOut, D, next, mixIn, D);
        return base;
    }

    /**
     * A saved position held inside [lo, hi]; one past a limit moves to the nearest downbeat inside
     * it (the clamped second itself with no grid there), with the reason shown (editor.md §6).
     */
    static double clampWindow(double t, double lo, double hi, String what, List<String> warnings, Grid grid) {
        double c = clamp(t, lo, hi);
        if (Math.abs(c - t) <= 0.01) return c;
        if (grid != null && grid.barSec > 0) {
            double d = t < lo ? downbeatAtOrAfter(grid, lo) : downbeatAtOrBefore(grid, hi);
            if (d >= lo - 1e-6 && d <= hi + 1e-6) c = d;
        }
        if (warnings != null) {
            warnings.add(String.format(Locale.US, "%s moved to %.1f s (%s)", what, c, t < lo ? "before the song" : "too close to the end"));
        }
        return c;
    }

    /** A saved mix-out the playhead has passed: the planner's own plays (editor.md §6). */
    static String playedNote(double sec) {
        return String.format(Locale.US, "the mix-out at %.1f s has already played: Auto's mix-out instead", sec);
    }

    /** The curator's fallback: the usual blend, the notes of the curator's pass dropped. */
    private static Plan planAgain(Settings s, String fromId, String toId, Analysis from, Analysis to, double durationSec,
                                  double pos, double earliest, Sung sung, MixOverride pick, List<String> warnings, int notesBefore, double[] sp) {
        warnings.subList(notesBefore, warnings.size()).clear();
        return planFor(s, fromId, toId, from, to, durationSec, pos, earliest, sung, pick, warnings, sp, false);
    }

    /** May Automix v2's kick lock move this plan's mix-in (automix.js kickLockAllowed): a blend not placed in the editor, not an echo out. */
    public static boolean kickLockAllowed(Plan p) {
        return p != null && "blend".equals(p.style) && !p.windowIn && !"echo".equals(p.shape) && !(p.inDelaySec > 0);
    }

    private static Plan planFor(Settings s, String fromId, String toId, Analysis from, Analysis to, double durationSec,
                                double pos, double earliest, Sung sung, MixOverride pick, List<String> warnings, double[] sp, boolean curatorAsk) {
        final Sung sungAsked = sung;
        // (the curator's fallback plans again from here: what this pass noted goes, not twice)
        final int notesBefore = warnings.size();
        boolean both = from != null && to != null;
        Analysis cur;
        if (both) {
            Analysis f = from.copy();
            f.durationSec = durationSec;
            cur = asOutgoing(f);
        } else {
            cur = asOutgoing(stub(fromId, durationSec));
        }
        Analysis next = both ? to : stub(toId, 0);
        Grid fromGrid = gridOf(cur), toGrid = gridOf(next);
        // the lyrics' spans with the vocal mask's gaps cut out (versions.md "Where a song is sung" rule 2)
        sung = carved(sung, cur, next);
        boolean forced = pick != null && pick.forced();
        String bm = pick != null ? pick.beatMatchOrAuto() : "auto";
        String family = pick != null ? pick.family : null;

        if (bm.equals("off") && both) {
            return overlap(cur, next, fromGrid, pick, earliest, family != null || pick.migrated ? "picked in the overview" : "beat match off", warnings);
        }
        boolean v3 = s.version == 3;
        if (fromGrid == null || cur.gridConfidence < MIN_GRID_CONFIDENCE) {
            if (forced && both) {
                warnings.add("no beat grid at this song's end: plays without beat match");
                return overlap(cur, next, null, pick, earliest, "this song has no beat grid at its end", warnings);
            }
            if (v3 && both) return handoff(cur, next, earliest, "this song has no beat grid at its end", sung);
            return fallback(cur, next, earliest, both ? "this song has no beat grid at its end" : "songs not analysed in time");
        }
        boolean toWeak = toGrid == null || next.gridConfidence < MIN_GRID_CONFIDENCE;
        if (forced && both && toWeak) {
            warnings.add("the next song has no beat grid: plays without beat match");
            return overlap(cur, next, fromGrid, pick, earliest, "next song has no beat grid", warnings);
        }
        // every tempo gate compares the played tempos: BPM x the song's playlist speed (spotify-mixes.md rule 10)
        double spOut = sp != null ? sp[0] : 1, spIn = sp != null ? sp[1] : 1;
        // Sync or Glide picked: always beat-matched, however far apart (folded, so at most about 41%);
        // the tempo gates below are Automix's own (editor.md §6, only Automix has rules)
        boolean userMatch = both && (bm.equals("sync") || bm.equals("glide"));
        if ("filter".equals(family)) {
            if (pick.out != null || pick.in != null) warnings.add("a Filter mix places itself: the saved window isn't used (pick a preset to use it)");
            Grid g = !toWeak ? toGrid : null;
            return filterMix(s, cur, next, fromGrid, g, requestedBars(s, cur, next, fromGrid, toGrid != null ? toGrid.downbeatSec : 0, true), pos, earliest,
                    "picked in the overview", sung);
        }
        if (v3 && toWeak) return handoff(cur, next, earliest, "next song has no beat grid", sung);
        if (toWeak) {
            return filterMix(s, cur, next, fromGrid, null, requestedBars(s, cur, next, fromGrid, 0, true), pos, earliest, "next song has no beat grid", sung);
        }

        double ratio = foldRate(fromGrid.bpm / toGrid.bpm);
        // as the two songs play (the same as ratio without playlist speeds)
        double played = sp != null ? foldRate(fromGrid.bpm * spOut / (toGrid.bpm * spIn)) : ratio;
        // v2: never more than V2_MAX_STRETCH of speed-up, never two 808 styles at once, never
        // keys that clash badly; it can't beatmatch those, so it hands over instead (an override
        // is the user's choice: the style gates warn instead)
        if (v3 && !userMatch && stretchOf(played) > V2_MAX_STRETCH) {
            String why = "tempos " + Math.round(stretchOf(played) * 100) + "% apart (v2 stretches at most " + Math.round(V2_MAX_STRETCH * 100) + "%)";
            if (!forced && (pick == null || pick.bars == 0)) return unmatchedMix(s, cur, next, fromGrid, toGrid, pos, earliest, why, sung, spOut != 1 || spIn != 1);
            // the user's preset, length or window: played as asked without beat match (editor.md §6)
            warnings.add(why + ": plays without beat match");
            return overlap(cur, next, fromGrid, pick, earliest, why, warnings);
        }
        double contrast = subBassContrast(cur, next);
        if (v3 && contrast >= V2_SUB_BASS_VETO) {
            if (!forced) return handoff(cur, next, earliest, "different sub-bass styles (" + String.format(Locale.US, "%.2f", contrast) + " apart)", sung);
            warnings.add("the productions clash (sub-bass " + String.format(Locale.US, "%.2f", contrast) + " apart)");
        }
        Harmonic harmonic = v3 ? harmonicEvidence(cur, next) : null;
        if (harmonic != null && harmonic.severeClash) {
            if (!forced) return handoff(cur, next, earliest, "the keys clash (" + cur.keyName + " → " + next.keyName + ", " + js(harmonic.score) + ")", sung);
            warnings.add("the keys clash (" + cur.keyName + " → " + next.keyName + ")");
        }
        if (!userMatch && !stretchAllowed(played)) {
            String why = "tempos " + Math.round(Math.abs(played - 1) * 100) + "% apart";
            if (!forced) return filterMix(s, cur, next, fromGrid, toGrid, requestedBars(s, cur, next, fromGrid, toGrid.downbeatSec, true), pos, earliest, why, sung);
            warnings.add(why + ": too far to stretch, plays without beat match");
            return overlap(cur, next, fromGrid, pick, earliest, why, warnings);
        }
        // Tempo only moves up: the next song faster, the playing one is brought up to it before the
        // blend; slower, it is sped up. Automix v2: over 4% apart, a glide on both songs instead
        // (glideSteps). The editor's Sync: always the speed-up; Glide: always the glide.
        // (each song's playlist speed, spotify-mixes.md rule 10: A at its speed with no ramp or glide,
        // B at A's played tempo, folded; after the mix B glides back to its own speed (Mix). This one
        // may slow a song)
        double glideQ = sp != null || bm.equals("sync") ? Double.NaN
                : bm.equals("glide") ? (Math.abs(ratio - 1) > 1e-4 ? 1 / ratio : Double.NaN)
                : v3 && stretchOf(ratio) > V2_MAX_CONSTANT ? 1 / ratio : Double.NaN;
        boolean gliding = !Double.isNaN(glideQ);
        double rate = sp != null ? foldRate(sp[0] * fromGrid.bpm / toGrid.bpm) : gliding ? 1 : ratio < 1 ? 1 : ratio;
        double outRate = sp != null ? sp[0] : gliding ? 1 : ratio < 1 ? 1 / ratio : 1;
        int rampBeats = sp == null && outRate > 1.0001 ? (int) Math.ceil((outRate - 1) / TEMPO_STEP_PER_BEAT) : 0;
        double rampSongSec = rampBeats * fromGrid.beatSec;
        // AutoDJ's key-aware length (its own toggle); Automix v2: Orchard's key score, always on
        String keyClash = v3 ? (harmonic.shortBlend ? cur.keyName + " → " + next.keyName + ", " + js(harmonic.score) : null)
                : s.version >= 2 && s.keyAware ? keysClash(cur, next) : null;
        boolean pinnedBars = pick != null && pick.pinnedBars() > 0;
        // the curator blend: only Auto's own blend on Automix v2, nothing picked or set for its length,
        // keys both trusted and not clashing, a song of 2 min or more (fallbacks 1 and 3; 2 is below)
        boolean curator = curatorAsk && v3 && !forced && !pinnedBars && s.bars == 0 && (pick == null || (pick.out == null && pick.in == null))
                && keyClash == null && harmonic != null && harmonic.confidence >= TRUSTED_KEY && musicEnd(cur).durationSec >= CURATOR_MIN_SONG_SEC;
        int bars = curator ? CURATOR_BARS : keyClash != null && !pinnedBars ? keyClashBars(fromGrid) : requestedBars(s, cur, next, fromGrid, toGrid.downbeatSec, false);
        // a length picked on a grid too weak to beat-match that many bars (effectiveBlendBars would cut it):
        // the length kept, played without beat match, as for no grid (editor.md §6, ruled 2026-11-26)
        if (s.userBars && effectiveBlendBars(bars, cur.gridConfidence, next.gridConfidence) < bars) {
            String why = "the beat grid is too weak to beat-match " + bars + " bars";
            warnings.add(why + ": plays without beat match");
            return overlap(cur, next, fromGrid, pick, earliest, why, warnings);
        }
        int effBars = s.userBars ? bars : effectiveBlendBars(bars, cur.gridConfidence, next.gridConfidence);
        double outSpan = effBars * fromGrid.barSec;
        GlideSteps glide = gliding ? glideSteps(glideQ, effBars * 4, fromGrid.beatSec) : null;
        double dur = glide != null ? glide.total : outSpan / outRate;
        double inPerOut = glide != null ? 1 / glideQ : rate / outRate;

        double first = earliest + rampSongSec;
        boolean v2 = s.version >= 2;
        double mixOut = naturalMixOut(fromGrid, v2 ? musicEnd(cur) : cur, outSpan);
        // Automix v2: where the blend sits, from the playing song's own shape (versions.md "Where the blend sits")
        Anchor anchor = v3 && !forced && !curator ? anchoredMixOut(cur, fromGrid, outSpan, Math.max(first, pos + rampSongSec), sung.out) : null;
        if (anchor != null) mixOut = anchor.mixOut;
        if (curator) {
            // the downbeat (on the song's end grid) nearest 31 s before its music ends; too early to reach: the usual blend
            double t = musicEnd(cur).durationSec - CURATOR_LEAD_SEC;
            mixOut = fromGrid.downbeatSec + Math.round((t - fromGrid.downbeatSec) / fromGrid.barSec) * fromGrid.barSec;
            if (mixOut < Math.max(first, pos + rampSongSec))
                return planAgain(s, fromId, toId, from, to, durationSec, pos, earliest, sungAsked, pick, warnings, notesBefore, sp);
        }
        if (mixOut < pos + rampSongSec) mixOut = phraseAtOrAfter(fromGrid, first);
        if (mixOut < first) mixOut = downbeatAtOrAfter(fromGrid, first);
        // the editor's window (editor.md §6): A's mix-out on A's end grid, clamped to what can still play
        MixOverride.Resolved wOut = pick != null ? MixOverride.resolveWindow(pick.out, fromGrid) : null;
        if (wOut != null && wOut.sec < first - 0.01) {
            warnings.add(playedNote(wOut.sec)); // already played: the planner's own mix-out
        } else if (wOut != null) {
            // up to A's real end, not its music end: a saved or imported window may run through the
            // outro, as Spotify's do (editor.md §6, ruled 2026-11-26 on Lush Life → Lean On)
            mixOut = clampWindow(wOut.sec, first, Math.max(first, cur.durationSec - 0.3 - outSpan), "the mix-out", warnings, fromGrid);
        }
        if (wOut != null && wOut.moved) warnings.add("the mix-out moved with a new beat grid");
        if (mixOut + outSpan > cur.durationSec - 0.3) {
            if (forced) {
                warnings.add("too close to the end for the window asked for");
                return overlap(cur, next, fromGrid, pick, earliest, "too close to the end for a blend", warnings);
            }
            if (v3) return handoff(cur, next, earliest, "too close to the end for a blend", sung);
            return filterMix(s, cur, next, fromGrid, toGrid, bars, pos, earliest, "too close to the end for a blend", sung);
        }

        double introEnd = Double.isNaN(next.introEndSec) ? 0 : next.introEndSec;
        double fullEnergyPhrase = phraseAtOrAfter(toGrid, Math.max(introEnd, toGrid.downbeatSec));
        double mixIn = fullEnergyPhrase - outSpan * inPerOut;
        boolean introShort = mixIn < toGrid.downbeatSec - 1e-6;
        if (mixIn < toGrid.downbeatSec) mixIn = toGrid.downbeatSec;

        Reroute dj = null;
        MixOverride.Resolved wIn = pick != null ? MixOverride.resolveWindow(pick.in, toGrid) : null;
        if (wIn != null) {
            mixIn = clampWindow(wIn.sec, 0, Math.max(0, next.durationSec - 0.3 - outSpan * inPerOut), "the mix-in", warnings, toGrid);
            if (wIn.moved) warnings.add("the mix-in moved with a new beat grid");
        }
        if (curator) {
            // B comes in as the planner places it (its cue, at most a quarter in); both singing over more
            // than V2_CLASH_MAX of the 8 bars, or no intro to blend over: the usual blend (fallback 2)
            mixIn = capIncomingSkip(next, toGrid, mixIn);
            double o = vocalOverlap(cur, next, mixOut, outSpan, mixIn, inPerOut, sung);
            double clash = Double.isNaN(o) ? 0 : o;
            if (introShort || clash > V2_CLASH_MAX)
                return planAgain(s, fromId, toId, from, to, durationSec, pos, earliest, sungAsked, pick, warnings, notesBefore, sp);
            dj = new Reroute();
            dj.clash = clash;
            dj.mixOut = mixOut;
            dj.mixIn = mixIn;
        } else if (v2 && wIn == null && wOut == null) {
            mixIn = capIncomingSkip(next, toGrid, mixIn);
            dj = rerouteForVocals(cur, next, fromGrid, toGrid, mixOut, mixIn, outSpan, inPerOut, Math.max(first, pos + rampSongSec), sung);
            mixOut = dj.mixOut;
            mixIn = dj.mixIn;
        }
        // v2: the bass changes hands on a bar where the playing song isn't mid-line
        Swap swap = v3 && effBars >= 2 ? vocalSafeSwap(cur, mixOut, outSpan, effBars, sung.out) : null;

        // v2's fallback ladder for a pair that beatmatches but can't blend: a drop-in, then a
        // muffle, else the hand-over (an override plays as asked, with the reason as a warning)
        String shape = null, shapeWhy = null;
        double muffleLead = Double.NaN;
        double djClash = dj != null ? dj.clash : 0;
        if (forced && v3) {
            if (dj == null) {
                double bothSing = vocalOverlap(cur, next, mixOut, outSpan, mixIn, inPerOut, sung);
                djClash = Double.isNaN(bothSing) ? 0 : bothSing;
            }
            if (djClash > V2_CLASH_MAX) warnings.add("both sing over " + Math.round(djClash * 100) + "% of the window");
            if (introShort && wIn == null) warnings.add("no intro in the next song to blend over");
        }
        if (v3 && !forced && (introShort || djClash > V2_CLASH_MAX)) {
            String why = introShort ? "no intro in the next song to blend over" : "both would sing " + Math.round(djClash * 100) + "% of a blend";
            String avoid = avoidedMove();   // an effect heard twice running isn't picked a third time
            // a drop-in plays at the user's length when one was picked
            int dBars = s.userBars ? effBars : DROP_IN_BARS;
            double dSpan = dBars * fromGrid.barSec;
            GlideSteps dGlide = gliding ? glideSteps(glideQ, dBars * 4, fromGrid.beatSec) : null;
            double lo = Math.max(first, pos + rampSongSec);
            double natural = naturalMixOut(fromGrid, musicEnd(cur), dSpan);
            for (int k = 0; !"dropin".equals(avoid) && k * fromGrid.barSec <= MAX_DISCARD_SEC; k++) {
                double o = natural - k * fromGrid.barSec;
                if (o < lo) break;
                double cut = voiceRisk(cur, o + dSpan - 1.5, o + dSpan, sung.out);
                // a voice that sings out to the end is cut by any exit (versions.md "Adlib outro")
                if (!Double.isNaN(cut) && cut >= SWAP_CLEAR && !singsOut(cur, o + dSpan, sung.out)) continue;
                double bothSing = vocalOverlap(cur, next, o, dSpan, toGrid.downbeatSec, inPerOut, sung);
                if ((Double.isNaN(bothSing) ? 0 : bothSing) > V2_CLASH_MAX) continue;
                double dDur = dGlide != null ? dGlide.total : dSpan / outRate;
                Plan p = new Plan();
                p.style = "blend";
                p.shape = "dropin";
                p.reason = why + ": a drop-in on the next song's first beat" + (k > 0 ? " (exit " + k + " bar" + (k == 1 ? "" : "s") + " earlier, off a sung line)" : "");
                p.v2 = v2;
                p.v3 = true;
                p.clash = Double.isNaN(bothSing) ? 0 : bothSing;
                p.vocalsBy = dj != null ? dj.by : null;
                p.keyClash = keyClash;
                p.subBassContrast = contrast;
                p.glide = dGlide != null ? new Glide(glideQ, dBars * 4, fromGrid.beatSec) : null;
                p.harmonic = harmonic;
                p.trim = loudnessTrim(cur, o, dSpan, next, toGrid.downbeatSec, dSpan * inPerOut);
                p.mixOutTrackTime = o;
                p.durationSec = dDur;
                p.mixInTrackTime = toGrid.downbeatSec;
                p.rate = dGlide != null ? dGlide.inRate[0] : rate;
                p.outRate = outRate;
                p.rampBeats = rampBeats;
                p.rampSongSec = rampSongSec;
                p.beatSec = fromGrid.beatSec;
                p.bars = dBars;
                p.swapDb = SHORT_BLEND_KILL_DB;
                p.barSec = dGlide != null ? dDur / dBars : fromGrid.barSec / outRate;
                p.bpm = dGlide != null ? fromGrid.bpm * Math.sqrt(glideQ) : fromGrid.bpm * outRate;
                p.outBpm = fromGrid.bpm;
                p.inBpm = toGrid.bpm;
                return p;
            }
            // muffle: the playing song keeps its level while a low-pass closes over it, the next
            // fades in over the bars before the bass swap and takes the bass on it
            int B = effBars * 4;
            double at = swap != null ? swap.at : 0.5;
            int leadBeats = (int) Math.min(MUFFLE_LEAD_BEATS, Math.round(at * B));
            double lead = leadBeats / (double) B;
            double inAtSwap = mixIn + at * outSpan * inPerOut, inAtLead = mixIn + (at - lead) * outSpan * inPerOut;
            double body = bassMean(cur, mixOut, mixOut + at * outSpan);
            double outRisk = voiceRisk(cur, mixOut + at * outSpan - 0.5, mixOut + at * outSpan + 0.5, sung.out);
            double inRisk = voiceRisk(next, inAtSwap - 0.5, inAtSwap + 0.5, sung.in);
            boolean swapsSingers = (Double.isNaN(outRisk) ? 0 : outRisk) >= 0.5 && (Double.isNaN(inRisk) ? 0 : inRisk) >= 0.7;
            if (!"muffle".equals(avoid) && !introShort && leadBeats >= MUFFLE_MIN_LEAD_BEATS && at + MUFFLE_EXIT_BEATS / (double) B <= 1 + 1e-6
                    && (Double.isNaN(body) || body >= MUFFLE_MIN_BODY) && inAtLead >= MUFFLE_MIN_OPENING_SEC && !swapsSingers) {
                shape = "muffle";
                muffleLead = lead;
                shapeWhy = why + ": a muffle (the playing song closes behind a low-pass)";
            } else {
                return handoff(cur, next, earliest, why + " and no drop-in or muffle fits", sung);
            }
        }

        Plan p = new Plan();
        p.style = "blend";
        p.reason = shapeWhy;
        p.shape = shape;
        p.muffleLead = muffleLead;
        p.v2 = v2;
        p.v3 = v3;
        p.clash = djClash;
        p.rerouted = dj != null ? dj.rerouted : null;
        p.vocalsBy = dj != null ? dj.by : null;
        p.keyClash = keyClash;
        p.anchor = anchor;
        p.curator = curator;
        // every blend carries its glide: Classic's too, when the editor's Glide asks for one
        p.glide = glide != null ? new Glide(glideQ, effBars * 4, fromGrid.beatSec) : null;
        if (v3) {
            p.subBassContrast = contrast;
            p.swapAt = swap != null ? swap.at : Double.NaN;
            p.swapMoved = swap != null ? swap.moved : null;
            p.harmonic = harmonic;
            p.trim = loudnessTrim(cur, mixOut, outSpan, next, mixIn, outSpan * inPerOut);
        }
        p.mixOutTrackTime = mixOut;
        p.durationSec = dur;
        p.mixInTrackTime = mixIn;
        p.rate = glide != null ? glide.inRate[0] : rate;
        p.outRate = outRate;
        p.rampBeats = rampBeats;
        p.rampSongSec = rampSongSec;
        p.beatSec = fromGrid.beatSec;
        p.bars = effBars;
        p.swapDb = effBars >= FULL_SWAP_MIN_BARS ? KILL_DB : SHORT_BLEND_KILL_DB;
        p.barSec = glide != null ? dur / effBars : fromGrid.barSec / outRate;
        p.bpm = glide != null ? fromGrid.bpm * Math.sqrt(glideQ) : fromGrid.bpm * outRate;
        p.outBpm = fromGrid.bpm;
        p.inBpm = toGrid.bpm;
        return p;
    }

    /** The phone's DJ_FILTER: incoming on its own downbeat at its own tempo. */
    static Plan filterMix(Settings s, Analysis cur, Analysis next, Grid fromGrid, Grid toGrid, int requested, double pos,
                          double earliest, String reason, Sung sung) {
        return filterMix(s, cur, next, fromGrid, toGrid, requested, pos, earliest, reason, sung, Double.NaN);
    }

    /** anchorLo: Automix v2's own filter mix (a tempo gap) is placed as its blend is, from there on (NaN: not). */
    static Plan filterMix(Settings s, Analysis cur, Analysis next, Grid fromGrid, Grid toGrid, int requested, double pos,
                          double earliest, String reason, Sung sung, double anchorLo) {
        // the 8-bar cap is Automix's own: a length the user picked plays as picked
        int bars = s.userBars ? requested : Math.min(requested, FILTER_MAX_BARS);
        double dur = bars * fromGrid.barSec;
        boolean v2 = s.version >= 2;
        double mixOut = naturalMixOut(fromGrid, v2 ? musicEnd(cur) : cur, dur);
        Anchor anchor = !Double.isNaN(anchorLo) ? anchoredMixOut(cur, fromGrid, dur, anchorLo, sung.out) : null;
        if (anchor != null) mixOut = anchor.mixOut;
        if (mixOut < pos) mixOut = phraseAtOrAfter(fromGrid, earliest);
        if (mixOut < earliest) mixOut = downbeatAtOrAfter(fromGrid, earliest);
        double room = cur.durationSec - 0.3 - mixOut;
        if (dur > room) {
            bars = (int) Math.max(1, Math.floor(room / fromGrid.barSec));
            dur = bars * fromGrid.barSec;
        }
        if (room < fromGrid.barSec) return fallback(cur, next, earliest, reason);
        double mixIn = toGrid != null ? toGrid.downbeatSec : Math.min(Double.isNaN(next.introEndSec) ? 0 : next.introEndSec, 1);
        double clash = 0;
        if (v2) {
            double o = vocalOverlap(cur, next, mixOut, dur, mixIn, 1, sung);
            clash = Double.isNaN(o) ? 0 : o;
        }
        Plan p = new Plan();
        p.style = "filter";
        p.reason = reason;
        p.v2 = v2;
        p.clash = clash;
        p.anchor = anchor;
        p.mixOutTrackTime = mixOut;
        p.durationSec = dur;
        p.mixInTrackTime = mixIn;
        p.rate = 1;
        p.bars = bars;
        p.swapDb = KILL_DB;
        p.barSec = fromGrid.barSec;
        p.bpm = fromGrid.bpm;
        p.inBpm = toGrid != null ? toGrid.bpm : Double.NaN;
        return p;
    }

    // ───────── AutoDJ (Automix version 2): BitChord phone ideas ─────────
    static final double VOCAL_SUNG = 0.25;
    static final double REROUTE_OVERLAP = 0.3;
    static final double REROUTE_GAIN = 0.5;
    static final double MAX_DISCARD_SEC = 12;
    static final double MAX_IN_SKIP = 0.25;
    static final int[] ENTRY_SHIFTS = {0, -4, 4, -8, 8};
    static final double KEY_MIN_CONFIDENCE = 0.5;

    static String keysClash(Analysis a, Analysis b) {
        if (a.camelotNum <= 0 || b.camelotNum <= 0 || !(a.keyConfidence >= KEY_MIN_CONFIDENCE) || !(b.keyConfidence >= KEY_MIN_CONFIDENCE)) return null;
        int step = ((a.camelotNum - b.camelotNum) % 12 + 12) % 12;
        boolean ok = a.camelotNum == b.camelotNum || (a.camelotLetter == b.camelotLetter && (step == 1 || step == 11));
        if (ok) return null;
        return (a.keyName != null ? a.keyName : a.camelotNum + "" + a.camelotLetter) + " → "
                + (b.keyName != null ? b.keyName : b.camelotNum + "" + b.camelotLetter);
    }

    static int keyClashBars(Grid g) {
        return 2 * g.barSec >= (g.bpm >= 140 ? 6 : 4) ? 2 : 4;
    }

    /**
     * The window's limits as the planner clamps them (editor.md §6, automix.js windowLimits), in song
     * seconds, {outLo, outHi, inLo, inHi}: A's mix-out from the earliest it can still start (with the
     * tempo ramp before a blend) to where the window ends 0.3 s before A's real end (its length, even
     * through a fading outro: a placed window may run there, as Spotify's do); B's mix-in from 0 to
     * where the window ends 0.3 s before B's end.
     */
    public static double[] windowLimits(Plan m, double outDur, double inDur, double earliest) {
        boolean blend = m != null && "blend".equals(m.style) && m.beatSec > 0 && m.bars > 0;
        double outSpan = blend ? m.bars * 4 * m.beatSec : m != null ? m.durationSec : 0;
        double inSpan = blend ? outSpan * (m.glide != null && m.glide.q > 0 ? 1 / m.glide.q : m.rate / m.outRate) : outSpan;
        double dur = outDur > 0 ? outDur : 0;
        double lo = Math.max(0, earliest > 0 ? earliest : 0) + (blend && m.rampSongSec > 0 ? m.rampSongSec : 0);
        double hi = dur - 0.3 - outSpan;
        return new double[]{lo, Math.max(lo, hi), 0, Math.max(0, (inDur > 0 ? inDur : 0) - 0.3 - inSpan)};
    }

    static Analysis musicEnd(Analysis a) {
        double end = a.contentEndSec;
        if (!(end > 0) || end >= a.durationSec - 1) return a;
        Analysis o = a.copy();
        o.durationSec = Math.max(end, a.durationSec - 20);
        return o;
    }

    static double capIncomingSkip(Analysis next, Grid toGrid, double mixIn) {
        double cap = next.durationSec > 0 ? next.durationSec * MAX_IN_SKIP : Double.POSITIVE_INFINITY;
        if (mixIn <= cap) return mixIn;
        return Math.max(toGrid.downbeatSec, mixIn - Math.ceil((mixIn - cap) / toGrid.barSec) * toGrid.barSec);
    }

    /** Sung or not at song second t: 1/0 from lyric spans, else the mask; NaN where neither knows. */
    static double vocalAt(Analysis a, double t, double[][] spans) {
        if (spans != null) {
            for (double[] x : spans) if (t >= x[0] && t < x[1]) return 1;
            return 0;
        }
        for (Analysis.VocalWindow w : a.vocals) {
            long i = Math.round((t - w.startSec) * w.fps);
            if (i >= 0 && i < w.curve.length) return w.curve[(int) i];
        }
        return Double.NaN;
    }

    /** The share of the blend where both sing; NaN when the sources cover under half of it. */
    static double vocalOverlap(Analysis cur, Analysis next, double mixOut, double outSpan, double mixIn, double inPerOut, Sung sung) {
        int both = 0, n = 0, steps = 0;
        for (double t = mixOut; t < mixOut + outSpan; t += 0.05) {
            steps++;
            double a = vocalAt(cur, t, sung.out), b = vocalAt(next, mixIn + (t - mixOut) * inPerOut, sung.in);
            if (Double.isNaN(a) || Double.isNaN(b)) continue;
            n++;
            if (a >= VOCAL_SUNG && b >= VOCAL_SUNG) both++;
        }
        return steps > 0 && n >= steps * 0.5 ? both / (double) n : Double.NaN;
    }

    static final class Reroute {
        double mixOut, mixIn, clash;
        String rerouted, by;
    }

    static Reroute rerouteForVocals(Analysis cur, Analysis next, Grid fromGrid, Grid toGrid, double mixOut, double mixIn,
                                    double outSpan, double inPerOut, double earliestOut, Sung sung) {
        String by = (sung.out != null ? "lyrics" : "mask") + "/" + (sung.in != null ? "lyrics" : "mask");
        double primary = vocalOverlap(cur, next, mixOut, outSpan, mixIn, inPerOut, sung);
        Reroute keep = new Reroute();
        keep.mixOut = mixOut;
        keep.mixIn = mixIn;
        keep.clash = Double.isNaN(primary) ? 0 : primary;
        keep.by = by;
        if (Double.isNaN(primary) || primary <= REROUTE_OVERLAP) return keep;
        double inCap = next.durationSec > 0 ? next.durationSec * MAX_IN_SKIP : Double.POSITIVE_INFINITY;
        double bestO = Double.NaN, bestCost = 0, bestMo = 0, bestMi = 0;
        int bestK = 0, bestJ = 0;
        for (int k = 0; k * fromGrid.barSec <= MAX_DISCARD_SEC; k++) {
            for (int j : ENTRY_SHIFTS) {
                if (k == 0 && j == 0) continue;
                double mi = mixIn + j * toGrid.barSec;
                if (mi < toGrid.downbeatSec - 1e-6 || mi > inCap) continue;
                double mo = mixOut - k * fromGrid.barSec;
                double o = vocalOverlap(cur, next, mo, outSpan, mi, inPerOut, sung);
                if (Double.isNaN(o)) continue;
                if (mo < earliestOut) continue;
                double cost = k + Math.abs(j) / 2.0;
                if (Double.isNaN(bestO) || o < bestO - 1e-9 || (Math.abs(o - bestO) < 1e-9 && cost < bestCost)) {
                    bestO = o;
                    bestCost = cost;
                    bestMo = mo;
                    bestMi = mi;
                    bestK = k;
                    bestJ = j;
                }
            }
        }
        if (Double.isNaN(bestO) || bestO > primary * REROUTE_GAIN) {
            keep.rerouted = "both sing " + pct(primary) + " of it, no cleaner point";
            return keep;
        }
        Reroute r = new Reroute();
        r.mixOut = bestMo;
        r.mixIn = bestMi;
        r.clash = bestO;
        r.by = by;
        r.rerouted = "both sang " + pct(primary) + " of it, moved to " + pct(bestO) + " (exit " + bestK + " bars earlier, cue "
                + (bestJ >= 0 ? "+" : "") + bestJ + " bars)";
        return r;
    }

    private static String pct(double x) {
        return Math.round(x * 100) + "%";
    }

    /** AutoMix's fallback: a plain 12 s equal-power fade that ends with the song. */
    static Plan fallback(Analysis cur, Analysis next, double earliest, String reason) {
        double picked = pinnedSec(cur);   // a length picked: the crossfade runs it
        double len = Double.isNaN(picked) ? FALLBACK_SEC : picked;
        double target = cur.durationSec - 0.3 - len;
        double mixOut = Math.max(earliest, target);
        double dur = Math.max(0, Math.min(len, cur.durationSec - 0.3 - mixOut));
        Plan p = new Plan();
        p.style = "crossfade";
        p.fallback = true;
        p.reason = reason;
        p.mixOutTrackTime = mixOut;
        p.durationSec = dur;
        p.mixInTrackTime = Double.isNaN(next.introEndSec) ? 0 : next.introEndSec;
        p.rate = 1;
        p.bars = 0;
        p.swapDb = 0;
        p.barSec = 0;
        return p;
    }

    public static boolean gridOk(Analysis a) {
        return gridOf(a) != null && a.gridConfidence >= MIN_GRID_CONFIDENCE;
    }

    // ───────── Automix v2 (version 3): Orchard's rules, automix.js `version === 3` ─────────
    static final double V2_MAX_STRETCH = 0.08, V2_MAX_CONSTANT = 0.04;
    static final double V2_SUB_BASS_VETO = 0.9;
    public static final double V2_SWITCH_SEC = 1.5;
    static final double SWAP_SINGING = 0.5, SWAP_CLEAR = 0.3;
    static final double V2_CLASH_MAX = 0.3;
    /** The curator blend: 8 bars from the downbeat nearest 31 s before the music ends, songs of 2 min or more. */
    static final int CURATOR_BARS = 8;
    static final double CURATOR_LEAD_SEC = 31, CURATOR_MIN_SONG_SEC = 120;
    static final int DROP_IN_BARS = 2;
    static final int MUFFLE_LEAD_BEATS = 8, MUFFLE_MIN_LEAD_BEATS = 4, MUFFLE_EXIT_BEATS = 2;
    static final double MUFFLE_MIN_BODY = 0.3, MUFFLE_MIN_OPENING_SEC = 2;
    static final double BRIDGE_MIN_SEC = 4, BRIDGE_MAX_SEC = 12, BRIDGE_MAX_SKIP_SEC = 16, BEATLESS = 0.3;
    static final double TRUSTED_KEY = 0.65;
    static final double CLASH_CORRELATION = -0.3, CLASH_CONFIDENCE = 0.5, KEY_CONTEXT_SEC = 24;
    static final double TRIM_TOLERANCE_DB = 1, TRIM_MAX_DB = 6;
    static final double LOOP_MARGIN = 0.02;

    /** The speed-up a pair needs, however it is split. */
    static double stretchOf(double ratio) {
        return Math.max(ratio, 1 / ratio) - 1;
    }

    /** A glide as the plan states it: the folded tempo ratio (next / playing), its beats, the playing song's beat. */
    public static final class Glide {
        public final double q, beatOutSec;
        public final int beats;

        Glide(double q, int beats, double beatOutSec) {
            this.q = q;
            this.beats = beats;
            this.beatOutSec = beatOutSec;
        }
    }

    /** glideSteps: each beat's rate on both songs, its output length and start, the next song's beat. */
    public static final class GlideSteps {
        public double[] outRate, inRate, dur, at;
        public double total, beatInSec;
    }

    /**
     * Orchard's glide, one step per beat of the blend: the shared tempo moves geometrically from the
     * playing song's to the next one's; beat k plays the playing song at q^x and the next at
     * q^(x - 1), x = (k + 0.5) / beats, so both play one beat of their own in the same output time.
     */
    public static GlideSteps glideSteps(double q, int beats, double beatOutSec) {
        GlideSteps g = new GlideSteps();
        g.outRate = new double[beats];
        g.inRate = new double[beats];
        g.dur = new double[beats];
        g.at = new double[beats];
        double t = 0;
        for (int k = 0; k < beats; k++) {
            double x = (k + 0.5) / beats;
            g.outRate[k] = Math.pow(q, x);
            g.inRate[k] = Math.pow(q, x - 1);
            g.at[k] = t;
            g.dur[k] = beatOutSec / g.outRate[k];
            t += g.dur[k];
        }
        g.total = t;
        g.beatInSec = beatOutSec / q;
        return g;
    }

    /** The two songs' sub-bass ratios apart, or NaN. */
    static double subBassContrast(Analysis a, Analysis b) {
        if (a == null || b == null || Double.isNaN(a.subBassRatio) || Double.isNaN(b.subBassRatio)) return Double.NaN;
        return Math.abs(a.subBassRatio - b.subBassRatio);
    }

    // keys (Orchard pairTempoHarmony)
    public static final class Harmonic {
        public double score, confidence, keyScore = Double.NaN, chromaScore = Double.NaN;
        public boolean severeClash, shortBlend;
    }

    private static final String[] KEY_NAMES = {"C", "B#", "C#", "DB", "D", "D#", "EB", "E", "FB", "F", "E#", "F#", "GB", "G", "G#", "AB", "A", "A#", "BB", "B", "CB"};
    private static final int[] KEY_ROOTS = {0, 0, 1, 1, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 8, 8, 9, 10, 10, 11, 11};

    /** {root, minor ? 1 : 0}, or null. */
    static int[] parsedKey(String name) {
        if (name == null) return null;
        java.util.regex.Matcher m = java.util.regex.Pattern.compile("^(\\S+)\\s+(major|minor)$", java.util.regex.Pattern.CASE_INSENSITIVE).matcher(name.trim());
        if (!m.matches()) return null;
        String root = m.group(1).toUpperCase(Locale.ROOT).replaceFirst("♯", "#").replaceFirst("♭", "B");
        for (int i = 0; i < KEY_NAMES.length; i++) if (KEY_NAMES[i].equals(root)) return new int[]{KEY_ROOTS[i], m.group(2).equalsIgnoreCase("minor") ? 1 : 0};
        return null;
    }

    static double keyRelationship(int[] a, int[] b) {
        if (a == null || b == null) return Double.NaN;
        int cw = (b[0] - a[0] + 12) % 12, d = Math.min(cw, 12 - cw);
        if (a[1] != b[1]) {
            if ((a[1] == 0 && cw == 9) || (a[1] == 1 && cw == 3)) return 0.95;
            return d == 0 ? 0.7 : d == 5 ? 0.55 : d == 6 ? 0.05 : 0.35;
        }
        return d == 0 ? 1 : d == 5 ? 0.85 : d == 2 ? 0.65 : d == 1 ? 0.3 : d == 6 ? 0 : 0.45;
    }

    static double cosine(double[] a, double[] b) {
        if (a == null || a.length != 12 || b == null || b.length != 12) return Double.NaN;
        double dot = 0, pa = 0, pb = 0;
        for (int k = 0; k < 12; k++) {
            dot += a[k] * b[k];
            pa += a[k] * a[k];
            pb += b[k] * b[k];
        }
        return pa > 0 && pb > 0 ? clamp(dot / Math.sqrt(pa * pb), 0, 1) : Double.NaN;
    }

    /** The keys on Orchard's table (0.7) and the whole-song pitch profiles (0.3); severe under 0.2, short under 0.55. */
    static Harmonic harmonicEvidence(Analysis a, Analysis b) {
        double keyScore = keyRelationship(parsedKey(a.keyName), parsedKey(b.keyName));
        double chromaScore = cosine(a.chroma, b.chroma);
        double score = !Double.isNaN(keyScore) && !Double.isNaN(chromaScore) ? keyScore * 0.7 + chromaScore * 0.3
                : !Double.isNaN(keyScore) ? keyScore : !Double.isNaN(chromaScore) ? chromaScore : 0.5;
        double confidence = Math.sqrt(clamp(a.keyConfidence, 0, 1) * clamp(b.keyConfidence, 0, 1));
        Harmonic h = new Harmonic();
        h.score = r3(score);
        h.confidence = r3(confidence);
        h.keyScore = r3(keyScore);
        h.chromaScore = r3(chromaScore);
        h.severeClash = confidence >= TRUSTED_KEY && score < 0.2;
        h.shortBlend = confidence >= TRUSTED_KEY && score < 0.55;
        return h;
    }

    /** {profile[12], mean weight} over [from, to], or null. */
    static double[][] chromaProfile(Analysis a, double from, double to) {
        Analysis.ChromaCurve c = a == null ? null : a.chromaCurve;
        if (c == null || c.values.length == 0 || !(to >= from)) return null;
        double[] profile = new double[12];
        double weight = 0;
        int frames = 0;
        for (int i = 0; i < c.values.length; i++) {
            double t = c.start + i * c.step;
            double[] f = c.values[i];
            if (t < from || t > to || f == null) continue;
            for (int k = 0; k < 12; k++) profile[k] += f[k] * c.weights[i];
            weight += c.weights[i];
            frames++;
        }
        return frames > 0 ? new double[][]{profile, {weight / frames}} : null;
    }

    static double pearson(double[] a, double[] b) {
        double ma = 0, mb = 0;
        for (double v : a) ma += v;
        for (double v : b) mb += v;
        ma /= a.length;
        mb /= b.length;
        double cov = 0, pa = 0, pb = 0;
        for (int k = 0; k < a.length; k++) {
            cov += (a[k] - ma) * (b[k] - mb);
            pa += (a[k] - ma) * (a[k] - ma);
            pb += (b[k] - mb) * (b[k] - mb);
        }
        return pa > 0 && pb > 0 ? cov / Math.sqrt(pa * pb) : 0;
    }

    static double tonality(double[][] side) {
        double total = 0, max = Double.NEGATIVE_INFINITY;
        for (double v : side[0]) {
            total += v;
            max = Math.max(max, v);
        }
        if (!(total > 0)) return 0;
        return clamp((max / (total / 12) - 1.3) / 0.4, 0, 1) * clamp(side[1][0], 0, 1);
    }

    /** Where the two songs meet: {correlation, confidence, severe ? 1 : 0}, or null (no chroma). */
    static double[] overlapHarmony(Analysis cur, Analysis next, double outFrom, double outTo, double inFrom, double inTo) {
        double[][] left = chromaProfile(cur, Math.min(outFrom, outTo - KEY_CONTEXT_SEC), outTo);
        double[][] right = chromaProfile(next, inFrom, Math.max(inTo, inFrom + KEY_CONTEXT_SEC));
        if (left == null || right == null) return null;
        double confidence = Math.min(tonality(left), tonality(right)), correlation = pearson(left[0], right[0]);
        return new double[]{r3(correlation), r3(confidence), correlation <= CLASH_CORRELATION && confidence >= CLASH_CONFIDENCE ? 1 : 0};
    }

    // loudness (Orchard loudness.rs, strategy.rs loudness_trim)
    public static final class Trim {
        public double diffDb, outDb, inDb;

        Trim(double diffDb, double outDb, double inDb) {
            this.diffDb = diffDb;
            this.outDb = outDb;
            this.inDb = inDb;
        }
    }

    /** A region's EBU R128 gated loudness from the song's 100 ms levels, or NaN. */
    static double regionLoudness(Analysis a, double from, double dur) {
        Analysis.Curve c = a == null ? null : a.loudnessCurve;
        if (c == null || c.values.length == 0 || !(dur > 0)) return Double.NaN;
        int i0 = (int) Math.max(0, Math.round((from - c.start) / c.step));
        int i1 = (int) Math.min(c.values.length, Math.round((from + dur - c.start) / c.step));
        if (i1 <= i0) return Double.NaN;
        double[] p = new double[i1 - i0];
        for (int i = i0; i < i1; i++) p[i - i0] = Math.pow(10, c.values[i] / 10);
        List<Double> loud = new ArrayList<>();
        for (int i = 0; i + 4 <= p.length; i++) {
            double x = (p[i] + p[i + 1] + p[i + 2] + p[i + 3]) / 4;
            if (lufs(x) > -70) loud.add(x);
        }
        if (loud.isEmpty()) {
            double s = 0;
            for (double v : p) s += v;
            return Math.max(-70, lufs(s / p.length));
        }
        double s = 0;
        for (double x : loud) s += x;
        double rel = lufs(s / loud.size()) - 10;
        double t = 0;
        int n = 0;
        for (double x : loud) {
            if (lufs(x) > rel) {
                t += x;
                n++;
            }
        }
        return lufs(t / n);
    }

    private static double lufs(double x) {
        return -0.691 + 10 * Math.log10(x + 1e-30);
    }

    /** The whole song's loudness (regionLoudness over it), once per curve and length: the trim reads it every tick. */
    static double wholeLoudness(Analysis a) {
        if (a == null || a.loudnessCurve == null) return regionLoudness(a, 0, a == null ? 0 : a.durationSec);
        List<Object> key = Arrays.asList(a.loudnessCurve, a.durationSec);
        Double hit = WHOLE_LOUDNESS.get(key);
        if (hit == null) WHOLE_LOUDNESS.put(key, hit = regionLoudness(a, 0, a.durationSec));
        return hit;
    }

    /** Each region against its whole song; more than 1 dB apart, the louder side is trimmed (at most 6 dB). */
    static Trim loudnessTrim(Analysis cur, double outFrom, double outDur, Analysis next, double inFrom, double inDur) {
        double o = regionLoudness(cur, outFrom, outDur), i = regionLoudness(next, inFrom, inDur);
        double ow = wholeLoudness(cur), iw = wholeLoudness(next);
        if (Double.isNaN(o) || Double.isNaN(i) || Double.isNaN(ow) || Double.isNaN(iw)) return null;
        double diff = (o - ow) - (i - iw);
        if (Math.abs(diff) <= TRIM_TOLERANCE_DB) return new Trim(r1(diff), 0, 0);
        double t = r1(Math.min(Math.abs(diff), TRIM_MAX_DB));
        return diff > 0 ? new Trim(r1(diff), -t, 0) : new Trim(r1(diff), 0, -t);
    }

    // ───────── Automix v2: where the blend sits (versions.md "Where the blend sits") ─────────
    // Orchard pairTransitionEvidence + track.rs, Prism SongShape.outroStartMs (automix.js anchoredMixOut)
    static final double ANCHOR_SEARCH_SEC = 60, ANCHOR_SEARCH_SHARE = 0.4, ANCHOR_SIDE_SEC = 2, ANCHOR_STEP_SEC = 0.5;
    static final double NOVELTY_MIN = 0.14, NOVELTY_MERGE_SEC = 4, AUDIBLE_SHARE = 0.1;
    static final double OUTRO_BELOW = 0.6, OUTRO_MIN_SEC = 6, OUTRO_NOT_BEFORE = 0.6, OUTRO_MAX_EARLY_SEC = 20;

    private static double anchorSource(String kind) {
        return kind.equals("change") || kind.equals("outro") ? 4 : kind.equals("end") ? 3 : 2;
    }

    /** The loudness curve as amplitude, mean over [from, to); NaN: none there. */
    static double ampMean(Analysis a, double from, double to) {
        Analysis.Curve c = a == null ? null : a.loudnessCurve;
        if (c == null || c.values == null || c.values.length == 0) return Double.NaN;
        int i0 = (int) Math.max(0, Math.floor((from - c.start) / c.step));
        int i1 = (int) Math.min(c.values.length, Math.ceil((to - c.start) / c.step));
        if (i1 <= i0) return Double.NaN;
        double s = 0;
        for (int i = i0; i < i1; i++) s += Math.pow(10, c.values[i] / 20);
        return s / (i1 - i0);
    }

    private static double or0(double x) {
        return Double.isNaN(x) ? 0 : x;
    }

    /** The song's 85th-percentile second (amplitude): its usual level; NaN: none. */
    static double usualLevel(Analysis a) {
        List<Double> xs = new ArrayList<>();
        for (double t = 0; t + 1 <= a.durationSec; t += 1) {
            double v = ampMean(a, t, t + 1);
            if (!Double.isNaN(v)) xs.add(v);
        }
        if (xs.isEmpty()) return Double.NaN;
        Collections.sort(xs);
        return xs.get(Math.min(xs.size() - 1, (int) Math.floor(xs.size() * 0.85)));
    }

    private static double meanOf(double[] xs, int from, int to) {
        double s = 0;
        for (int i = from; i < to; i++) s += xs[i];
        return s / (to - from);
    }

    private static final class Cand {
        final String kind;
        final double sec, end, conf, stab;
        /** 1 - its sung risk over the 1.5 s before its end (0.35: unknown). */
        double clean;

        Cand(String kind, double sec, double end, double conf, double stab) {
            this.kind = kind;
            this.sec = sec;
            this.end = end;
            this.conf = conf;
            this.stab = stab;
        }
    }

    /**
     * Candidates over the playing song's last min(60 s, 40%), each a mix-out on its end grid
     * [g] for a blend of [span] song seconds starting no earlier than [lo], scored as Orchard
     * does; null when none fits (the natural point then).
     */
    static Anchor anchoredMixOut(Analysis cur, Grid g, double span, double lo, double[][] sung) {
        // the song's walks once per song, grid, span and spans (they don't move with lo); only lo moves each tick
        List<Object> key = Arrays.asList(cur.loudnessCurve, cur.bassCurve, cur.vocals, cur.durationSec, cur.contentEndSec,
                cur.gridConfidence, g.downbeatSec, g.beatSec, g.barSec, g.phraseSec, span, new Deep(sung));
        AnchorCands ac = ANCHOR_CANDS.get(key);
        if (ac == null) ANCHOR_CANDS.put(key, ac = anchorCands(cur, g, span, sung));
        if (ac.cands == null) return null;
        Anchor best = null;
        for (Cand c : ac.cands) {
            double start = c.end - span, cut = Math.max(0, ac.keepUntil - c.end);
            if (start < lo - 1e-6 || start < ac.dur / 2 || c.end > ac.audible + 1e-6 || c.end > ac.dur - 0.3 || cut > MAX_DISCARD_SEC) continue;
            double score = anchorSource(c.kind) / 4 * 0.2 + c.conf * 0.55 + c.stab * 0.15 + c.clean * 0.1 - cut / MAX_DISCARD_SEC * 0.15;
            if (best == null || score > best.score + 1e-9) {
                best = new Anchor();
                best.kind = c.kind;
                best.sec = Math.round(c.sec * 1000) / 1000.0;
                best.mixOut = start;
                best.score = Math.round(score * 1000) / 1000.0;
            }
        }
        return best;
    }

    /** The anchor search's candidates (null: no curves to search), with what a tick's choice reads. */
    static final class AnchorCands {
        List<Cand> cands;
        double audible, keepUntil, dur;
    }

    private static AnchorCands anchorCands(Analysis cur, Grid g, double span, double[][] sung) {
        AnchorCands out = new AnchorCands();
        if (cur.loudnessCurve == null || cur.loudnessCurve.values == null || cur.loudnessCurve.values.length == 0
                || cur.bassCurve == null || cur.bassCurve.values == null || cur.bassCurve.values.length == 0) return out;
        double level = usualLevel(cur);
        if (!(level > 0)) return out;
        double dur = cur.durationSec;
        // the audible end: the last half second at a tenth of the usual level, within the music
        double audible = Math.min(musicEnd(cur).durationSec, dur - 0.3);
        while (audible > dur / 2 && or0(ampMean(cur, audible - ANCHOR_STEP_SEC, audible)) < AUDIBLE_SHARE * level) audible -= ANCHOR_STEP_SEC;
        double from = Math.max(dur / 2, audible - Math.min(ANCHOR_SEARCH_SEC, ANCHOR_SEARCH_SHARE * dur));
        java.util.function.DoubleBinaryOperator E = (x, y) -> Math.min(1.5, or0(ampMean(cur, x, y)) / level);
        java.util.function.DoubleBinaryOperator L = (x, y) -> Math.min(1.5, or0(bassMean(cur, x, y)));
        java.util.function.DoubleBinaryOperator V = (x, y) -> or0(voiceRisk(cur, x, y, sung));
        // how steady the energy is over [x, x + 2 s): 1 - 2 x its spread in half seconds
        java.util.function.DoubleUnaryOperator steady = (x) -> {
            double[] e = new double[4];
            for (int k = 0; k < 4; k++) e[k] = E.applyAsDouble(x + k * 0.5, x + k * 0.5 + 0.5);
            double m = meanOf(e, 0, 4), v = 0;
            for (double y : e) v += (y - m) * (y - m);
            return clamp(1 - 2 * Math.sqrt(v / 4), 0, 1);
        };
        double grid = clamp(Double.isNaN(cur.gridConfidence) ? 0 : cur.gridConfidence, 0, 1);
        List<Cand> cands = new ArrayList<>();
        // a section change: Orchard's novelty (energy 0.55, low end 0.25, voice 0.2), the 2 s after against the 2 s before
        List<double[]> frames = new ArrayList<>();
        for (double t = from + ANCHOR_SIDE_SEC; t <= audible - ANCHOR_SIDE_SEC; t += ANCHOR_STEP_SEC) {
            double a0 = t - ANCHOR_SIDE_SEC, b1 = t + ANCHOR_SIDE_SEC;
            double n = Math.abs(E.applyAsDouble(t, b1) - E.applyAsDouble(a0, t)) / 1.5 * 0.55
                    + Math.abs(L.applyAsDouble(t, b1) - L.applyAsDouble(a0, t)) / 1.5 * 0.25
                    + Math.abs(V.applyAsDouble(t, b1) - V.applyAsDouble(a0, t)) * 0.2;
            frames.add(new double[]{t, clamp(n, 0, 1)});
        }
        List<double[]> peaks = new ArrayList<>();
        for (int i = 1; i < frames.size() - 1; i++) {
            double[] f = frames.get(i);
            if (f[1] < NOVELTY_MIN || f[1] < frames.get(i - 1)[1] || f[1] < frames.get(i + 1)[1]) continue;
            double[] last = peaks.isEmpty() ? null : peaks.get(peaks.size() - 1);
            if (last != null && f[0] - last[0] < NOVELTY_MERGE_SEC) {
                if (f[1] > last[1]) peaks.set(peaks.size() - 1, f);
                continue;
            }
            peaks.add(f);
        }
        for (double[] p : peaks) {
            double end = g.downbeatSec + Math.round((p[0] - g.downbeatSec) / g.barSec) * g.barSec;
            double stab = Math.max(steady.applyAsDouble(p[0] - ANCHOR_SIDE_SEC), steady.applyAsDouble(p[0]));
            cands.add(new Cand("change", end, end, clamp(p[1] * 0.65 + grid * 0.2 + stab * 0.15, 0, 1), stab));
        }
        // the outro (Prism's finding): energy over 3 s under 0.6 of the body's median to the end, 6 s or
        // more; the blend ENDS on the phrase that opens it (else the first beat in it), so the next song
        // is in by the time the playing one drops. Its music doesn't count as cut.
        List<Double> sl = new ArrayList<>();
        for (double t = 0; t + 1 <= audible; t += 1) sl.add(or0(ampMean(cur, t, t + 1)));
        double[] secs = new double[sl.size()];
        for (int i = 0; i < secs.length; i++) secs[i] = sl.get(i);
        double keepUntil = audible;   // the music a blend ending early cuts: up to the outro
        if (secs.length > 0) {
            double[] sorted = secs.clone();
            Arrays.sort(sorted);
            double body = sorted[secs.length / 2];
            int o = secs.length - 1;
            while (o >= 0 && meanOf(secs, Math.max(0, o - 1), Math.min(secs.length, o + 2)) < OUTRO_BELOW * body) o--;
            o++;
            if (body > 0 && secs.length - o >= OUTRO_MIN_SEC && o >= OUTRO_NOT_BEFORE * dur && o >= audible - OUTRO_MAX_EARLY_SEC) {
                double phrase = g.downbeatSec + Math.floor((o + 2 * g.beatSec - g.downbeatSec) / g.phraseSec) * g.phraseSec;
                double start = o - phrase <= g.barSec ? phrase : g.downbeatSec + Math.ceil((o - g.downbeatSec) / g.beatSec) * g.beatSec;
                double drop = 1 - meanOf(secs, o, secs.length) / body, stab = steady.applyAsDouble(start);
                cands.add(new Cand("outro", start, start, clamp(drop * 0.65 + grid * 0.2 + stab * 0.15, 0, 1), stab));
                keepUntil = Math.min(audible, start);
            }
        }
        // the end of the music (today's point), and each downbeat in the search as Orchard's downbeat evidence
        double natural = naturalMixOut(g, musicEnd(cur), span) + span;
        cands.add(new Cand("end", natural, natural, 0.5, steady.applyAsDouble(natural - ANCHOR_SIDE_SEC)));
        for (double t = g.downbeatSec + Math.ceil((from - g.downbeatSec) / g.barSec) * g.barSec; t <= audible; t += g.barSec) {
            double stab = steady.applyAsDouble(t - ANCHOR_SIDE_SEC);
            cands.add(new Cand("downbeat", t, t, Math.min(0.6, grid * 0.35 + stab * 0.35 + (1 - V.applyAsDouble(t - 1, t + 1)) * 0.3), stab));
        }
        // what each candidate is, whatever the tick: its sung risk at the hand-over
        for (Cand c : cands) {
            double risk = voiceRisk(cur, c.end - 1.5, c.end, sung);
            c.clean = Double.isNaN(risk) ? 0.35 : 1 - risk;
        }
        out.cands = cands;
        out.audible = audible;
        out.keepUntil = keepUntil;
        out.dur = dur;
        return out;
    }

    /**
     * Automix v2, a pair too far apart in tempo to beatmatch (versions.md "Tempo too far apart"):
     * the beatless bridge, else a filter mix at an anchor, else (both would sing over the filter
     * mix) an echo out at one, else the hand-over.
     */
    static Plan unmatchedMix(Settings s, Analysis cur, Analysis next, Grid fromGrid, Grid toGrid, double pos, double earliest, String why, Sung sung, boolean speeds) {
        double[] b = new double[3];
        if (beatlessBridge(cur, next, sung, b) == null && b[0] >= earliest) return handoff(cur, next, earliest, why, sung);
        double lo = Math.max(earliest, pos);
        String avoid = avoidedMove();
        Plan f = filterMix(s, cur, next, fromGrid, toGrid, requestedBars(s, cur, next, fromGrid, toGrid.downbeatSec, true), pos, earliest,
                why + ": a filter mix (no beat match)", sung, lo);
        if ("filter".equals(f.style) && f.clash <= V2_CLASH_MAX && !"filter".equals(avoid)) return f;
        String sang = !"filter".equals(f.style) ? "" : "filter".equals(avoid) ? ", a filter mix the last two times"
                : f.clash > V2_CLASH_MAX ? ", both would sing " + Math.round(f.clash * 100) + "% of a filter mix" : "";
        // playlist speeds (spotify-mixes.md rule 10): no echo out, a blend at x1 that would not keep B
        // at speedIn through the mix (BitChord audit 1a #1)
        Plan e = "echo".equals(avoid) || speeds ? null : echoOut(cur, next, fromGrid, toGrid, lo, why + sang + ": an echo out (no beat match)", sung);
        // (the reason as spotify-mixes.md rule 10 and automix.js word it)
        return e != null ? e : handoff(cur, next, earliest, why + sang + ", and no " + ("echo".equals(avoid) ? "third echo out in a row or " : "")
                + "filter mix" + (speeds ? " (no echo out at a playlist speed)" : " or echo out") + " fits", sung);
    }

    // ---------------------------------------------------------------------------------------------
    // the adlib outro (versions.md "Adlib outro", Orchard transitionFlow.js singsOut)

    static final double SINGS_OUT_TAIL_SEC = 4, LINE_PAUSE_SEC = 2;

    /**
     * From [time] to the music's end the voice never pauses 2 s for a line to finish, while the beat
     * is gone over the last 4 s (beat presence under 0.5 at 2 s and at 0.5 s before the end). Any
     * exit cuts such a voice, the song's own end included, so an exit may cut it.
     */
    static boolean singsOut(Analysis a, double time, double[][] spans) {
        double end = Math.min(musicEnd(a).durationSec, a.durationSec - 0.3);
        if (!(end - time >= SINGS_OUT_TAIL_SEC)) return false;
        double closing = beatPresence(a, end - SINGS_OUT_TAIL_SEC / 2), last = beatPresence(a, end - 0.5);
        if (Double.isNaN(closing) || closing >= 0.5 || (Double.isNaN(last) ? 1 : last) >= 0.5) return false;
        double pause = 0;
        for (double at = time; at < end - 1; at += 0.25) {
            double r = voiceRisk(a, at, at + 0.5, spans);
            if (Double.isNaN(r)) return false;
            pause = r < 0.3 ? pause + 0.25 : 0;
            if (pause >= LINE_PAUSE_SEC) return false;
        }
        return true;
    }

    // ---------------------------------------------------------------------------------------------
    // no effect three times in a row (versions.md, Prism MixMoves.pick)

    static final int RECENT_MOVES = 16;
    static final List<String> EFFECT_MOVES = java.util.Arrays.asList("filter", "echo", "dropin", "muffle");
    private static final List<String> recentMoves = new ArrayList<>();

    /** A mix's move: its shape (filter mix, echo out, drop-in, muffle, loop, blend, bridge, hand-over) or crossfade. */
    static String moveOf(Plan p) {
        if (p == null) return null;
        if ("filter".equals(p.style)) return "filter";
        if ("loop".equals(p.style)) return "loop";
        if ("blend".equals(p.style)) return p.shape != null ? p.shape : "blend";
        return "crossfade";
    }

    /** A mix heard (at its hand-over; one aborted before doesn't count): kept in order, the last 16. */
    public static synchronized void heard(String move) {
        if (move == null) return;
        recentMoves.add(move);
        while (recentMoves.size() > RECENT_MOVES) recentMoves.remove(0);
    }

    /**
     * A mix that ended: counted only once it played to its real end (versions.md "No effect three
     * times running" rule 1, audit 2026-11-24). Armed, called off, or aborted after its hand-over: not heard.
     */
    static void ended(String move, boolean ok, boolean handedOver) {
        if (ok && handedOver) heard(move);
    }

    public static void heard(Plan p) {
        heard(moveOf(p));
    }

    static synchronized List<String> recentMoves() {
        return new ArrayList<>(recentMoves);
    }

    static synchronized void forgetMoves() {
        recentMoves.clear();
    }

    /** The effect move heard the last two times (skipped for the next mix), or null. */
    static synchronized String avoidedMove() {
        int n = recentMoves.size();
        String m = n > 0 ? recentMoves.get(n - 1) : null;
        return n >= 2 && EFFECT_MOVES.contains(m) && m.equals(recentMoves.get(n - 2)) ? m : null;
    }

    // ---------------------------------------------------------------------------------------------
    // where a song is sung (versions.md "Where a song is sung")

    /** A synced line's shape, without its text: seconds; end NaN when the provider gives none; wordTimes null when untimed. */
    public static final class LineShape {
        public final double start, end;
        public final int words;
        public final double[][] wordTimes;
        /** A credit or tag line, not sung (creditLine): the loop mix doesn't count it. */
        public final boolean credit;

        public LineShape(double start, double end, int words, double[][] wordTimes) {
            this(start, end, words, wordTimes, false);
        }

        public LineShape(double start, double end, int words, double[][] wordTimes, boolean credit) {
            this.start = start;
            this.end = end;
            this.words = words;
            this.wordTimes = wordTimes;
            this.credit = credit;
        }
    }

    // versions.md "The loop mix's baseline" rule 6: a credit word followed by ":", "：", " - " or "by"; or any line opening "prod. "
    private static final Pattern CREDIT = Pattern.compile(
            "^\\s*[\\[(]?\\s*(?:(?:作词|作詞|作曲|编曲|編曲|词|詞|曲|制作人|製作人|监制|監製|混音|母带|母帶|和声|和聲|录音|錄音|出品|发行|發行|"
                    + "letra|música|compositor(?:es)?|autor(?:es)?|lyrics?|lyricist|written|writers?|words|music|composed|composer|"
                    + "composition|arranged|arrangement|arranger|produced|producers?|prod\\.?|mixed|mixing|mastered|mastering|recorded|"
                    + "engineer(?:ed)?)(?:\\s*[:：]|\\s+-\\s|\\s+by\\b)|prod\\.\\s)",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);

    /**
     * A credit or tag line, not sung: its text is the song's title or artist (or both), a credit
     * ("作曲: …", "Letra: …", "Lyrics by …", "Prod. …", "Written by …"), or symbols only (♪, ...).
     */
    public static boolean creditLine(String text, String title, String artist) {
        if (text == null) return true;
        String t = text.trim();
        if (t.isEmpty() || !t.codePoints().anyMatch(Character::isLetterOrDigit)) return true;
        String n = norm(t);
        String ti = norm(title), ar = norm(artist);
        if (!n.isEmpty() && (n.equals(ti) || n.equals(ar) || n.equals(ar + ti) || n.equals(ti + ar))) return true;
        return CREDIT.matcher(t).find();
    }

    /** Letters and digits only, lower case, no accents: "Cris MJ - SI NO ES CONTIGO" and "cris mj si no es contigo" compare equal. */
    private static String norm(String s) {
        if (s == null) return "";
        StringBuilder b = new StringBuilder();
        String plain = Normalizer.normalize(s, Normalizer.Form.NFKD).replaceAll("\\p{M}+", "");
        plain.toLowerCase(Locale.ROOT).codePoints().filter(Character::isLetterOrDigit).forEach(b::appendCodePoint);
        return b.toString();
    }

    static final double LINE_WORD_SEC = 0.35, LINE_PAD_SEC = 0.5, LINE_MAX_SEC = 10, WORD_TAIL_SEC = 0.3, MASK_GAP = 0.3;

    /**
     * Where each line is sung (sorted by start). With word times: the first word's start to the last
     * word's end + 0.3 s. Without: the line's start to the earliest of the next line's start, the
     * start + its words x 0.35 s + 0.5 s, its own end when given, and 10 s.
     */
    public static double[][] sungSpansFromLines(List<LineShape> shapes) {
        List<double[]> spans = new ArrayList<>();
        for (int i = 0; i < shapes.size(); i++) {
            LineShape l = shapes.get(i);
            if (l.wordTimes != null && l.wordTimes.length > 0) {
                double a = Double.POSITIVE_INFINITY, b = Double.NEGATIVE_INFINITY;
                for (double[] w : l.wordTimes) {
                    a = Math.min(a, w[0]);
                    b = Math.max(b, w[1]);
                }
                spans.add(new double[]{a, b + WORD_TAIL_SEC});
                continue;
            }
            if (l.words <= 0) continue; // a line with no words is a gap (versions.md "Where a song is sung" rule 1)
            double next = Double.POSITIVE_INFINITY;
            for (int j = i + 1; j < shapes.size(); j++) {
                if (shapes.get(j).start > l.start) {
                    next = shapes.get(j).start;
                    break;
                }
            }
            double end = Math.min(Math.min(next, l.start + l.words * LINE_WORD_SEC + LINE_PAD_SEC),
                    Math.min(Double.isNaN(l.end) ? Double.POSITIVE_INFINITY : l.end, l.start + LINE_MAX_SEC));
            spans.add(new double[]{l.start, Math.max(end, l.start)});
        }
        return spans.toArray(new double[0][]);
    }

    static final double LOOP_LYRIC_LEAD_SEC = 0.15, LOOP_LYRIC_TAIL_SEC = 0.35;

    /**
     * The loop mix's sung spans, as the baseline reads lines (the extension's loopSpansFromLines,
     * d26dc16): each line padded 0.15 s before and 0.35 s after; a line with word times ends at its
     * last word, one without at its own end, else at the next line, 10 s at most.
     */
    public static double[][] loopSpansFromLines(List<LineShape> all) {
        // a credit or tag line (creditLine) or one before the song starts isn't sung: left out
        // before anything else, so a sung line never ends at one
        List<LineShape> shapes = new ArrayList<>();
        for (LineShape l : all) if (Double.isFinite(l.start) && l.start >= 0 && !l.credit) shapes.add(l);
        List<double[]> spans = new ArrayList<>();
        for (int i = 0; i < shapes.size(); i++) {
            LineShape l = shapes.get(i);
            double end;
            if (l.wordTimes != null && l.wordTimes.length > 0) {
                end = Double.NEGATIVE_INFINITY;
                for (double[] w : l.wordTimes) end = Math.max(end, w[1]);
            } else {
                double next = Double.NaN;
                for (int j = i + 1; j < shapes.size(); j++) {
                    if (shapes.get(j).start > l.start) {
                        next = shapes.get(j).start;
                        break;
                    }
                }
                double own = !Double.isNaN(l.end) ? l.end : !Double.isNaN(next) ? next : l.start + LINE_MAX_SEC;
                end = Math.min(l.start + LINE_MAX_SEC, own);
            }
            spans.add(new double[]{l.start - LOOP_LYRIC_LEAD_SEC, Math.max(end, l.start) + LOOP_LYRIC_TAIL_SEC});
        }
        return spans.toArray(new double[0][]);
    }

    /**
     * The mask still hears gaps: inside a sung span, a run of a beat or more (0.5 s without a grid)
     * with the vocal mask under 0.3 isn't sung. Spans that touch or overlap are joined first, so a
     * breath across a line change is one gap. Without a mask the spans stand.
     */
    public static double[][] carveSung(double[][] spans, Analysis a) {
        if (spans == null || a == null || a.vocals == null || a.vocals.isEmpty()) return spans;
        double beat = a.beatIntervalSec > 0 ? a.beatIntervalSec : 0.5;
        // planned every tick: cached on what it reads, not on the analysis (copied each plan)
        List<Object> key = Arrays.asList(new Deep(spans), a.vocals, beat);
        double[][] hit = CARVED.get(key);
        if (hit == null) CARVED.put(key, hit = carve(spans, a, beat));
        return Deep.copy(hit);
    }

    private static double[][] carve(double[][] spans, Analysis a, double beat) {
        double[][] sorted = spans.clone();
        java.util.Arrays.sort(sorted, (p, q) -> Double.compare(p[0], q[0]));
        List<double[]> runs = new ArrayList<>();
        for (double[] s : sorted) {
            double[] last = runs.isEmpty() ? null : runs.get(runs.size() - 1);
            if (last != null && s[0] <= last[1]) last[1] = Math.max(last[1], s[1]);
            else runs.add(new double[]{s[0], s[1]});
        }
        List<double[]> out = new ArrayList<>();
        for (double[] r : runs) {
            double x = r[0], y = r[1], from = x, gapAt = Double.NaN;
            // the same steps as automix.js (t += 0.02 from x)
            for (double t = x; t < y; t += 0.02) {
                double m = vocalAt(a, t, null);
                if (!Double.isNaN(m) && m < MASK_GAP) {
                    if (Double.isNaN(gapAt)) gapAt = t;
                    continue;
                }
                if (!Double.isNaN(gapAt) && t - gapAt >= beat) {
                    if (gapAt > from) out.add(new double[]{from, gapAt});
                    from = t;
                }
                gapAt = Double.NaN;
            }
            if (!Double.isNaN(gapAt) && y - gapAt >= beat) {
                if (gapAt > from) out.add(new double[]{from, gapAt});
            } else if (y > from) out.add(new double[]{from, y});
        }
        return out.toArray(new double[0][]);
    }

    // ───────── per-song walks the plan repeats every tick (Automix plans every 250 ms) ─────────
    // The extension's crackle (c42bb5f): a cache keyed on the analysis object missed every tick, as
    // the planner copies it (asOutgoing, musicEnd). These are keyed on the parts the walk reads
    // (curves, the vocal mask, sung spans and the grid), which the copies share.

    /** A few results by key, the least recently used dropped first. */
    static final class Memo<V> {
        private final java.util.LinkedHashMap<List<Object>, V> map = new java.util.LinkedHashMap<List<Object>, V>(16, 0.75f, true) {
            @Override
            protected boolean removeEldestEntry(java.util.Map.Entry<List<Object>, V> e) {
                return size() > 16;
            }
        };
        /** Walks done (a test reads it). */
        int misses;

        synchronized V get(List<Object> key) {
            return map.get(key);
        }

        synchronized void put(List<Object> key, V v) {
            misses++;
            map.put(key, v);
        }

        synchronized void clear() {
            map.clear();
            misses = 0;
        }
    }

    static final Memo<double[][]> CARVED = new Memo<>();
    static final Memo<Double> WHOLE_LOUDNESS = new Memo<>();
    static final Memo<AnchorCands> ANCHOR_CANDS = new Memo<>();

    /** Spans compared by their numbers (each plan may build them again). */
    static final class Deep {
        final double[][] x;

        Deep(double[][] x) {
            this.x = x;
        }

        @Override
        public boolean equals(Object o) {
            return o instanceof Deep && Arrays.deepEquals(x, ((Deep) o).x);
        }

        @Override
        public int hashCode() {
            return Arrays.deepHashCode(x);
        }

        static double[][] copy(double[][] x) {
            if (x == null) return null;
            double[][] c = new double[x.length][];
            for (int i = 0; i < x.length; i++) c[i] = x[i].clone();
            return c;
        }
    }

    /** Each side's spans carved by its own song's mask. */
    static Sung carved(Sung sung, Analysis cur, Analysis next) {
        Sung c = new Sung();
        if (sung == null) return c;
        c.out = carveSung(sung.out, cur);
        c.in = carveSung(sung.in, next);
        return c;
    }

    // Echo out (Prism MixMoves ECHO_OUT; editor.md §5)
    static final int ECHO_BEATS = 8;
    static final double ECHO_FEEDBACK = 0.53, ECHO_CUT_SEC = 0.01, ECHO_FIRST_BEAT_MAX_SEC = 10;

    /**
     * The beat before the catch (a bar line, at an anchor) is fed to a 1-beat delay with feedback
     * 0.53; the playing song's dry sound is cut on the catch in 10 ms and the next song comes in
     * there at full level on its first downbeat (its first 10 s; else from its start), at its own
     * speed, under 8 beats of echo. The repeated beat may not be sung; at most 12 s from the anchor.
     */
    static Plan echoOut(Analysis cur, Analysis next, Grid g, Grid toGrid, double lo, String reason, Sung sung) {
        int pinned = PINNED.get();
        int beats = pinned > 0 ? pinned * 4 : ECHO_BEATS;   // a length picked: the echo runs it
        double beat = g.beatSec, D = beats * beat;
        double end = Math.min(musicEnd(cur).durationSec, cur.durationSec - 0.3);
        Anchor a = anchoredMixOut(cur, g, beat, lo, sung.out);
        java.util.function.DoubleUnaryOperator bar = (t) -> g.downbeatSec + Math.floor((t - g.downbeatSec + 1e-6) / g.barSec) * g.barSec;
        double first = a != null ? bar.applyAsDouble(a.mixOut + beat) : bar.applyAsDouble(end - beat);
        // the anchor's bar, then the nearest bars either side (earlier first), within 12 s of it
        for (int j = 0; j <= 2 * (int) Math.floor(MAX_DISCARD_SEC / g.barSec); j++) {
            int k = j % 2 == 1 ? (j + 1) / 2 : -j / 2;   // 0, 1, -1, 2, -2, ...: k bars earlier
            double c = first - k * g.barSec;
            if (c - beat < lo - 1e-6 || c < cur.durationSec / 2 || c + D > cur.durationSec - 0.3 || c > end) continue;
            if (or0(voiceRisk(cur, c - beat, c, sung.out)) >= SWAP_CLEAR) continue;   // the beat that repeats is sung
            Plan p = new Plan();
            p.style = "blend";
            p.shape = "echo";
            p.reason = reason + (k != 0 ? " (" + Math.abs(k) + " bar" + (Math.abs(k) == 1 ? "" : "s") + " " + (k > 0 ? "earlier" : "later") + ", off a sung beat)" : "");
            p.v2 = true;
            p.v3 = true;
            p.anchor = a;
            p.echo = new Echo();
            p.echo.beats = beats;
            p.echo.delaySec = beat;
            p.echo.feedback = ECHO_FEEDBACK;
            p.echo.cutSec = ECHO_CUT_SEC;
            p.mixOutTrackTime = c;
            p.durationSec = D;
            p.mixInTrackTime = toGrid != null && toGrid.downbeatSec <= ECHO_FIRST_BEAT_MAX_SEC ? toGrid.downbeatSec : 0;
            p.rate = 1;
            p.outRate = 1;
            p.beatSec = beat;
            p.bars = beats / 4;
            p.swapDb = 0;
            p.barSec = g.barSec;
            p.bpm = g.bpm;
            p.outBpm = g.bpm;
            p.inBpm = toGrid != null ? toGrid.bpm : Double.NaN;
            return p;
        }
        return null;
    }

    // the hand-over and the beatless bridge (Orchard's boundary hand-off, beatlessBridge)

    /** "Beatmatch or do nothing": a beatless bridge when both edges have one, else the playing song runs out with a short fade. */
    static Plan handoff(Analysis cur, Analysis next, double earliest, String reason, Sung sung) {
        // a length picked: the bridge or hand-over runs it, ending where it would have ended
        double len = pinnedSec(cur);
        double[] b = new double[3];
        String none = beatlessBridge(cur, next, sung, b);
        if (none == null && b[0] >= earliest) {
            double bEnd = b[0] + b[1], bOut = !Double.isNaN(len) ? Math.max(earliest, bEnd - len) : b[0], bDur = bEnd - bOut;
            Plan p = new Plan();
            p.style = "crossfade";
            p.bridge = true;
            p.reason = reason + ": a beatless bridge (" + String.format(Locale.US, "%.1f", bDur) + " s, no beat on either side)";
            p.mixOutTrackTime = bOut;
            p.durationSec = bDur;
            p.mixInTrackTime = b[2];
            p.rate = 1;
            p.trim = loudnessTrim(cur, bOut, bDur, next, b[2], bDur);
            return p;
        }
        double end = Math.min(musicEnd(cur).durationSec, cur.durationSec - 0.3);
        double mixOut = Math.max(earliest, end - (Double.isNaN(len) ? V2_SWITCH_SEC : len));
        Plan p = new Plan();
        p.style = "crossfade";
        p.handoff = true;
        p.reason = reason + ", so a straight hand-over (no beatless bridge: " + (none != null ? none : "past the playhead") + ")";
        p.mixOutTrackTime = mixOut;
        p.durationSec = Math.max(0, end - mixOut);
        p.mixInTrackTime = 0;
        p.rate = 1;
        return p;
    }

    /** The bass curve's mean over [from, to], or NaN. */
    static double bassMean(Analysis a, double from, double to) {
        Analysis.Curve c = a == null ? null : a.bassCurve;
        if (c == null || c.values.length == 0) return Double.NaN;
        int i0 = (int) Math.max(0, Math.floor((from - c.start) / c.step));
        int i1 = (int) Math.min(c.values.length - 1, Math.floor((to - c.start) / c.step));
        if (i1 < i0) return Double.NaN;
        double s = 0;
        for (int i = i0; i <= i1; i++) s += c.values[i];
        return s / (i1 - i0 + 1);
    }

    /** Orchard beatPresence: 0 in a beatless passage, 1 once kick and bass are in; NaN unmeasured. */
    static double beatPresence(Analysis a, double t) {
        double m = bassMean(a, t - 0.5, t + 0.5);
        return Double.isNaN(m) ? Double.NaN : clamp((m - 0.1) / 0.4, 0, 1);
    }

    static double beatlessRun(Analysis a, double from, double limit, double step) {
        double run = 0;
        for (double t = from; step > 0 ? t < limit : t > limit; t += step) {
            double p = beatPresence(a, t);
            if (Double.isNaN(p) || p >= BEATLESS) break;
            run += Math.abs(step);
        }
        return run;
    }

    /** The bridge into [into] {mixOut, dur, mixIn}; returns null, or why there is none. */
    static String beatlessBridge(Analysis cur, Analysis next, Sung sung, double[] into) {
        if (cur.bassCurve == null || next.bassCurve == null) return "no bass curves";
        if (subBassContrast(cur, next) >= V2_SUB_BASS_VETO) return "the productions clash";
        double end = Math.min(musicEnd(cur).durationSec, cur.durationSec - 0.3);
        double outRun = beatlessRun(cur, end - 0.125, end - BRIDGE_MAX_SEC, -0.25);
        double nextDur = next.durationSec > 0 ? next.durationSec : 60;
        double inRun = beatlessRun(next, 0.125, Math.min(nextDur, 60), 0.25);
        if (Math.min(outRun, inRun) < BRIDGE_MIN_SEC) return "beatless ending " + js(outRun) + " s, opening " + js(inRun) + " s";
        double beat = cur.beatIntervalSec > 0 ? cur.beatIntervalSec : 0.5;
        double dur = Math.floor(Math.min(Math.min(outRun, inRun), BRIDGE_MAX_SEC) / beat) * beat;
        if (dur < BRIDGE_MIN_SEC) return "beatless edges too short";
        double skip = Math.min(Math.max(0, inRun - dur), BRIDGE_MAX_SKIP_SEC);
        double both = vocalOverlap(cur, next, end - dur, dur, skip, 1, sung);
        if ((Double.isNaN(both) ? 0 : both) > 0.25) return "voices meet over the bridge";
        double risk = voiceRisk(next, skip - 0.5, skip + 1, sung.in);
        if ((Double.isNaN(risk) ? 0 : risk) >= 0.5) return "the next song would fade in mid-line";
        double[] keys = overlapHarmony(cur, next, end - dur, end, skip, skip + dur);
        if (keys != null && keys[2] > 0) return "the keys clash where they meet (" + js(keys[0]) + ")";
        into[0] = end - dur;
        into[1] = dur;
        into[2] = skip;
        return null;
    }

    /** Orchard's voice risk over [from, to): the vocal mask mapped to 0..1 (lyric lines: sung or not); NaN unknown. */
    static double voiceRisk(Analysis a, double from, double to, double[][] spans) {
        double sum = 0;
        int n = 0;
        for (double t = from; t < to; t += 0.05) {
            double v = vocalAt(a, t, spans);
            if (Double.isNaN(v)) continue;
            sum += spans != null ? v : clamp((v - 0.15) / 0.45, 0, 1);
            n++;
        }
        return n > 0 ? sum / n : Double.NaN;
    }

    static final class Swap {
        double at;
        String moved;
    }

    /** Orchard chooseBassSwap by the playing song's voice: the bar nearest the middle, moved off a sung line. */
    static Swap vocalSafeSwap(Analysis cur, double mixOut, double outSpan, int bars, double[][] spans) {
        Swap s = new Swap();
        double mid = clamp(Math.round(bars / 2.0), 1, bars - 1) / bars;
        double here = voiceRisk(cur, mixOut + mid * outSpan - 0.5, mixOut + mid * outSpan + 0.5, spans);
        s.at = mid;
        if (Double.isNaN(here) || here < SWAP_SINGING) return s;
        List<Double> moves = new ArrayList<>();
        for (int k = 1; k < bars; k++) {
            double f = k / (double) bars;
            if (f < 0.25 || f > 0.75 || Math.abs(f - mid) < 1e-9) continue;
            double r = voiceRisk(cur, mixOut + f * outSpan - 0.5, mixOut + f * outSpan + 0.5, spans);
            if (!Double.isNaN(r) && r < SWAP_CLEAR) moves.add(f);
        }
        moves.sort((x, y) -> {
            int c = Double.compare(Math.abs(x - 0.5), Math.abs(y - 0.5));
            return c != 0 ? c : Double.compare(x, y);
        });
        if (moves.isEmpty()) {
            s.moved = "sung at the middle, no clear bar";
            return s;
        }
        long by = Math.round((moves.get(0) - mid) * bars);
        s.at = moves.get(0);
        s.moved = "off a sung line, " + (by > 0 ? "+" : "") + by + " bar" + (Math.abs(by) == 1 ? "" : "s");
        return s;
    }

    /** What plays: the loop mix or the blend (automix.js loopOrBlend), with why under Automix v2. */
    public static final class Choice {
        public final boolean loop;
        public final String why;

        Choice(boolean loop, String why) {
            this.loop = loop;
            this.why = why;
        }

        /** The editor's Loop preset: the loop mix whenever one was found (crossfade.js loopPicked). */
        static Choice picked(boolean found) {
            return new Choice(found, "Loop picked for these two");
        }
    }

    /**
     * Loop mix or blend. Before Automix v2 a loop mix that found bars always plays. Under v2 a blend
     * that fell back never beats it; otherwise both are scored as Orchard does on what differs
     * (both singing, the keys, the length) and the blend has to win by LOOP_MARGIN.
     */
    public static Choice loopOrBlend(int version, Plan blend, LoopPlan loop) {
        if (version != 3 || loop == null || loop.none != null) return new Choice(loop != null && loop.none == null, null);
        if (blend == null || blend.fallback || !"blend".equals(blend.style) || blend.shape != null) return new Choice(true, "the blend fell back");
        double b = choiceScore(blend.clash, blend.harmonic != null ? blend.harmonic.score : 0.5, blend.bars * 4);
        double l = choiceScore(Math.min(loop.out.vocal, loop.in.vocal), 1, loop.totalBars * 4);
        return new Choice(b < l + LOOP_MARGIN, "loop " + js(r4(l)) + " vs blend " + js(r4(b)) + " (the blend needs " + js(LOOP_MARGIN) + " more)");
    }

    private static double choiceScore(double clash, double keys, int beats) {
        double vocal = 1 - Math.min(1, clash * 1.15) * 0.72;
        double length = beats == 16 ? 1 : beats == 8 ? 0.85 : beats == 32 ? 0.75 : 0.65;
        return 0.82 * (0.15 * vocal + 0.13 * keys + 0.02 * length);
    }

    static double clamp(double x, double lo, double hi) {
        return Math.min(hi, Math.max(lo, x));
    }

    private static double r1(double v) {
        return Math.round(v * 10) / 10.0;
    }

    private static double r3(double v) {
        return Double.isNaN(v) ? Double.NaN : Math.round(v * 1000) / 1000.0;
    }

    private static double r4(double v) {
        return Math.round(v * 1e4) / 1e4;
    }

    /** A number as JavaScript prints it in a template string. */
    static String js(double v) {
        if (Double.isNaN(v)) return "null";
        if (v == Math.rint(v) && Math.abs(v) < 1e15) return Long.toString((long) v);
        String s = Double.toString(v);
        return s.contains("E") ? java.math.BigDecimal.valueOf(v).toPlainString() : s;
    }


    // ───────── the loop mix (BitChord engine/loopMix.ts) ─────────
    static final int LOOP_BARS = 4;
    static final int[] LOOP_LENGTHS = {4, 2, 1};
    static final int ENTER_BARS = 4;
    static final int SETTLE_BARS = 2;
    static final double MAX_BPM_PER_BAR = 2.5;
    static final int MIN_RAMP_BARS = 2, MAX_RAMP_BARS = 24;
    static final double VOCAL_ACTIVE = 0.25;
    static final double MAX_SUNG_SHARE = 0.03;
    static final double MAX_SUNG_RUN_SEC = 0.2;
    static final double LYRIC_GUARD_SEC = 0.3;
    public static final double LYRIC_LEAD_SEC = 0.15, LYRIC_TAIL_SEC = 0.35;
    static final double MIN_LOUDNESS = 0.6;
    static final double OUT_SEARCH_SEC = 60, IN_SEARCH_SEC = 45;
    public static final double OUT_REGION_SEC = OUT_SEARCH_SEC + 5, IN_REGION_SEC = IN_SEARCH_SEC + 40;
    public static final double LOOP_SETUP_SEC = 15;
    public static final double HANDOVER_SEC = 0.025;
    public static final double BASS_CUT_DB = -18;

    /** A decoded song for the loop search: its loudness (channel 0, the extension's rms) and length. */
    public interface Audio {
        double duration();

        double rms(double from, double to);
    }

    public static final class LoopSide {
        public String key;
        public double loopStart, loopEnd;
        public int bars;
        public double beatSec, bpm, vocal;
        public String checkedBy;
    }

    public static final class LoopPlan {
        public LoopSide out, in;
        public double fold;
        public int enterBars, rampBars, totalBars;
        public double exitBars;
        /** Set when a side has no instrumental bars. */
        public String none;
        /** What each deck does over the loop mix (spec/automix/plan.schema.json "curves"). */
        public Curves curves;

        @Override
        public String toString() {
            if (none != null) return "no loop mix: " + none;
            return String.format(Locale.US, "loop mix: %d-bar loop at %.2f s (%.1f BPM, %s) into a %d-bar loop at %.2f s (%.1f BPM, %s), ramp %d bars, %d bars in all",
                    out.bars, out.loopStart, out.bpm, "lyrics".equals(out.checkedBy) ? "no lyric line" : String.format(Locale.US, "sung %.1f%%", out.vocal * 100),
                    in.bars, in.loopStart, in.bpm, "lyrics".equals(in.checkedBy) ? "no lyric line" : String.format(Locale.US, "sung %.1f%%", in.vocal * 100),
                    rampBars, totalBars);
        }
    }

    /** null when there is no usable grid or a music video; a plan with [none] when a side has no instrumental bars. */
    public static LoopPlan planLoopMix(Analysis out, Audio outBuffer, Analysis inn, Audio inBuffer, double earliestOutSec, Sung sung) {
        return planLoopMix(1, out, outBuffer, inn, inBuffer, earliestOutSec, sung);
    }

    /** The same for an engine version: Automix v2 (3) adds its gates (tempo cap, sub-bass, keys). */
    public static LoopPlan planLoopMix(int version, Analysis out, Audio outBuffer, Analysis inn, Audio inBuffer, double earliestOutSec, Sung sung) {
        if (!(out.beatIntervalSec > 0) || Double.isNaN(out.firstDownbeatSec) || !(out.bpm > 0)) return null;
        if (!(inn.beatIntervalSec > 0) || Double.isNaN(inn.firstDownbeatSec) || !(inn.bpm > 0)) return null;
        if (out.musicVideo || inn.musicVideo) return null;
        if (sung == null) sung = new Sung();
        double outBar = out.beatIntervalSec * 4;
        double inBar = inn.beatIntervalSec * 4;

        double outEnd = Math.min(out.durationSec - 0.5, outBuffer.duration() - 0.1);
        double outFirst = Math.max(earliestOutSec, out.durationSec - OUT_SEARCH_SEC);
        // the baseline (versions.md "The loop mix's baseline", the extension's d26dc16): each song's own
        // grid and the loop's padded lyric spans (loopSpansFromLines) as given
        Clean outPick = firstClean(bars -> {
            List<double[]> l = loopsBetween(out.tailBeats, out.firstDownbeatSec, outBar, outFirst, outEnd, bars);
            Collections.reverse(l);
            return l;
        }, outBuffer, out.vocals, sung.out, out.beatIntervalSec);
        if (outPick == null) return none("no instrumental bars near the end of the playing song");
        double inEnd = Math.min(IN_SEARCH_SEC + LOOP_BARS * inBar, inBuffer.duration() - 20);
        Clean inPick = firstClean(bars -> loopsBetween(inn.headBeats, inn.firstDownbeatSec, inBar, 0, inEnd, bars),
                inBuffer, inn.vocals, sung.in, inn.beatIntervalSec);
        if (inPick == null) return none("no instrumental bars in the opening of the next song");
        double outBeat = (outPick.end - outPick.start) / (outPick.bars * 4);
        double inBeat = (inPick.end - inPick.start) / (inPick.bars * 4);
        double outBpm = 60 / outBeat, inBpm = 60 / inBeat;
        double fold = 1;
        for (double f : new double[]{2, 0.5}) {
            if (Math.abs(Math.log(inBpm / f / outBpm)) < Math.abs(Math.log(inBpm / fold / outBpm))) fold = f;
        }
        double target = inBpm / fold;
        // v2: the loop ramps the tempo too, so the same cap (a wider gap: a blend or hand-over instead)
        if (version == 3 && stretchOf(target / outBpm) > V2_MAX_STRETCH) {
            return none("tempos " + Math.round(stretchOf(target / outBpm) * 100) + "% apart (v2 stretches at most " + Math.round(V2_MAX_STRETCH * 100) + "%)");
        }
        double contrast = subBassContrast(out, inn);
        if (version == 3 && contrast >= V2_SUB_BASS_VETO) return none("different sub-bass styles (" + String.format(Locale.US, "%.2f", contrast) + " apart)");
        Harmonic harmonic = version == 3 ? harmonicEvidence(out, inn) : null;
        if (harmonic != null && harmonic.severeClash) return none("the keys clash (" + out.keyName + " → " + inn.keyName + ", " + js(harmonic.score) + ")");
        int rampBars = (int) Math.min(MAX_RAMP_BARS, Math.max(MIN_RAMP_BARS, Math.ceil(Math.abs(target - outBpm) / MAX_BPM_PER_BAR)));
        double inLoopOutBars = inPick.bars / fold;
        double totalBars = Math.ceil((ENTER_BARS + rampBars + 2) / inLoopOutBars) * inLoopOutBars;
        LoopPlan p = new LoopPlan();
        p.out = side(out.fileKey, outPick, outBeat, outBpm);
        p.in = side(inn.fileKey, inPick, inBeat, inBpm);
        p.fold = fold;
        p.enterBars = ENTER_BARS;
        p.rampBars = rampBars;
        p.totalBars = (int) Math.round(totalBars);
        p.exitBars = totalBars - ENTER_BARS - rampBars;
        p.curves = Curves.loop(p);
        return p;
    }

    private static LoopPlan none(String why) {
        LoopPlan p = new LoopPlan();
        p.none = why;
        return p;
    }

    private static LoopSide side(String key, Clean c, double beatSec, double bpm) {
        LoopSide s = new LoopSide();
        s.key = key;
        s.loopStart = c.start;
        s.loopEnd = c.end;
        s.bars = c.bars;
        s.beatSec = beatSec;
        s.bpm = bpm;
        s.vocal = c.vocal;
        s.checkedBy = c.checkedBy;
        return s;
    }

    /** [bars]-bar loops in [from, to]: on the model's own downbeats where it has them, else the constant grid. */
    static List<double[]> loopsBetween(Analysis.BeatSide side, double anchor, double bar, double from, double to, int bars) {
        List<double[]> loops = new ArrayList<>();
        double[] downs = side == null ? new double[0] : side.downbeats;
        if (side != null && downs.length >= bars + 1) {
            double beat = 60 / side.bpm;
            for (double start : downs) {
                if (start < from) continue;
                double target = start + bars * 4 * beat;
                double end = downs[0];
                for (double d : downs) if (Math.abs(d - target) < Math.abs(end - target)) end = d;
                if (Math.abs(end - target) > beat / 4 || end > to) continue;
                loops.add(new double[]{start, end});
            }
            if (!loops.isEmpty()) return loops;
        }
        if (to < from) return loops;
        double len = bars * bar;
        for (double t = anchor + Math.ceil((from - anchor) / bar) * bar; t + len <= to; t += bar) loops.add(new double[]{t, t + len});
        return loops;
    }

    /** Why the next song's opening has no loop (a log line): its grid, its downbeats, its sung spans and each 4-bar candidate. */
    static String openingWhy(Analysis inn, Audio buf, double[][] sung) {
        StringBuilder b = new StringBuilder(String.format(Locale.US, "opening of the next song: %.2f BPM, downbeat %.3f s, model downbeats",
                inn.bpm, inn.firstDownbeatSec));
        double[] downs = inn.headBeats == null ? new double[0] : inn.headBeats.downbeats;
        for (double d : downs) if (d < 50) b.append(String.format(Locale.US, " %.2f", d));
        b.append("; sung");
        if (sung == null) b.append(" (the vocal mask)");
        else for (double[] x : sung) if (x[0] < 60) b.append(String.format(Locale.US, " %.2f-%.2f", x[0], x[1]));
        double inBar = inn.beatIntervalSec * 4, inEnd = Math.min(IN_SEARCH_SEC + LOOP_BARS * inBar, buf.duration() - 20);
        b.append(String.format(Locale.US, "; search to %.2f s (decoded %.1f s); 4-bar loops", inEnd, buf.duration()));
        for (double[] l : loopsBetween(inn.headBeats, inn.firstDownbeatSec, inBar, 0, inEnd, 4)) {
            double min = Double.POSITIVE_INFINITY;
            for (int k = 0; k < 4; k++) min = Math.min(min, buf.rms(l[0] + k * (l[1] - l[0]) / 4, l[0] + (k + 1) * (l[1] - l[0]) / 4));
            b.append(String.format(Locale.US, " %.2f-%.2f (%.3f)", l[0], l[1], min));
        }
        return b.toString();
    }

    interface Candidates {
        List<double[]> of(int bars);
    }

    static final class Clean {
        double start, end, vocal;
        int bars;
        String checkedBy;
    }

    static Clean firstClean(Candidates candidates, Audio buffer, List<Analysis.VocalWindow> vocals, double[][] sung, double beatSec) {
        for (int bars : LOOP_LENGTHS) {
            List<double[]> loops = candidates.of(bars);
            if (loops.isEmpty()) continue;
            double[] louds = new double[loops.size()];
            for (int i = 0; i < louds.length; i++) {
                double[] l = loops.get(i);
                double min = Double.POSITIVE_INFINITY;
                for (int b = 0; b < bars; b++) {
                    min = Math.min(min, buffer.rms(l[0] + (b * (l[1] - l[0])) / bars, l[0] + ((b + 1) * (l[1] - l[0])) / bars));
                }
                louds[i] = min;
            }
            double[] sorted = louds.clone();
            Arrays.sort(sorted);
            int at = (int) Math.floor(louds.length * 0.6);
            double typical = at < sorted.length ? sorted[at] : 0;
            for (int i = 0; i < loops.size(); i++) {
                double[] l = loops.get(i);
                if (louds[i] < typical * MIN_LOUDNESS || louds[i] <= 0.01) continue;
                if (sung != null) {
                    double from = l[0] - LYRIC_GUARD_SEC;
                    boolean hit = false;
                    for (double[] x : sung) if (x[0] < l[1] && x[1] > from) { hit = true; break; }
                    if (hit) continue;
                    Clean c = new Clean();
                    c.start = l[0];
                    c.end = l[1];
                    c.bars = bars;
                    c.vocal = 0;
                    c.checkedBy = "lyrics";
                    return c;
                }
                double[] m = maskStats(vocals, l[0] - beatSec, l[1]);
                if (m == null || m[0] > MAX_SUNG_SHARE || m[1] > MAX_SUNG_RUN_SEC) continue;
                Clean c = new Clean();
                c.start = l[0];
                c.end = l[1];
                c.bars = bars;
                c.vocal = m[0];
                c.checkedBy = "mask";
                return c;
            }
        }
        return null;
    }

    /** {share sung, longest sung run s}, or null when the mask covers under 80% of [from, to). */
    static double[] maskStats(List<Analysis.VocalWindow> windows, double from, double to) {
        int sung = 0, n = 0, run = 0, longest = 0;
        double covered = 0, fps = 1;
        for (Analysis.VocalWindow w : windows) {
            int a = (int) Math.max(0, Math.ceil((from - w.startSec) * w.fps));
            int b = (int) Math.min(w.curve.length, Math.floor((to - w.startSec) * w.fps));
            for (int i = a; i < b; i++) {
                n++;
                if (w.curve[i] > VOCAL_ACTIVE) {
                    sung++;
                    run++;
                    longest = Math.max(longest, run);
                } else {
                    run = 0;
                }
            }
            if (b > a) {
                covered += (b - a) / w.fps;
                fps = w.fps;
            }
        }
        return n > 0 && covered >= (to - from) * 0.8 ? new double[]{sung / (double) n, longest / fps} : null;
    }

    /** One deck tempo/position change (the extension's LoopDeck schedule entry). */
    public static final class Change {
        public double output, input, rate;
        public boolean active;
        public double[] loop;

        Change(double output, double input, double rate, boolean active, double[] loop) {
            this.output = output;
            this.input = input;
            this.rate = rate;
            this.active = active;
            this.loop = loop;
        }
    }

    public static final class LoopSchedule {
        public double t0;
        public double[] beatTimes;
        public List<Change> outChanges = new ArrayList<>(), inChanges = new ArrayList<>();
        public double releaseAt, elementAt, elementTrackTime, enterEnd, rampEnd, mid, bar, handoffAt;
        public int beats, settleBeats, rampFrom, rampTo;
    }

    /** The whole loop mix on one beat clock from [t0] (the audio time the outgoing song reaches its loop start). */
    public static LoopSchedule loopSchedule(LoopPlan plan, double t0) {
        LoopSide out = plan.out, inn = plan.in;
        double fold = plan.fold;
        int beats = plan.totalBars * 4;
        int settleBeats = (int) Math.round((SETTLE_BARS * 4) / fold);
        int rampFrom = plan.enterBars * 4;
        int rampTo = (plan.enterBars + plan.rampBars) * 4;
        double target = inn.bpm / fold;
        double[] beatTimes = new double[beats + settleBeats + 1];
        beatTimes[0] = t0;
        for (int k = 0; k < beats + settleBeats; k++) beatTimes[k + 1] = beatTimes[k] + 60 / tempo(k, rampFrom, rampTo, out.bpm, target);
        int outLoopBeats = out.bars * 4;
        int inLoopBeats = inn.bars * 4;
        double inPerBeat = fold * inn.beatSec;
        LoopSchedule x = new LoopSchedule();
        double[] outLoop = {out.loopStart, out.loopEnd}, inLoop = {inn.loopStart, inn.loopEnd};
        for (int k = 0; k < beats; k++) {
            double t = beatTimes[k], T = tempo(k, rampFrom, rampTo, out.bpm, target);
            x.outChanges.add(new Change(t, out.loopStart + (k % outLoopBeats) * out.beatSec, (T * out.beatSec) / 60, true, outLoop));
            x.inChanges.add(new Change(t, inn.loopStart + ((k * fold) % inLoopBeats) * inn.beatSec, (T * inPerBeat) / 60, true, inLoop));
        }
        double releaseAt = beatTimes[beats];
        x.outChanges.add(new Change(releaseAt + 0.05, out.loopStart, 1, false, null));
        x.inChanges.add(new Change(releaseAt, inn.loopEnd, 1, true, null));
        double elementAt = beatTimes[beats + settleBeats];
        double elementTrackTime = inn.loopEnd + (elementAt - releaseAt);
        x.inChanges.add(new Change(elementAt + 0.1, elementTrackTime + 0.1, 1, false, null));
        int midBeat = (int) Math.round((rampFrom + rampTo) / 2.0);
        x.t0 = t0;
        x.beatTimes = beatTimes;
        x.releaseAt = releaseAt;
        x.elementAt = elementAt;
        x.elementTrackTime = elementTrackTime;
        x.enterEnd = beatTimes[rampFrom];
        x.rampEnd = beatTimes[rampTo];
        x.mid = beatTimes[midBeat];
        x.bar = 4 * (60 / tempo(midBeat, rampFrom, rampTo, out.bpm, target));
        x.handoffAt = beatTimes[midBeat];
        x.beats = beats;
        x.settleBeats = settleBeats;
        x.rampFrom = rampFrom;
        x.rampTo = rampTo;
        return x;
    }

    static double tempo(int k, int rampFrom, int rampTo, double outBpm, double target) {
        return k < rampFrom ? outBpm : k >= rampTo ? target : outBpm + ((target - outBpm) * (k - rampFrom + 0.5)) / (rampTo - rampFrom);
    }
}
