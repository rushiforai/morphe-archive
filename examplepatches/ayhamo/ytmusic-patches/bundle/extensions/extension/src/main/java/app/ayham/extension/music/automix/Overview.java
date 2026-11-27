package app.ayham.extension.music.automix;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * The Automix overview's view of one mix (crossfade.js overviewSnapshot and automix-overview.js
 * lanes): the coming mix, or the one playing, on its own clock, 0 at its start. What each song
 * plays at mix time t and how loud, read from the plan's curves (plan.schema.json), so it draws
 * any engine's plan unchanged.
 */
public final class Overview {
    /** Set: nothing to draw, and why (a pick for the pair can still be shown and cleared). */
    public String why;
    public String fromId, toId, pairKey, fromTitle, fromArtist, toTitle, toArtist;
    /** The user's edit of this pair (editor.md), or null: Auto. */
    public MixOverride override;
    /** The grids the editor snaps to: A's end grid and B's opening, {downbeatSec, beatSec, bpm}; null: none. */
    public double[] outGrid, inGrid;
    /** Each song's length (s), NaN unknown. */
    public double outDur = Double.NaN, inDur = Double.NaN;
    /** The first song time the mix can start now (the planner's earliest). */
    public double earliest = Double.NaN;
    public Planner.Plan plan;
    public Planner.LoopPlan loop;
    public Planner.LoopSchedule x;
    public Curves curves;
    /** The mix's length on its clock (a loop mix: to the handover). */
    public double D;
    /** Where the music is on the mix's clock (negative: before it), NaN unknown. */
    public double at = Double.NaN;
    /** Seconds until the decks take over (before the mix), NaN unknown. */
    public double left = Double.NaN;
    public double previewAt;
    public boolean live, editable;
    /** Why there is no loop mix for this pair, when the search found none. */
    public String loopNone;
    /** Automix v2: why the loop mix or the blend plays ("loop 0.24 vs blend 0.16 ..."), or null. */
    public String choice;
    /** Work still running for this pair ("Analysing the next song: finding the beats"), or null. */
    public String waiting;
    /** How far [waiting] is, 0..1, or -1 when unknown. */
    public float waitDone = -1;
    /** [waiting] is an outcome (a failed or skipped analysis): no bar, no %. */
    public boolean waitNoBar;
    /** The song being analysed, or null. */
    public String waitingFor;
    /** The plan is a stand-in fade until the analysis lands (it is planned again then). */
    public boolean provisional;

    public String style() {
        return loop != null ? "loop" : plan.style;
    }

    public int bars() {
        return loop != null ? loop.totalBars : plan.bars;
    }

    /** "Auto · Blend": what the planner chose, as the preset row names it with no override (editor.md §7). */
    /** Every name autoName gives (the editor's first chip is as wide as the widest). */
    public static final String[] AUTO_NAMES = {"Auto", "Auto · Loop", "Auto · Hand-over", "Auto · Bridge", "Auto · Fade",
            "Auto · Filter", "Auto · Drop-in", "Auto · Muffle", "Auto · Echo out", "Auto · Glide", "Auto · Blend"};

    public String autoName() {
        if (loop != null) return "Auto · Loop";
        if (plan == null) return "Auto";
        if ("crossfade".equals(plan.style)) return plan.handoff ? "Auto · Hand-over" : plan.bridge ? "Auto · Bridge" : "Auto · Fade";
        if ("filter".equals(plan.style)) return "Auto · Filter";
        if ("dropin".equals(plan.shape)) return "Auto · Drop-in";
        if ("muffle".equals(plan.shape)) return "Auto · Muffle";
        if ("echo".equals(plan.shape)) return "Auto · Echo out";
        return plan.glide != null ? "Auto · Glide" : "Auto · Blend";
    }

    /** "Blend · 8 bars · 120→124 BPM · 16.0 s" (automix-overview.js describe). */
    public String describe() {
        if (loop != null) {
            return String.format(Locale.ROOT, "Loop mix · %d bars · %d→%d BPM · %.1f s", loop.totalBars, Math.round(loop.out.bpm), Math.round(loop.in.bpm), D);
        }
        if (provisional) return String.format(Locale.ROOT, "Fade for now · %.1f s · replanned once analysed", D);
        // Automix v2 names its ways: the hand-over and bridge of a pair it can't beatmatch, the drop-in, muffle and glide
        if ("crossfade".equals(plan.style)) {
            return String.format(Locale.ROOT, "%s · %.1f s", plan.bridge ? "Beatless bridge" : plan.handoff ? "Hand-over" : "Fade", D)
                    + (plan.reason != null ? " · " + plan.reason : "");
        }
        // (editor.md §7: A's and B's BPM when they round apart, else the plan's)
        double outBpm = plan.outBpm > 0 ? plan.outBpm : plan.bpm;
        String bpm = plan.inBpm > 0 && Math.round(plan.inBpm) != Math.round(outBpm)
                ? Math.round(outBpm) + "→" + Math.round(plan.inBpm) + " BPM"
                : Math.round(plan.bpm) + " BPM";
        String kind = "filter".equals(plan.style) ? "Filter mix" : "dropin".equals(plan.shape) ? "Drop-in" : "muffle".equals(plan.shape) ? "Muffle"
                : "echo".equals(plan.shape) ? "Echo out" : plan.glide != null ? "Glide blend" : "Blend";
        return String.format(Locale.ROOT, "%s · %d bars · %s · %.1f s", kind, plan.bars, bpm, D);
    }

    /** The outgoing song's second at mix time t, NaN while it is silent. */
    public double outTrack(double t) {
        if (x != null) {
            if (t < 0) return loop.out.loopStart + t;
            return t < x.releaseAt ? seg(x.outChanges, t) : Double.NaN;
        }
        if (t < 0) return plan.mixOutTrackTime + t;
        if (plan.glide != null) return t <= D ? clocks().out.applyAsDouble(t) : Double.NaN;
        return t <= D ? plan.mixOutTrackTime + t * plan.outRate : Double.NaN;
    }

    /** The incoming song's second at mix time t, NaN while it is silent. */
    public double inTrack(double t) {
        if (t < 0) return Double.NaN;
        if (x != null) return t < x.releaseAt ? seg(x.inChanges, t) : loop.in.loopEnd + (t - x.releaseAt);
        if ("blend".equals(plan.style) && plan.glide != null) return clocks().in.applyAsDouble(t);
        // as the decks play it (Mix.blend): B silent until its late entry (mix-file.md rule 2), at the
        // plan's rate (a playlist speed too, spotify-mixes.md rule 10), then on at its own speed
        double late = plan.inDelaySec > 0 ? Math.min(plan.inDelaySec, D) : 0;
        if (t < late) return Double.NaN;
        double rate = plan.rate > 0 ? plan.rate : 1, home = !Double.isNaN(plan.speedIn) ? plan.speedIn : 1;
        return t <= D ? plan.mixInTrackTime + (t - late) * rate : plan.mixInTrackTime + (D - late) * rate + (t - D) * home;
    }

    /** The glide's clocks, made once per plan: the waveform asks for them on every column. */
    private Planner.Plan clocksOf;
    private KickLock.Clocks clocks;

    private KickLock.Clocks clocks() {
        if (clocks == null || clocksOf != plan) {
            clocks = KickLock.blendClocks(plan);
            clocksOf = plan;
        }
        return clocks;
    }

    private static double seg(List<Planner.Change> changes, double t) {
        Planner.Change c = null;
        for (Planner.Change ch : changes) {
            if (ch.output <= t) c = ch;
            else break;
        }
        return c != null && c.active ? c.input + (t - c.output) * c.rate : Double.NaN;
    }

    public double gainOut(double t) {
        return value(curves.out.get("gain"), t, 1);
    }

    public double gainIn(double t) {
        return value(curves.in.get("gain"), t, 0);
    }

    /** A curve at t: held before its first point and after its last, linear between (plan.schema.json). */
    static double value(double[][] pts, double t, double neutral) {
        if (pts == null || pts.length == 0) return neutral;
        if (t <= pts[0][0]) return pts[0][1];
        for (int i = 1; i < pts.length; i++) {
            if (t <= pts[i][0]) {
                double a = pts[i - 1][0], b = pts[i][0];
                return pts[i - 1][1] + (pts[i][1] - pts[i - 1][1]) * ((t - a) / Math.max(1e-6, b - a));
            }
        }
        return pts[pts.length - 1][1];
    }

    /** The beats to draw between t0 and t1, {t, 1 on a bar's first beat}: the loop mix's own, else the blend's tempo. */
    public List<double[]> beats(double t0, double t1) {
        List<double[]> out = new ArrayList<>();
        if (x != null) {
            for (int k = 0; k < x.beatTimes.length; k++) out.add(new double[]{x.beatTimes[k], k % 4 == 0 ? 1 : 0});
            return out;
        }
        if (!(plan.bpm > 0) || "crossfade".equals(plan.style)) return out;
        double b = 60 / plan.bpm;
        for (long k = (long) Math.ceil(t0 / b); k * b <= t1; k++) out.add(new double[]{k * b, ((k % 4) + 4) % 4 == 0 ? 1 : 0});
        return out;
    }

    /** "120 BPM", "8A · F minor", "3:20" from the song's analysis. */
    public static List<String> tags(String id) {
        List<String> t = new ArrayList<>();
        Analysis a = id == null || Automix.context() == null ? null : Analyzer.get(Automix.context(), id);
        if (a == null) {
            if (id != null && Analyzer.busy(id)) t.add("Analysing…");
            return t;
        }
        if (a.bpm > 0) t.add(Math.round(a.bpm) + " BPM");
        if (a.camelotNum > 0) t.add(a.camelotNum + "" + a.camelotLetter + (a.keyName != null && !a.keyName.isEmpty() ? " · " + a.keyName : ""));
        if (a.durationSec > 0) t.add(clock(a.durationSec));
        return t;
    }

    public static String clock(double s) {
        long v = Math.max(0, Math.round(Double.isNaN(s) ? 0 : s));
        return v / 60 + ":" + String.format(Locale.ROOT, "%02d", v % 60);
    }
}
