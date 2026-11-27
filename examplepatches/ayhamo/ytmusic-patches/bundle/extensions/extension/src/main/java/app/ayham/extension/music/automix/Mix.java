package app.ayham.extension.music.automix;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * What both decks play, on one clock: mix seconds, 0 = the moment our deck takes the outgoing song
 * over from YT's player. Built from a plan the way the extension's crossfade.js schedules it
 * (rampOutgoing, scheduleDeckBlend/blendShape/djShape, glideToUnity, scheduleLoopMix). Pure Java.
 */
public final class Mix {
    /** The old song moves to our deck this long before its blend (its speed-up included). */
    public static final double HAND_LEAD = 4;
    /** The incoming deck's glide back to x1.0 after a blend: this much speed every [GLIDE_STEP_SEC]. */
    static final double GLIDE_STEP = 0.0025, GLIDE_STEP_SEC = 0.25;
    /** YT is asked for the next song this long before the deck needs its player. */
    public static final double NEXT_LEAD = 2.5;
    public static final double H = 0.025;

    public String style, outId, inId, note, title, sub;
    public boolean v2;
    public Planner.Plan plan;
    /** The loop mix's plan (stats for nerds), or null for a blend. */
    public Planner.LoopPlan loopPlan;
    /** Outgoing song second at mix 0, and where the outgoing song ends (mix seconds at its own speed). */
    public double takeoverSong, outEnd;
    /** The blend (or loop mix) on the mix clock. */
    public double t0, D;
    /** B's late entry (mix-file.md rule 2): the incoming deck is silent and unstarted before this mix second; 0: from t0. */
    public double inStart;
    /** The speed YT's player plays the next song at once it takes over: its playlist speed, else x1. */
    public double home = 1;
    /** YT moves to the next song; its player takes over from the incoming deck no earlier than [elementAt]. */
    public double askAt, elementAt;
    public final Deck out = new Deck(), in = new Deck();
    /**
     * editor.md §12: [mid] a curve moves the 1 kHz band, [fx] the decks send to the Effects returns
     * (the echo and the delay [echoSec], [delaySec] long), [noise] the noise plays.
     */
    public boolean mid, fx, noise;
    public double echoSec = 0.375, delaySec = 0.25;
    /** The mix's beats on the mix clock (the seek bar pulses on them); null: no beat (a crossfade). */
    public double[] beats;

    /** Where the mix's pulse ends (the decks hand over to YT's player). */
    public double pulseEnd() {
        return "loop".equals(style) ? elementAt : t0 + D;
    }

    static final double PULSE_REST = 0.1, BREATH_SEC = 1.8;

    /**
     * The seek bar's brightness at mix second t (crossfade.js stepPulse): full on each beat,
     * (0.5 + 0.5 cos 2πφ)² between, never under PULSE_REST; a slow 1.8 s breath without beats.
     */
    public static double pulse(double[] beats, double t) {
        double phase;
        if (beats != null && beats.length > 1 && t >= beats[0] && t < beats[beats.length - 1]) {
            int k = java.util.Arrays.binarySearch(beats, t);
            if (k < 0) k = -k - 2;
            phase = (t - beats[k]) / (beats[k + 1] - beats[k]);
        } else {
            double b = beats != null && beats.length > 1 ? beats[beats.length - 1] - beats[beats.length - 2] : BREATH_SEC;
            double from = beats != null && beats.length > 0 ? beats[beats.length - 1] : 0;
            phase = (((t - from) % b) + b) % b / b;
        }
        double shape = 0.5 + 0.5 * Math.cos(2 * Math.PI * phase);
        return PULSE_REST + (1 - PULSE_REST) * shape * shape;
    }

    /** One automation lane, like a Web Audio AudioParam's events: set / linear ramp / exponential ramp. */
    public static final class Lane {
        final List<double[]> pts = new ArrayList<>(); // {time, value, kind}: 0 set, 1 linear, 2 exponential
        final double rest;

        Lane(double rest) {
            this.rest = rest;
        }

        Lane set(double v, double t) {
            pts.add(new double[]{t, v, 0});
            return this;
        }

        Lane lin(double v, double t) {
            pts.add(new double[]{t, v, 1});
            return this;
        }

        Lane exp(double v, double t) {
            pts.add(new double[]{t, v, 2});
            return this;
        }

        /** setValueCurveAtTime: the values evenly over [t, t + d], linearly between them. */
        Lane curve(float[] c, double t, double d) {
            pts.add(new double[]{t, c[0], 0});
            for (int i = 1; i < c.length; i++) pts.add(new double[]{t + d * i / (c.length - 1), c[i], 1});
            return this;
        }

        public boolean empty() {
            return pts.isEmpty();
        }

        public double at(double t) {
            if (pts.isEmpty()) return rest;
            double prevT = Double.NEGATIVE_INFINITY, prevV = rest;
            for (double[] p : pts) {
                if (t < p[0]) {
                    if (p[2] == 0 || prevT == Double.NEGATIVE_INFINITY) return prevV;
                    double f = (t - prevT) / (p[0] - prevT);
                    if (p[2] == 2 && prevV > 0 && p[1] > 0) return prevV * Math.pow(p[1] / prevV, f);
                    return prevV + (p[1] - prevV) * f;
                }
                prevT = p[0];
                prevV = p[1];
            }
            return prevV;
        }
    }

    public static final class Deck {
        /** Beat knots: mix seconds, and the (unwrapped) song second heard then. */
        public double[] knotT, knotP;
        /** A loop [loopA, loopB) song seconds, let go at unwrapped second [release] (then on from loopB). */
        public double loopA, loopB, release = 1e18;
        /** After the last knot: on at rate 1 (the incoming song), or stop. */
        public boolean runOn;
        public double stopAt = 1e9;
        public final Lane gain = new Lane(0), lowDb = new Lane(0), highDb = new Lane(0), hpHz = new Lane(20), lpHz = new Lane(20000);
        /** editor.md §12: the 1 kHz band, the noise, and the sends to the Effects returns. */
        public final Lane midDb = new Lane(0), noise = new Lane(0), echoSend = new Lane(0), reverbSend = new Lane(0), delaySend = new Lane(0);
        /** Song seconds of decoded audio the deck needs. */
        public double needFrom, needTo;

        /** The unwrapped song second at mix second [t]. */
        public double unwrappedAt(double t) {
            int n = knotT.length;
            if (t <= knotT[0]) return knotP[0] + (t - knotT[0]) * rate(0);
            if (t >= knotT[n - 1]) return knotP[n - 1] + (runOn ? t - knotT[n - 1] : 0);
            int i = 1;
            while (knotT[i] < t) i++;
            double f = (t - knotT[i - 1]) / (knotT[i] - knotT[i - 1]);
            return knotP[i - 1] + (knotP[i] - knotP[i - 1]) * f;
        }

        private double rate(int seg) {
            return (knotP[seg + 1] - knotP[seg]) / (knotT[seg + 1] - knotT[seg]);
        }

        /** The song second heard at mix second [t]: the loop and its release applied. */
        public double trackAt(double t) {
            double u = unwrappedAt(t), len = loopB - loopA;
            if (len > 0 && u >= loopB) return u < release ? loopA + (u - loopA) % len : loopB + (u - release);
            return u;
        }

        /** Song seconds per mix second at [t]. */
        public double rateAt(double t) {
            int n = knotT.length;
            if (t >= knotT[n - 1]) return runOn ? 1 : 0;
            if (t < knotT[0]) return rate(0);
            int i = 1;
            while (knotT[i] <= t) i++;
            return rate(i - 1);
        }

        void knots(List<double[]> k) {
            knotT = new double[k.size()];
            knotP = new double[k.size()];
            for (int i = 0; i < k.size(); i++) {
                knotT[i] = k.get(i)[0];
                knotP[i] = k.get(i)[1];
            }
        }
    }

    // ---- the blend's shapes ----

    static final int EP = 65;

    static float[] ep(boolean in) {
        float[] c = new float[EP];
        for (int i = 0; i < EP; i++) {
            double a = (i / (double) (EP - 1)) * Math.PI / 2;
            c[i] = (float) (in ? Math.sin(a) : Math.cos(a));
        }
        return c;
    }

    /** x held to a..b; a NaN (a zero-length span's 0/0) is a, never passed on to a gain or a filter aim. */
    static double clamp(double x, double a, double b) {
        return Double.isNaN(x) ? a : Math.max(a, Math.min(b, x));
    }

    static double glide(double a, double b, double x) {
        return a * Math.pow(b / a, clamp(x, 0, 1));
    }

    /** crossfade.js djShape: AutoDJ's fader and filter curves (gIn, gOut, inHp, outHp, outLp). */
    static float[][] djShape(String style, double clashIn, double D, double bpm) {
        return djShape(style, clashIn, D, bpm, (int) Math.max(EP, Math.min(4000, Math.ceil(D * 40))));
    }

    /** A plan's shape over [n] points: Automix v2's ladder shapes (drop-in, muffle) or djShape at its bass swap. */
    static float[][] djShape(Planner.Plan m, double D, int n) {
        if ("blend".equals(m.style) && ("dropin".equals(m.shape) || "muffle".equals(m.shape) || "echo".equals(m.shape))) return ladderShape(m, D, n);
        return djShape(m.style, m.clash, D, m.bpm, m.swapAt, n);
    }

    static float[][] djShape(Planner.Plan m, double D) {
        return djShape(m, D, (int) Math.max(EP, Math.min(4000, Math.ceil(D * 40))));
    }

    /** The same over [n] points (the plan's curves sample it more coarsely than the engine plays it). */
    static float[][] djShape(String style, double clashIn, double D, double bpm, int n) {
        return djShape(style, clashIn, D, bpm, Double.NaN, n);
    }

    /**
     * Automix v2's fallback ladder shapes (automix.js ladderShape). Drop-in: the next song at full
     * level on its first beat (20 ms), its bass with it; the playing song closes and fades over the
     * two bars. Muffle: the playing song holds its level while its low-pass closes (18 kHz to 300 Hz)
     * over the lead before the bass swap; the next fades in over the same bars, takes the bass on
     * the swap, and the playing song is gone two beats after it.
     */
    static float[][] ladderShape(Planner.Plan m, double D, int n) {
        final double S = Math.PI / 2;
        int beats = Math.max(1, (m.bars > 0 ? m.bars : 1) * 4);
        float[] gIn = new float[n], gOut = new float[n], inHp = new float[n], outHp = new float[n], outLp = new float[n];
        boolean dropin = "dropin".equals(m.shape);
        if ("echo".equals(m.shape)) {
            // echo out: the playing song's dry sound cut on the catch (10 ms), the next song in at full
            // level with it; the echo (Engine's delay line on the outgoing deck) rings on over it
            double ec = Math.min((m.echo != null ? m.echo.cutSec : Planner.ECHO_CUT_SEC) / D, 0.05);
            for (int i = 0; i < n; i++) {
                double p = i / (double) (n - 1);
                gIn[i] = (float) clamp(p / ec, 0, 1);
                gOut[i] = (float) (1 - clamp(p / ec, 0, 1));
                outLp[i] = 20000;
                outHp[i] = 20;
                inHp[i] = 20;
            }
            return new float[][]{gIn, gOut, inHp, outHp, outLp};
        }
        double e = Math.min(0.02 / D, 0.05);
        double at = m.swapAt > 0 && m.swapAt < 1 ? m.swapAt : 0.5;
        double from = Math.max(0, at - (m.muffleLead > 0 ? m.muffleLead : 0.25));
        double exit = Math.min(1, at + Planner.MUFFLE_EXIT_BEATS / (double) beats), w = 0.5 / beats;
        for (int i = 0; i < n; i++) {
            double p = i / (double) (n - 1);
            if (dropin) {
                gIn[i] = (float) clamp(p / e, 0, 1);
                gOut[i] = (float) Math.cos(p * S);
                outLp[i] = (float) glide(18000, 2000, p);
                outHp[i] = (float) glide(20, 200, clamp(p / e, 0, 1));
                inHp[i] = 20;
            } else {
                double h = clamp((p - at) / w, 0, 1);
                gOut[i] = (float) (p <= at ? 1 : Math.cos(clamp((p - at) / (exit - at), 0, 1) * S));
                gIn[i] = (float) Math.sin(clamp((p - from) / (at - from), 0, 1) * S);
                outLp[i] = (float) glide(18000, 300, (p - from) / (at - from));
                outHp[i] = (float) glide(20, 200, h);
                inHp[i] = (float) glide(20, 200, 1 - h);
            }
        }
        return new float[][]{gIn, gOut, inHp, outHp, outLp};
    }

    /** djShape with the bass swap at [swapAtIn] (0..1; else on the bar nearest the middle). */
    static float[][] djShape(String style, double clashIn, double D, double bpm, double swapAtIn, int n) {
        return djShape(style, clashIn, D, bpm, swapAtIn, n, 0);
    }

    /**
     * The same with B held [lateSec] into the mix (mix-file.md rule 2, "A while B is held"): the
     * equal-power trim is worked out from B's heard gain (0 while held, its LATE_RISE_SEC rise, then
     * its curve), so A plays its own curve alone and its trim follows B in. The curves as drawn or
     * saved don't change (they call this without a delay).
     */
    static float[][] djShape(String style, double clashIn, double D, double bpm, double swapAtIn, int n, double lateSec) {
        double clash = clamp(clashIn, 0, 1);
        double beat = bpm > 0 ? 60 / bpm : 0;
        double grid = beat > 0 ? D / beat : 0;
        java.util.function.DoubleUnaryOperator onBar = (f) -> grid >= 8 ? clamp(Math.round((f * grid) / 4) * 4 / grid, 4 / grid, 1 - 4 / grid) : f;
        double w = grid >= 2 ? 0.5 / grid : 0.2;
        double swapAt = swapAtIn > 0 && swapAtIn < 1 ? swapAtIn : onBar.applyAsDouble(0.5);
        java.util.function.DoubleUnaryOperator h = (p) -> clamp((p - (swapAt - w)) / w, 0, 1);
        final double S = Math.PI / 2;
        float[] gIn = new float[n], gOut = new float[n], inHp = new float[n], outHp = new float[n], outLp = new float[n];
        boolean filter = style.equals("filter");
        double top = filter ? glide(1200, 2400, clash) : glide(520, 950, clash);
        double openBy = onBar.applyAsDouble(filter ? 0.6 + 0.18 * clash : 0.45 + 0.25 * clash);
        double from = onBar.applyAsDouble(0.3 - 0.18 * clash), floor = glide(2200, 1100, clash);
        double fallFrom = Math.max(0, Math.min(Math.min(swapAt, 0.5), grid != 0 ? 1 - 4 / grid : 0.5));
        for (int i = 0; i < n; i++) {
            double p = i / (double) (n - 1);
            double hp = h.applyAsDouble(p);
            double entry = p >= openBy ? 20 : glide(20, top, Math.pow(1 - p / openBy, 0.35));
            outHp[i] = (float) glide(20, 200, hp);
            double r, f;
            if (filter) {
                outLp[i] = (float) glide(7000, 300, Math.pow(p, 0.75));
                inHp[i] = (float) Math.max(entry, glide(20, 200, 1 - hp));
                r = Math.sin(Math.pow(p, 0.8) * S);
                f = Math.cos(Math.pow(p, 1.6) * S);
            } else {
                outLp[i] = (float) glide(20000, floor, (p - from) / (1 - from));
                inHp[i] = (float) Math.max(glide(20, 200, 1 - hp), entry);
                double rp = Math.sin(p * S), rd = Math.sin(clamp(p / swapAt, 0, 1) * S);
                double fp = Math.cos(p * S), fd = p <= fallFrom ? 1 : Math.cos(((p - fallFrom) / (1 - fallFrom)) * S);
                r = rp + (rd - rp) * (1 - clash);
                f = fp + (fd - fp) * (1 - clash);
            }
            r += (Math.sin(Math.pow(p, 1.65) * S) - r) * clash;
            f += (Math.cos(Math.pow(p, 0.65) * S) - f) * clash;
            // B as heard: nothing while held, then its 10 ms rise into its curve
            double heard = lateSec > 0 ? r * clamp((p * D - lateSec) / Engine.LATE_RISE_SEC, 0, 1) : r;
            double trim = heard + f <= 1 ? 1 : Math.max(0.5, 1 / Math.sqrt(heard + f));
            gIn[i] = (float) (r * trim);
            gOut[i] = (float) (f * trim);
        }
        return new float[][]{gIn, gOut, inHp, outHp, outLp};
    }

    // ---- building ----

    /**
     * A blend, filter mix or crossfade (not a fallback onto Morphe's crossfade). [outDuration]: the
     * playing song's length as the player reports it.
     */
    /** A's speed over the hand lead: its playlist speed (spotify-mixes.md rule 10), else x1. */
    static double leadRate(Planner.Plan p) {
        return !Double.isNaN(p.speedOut) ? p.speedOut : 1;
    }

    public static Mix blend(Planner.Plan p, String outId, String inId, double outDuration) {
        Mix m = new Mix();
        m.plan = p;
        m.style = p.style;
        m.v2 = p.v2 && !p.style.equals("crossfade");
        m.outId = outId;
        m.inId = inId;
        double R = p.outRate > 0 ? p.outRate : 1, b = p.beatSec, mixOut = p.mixOutTrackTime, rate = p.rate;
        int n = p.style.equals("blend") ? p.rampBeats : 0;
        double rampSong = n * (b > 0 ? b : 0);
        // A at its playlist speed (spotify-mixes.md rule 10) plays the hand lead at it, as YT played it
        double lead = leadRate(p);
        m.home = !Double.isNaN(p.speedIn) ? p.speedIn : 1;
        m.takeoverSong = mixOut - HAND_LEAD * lead - rampSong;
        // outgoing: rate 1 to the ramp, one 0.75% step per beat up to R (rampOutgoing), R through the blend
        List<double[]> ok = new ArrayList<>();
        ok.add(new double[]{0, m.takeoverSong});
        double t = HAND_LEAD, pos = mixOut - rampSong;
        ok.add(new double[]{t, pos});
        for (int k = 1; k <= n; k++) {
            double r = 1 + ((R - 1) * k) / n;
            t += b / r;
            pos += b;
            ok.add(new double[]{t, pos});
        }
        m.t0 = t;
        m.D = p.durationSec;
        Planner.GlideSteps G = p.style.equals("blend") && p.glide != null ? Planner.glideSteps(p.glide.q, p.glide.beats, p.glide.beatOutSec) : null;
        if (G != null) {
            // Automix v2's glide (crossfade.js glideOutgoing): from the mix-out, one rate per beat,
            // the last held after the blend while the playing song fades
            int B = G.outRate.length;
            double gb = p.glide.beatOutSec, last = G.outRate[B - 1];
            m.beats = new double[B + 1];
            for (int k = 0; k < B; k++) {
                if (k > 0) ok.add(new double[]{m.t0 + G.at[k], mixOut + k * gb}); // (k = 0: the mix-out, added above)
                m.beats[k] = m.t0 + G.at[k];
            }
            m.beats[B] = m.t0 + G.total;
            ok.add(new double[]{m.t0 + G.total, mixOut + B * gb});
            ok.add(new double[]{m.t0 + G.total + 1, mixOut + B * gb + last});
            m.out.knots(ok);
            m.out.stopAt = m.t0 + m.D + 0.2;
            m.out.needFrom = m.takeoverSong - 1;
            m.out.needTo = mixOut + B * gb + last + 1;
            m.outEnd = m.t0 + G.total + Math.max(0, outDuration - (mixOut + B * gb)) / last;
            // the next song (deckGlideIn): one rate per beat, ending at x1.0 with the blend
            List<double[]> ik = new ArrayList<>();
            double mixIn = p.mixInTrackTime;
            for (int k = 0; k < B; k++) ik.add(new double[]{m.t0 + G.at[k], mixIn + k * G.beatInSec});
            ik.add(new double[]{m.t0 + G.total, mixIn + B * G.beatInSec});
            ik.add(new double[]{m.t0 + G.total + 0.5, mixIn + B * G.beatInSec + 0.5});
            m.in.knots(ik);
            m.in.runOn = true;
            m.elementAt = m.t0 + G.total + 1;
            m.in.needFrom = mixIn - 1;
            m.in.needTo = m.in.trackAt(m.elementAt) + 30;
            m.askAt = Math.min(Math.min(m.t0 + m.D / 2, m.t0 + m.D - 1.5 - NEXT_LEAD), m.outEnd - 1.5);
            shape(m, p, rate);
            return m;
        }
        // a filter mix's plan has no beatSec (plan.schema fixtures pin it): its pulse counts A's bar / 4
        double pb = b > 0 ? b : p.style.equals("filter") && p.barSec > 0 ? p.barSec / 4 : 0;
        if (pb > 0) {
            // the ramp's beats as laid out above, then the blend's at the outgoing song's speed
            List<Double> bt = new ArrayList<>();
            for (int k = 1; k < ok.size(); k++) bt.add(ok.get(k)[0]);
            for (double x = m.t0 + pb / R; x <= m.t0 + m.D + 1e-6; x += pb / R) bt.add(x);
            m.beats = new double[bt.size()];
            for (int k = 0; k < bt.size(); k++) m.beats[k] = bt.get(k);
        }
        ok.add(new double[]{m.t0 + m.D + 1, mixOut + (m.D + 1) * R});
        m.out.knots(ok);
        m.out.stopAt = m.t0 + m.D + 0.2;
        m.out.needFrom = m.takeoverSong - 1;
        m.out.needTo = mixOut + (m.D + 1) * R + 1;
        m.outEnd = m.t0 + (outDuration - mixOut) / R;

        // incoming: [rate] through the blend, then back to its own tempo on our deck, 0.25% every
        // 0.25 s (the extension's deckGlideBack, and the plan's curves): a smooth glide, not steps
        double mixIn = p.mixInTrackTime;
        // (a late entry: B's first point that long into the mix, crossfade.js inStartOf; the curves still from t0)
        double late = p.inDelaySec > 0 ? Math.min(p.inDelaySec, m.D) : 0;
        if (late > 0) m.inStart = m.t0 + late;
        List<double[]> ik = new ArrayList<>();
        ik.add(new double[]{m.t0 + late, mixIn});
        double it = m.t0 + m.D, ip = mixIn + (m.D - late) * rate;
        ik.add(new double[]{it, ip});
        // (B at a playlist speed glides back to it, not to x1: spotify-mixes.md rule 10)
        double home = m.home;
        if (Math.abs(home - 1) < 1e-9 ? Math.abs(rate - 1) < 0.002 : Math.abs(rate - home) < 1e-9) {
            ik.add(new double[]{it + 0.5, ip + 0.5 * rate});
            it += 0.5;
        } else {
            int steps = Math.max(1, (int) Math.ceil(Math.abs(rate - home) / GLIDE_STEP));
            double r = rate;
            for (int i = 1; i <= steps; i++) {
                it += GLIDE_STEP_SEC;
                ip += GLIDE_STEP_SEC * r;
                ik.add(new double[]{it, ip});
                r = i == steps ? home : rate + (home - rate) * i / (double) steps;
            }
            // ...and on at its own speed to the takeover
            ik.add(new double[]{it + 0.5, ip + 0.5 * home});
            it += 0.5;
        }
        // B at its playlist speed runs on at it for as long as YT may take to take over (past its
        // last knot the renderer runs on at x1)
        if (Math.abs(m.home - 1) > 1e-9) {
            double[] l = ik.get(ik.size() - 1);
            ik.add(new double[]{l[0] + 120, l[1] + 120 * m.home});
        }
        m.in.knots(ik);
        m.in.runOn = true;
        m.elementAt = it + 0.5;
        m.in.needFrom = mixIn - 1;
        m.in.needTo = m.in.trackAt(m.elementAt) + 30;
        m.askAt = Math.min(Math.min(m.t0 + m.D / 2, m.t0 + m.D - 1.5 - NEXT_LEAD), m.outEnd - 1.5);
        shape(m, p, rate);
        return m;
    }

    /** The blend's gains, EQ and filters, and its names (scheduleDeckBlend, blendShape). */
    private static void shape(Mix m, Planner.Plan p, double rate) {
        if (p.preset != null && p.curves != null) {
            preset(m, p);
        } else {
            planned(m, p);
        }
        String name = p.v3 ? "Automix v2" : m.v2 ? "Automix Classic" : "Automix";
        String kind = "dropin".equals(p.shape) ? " · drop-in" : "muffle".equals(p.shape) ? " · muffle" : "echo".equals(p.shape) ? " · echo out"
                : p.glide != null ? " · glide" : "";
        m.title = p.style.equals("blend") ? name + kind : p.style.equals("filter") ? name + " · filter mix"
                : p.handoff ? "Automix v2 · hand-over" : p.bridge ? "Automix v2 · beatless bridge" : "Automix · crossfade";
        m.sub = p.style.equals("crossfade")
                ? String.format(Locale.US, "%.1f s%s", m.D, p.reason != null ? " · " + p.reason : "")
                : String.format(Locale.US, "%d bars · %.1f s · %d BPM%s", p.bars, m.D, Math.round(p.bpm),
                p.glide != null ? String.format(Locale.US, " · glide ×%.3f", p.glide.q) : p.style.equals("blend") && Math.abs(rate - 1) > 0.002 ? String.format(Locale.US, " · ×%.3f", rate) : "");
        m.note = p.toString() + (p.kick != null ? "; " + p.kick : "");
    }

    /** The planner's own fader, EQ and filters (scheduleDeckBlend, blendShape). */
    private static void planned(Mix m, Planner.Plan p) {
        // gains: AutoDJ's fader for a version 2 blend or filter mix, else equal power; Automix v2's loudness trim on either
        // B held into the mix (a late entry): its trim from B's heard gain, sampled every 5 ms so A's
        // trim follows B's 10 ms rise rather than a step between coarser points
        double late = m.inStart > 0 ? m.inStart - m.t0 : 0;
        float[][] dj = !m.v2 ? null : late > 0 && p.shape == null
                ? djShape(p.style, p.clash, m.D, p.bpm, p.swapAt, (int) Math.max(EP, Math.min(8000, Math.ceil(m.D * 200))), late)
                : djShape(p, m.D);
        float[][] g = Curves.trimmed(p, dj != null ? dj[0] : ep(true), dj != null ? dj[1] : ep(false));
        float[] gIn = g[0], gOut = g[1];
        m.out.gain.set(0, -H).lin(1, 0).set(1, m.t0).curve(gOut, m.t0, m.D).set(0, m.t0 + m.D);
        m.in.gain.set(0, 0).curve(gIn, m.t0, m.D).set(1, m.t0 + m.D);

        // the EQ and filters (blendShape)
        double mid = m.t0 + m.D / 2, bar = Math.min(p.barSec, m.D / 2);
        if (dj != null) {
            m.in.hpHz.set(dj[2][0], 0).curve(dj[2], m.t0, m.D);
            double ease = Math.max(0.01, m.t0 - 0.03);
            m.out.lpHz.set(20000, ease).lin(dj[4][0], m.t0 - 0.001).curve(dj[4], m.t0, m.D);
            m.out.hpHz.set(20, ease).lin(dj[3][0], m.t0 - 0.001).curve(dj[3], m.t0, m.D);
        } else if (p.style.equals("blend") || p.style.equals("filter")) {
            m.in.lowDb.set(p.swapDb, 0).set(p.swapDb, mid - bar / 2).lin(0, mid + bar / 2);
            m.out.lowDb.set(0, mid - bar / 2).lin(p.swapDb, mid + bar / 2);
            if (p.style.equals("blend")) {
                m.out.highDb.set(0, m.t0).lin(-8, m.t0 + m.D);
                m.in.highDb.set(-8, 0).set(-8, m.t0).lin(0, m.t0 + m.D);
            } else {
                m.out.hpHz.set(20, m.t0).exp(1800, m.t0 + m.D);
                m.in.lpHz.set(350, 0).set(350, m.t0).exp(20000, m.t0 + m.D);
            }
        }
    }

    /**
     * The editor's preset (editor.md §9): the plan's own curves play as points (linear; Hz
     * exponential; two points at one t a step), the loudness trim on the faders (crossfade.js
     * presetGains, presetShape). A curve the preset leaves out stays neutral.
     */
    private static void preset(Mix m, Planner.Plan p) {
        Curves c = p.curves;
        Planner.Trim t = p.trim;
        boolean trim = t != null && (t.inDb != 0 || t.outDb != 0);
        double gi = trim ? Math.pow(10, t.inDb / 20) : 1, go = trim ? Math.pow(10, t.outDb / 20) : 1;
        // the curves are over their own window (P); the times fit to the seconds the mix has (m.D)
        double P = c.durationSec > 0 ? c.durationSec : m.D;
        m.out.gain.set(0, -H).lin(1, 0).set(1, m.t0);
        play(m.out.gain, c.out.get("gain"), m.t0, P, m.D, false, trim ? x -> 1 + (go - 1) * x * x * (3 - 2 * x) : null);
        m.out.gain.set(0, m.t0 + m.D);
        m.in.gain.set(0, 0);
        play(m.in.gain, c.in.get("gain"), m.t0, P, m.D, false, trim ? x -> gi + (1 - gi) * x * x * (3 - 2 * x) : null);
        m.in.gain.set(1, m.t0 + m.D);
        play(m.out.lowDb, c.out.get("bassDb"), m.t0, P, m.D, false, null);
        play(m.in.lowDb, c.in.get("bassDb"), m.t0, P, m.D, false, null);
        play(m.out.highDb, c.out.get("highDb"), m.t0, P, m.D, false, null);
        play(m.in.highDb, c.in.get("highDb"), m.t0, P, m.D, false, null);
        play(m.out.hpHz, c.out.get("highpassHz"), m.t0, P, m.D, true, null);
        play(m.in.hpHz, c.in.get("highpassHz"), m.t0, P, m.D, true, null);
        play(m.out.lpHz, c.out.get("lowpassHz"), m.t0, P, m.D, true, null);
        play(m.in.lpHz, c.in.get("lowpassHz"), m.t0, P, m.D, true, null);
        // editor.md §12: the mid band, then the noise and the sends, 0 after the window (the noise
        // plays to the window's end; the returns' tails ring on)
        play(m.out.midDb, c.out.get("midDb"), m.t0, P, m.D, false, null);
        play(m.in.midDb, c.in.get("midDb"), m.t0, P, m.D, false, null);
        m.mid = !m.out.midDb.empty() || !m.in.midDb.empty();
        String[] keys = {"noise", "echoSend", "reverbSend", "delaySend"};
        for (int side = 0; side < 2; side++) {
            Deck d = side == 0 ? m.out : m.in;
            Lane[] lanes = {d.noise, d.echoSend, d.reverbSend, d.delaySend};
            for (int k = 0; k < keys.length; k++) {
                double[][] pts = (side == 0 ? c.out : c.in).get(keys[k]);
                if (pts == null || pts.length == 0) continue;
                play(lanes[k], pts, m.t0, P, m.D, false, null);
                lanes[k].set(0, m.t0 + m.D + 0.002);
                if (k == 0) m.noise = true;
                else m.fx = true;
            }
        }
        if (c.fxTime != null) {
            m.echoSec = c.fxTime[0];
            m.delaySec = c.fxTime[1];
        }
        if (m.fx) {
            // the tails ring on after the window: the next song's player takes over once they have
            m.elementAt = Math.max(m.elementAt, m.t0 + m.D + FxBus.tailSec(m));
            m.in.needTo = Math.max(m.in.needTo, m.in.trackAt(m.elementAt) + 30);
        }
        // the Looping lane (editor.md §13): from the mix-out A plays its first loopSec seconds again
        // and again until it ends; a glide plays no loop (its rate steps every beat)
        if (p.loopSec > 0 && p.glide == null && !Double.isNaN(p.mixOutTrackTime)) {
            m.out.loopA = p.mixOutTrackTime;
            m.out.loopB = p.mixOutTrackTime + p.loopSec;
            m.out.release = 1e18;
        }
    }

    /**
     * A curve's points onto a lane from t0, [mul] scaling them by the window's fraction (sampled in 32
     * steps too). [D]: the curves' window; [Dplay]: the seconds the mix really has, the times fit to it
     * (crossfade.js curveEvents).
     */
    static void play(Lane lane, double[][] pts, double t0, double D, double Dplay, boolean geo, java.util.function.DoubleUnaryOperator mul) {
        if (pts == null || pts.length == 0) return;
        java.util.TreeSet<Double> ts = new java.util.TreeSet<>();
        for (double[] q : pts) ts.add(Math.round(q[0] * 1e6) / 1e6);
        if (mul != null) for (int k = 0; k <= 32; k++) ts.add(Math.round(D * k / 32 * 1e6) / 1e6);
        double fit = Dplay > 0 && D > 0 ? Dplay / D : 1;
        boolean first = true;
        for (double tt : ts) {
            double k = mul != null ? mul.applyAsDouble(clamp(tt / D, 0, 1)) : 1;
            int n = 0;
            double v0 = 0, v1 = 0;
            for (double[] q : pts) {
                if (Math.abs(q[0] - tt) < 1e-6) {
                    if (n == 0) v0 = q[1];
                    v1 = q[1];
                    n++;
                }
            }
            if (n == 0) v0 = v1 = Overview.value(pts, tt, 0);
            if (first) {
                // held from the window's start up to the first point (editor.md §3), as the overview draws it
                if (tt > 0) lane.set(v0 * k, t0);
                lane.set(v0 * k, t0 + tt * fit);
                first = false;
            } else if (geo && v0 > 0) {
                lane.exp(v0 * k, t0 + tt * fit);
            } else {
                lane.lin(v0 * k, t0 + tt * fit);
            }
            if (n > 1) lane.set(v1 * k, t0 + tt * fit);
        }
    }

    /** The loop mix, its clock from the outgoing loop's start (scheduleLoopMix). */
    public static Mix loop(Planner.LoopPlan lp, String outId, String inId, double outDuration) {
        Planner.LoopSchedule x = Planner.loopSchedule(lp, 0);
        Mix m = new Mix();
        m.style = "loop";
        m.loopPlan = lp;
        m.outId = outId;
        m.inId = inId;
        m.takeoverSong = lp.out.loopStart;
        m.t0 = 0;
        m.D = x.elementAt;
        int beats = x.beats;
        List<double[]> ok = new ArrayList<>(), ik = new ArrayList<>();
        for (int k = 0; k <= beats; k++) {
            ok.add(new double[]{x.beatTimes[k], lp.out.loopStart + k * lp.out.beatSec});
            ik.add(new double[]{x.beatTimes[k], lp.in.loopStart + k * lp.fold * lp.in.beatSec});
        }
        m.out.knots(ok);
        m.out.loopA = lp.out.loopStart;
        m.out.loopB = lp.out.loopEnd;
        m.out.stopAt = x.releaseAt + 0.05;
        m.out.needFrom = lp.out.loopStart - 1;
        m.out.needTo = lp.out.loopEnd + 1;
        m.in.knots(ik);
        m.beats = x.beatTimes.clone(); // the ramp and the settle bars, up to the handover
        m.in.loopA = lp.in.loopStart;
        m.in.loopB = lp.in.loopEnd;
        m.in.release = ik.get(beats)[1];
        m.in.runOn = true;
        m.in.needFrom = lp.in.loopStart - 1;
        m.in.needTo = x.elementTrackTime + 30;
        m.elementAt = x.elementAt;
        m.outEnd = outDuration - lp.out.loopStart;
        m.askAt = Math.min(Math.min(x.handoffAt, x.elementAt - 1.5 - NEXT_LEAD), m.outEnd - 1.5);

        double cut = Planner.BASS_CUT_DB;
        // the baseline's gains (the extension's d26dc16): A 1 through the enter bars, to 0.6 over the
        // ramp, to 0 at the release; B to 0.55 over the enter bars, to 1 over the ramp
        m.out.gain.set(0, -H).lin(1, 0).set(1, x.enterEnd).lin(0.6, x.rampEnd).lin(0, x.releaseAt);
        m.in.gain.set(0, 0).lin(0.55, x.enterEnd).lin(1, x.rampEnd);
        m.in.lowDb.set(cut, 0).set(cut, x.mid - x.bar / 2).lin(0, x.mid + x.bar / 2);
        m.out.lowDb.set(0, x.mid - x.bar / 2).lin(cut, x.mid + x.bar / 2);
        m.out.hpHz.set(20, x.rampEnd).exp(1500, x.releaseAt);

        m.title = "Automix · loop mix";
        m.sub = String.format(Locale.US, "%d-bar loop · %d→%d BPM · %.1f s", lp.out.bars, Math.round(lp.out.bpm), Math.round(lp.in.bpm), m.D);
        m.note = lp.toString();
        return m;
    }
}
