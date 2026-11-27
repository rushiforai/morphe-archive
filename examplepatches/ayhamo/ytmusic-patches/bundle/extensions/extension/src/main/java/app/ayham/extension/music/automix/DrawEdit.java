package app.ayham.extension.music.automix;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Deque;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * The drawing editor's rules (editor.md §10 rule 6, the extension's automix-overview.js startDraw,
 * pointAt, pointStart/Move, pointDelete, repeat, saveDrawing and undoDraw), apart from the screen:
 * which curves a lane has, a finger's x snapped, a point added, moved or deleted, Repeat, and the
 * undo steps. Each edit makes a new Drawing, so one kept for undo never changes under it.
 */
public final class DrawEdit {
    /** The curves, as the plan names them (automix-overview.js CURVES); the chip and lane of each. */
    public static final String[] KEYS = {"gain", "bassDb", "midDb", "highDb", "lowpassHz", "highpassHz", "noise", "echoSend", "reverbSend", "delaySend"};
    public static final String[] CHIPS = {"Volume", "Bass", "Mid", "High", "Lowpass", "Highpass", "Noise", "Echo", "Reverb", "Delay"};
    private static final int[] LANE = {0, 1, 1, 1, 2, 2, 2, 3, 3, 3};
    private static final String[] NAME = {"gain", "bass", "mid", "high", "lp", "hp", "noise", "echo", "reverb", "delay"};
    private static final double LOG1K = Math.log(1000);
    public static final int UNDO_MAX = 50;
    public static final String TOO_MANY = MixOverride.DRAW_MAX_POINTS + " points is the most for one line";
    public static final String KEEP_ONE = "A volume line keeps at least one point";

    private DrawEdit() {
    }

    public static int index(String key) {
        return Arrays.asList(KEYS).indexOf(key);
    }

    /** The lane (0 volume, 1 EQ, 2 filter, 3 effects) a curve belongs to. */
    public static int laneOf(String key) {
        return LANE[index(key)];
    }

    /** A lane's first curve: the one Draw chooses. */
    public static String firstKey(int lane) {
        for (int i = 0; i < KEYS.length; i++) if (LANE[i] == lane) return KEYS[i];
        return null;
    }

    /** A value as a height in its lane, 0 (bottom) .. 1 (top). */
    public static double norm(String key, double v) {
        switch (key) {
            case "gain":
            case "noise":
            case "echoSend":
            case "reverbSend":
            case "delaySend": return v;
            case "bassDb":
            case "midDb":
            case "highDb": return 1 + v / -MixOverride.CUT_DB;
            case "lowpassHz": return Math.log(v / 20) / LOG1K;
            default: return 1 - Math.log(v / 20) / LOG1K;
        }
    }

    /** A height in the lane (clamped to 0..1) as the curve's value, rounded as saved (Hz to 1 Hz). */
    public static double value(String key, double n) {
        n = Math.max(0, Math.min(1, n));
        switch (key) {
            case "gain":
            case "noise":
            case "echoSend":
            case "reverbSend":
            case "delaySend": return round3(n);
            case "bassDb":
            case "midDb":
            case "highDb": return round3(-MixOverride.CUT_DB * n + MixOverride.CUT_DB);
            case "lowpassHz": return Math.round(20 * Math.pow(1000, n));
            default: return Math.round(20 * Math.pow(1000, 1 - n));
        }
    }

    /** Where an EQ or effect curve starts when Draw adds it: open. */
    static double open(String key) {
        return key.equals("lowpassHz") ? 20000 : key.equals("highpassHz") ? 20 : 0;
    }

    /** A finger's x (beats or seconds of the window) snapped: a quarter beat, or 10 ms; free: 1 ms. */
    public static double snap(double x, String unit, boolean free) {
        x = Math.max(0, x);
        if (free) return Math.round(x * 1000) / 1000.0;
        return "sec".equals(unit) ? Math.round(x * 100) / 100.0 : Math.round(x * 4) / 4.0;
    }

    /** One deck's points of a curve (empty when it has none). */
    public static double[][] points(MixOverride.Drawing d, String key, boolean out) {
        double[][] p = d == null ? null : (out ? d.out : d.in).get(NAME[index(key)]);
        return p == null ? new double[0][] : p;
    }

    /** A copy of the drawing with one deck's curve replaced (none left: the curve goes). */
    public static MixOverride.Drawing withPoints(MixOverride.Drawing d, String key, boolean out, double[][] pts) {
        MixOverride.Drawing c = copy(d);
        Map<String, double[][]> deck = out ? c.out : c.in;
        if (pts.length > 0) deck.put(NAME[index(key)], deepCopy(pts));
        else deck.remove(NAME[index(key)]);
        return c;
    }

    public static MixOverride.Drawing copy(MixOverride.Drawing d) {
        MixOverride.Drawing c = new MixOverride.Drawing(d.unit);
        for (Map.Entry<String, double[][]> e : d.out.entrySet()) c.out.put(e.getKey(), deepCopy(e.getValue()));
        for (Map.Entry<String, double[][]> e : d.in.entrySet()) c.in.put(e.getKey(), deepCopy(e.getValue()));
        // editor.md §12 rule 6: a drawing keeps the time it came with
        c.echoBeats = d.echoBeats;
        c.delayBeats = d.delayBeats;
        return c;
    }

    private static double[][] deepCopy(double[][] p) {
        double[][] r = new double[p.length][];
        for (int i = 0; i < p.length; i++) r[i] = p[i].clone();
        return r;
    }

    /**
     * Draw picked (startDraw): the lane's drawing as it is, else its shape as points (null or "none":
     * empty), with each EQ or effect curve the shape didn't have flat and open, so each can be drawn.
     */
    public static MixOverride.Drawing start(int lane, Object fromShape, String unit) {
        MixOverride.Drawing d = fromShape instanceof MixOverride.Drawing ? copy((MixOverride.Drawing) fromShape) : new MixOverride.Drawing(unit);
        for (int i = 0; i < KEYS.length; i++) {
            if (LANE[i] != lane || i == 0) continue;
            for (boolean out : new boolean[]{true, false}) {
                if (points(d, KEYS[i], out).length == 0) d = withPoints(d, KEYS[i], out, new double[][]{{0, open(KEYS[i])}});
            }
        }
        return d;
    }

    /** What an edit gives: the points (null when refused or nothing changes), the index of the point, and a refusal. */
    public static final class Edit {
        public final double[][] pts;
        public final int i;
        public final String refused;

        Edit(double[][] pts, int i, String refused) {
            this.pts = pts;
            this.i = i;
            this.refused = refused;
        }
    }

    /** A point added at p (pointStart): refused at 128, nothing at a third point on one x. */
    public static Edit add(double[][] pts, double[] p) {
        if (pts.length >= MixOverride.DRAW_MAX_POINTS) return new Edit(null, -1, TOO_MANY);
        int same = 0;
        for (double[] q : pts) if (q[0] == p[0]) same++;
        if (same >= 2) return new Edit(null, -1, null);
        int i = 0;
        while (i < pts.length && pts[i][0] <= p[0]) i++;
        double[][] r = new double[pts.length + 1][];
        for (int j = 0, k = 0; j < r.length; j++) r[j] = j == i ? p.clone() : pts[k++].clone();
        return new Edit(r, i, null);
    }

    /**
     * Point i moved to p (pointMove): held between its neighbours. Onto a neighbour's x makes a
     * step, but a neighbour already in a step keeps 1 ms away, so never a third at one x.
     */
    public static Edit move(double[][] pts, int i, double[] p) {
        double[][] r = deepCopy(pts);
        double lo = i > 0 ? r[i - 1][0] : 0, hi = i + 1 < r.length ? r[i + 1][0] : Double.POSITIVE_INFINITY;
        if (i > 1 && r[i - 2][0] == r[i - 1][0]) lo += 0.001;
        if (i + 2 < r.length && r[i + 2][0] == r[i + 1][0]) hi -= 0.001;
        r[i] = new double[]{Math.max(lo, Math.min(hi, p[0])), p[1]};
        return new Edit(r, i, null);
    }

    /** Point i deleted (pointDelete): a volume deck keeps its last point. */
    public static Edit delete(String key, double[][] pts, int i) {
        if (i < 0 || i >= pts.length) return new Edit(null, -1, null);
        if (key.equals("gain") && pts.length <= 1) return new Edit(null, -1, KEEP_ONE);
        double[][] r = new double[pts.length - 1][];
        for (int j = 0, k = 0; j < pts.length; j++) if (j != i) r[k++] = pts[j].clone();
        return new Edit(r, -1, null);
    }

    /** Repeat's answer: the drawing (null when refused or nothing to copy) and a refusal. */
    public static final class Repeated {
        public final MixOverride.Drawing d;
        public final String refused;

        Repeated(MixOverride.Drawing d, String refused) {
            this.d = d;
            this.refused = refused;
        }
    }

    /**
     * Repeat (rule 6): the curve's points in [from, from + len), on both decks, copied every len up
     * to end (the window's end in the drawing's x); each copy replaces the points in its span, those
     * at or past the end stay. Refused past 128 points.
     */
    public static Repeated repeat(MixOverride.Drawing d, String key, double from, double len, double end) {
        if (d == null || !(len > 0) || !(from >= 0)) return new Repeated(null, null);
        boolean any = false;
        for (boolean out : new boolean[]{true, false}) {
            double[][] pts = points(d, key, out);
            List<double[]> part = new ArrayList<>();
            for (double[] p : pts) if (p[0] >= from && p[0] < from + len) part.add(p);
            if (part.isEmpty()) continue;
            List<double[]> o = new ArrayList<>();
            for (double[] p : pts) if (p[0] < from + len) o.add(p.clone());
            for (double a = from + len; a < end - 1e-9; a += len) {
                for (Iterator<double[]> it = o.iterator(); it.hasNext(); ) if (it.next()[0] >= a) it.remove();
                for (double[] p : part) o.add(new double[]{round3(p[0] - from + a), p[1]});
                if (o.size() > MixOverride.DRAW_MAX_POINTS) return new Repeated(null, TOO_MANY);
            }
            double last = o.get(o.size() - 1)[0];
            for (double[] p : pts) if (p[0] >= end - 1e-9 && p[0] > last) o.add(p.clone());
            if (o.size() > MixOverride.DRAW_MAX_POINTS) return new Repeated(null, TOO_MANY);
            d = withPoints(d, key, out, o.toArray(new double[0][]));
            any = true;
        }
        return new Repeated(any ? d : null, null);
    }

    /**
     * The length a drawing edit saves (rule 6): the one picked, else the one shown when it is a
     * Length chip and the mix has bars (not a fade); 0 when neither.
     */
    public static int barsToSave(int picked, int shown, String style) {
        if (picked > 0) return picked;
        boolean chip = shown == 2 || shown == 4 || shown == 8 || shown == 16 || shown == 32;
        return chip && !"crossfade".equals(style) ? shown : 0;
    }

    /**
     * The override with a lane's drawing saved: Custom with the lanes on screen, this one drawn,
     * the length to keep. lanesNow: the lanes shown (a preset's, or Smooth's on Auto).
     */
    public static MixOverride withDrawing(MixOverride o, String[] lanesNow, int lane, MixOverride.Drawing d, int bars) {
        MixOverride c = o != null ? o.copy() : new MixOverride();
        if (!"custom".equals(c.preset)) c.drawn = new MixOverride.Drawing[MixOverride.LANE_COUNT];
        String[] l = lanesNow.clone();
        l[lane] = MixOverride.DRAW;
        c.family = null;
        c.retiredPreset = null;
        c.preset = "custom";
        for (int k = 0; k < l.length; k++) c.setLane(k, l[k]);
        c.drawn[lane] = d;
        c.bars = bars;
        return c;
    }

    /** The undo steps while the editor is open (undoDraw): what the pair had before each edit. */
    public static final class Undo {
        private static final class Step {
            final String pair;
            final MixOverride before;
            final int barsAfter;

            Step(String pair, MixOverride before, int barsAfter) {
                this.pair = pair;
                this.before = before;
                this.barsAfter = barsAfter;
            }
        }

        private final Deque<Step> steps = new ArrayDeque<>();

        /** Before an edit of [pair]: its override (null: Auto) and the length the edit saves. */
        public void push(String pair, MixOverride before, int barsAfter) {
            steps.addLast(new Step(pair, before == null ? null : before.copy(), barsAfter));
            while (steps.size() > UNDO_MAX) steps.removeFirst();
        }

        public boolean has(String pair) {
            for (Step s : steps) if (s.pair.equals(pair)) return true;
            return false;
        }

        public void clear() {
            steps.clear();
        }

        /**
         * One step back for [pair] from [now]: the preset, lanes and drawings as before; the length
         * goes back only if it is still the one the edit set (one picked by hand since stays); the
         * window and the rest stay as they are now. Another pair's steps are dropped. Null: none.
         */
        public MixOverride undo(String pair, MixOverride now) {
            while (!steps.isEmpty() && !steps.peekLast().pair.equals(pair)) steps.removeLast();
            Step s = steps.pollLast();
            if (s == null) return null;
            MixOverride c = now != null ? now.copy() : new MixOverride();
            MixOverride b = s.before;
            c.preset = b != null ? b.preset : null;
            c.volume = b != null ? b.volume : null;
            c.eq = b != null ? b.eq : null;
            c.effect = b != null ? b.effect : null;
            c.fx = b != null ? b.fx : null;
            c.looping = b != null ? b.looping : null;
            c.drawn = b != null ? b.drawn.clone() : new MixOverride.Drawing[MixOverride.LANE_COUNT];
            c.family = b != null ? b.family : null;
            c.retiredPreset = b != null ? b.retiredPreset : null;
            int bNow = now != null ? now.bars : 0;
            c.bars = bNow == s.barsAfter ? (b != null ? b.bars : 0) : bNow;
            return c;
        }
    }

    private static double round3(double v) {
        return Math.round(v * 1000) / 1000.0;
    }
}
