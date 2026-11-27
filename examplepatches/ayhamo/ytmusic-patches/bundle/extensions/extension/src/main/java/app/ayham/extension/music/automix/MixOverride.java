package app.ayham.extension.music.automix;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * A user's edit of one pair's transition (spec/automix/editor.md, override.schema.json), saved per
 * pair under "fromId>toId". A field left out is Auto; an override with nothing but Auto in it is
 * no override (Auto is the reset). A port of automix.js normalizeOverride, migratePick,
 * presetCurves, resolveWindow and the drawn curves (pointCurves, drawSec, normalizeDrawing,
 * shapeDrawing), checked against spec/automix/editor-cases.json.
 */
public final class MixOverride {
    /** editor.md §2: Spotify's presets in its order (smooth is its Fade, none its No transition), then Loop. */
    public static final String[] PRESETS = {"auto", "custom", "smooth", "rise", "wave", "blend", "slam", "melt", "afterglow", "surge", "dissolve", "none", "loop"};
    public static final String[] VOLUMES = {"smooth", "crossfade", "overlap", "cutInFadeOut", "fadeInCutOut", "centerCut", "fadeInFadeOut", "fadeInFastOut",
            "fadeIn1BarCutOut", "overlap1BarCutOut"};
    public static final String[] EQS = {"centerBassSwap", "endBassSwap", "threeBandFade", "quickBassCut", "none", "startBassSwap", "longBassCut", "bassFadeOut"};
    public static final String[] EFFECTS = {"none", "lpOut", "hpIn", "lpBoth", "hpBoth", "lpInHpOut", "hpOut", "lpIn", "hpInLpOut", "hpHalfOut", "noiseOutEnd"};
    /** The Effects lane (editor.md §12): missing is none, and none is not stored. */
    public static final String[] FXS = {"none", "echo1CutEnd", "echo34CutEnd", "echoHalfCutEnd", "echo1OutEnd", "echo34OutEnd", "echoHalfOutEnd",
            "delay34CutEnd", "delayHalfCutEnd", "reverbCutEnd", "reverbOutEnd", "reverbOutCenter"};
    /** The Looping lane (editor.md §13): a shape only, never drawn; missing is none, and none is not stored. */
    public static final String[] LOOPINGS = {"none", "loop1", "loop2", "loop4", "loop8", "loop16"};
    /** lanes()'s index of the Looping lane (after the drawable LANES). */
    public static final int LOOPING = 4;
    public static final String[] BEAT_MATCH = {"auto", "sync", "glide", "off"};
    public static final int[] BARS = {2, 4, 8, 16, 32};
    /** Unlocked overrides kept (oldest saved first out); locked ones have a cap of their own. */
    public static final int MAX_UNLOCKED = 300, MAX_LOCKED = 300;

    static final double CUT_DB = Planner.BASS_CUT_DB, LP_CLOSED = 400, HP_CLOSED = 1000, CUT_RAMP_SEC = 0.008;

    /** null: Auto. */
    public String preset;
    /**
     * A saved preset no longer offered (editor.md §6): Automatic plays, with a notice; the pick stays
     * saved under its name. Only set while preset is null.
     */
    public String retiredPreset;
    /**
     * Read from a pick saved before the editor as blend, filter or crossfade (the master's preset "auto"
     * after migratePick): the planner's reason is "picked in the overview". Not saved: an edit saves it
     * normalized, as the master does.
     */
    public boolean migrated;
    /** volume, eq, effect, fx: only with preset custom. A drawn lane is "draw", its points in [drawn]; fx null: none. */
    public String volume, eq, effect, fx;
    /** The Looping lane (§13), only with preset custom; null: none. */
    public String looping;
    /** The drawn lanes (editor.md §10), by lane index (volume, eq, effect, fx); null: a shape name. */
    public Drawing[] drawn = new Drawing[LANE_COUNT];
    /** Each song's speed in the playlist the mix came from (spotify-mixes.md rule 10); NaN: x1. */
    public double speedOut = Double.NaN, speedIn = Double.NaN;
    /** 0: Auto. */
    public int bars;
    /** null: Auto. */
    public String beatMatch;
    public Position out, in;
    public boolean lock;
    /**
     * The tempo of A that bars and beat drawings count on (mix-file.md rule 2, 4), 0: none. An app
     * reading A at half or double it folds the beats (fold); not an edit on its own.
     */
    public double gridBpm;
    /** Only in picks migrated from {style, bars}: blend | filter, the planner's own mix forced. */
    public String family;
    public int engine;
    public long savedAt;

    /** A window position on a song's grid (override.schema.json $defs.position). */
    public static final class Position {
        public int bar, beat, nudgeMs;
        public double sec;
        /** No bar: seconds only, as a mix file from another app gives it (editor.md §6), played at the song's nearest beat. */
        public final boolean secOnly;
        /** window.in only (mix-file.md rule 2 [all], B's late entry): B comes in this long after the mix starts; 0: with it. */
        public double delaySec;

        public Position(int bar, int beat, int nudgeMs, double sec) {
            this(bar, beat, nudgeMs, sec, false);
        }

        public Position(int bar, int beat, int nudgeMs, double sec, boolean secOnly) {
            this.bar = secOnly ? 0 : bar;
            this.beat = secOnly ? 0 : beat;
            this.nudgeMs = nudgeMs;
            this.sec = sec;
            this.secOnly = secOnly;
        }

        public static Position secondsOnly(int nudgeMs, double sec) {
            return new Position(0, 0, nudgeMs, sec, true);
        }

        Position copy() {
            Position c = new Position(bar, beat, nudgeMs, sec, secOnly);
            c.delaySec = delaySec;
            return c;
        }

        /** A copy (with B's late entry) for the editor. */
        public Position copyOf() {
            return copy();
        }
    }

    /** A saved position read back on a song's grid: song seconds, and whether the grid moved under it. */
    public static final class Resolved {
        public final double sec;
        public final boolean moved, snapped;
        /** The bar it snapped to when moved, else the saved one. */
        public final int bar;

        Resolved(double sec, boolean moved, boolean snapped, int bar) {
            this.sec = sec;
            this.moved = moved;
            this.snapped = snapped;
            this.bar = bar;
        }
    }

    public MixOverride copy() {
        MixOverride o = new MixOverride();
        o.preset = preset;
        o.volume = volume;
        o.eq = eq;
        o.effect = effect;
        o.fx = fx;
        o.looping = looping;
        o.speedOut = speedOut;
        o.speedIn = speedIn;
        o.bars = bars;
        o.beatMatch = beatMatch;
        o.out = out == null ? null : out.copy();
        o.in = in == null ? null : in.copy();
        o.lock = lock;
        o.gridBpm = gridBpm;
        o.family = family;
        o.engine = engine;
        o.savedAt = savedAt;
        o.migrated = migrated;
        o.retiredPreset = retiredPreset;
        o.drawn = drawn.clone();
        return o;
    }

    /** The preset as the planner reads it ("auto" when none). */
    public String presetOrAuto() {
        return preset == null ? "auto" : preset;
    }

    public String beatMatchOrAuto() {
        return beatMatch == null ? "auto" : beatMatch;
    }

    /**
     * The beat match this mix plays with (mix-file.md rule 6, automix.js beatMatchOf): its own when it
     * has one; an imported mix (it carries gridBpm, which the editor never sets) beat-matches as Sync;
     * else Auto. A loop mix: Auto (its decks do their own tempo ramp).
     */
    public String beatMatchOf() {
        if (loop()) return "auto";
        if (beatMatch != null) return beatMatch;
        return gridBpm > 0 ? "sync" : "auto";
    }

    /** Carries gridBpm: the mix came from a file (mix-file.md rule 2), not the editor. */
    public boolean imported() {
        return gridBpm > 0;
    }

    /** No transition (editor.md §2): no mix, no crossfade; A plays to its end, then B from its start. */
    public boolean noTransition() {
        return "none".equals(preset);
    }

    /** The loop mix asked for. */
    public boolean loop() {
        return "loop".equals(preset);
    }

    /** The user's own choice beyond Auto: the planner's style gates warn instead of refusing (editor.md §6). */
    public boolean forced() {
        return (preset != null && !preset.equals("auto") && !preset.equals("loop"))
                || "sync".equals(beatMatch) || "glide".equals(beatMatch) || out != null || in != null;
    }

    /** The length the window asks for in bars (a preset's own default when Auto), 0: Auto. */
    // ---------------------------------------------------------------------------------------------
    // half and double time (mix-file.md rule 4, automix.js foldFactor, foldOverride, foldNote)

    static final double FOLD_TOL = 0.04;

    /** The factor between this app's tempo for A and gridBpm: 1, 2 or ½ (within 4%), NaN when they don't fold. */
    public static double foldFactor(double gridBpm, double bpm) {
        if (!(gridBpm > 0) || !(bpm > 0)) return Double.NaN;
        double r = bpm / gridBpm;
        for (double k : new double[]{1, 2, 0.5}) if (Math.abs(r / k - 1) <= FOLD_TOL) return k;
        return Double.NaN;
    }

    /** Whether anything counts beats: a length, or a drawing in beats. */
    public boolean countsBeats() {
        if (bars > 0) return true;
        if (!"custom".equals(preset)) return false;
        String[] l = lanes();
        for (int k = 0; k < LANES.length; k++) if (DRAW.equals(l[k]) && drawn[k] != null && "beat".equals(drawn[k].unit)) return true;
        return false;
    }

    /** An override on this app's grid: k, and a note when the beats are taken as they are or a length changes. */
    public static final class Fold {
        public final MixOverride ov;
        public final double k;
        public final String note;

        Fold(MixOverride ov, double k, String note) {
            this.ov = ov;
            this.k = k;
            this.note = note;
        }
    }

    /** foldOverride: the beats (bars, drawings in beats) times k, and gridBpm with them; bpm: this app's tempo for A. */
    public static Fold fold(MixOverride o, double bpm) {
        if (o == null || !o.countsBeats() || !(o.gridBpm > 0) || !(bpm > 0)) return new Fold(o, 1, null);
        double k = foldFactor(o.gridBpm, bpm);
        if (Double.isNaN(k)) {
            return new Fold(o, k, "drawn at " + Math.round(o.gridBpm) + " BPM, this song reads " + Math.round(bpm) + " BPM: its beats are taken as they are");
        }
        if (k == 1) return new Fold(o, k, null);
        MixOverride c = o.copy();
        for (int i = 0; i < LANES.length; i++) {
            Drawing d = c.drawn[i];
            if (d == null || !"beat".equals(d.unit)) continue;
            Drawing s = new Drawing(d.unit).timed(d);
            for (int side = 0; side < 2; side++) {
                Map<String, double[][]> from = side == 0 ? d.out : d.in, to = side == 0 ? s.out : s.in;
                for (Map.Entry<String, double[][]> e : from.entrySet()) {
                    double[][] p = new double[e.getValue().length][];
                    for (int j = 0; j < p.length; j++) p[j] = new double[]{r3(e.getValue()[j][0] * k), e.getValue()[j][1]};
                    to.put(e.getKey(), p);
                }
            }
            c.drawn[i] = s;
        }
        String note = null;
        if (c.bars > 0) {
            double want = c.bars * k;
            boolean chip = false;
            for (int b : BARS) chip |= b == want;
            c.bars = chip ? (int) want : want > 32 ? 32 : 2;
            if (c.bars != want) note = (want == Math.rint(want) ? String.valueOf((long) want) : String.valueOf(want)) + " bars on this song's grid: " + c.bars + " play";
        }
        c.gridBpm = Math.round(o.gridBpm * k * 100) / 100.0;
        return new Fold(c, k, note);
    }

    /** The import summary's note for one mix (mix-file.md rule 7): no tempo, or one that doesn't fold; null: none. */
    public static String foldNote(MixOverride o, double bpm) {
        if (o == null || !o.countsBeats()) return null;
        if (!(o.gridBpm > 0)) return "no gridBpm: its beats are taken as they are";
        return fold(o, bpm).note;
    }

    public int pinnedBars() {
        if (loop()) return 0;
        return noTransition() ? 0 : bars;
    }

    // ---------------------------------------------------------------------------------------------
    // reading and writing (override.schema.json; a pick from before the editor migrates as read)

    /** An override or a pick from before the editor ({style, bars}), as saved JSON; null: Auto. */
    @SuppressWarnings("unchecked")
    public static MixOverride fromJson(Object json) {
        if (!(json instanceof Map)) return null;
        Map<String, Object> m = (Map<String, Object>) json;
        MixOverride o = new MixOverride();
        if (m.containsKey("style")) {
            // editor.md §1: today's picks migrate as they're read
            Object st = m.get("style");
            if ("loop".equals(st)) o.preset = "loop";
            else if ("blend".equals(st) || "filter".equals(st)) o.family = (String) st;
            else if ("crossfade".equals(st)) o.beatMatch = "off";
            o.bars = intOf(m.get("bars"), 0);
            MixOverride n = normalize(o);
            if (n != null) n.migrated = "blend".equals(st) || "filter".equals(st) || "crossfade".equals(st);
            return n;
        }
        o.preset = str(m.get("preset"));
        if (o.preset != null && !o.preset.equals("auto") && !Arrays.asList(PRESETS).contains(o.preset)) {
            o.retiredPreset = o.preset;
            o.preset = null;
        }
        Object lanes = m.get("lanes");
        if (lanes instanceof Map) {
            Map<String, Object> l = (Map<String, Object>) lanes;
            for (int k = 0; k < LANES.length; k++) {
                Object v = l.get(LANES[k]);
                // (the Effects lane may be missing: none, editor.md §12 rule 1)
                if (v == null && k == FX) v = "none";
                String name = str(v);
                if (v instanceof Map) {
                    // a drawing (editor.md §10 rule 2): "none" when no curve is left, null: invalid
                    Object d = normalizeDrawing(LANES[k], v);
                    if (d instanceof Drawing) {
                        name = DRAW;
                        o.drawn[k] = (Drawing) d;
                    } else name = (String) d;
                }
                o.setLane(k, name);
            }
            // the Looping lane (§13): a shape name only; missing is none, anything else is invalid
            Object lv = l.get("looping");
            o.setLane(LOOPING, lv == null ? "none" : lv instanceof String ? (String) lv : "?");
        }
        o.bars = intOf(m.get("bars"), 0);
        o.beatMatch = str(m.get("beatMatch"));
        Object w = m.get("window");
        if (w instanceof Map) {
            o.out = position(((Map<String, Object>) w).get("out"));
            o.in = position(((Map<String, Object>) w).get("in"));
        }
        Object sp = m.get("speed");
        if (sp instanceof Map) {
            Object so = ((Map<String, Object>) sp).get("out"), si = ((Map<String, Object>) sp).get("in");
            if (so instanceof Number) o.speedOut = ((Number) so).doubleValue();
            if (si instanceof Number) o.speedIn = ((Number) si).doubleValue();
        }
        o.lock = Boolean.TRUE.equals(m.get("lock"));
        o.gridBpm = m.get("gridBpm") instanceof Number ? ((Number) m.get("gridBpm")).doubleValue() : 0;
        o.family = str(m.get("family"));
        o.engine = intOf(m.get("engine"), 0);
        o.savedAt = m.get("savedAt") instanceof Number ? ((Number) m.get("savedAt")).longValue() : 0;
        return normalize(o);
    }

    @SuppressWarnings("unchecked")
    private static Position position(Object json) {
        if (!(json instanceof Map)) return null;
        Map<String, Object> p = (Map<String, Object>) json;
        Object bar = p.get("bar"), sec = p.get("sec");
        if (!(sec instanceof Number)) return null;
        double s = ((Number) sec).doubleValue();
        if (Double.isNaN(s) || Double.isInfinite(s)) return null;
        // no bar: seconds only (editor.md §6), its beat ignored (only with a bar)
        Position r;
        if (bar == null) r = Position.secondsOnly(intOf(p.get("nudgeMs"), 0), s);
        else {
            if (!(bar instanceof Number)) return null;
            double b = ((Number) bar).doubleValue();
            if (b != Math.rint(b)) return null;
            r = new Position((int) b, intOf(p.get("beat"), 0), intOf(p.get("nudgeMs"), 0), s);
        }
        if (p.get("delaySec") instanceof Number) r.delaySec = ((Number) p.get("delaySec")).doubleValue();
        return r;
    }

    /**
     * The override as saved (automix.js normalizeOverride): unknown values and Auto fields dropped,
     * null when nothing but Auto is left. Picking a preset drops a migrated pick's family.
     */
    public static MixOverride normalize(MixOverride o) {
        if (o == null) return null;
        MixOverride n = new MixOverride();
        if (o.preset != null && !o.preset.equals("auto") && Arrays.asList(PRESETS).contains(o.preset)) n.preset = o.preset;
        if ("custom".equals(n.preset)) {
            // each lane a shape name (override.schema.json lanes) or a drawing (editor.md §10 rule 2)
            String[] l = o.lanes();
            boolean ok = true;
            for (int k = 0; k < LANES.length && ok; k++) {
                if (DRAW.equals(l[k]) && o.drawn[k] != null) {
                    Object d = normalizeDrawing(LANES[k], o.drawn[k].toJson(LANES[k]));
                    if (d instanceof Drawing) {
                        n.setLane(k, DRAW);
                        n.drawn[k] = (Drawing) d;
                    } else if (d != null) n.setLane(k, (String) d);
                    else ok = false;
                } else if (options(LANES[k]).contains(l[k])) n.setLane(k, l[k]);
                else ok = false;
            }
            if (Arrays.asList(LOOPINGS).contains(l[LOOPING])) n.setLane(LOOPING, l[LOOPING]);
            else ok = false;
            if (!ok) {
                n.preset = null;
                n.volume = n.eq = n.effect = n.fx = n.looping = null;
                n.drawn = new Drawing[LANE_COUNT];
            }
        }
        if (n.preset == null && ("blend".equals(o.family) || "filter".equals(o.family))) n.family = o.family;
        if (n.preset == null && o.preset == null && o.retiredPreset != null) n.retiredPreset = o.retiredPreset;
        if (!n.loop()) {
            for (int b : BARS) if (o.bars == b) n.bars = b;
            n.out = clean(o.out, false);
            n.in = clean(o.in, true);
            // (Loop: the loop decks do their own tempo ramp, editor.md §2)
            if ("sync".equals(o.beatMatch) || "glide".equals(o.beatMatch) || "off".equals(o.beatMatch)) n.beatMatch = o.beatMatch;
            // Auto picked on an imported mix is kept: it gets Automix's limits back, where it would
            // otherwise beat-match as Sync (mix-file.md rule 6); an editor mix's Auto is no edit
            else if ("auto".equals(o.beatMatch) && o.gridBpm >= 20 && o.gridBpm <= 400) n.beatMatch = "auto";
        }
        // each song's speed in the playlist it came from (editor.md §1, spotify-mixes.md rule 10)
        n.speedOut = speed(o.speedOut);
        n.speedIn = speed(o.speedIn);
        if (n.preset == null && n.family == null && n.bars == 0 && n.out == null && n.in == null && n.beatMatch == null && n.retiredPreset == null
                && !n.hasSpeed()) return null;
        n.lock = o.lock;
        // the tempo of A the beats count on (mix-file.md rule 2): not an edit on its own
        if (o.gridBpm >= 20 && o.gridBpm <= 400) n.gridBpm = Math.round(o.gridBpm * 100) / 100.0;
        n.engine = o.engine;
        n.savedAt = o.savedAt;
        return n;
    }

    /** A speed as saved (automix.js normalizeSpeed): 0.5..2 to 0.00001; a 1 (within 0.0001) left out: NaN. */
    static double speed(double v) {
        if (Double.isNaN(v) || Double.isInfinite(v) || v < 0.5 || v > 2 || Math.abs(v - 1) < 1e-4) return Double.NaN;
        return Math.round(v * 1e5) / 1e5;
    }

    /** Whether a song's speed is saved (either side not x1). */
    public boolean hasSpeed() {
        return !Double.isNaN(speedOut) || !Double.isNaN(speedIn);
    }

    /**
     * A song's speed while it plays (automix.js songSpeed, spotify-mixes.md rule 10): the speed.in of
     * the mix that brought it in, else the speed.out of the mix taking it out, else 1.
     */
    public static double songSpeed(MixOverride broughtIn, MixOverride takesOut) {
        if (broughtIn != null && !Double.isNaN(broughtIn.speedIn)) return broughtIn.speedIn;
        if (takesOut != null && !Double.isNaN(takesOut.speedOut)) return takesOut.speedOut;
        return 1;
    }

    private static Position clean(Position p, boolean in) {
        if (p == null || Double.isNaN(p.sec) || Double.isInfinite(p.sec)) return null;
        int nudge = (int) Math.max(-2000, Math.min(2000, Math.round(p.nudgeMs / 10.0) * 10));
        int beat = p.beat >= 1 && p.beat <= 3 ? p.beat : 0; // as normalizeOverride: beats 1 to 3, else on the downbeat
        // to the ms, as the PC's Math.round; a value too big for that (a converter's wrapped one) stays
        double sec = Math.abs(p.sec) < 1e12 ? Math.round(p.sec * 1e3) / 1e3 : p.sec;
        Position c = new Position(p.bar, beat, nudge, sec, p.secOnly);
        // B's late entry (mix-file.md rule 2): on the mix-in only, 1 ms to 60 s, to the ms
        if (in && p.delaySec >= 0.001 && !Double.isInfinite(p.delaySec)) c.delaySec = Math.round(Math.min(p.delaySec, 60) * 1e3) / 1e3;
        return c;
    }

    /** As saved (override.schema.json), fields in the schema's order. */
    public Map<String, Object> toJson() {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("v", 1);
        if (preset != null) m.put("preset", preset);
        else if (retiredPreset != null) m.put("preset", retiredPreset);
        if ("custom".equals(preset)) {
            Map<String, Object> l = new LinkedHashMap<>();
            String[] names = lanes();
            for (int k = 0; k < LANES.length; k++) {
                if (k == FX && "none".equals(names[k])) continue; // (a none Effects lane is not stored, §12 rule 1)
                l.put(LANES[k], DRAW.equals(names[k]) && drawn[k] != null ? drawn[k].toJson(LANES[k]) : names[k]);
            }
            if (looping != null) l.put("looping", looping);
            m.put("lanes", l);
        }
        if (bars > 0) m.put("bars", bars);
        if (beatMatch != null) m.put("beatMatch", beatMatch);
        if (out != null || in != null) {
            Map<String, Object> w = new LinkedHashMap<>();
            if (out != null) w.put("out", positionJson(out));
            if (in != null) w.put("in", positionJson(in));
            m.put("window", w);
        }
        if (hasSpeed()) {
            Map<String, Object> sp = new LinkedHashMap<>();
            if (!Double.isNaN(speedOut)) sp.put("out", speedOut);
            if (!Double.isNaN(speedIn)) sp.put("in", speedIn);
            m.put("speed", sp);
        }
        if (lock) m.put("lock", true);
        if (gridBpm > 0) m.put("gridBpm", gridBpm);
        if (family != null) m.put("family", family);
        if (engine > 0) m.put("engine", engine);
        if (savedAt > 0) m.put("savedAt", savedAt);
        return m;
    }

    private static Map<String, Object> positionJson(Position p) {
        Map<String, Object> m = new LinkedHashMap<>();
        if (!p.secOnly) {
            m.put("bar", p.bar);
            if (p.beat != 0) m.put("beat", p.beat);
        }
        if (p.nudgeMs != 0) m.put("nudgeMs", p.nudgeMs);
        m.put("sec", p.sec);
        if (p.delaySec > 0) m.put("delaySec", p.delaySec);
        return m;
    }

    // ---------------------------------------------------------------------------------------------
    // presets and lanes as curves (editor.md §2, §3)

    /** volume, eq, effect, fx, looping of a preset (no effects or looping: §12 rule 1, §13 rule 1); null for auto, loop or an unknown one. */
    static String[] lanesOf(String preset) {
        if (preset == null) return null;
        switch (preset) {
            case "smooth": return new String[]{"smooth", "centerBassSwap", "none", "none", "none"};
            case "rise": return new String[]{"overlap", "endBassSwap", "lpInHpOut", "none", "none"};
            case "blend": return new String[]{"overlap", "threeBandFade", "none", "none", "none"};
            case "wave": return new String[]{"overlap", "centerBassSwap", "lpBoth", "none", "none"};
            case "melt": return new String[]{"fadeInFadeOut", "centerBassSwap", "hpBoth", "none", "none"};
            case "afterglow": return new String[]{"smooth", "centerBassSwap", "none", "reverbOutCenter", "none"};
            case "surge": return new String[]{"fadeInCutOut", "endBassSwap", "hpHalfOut", "reverbOutEnd", "none"};
            case "dissolve": return new String[]{"fadeInCutOut", "endBassSwap", "hpHalfOut", "echoHalfOutEnd", "none"};
            case "slam": return new String[]{"centerCut", "none", "none", "none", "none"};
            default: return null;
        }
    }

    /** The lanes this override plays (a preset's, or the custom ones; "draw" for a drawn one), or null: the planner's own. */
    public String[] lanes() {
        return "custom".equals(preset) ? new String[]{volume, eq, effect, fx == null ? "none" : fx, looping == null ? "none" : looping} : lanesOf(preset);
    }

    /** Lane [k] set to [v] (a shape name, or DRAW); the Effects lane's none is kept as null (not stored). */
    public void setLane(int k, String v) {
        if (k == 0) volume = v;
        else if (k == 1) eq = v;
        else if (k == 2) effect = v;
        else if (k == FX) fx = "none".equals(v) ? null : v;
        else looping = "none".equals(v) ? null : v;
    }

    /** Whether the custom lanes hold a drawing. */
    public boolean hasDrawing() {
        String[] l = lanes();
        if (!"custom".equals(preset) || l == null) return false;
        for (int k = 0; k < LANES.length; k++) if (DRAW.equals(l[k]) && drawn[k] != null) return true;
        return false;
    }

    /**
     * The curves of a preset or custom lanes over a window of D seconds (automix.js presetCurves):
     * gain, the shelves and the filters, no rate. beatSec: the beat, NaN with beat match Off.
     * Null for Auto, Loop, an unknown shape or no window. A drawn lane counts its beats on beatSec.
     */
    public static Curves presetCurves(MixOverride o, double D, double beatSec) {
        return presetCurves(o, D, beatSec, Double.NaN, null);
    }

    /**
     * As above; drawBeatSec and glide: the beats a drawn lane counts on (editor.md §10 rule 4; NaN:
     * beatSec, else 0.5 s). The named lanes as §3, then each drawn lane's curves in their place (§10 rule 7).
     */
    public static Curves presetCurves(MixOverride o, double D, double beatSec, double drawBeatSec, Planner.Glide glide) {
        String[] lanes = o == null ? null : o.lanes();
        if (lanes == null || !(D > 0)) return null;
        if (o.hasDrawing()) {
            String[] named = lanes.clone();
            boolean[] isDrawn = new boolean[LANES.length];
            for (int k = 0; k < LANES.length; k++) {
                isDrawn[k] = DRAW.equals(lanes[k]) && o.drawn[k] != null;
                if (isDrawn[k]) named[k] = k == 0 ? "crossfade" : "none";
            }
            Curves base = namedCurves(named, D, beatSec);
            if (base == null) return null;
            double db = drawBeatSec > 0 ? drawBeatSec : beatSec > 0 ? beatSec : 0.5;
            Curves pc = pointCurves(o.drawn, D, db, glide);
            for (int k = 0; k < LANES.length; k++) {
                if (!isDrawn[k]) continue;
                for (String key : DRAW_KEYS[k]) {
                    for (int side = 0; side < 2; side++) {
                        Map<String, double[][]> from = side == 0 ? pc.out : pc.in, to = side == 0 ? base.out : base.in;
                        if (from.containsKey(key)) to.put(key, from.get(key));
                        else to.remove(key);
                    }
                }
            }
            // (the PC: draw?.beatSec ?? beatSec; a NaN beat is 0.5 s in fxTime)
            if (isDrawn[FX]) base.fxTime = fxTime(o.drawn[FX].echoBeats, o.drawn[FX].delayBeats, drawBeatSec > 0 ? drawBeatSec : beatSec);
            return base;
        }
        return namedCurves(lanes, D, beatSec);
    }

    private static Curves namedCurves(String[] lanes, double D, double beatSec) {
        double e = CUT_RAMP_SEC / D, hb = beatSec > 0 ? 0.5 * beatSec / D : 0.02, C = CUT_DB;
        Curves c = new Curves();
        c.durationSec = r6(D);
        switch (String.valueOf(lanes[0])) {
            case "smooth": {
                double[][] a = new double[17][], b = new double[17][];
                for (int i = 0; i <= 16; i++) {
                    double x = i / 16.0;
                    a[i] = new double[]{x, Math.cos(x * Math.PI / 2)};
                    b[i] = new double[]{x, Math.sin(x * Math.PI / 2)};
                }
                c.out.put("gain", at(D, a));
                c.in.put("gain", at(D, b));
                break;
            }
            case "crossfade":
                c.out.put("gain", at(D, new double[][]{{0, 1}, {1, 0}}));
                c.in.put("gain", at(D, new double[][]{{0, 0}, {1, 1}}));
                break;
            case "overlap":
                c.out.put("gain", at(D, new double[][]{{0, 1}, {0.75, 1}, {1, 0}}));
                c.in.put("gain", at(D, new double[][]{{0, 0}, {0.25, 1}}));
                break;
            case "cutInFadeOut":
                c.out.put("gain", at(D, new double[][]{{0, 1}, {1, 0}}));
                c.in.put("gain", at(D, new double[][]{{0, 0}, {e, 1}}));
                break;
            case "fadeInCutOut":
                c.out.put("gain", at(D, new double[][]{{0, 1}, {1 - e, 1}, {1, 0}}));
                c.in.put("gain", at(D, new double[][]{{0, 0}, {1, 1}}));
                break;
            case "centerCut":
                c.out.put("gain", at(D, new double[][]{{0, 1}, {0.5, 1}, {0.5 + e, 0}}));
                c.in.put("gain", at(D, new double[][]{{0, 0}, {0.5, 0}, {0.5 + e, 1}}));
                break;
            // (Spotify's names, editor.md §3: its own shapes aren't known, these are this app's)
            case "fadeInFadeOut":
                c.out.put("gain", at(D, new double[][]{{0, 1}, {0.5, 1}, {1, 0}}));
                c.in.put("gain", at(D, new double[][]{{0, 0}, {0.5, 1}}));
                break;
            case "fadeInFastOut":
                c.out.put("gain", at(D, new double[][]{{0, 1}, {0.75, 1}, {1, 0}}));
                c.in.put("gain", at(D, new double[][]{{0, 0}, {0.75, 1}}));
                break;
            // (from screenshots of Spotify's editor: A cut one bar before the end, b; editor.md §3)
            case "fadeIn1BarCutOut":
            case "overlap1BarCutOut": {
                double b = beatSec > 0 ? Math.max(0.5, 1 - 4 * beatSec / D) : 0.875;
                c.out.put("gain", at(D, new double[][]{{0, 1}, {b, 1}, {b + e, 0}}));
                c.in.put("gain", at(D, "fadeIn1BarCutOut".equals(lanes[0]) ? new double[][]{{0, 0}, {0.5, 1}} : new double[][]{{0, 0}, {e, 1}}));
                break;
            }
            default:
                return null;
        }
        switch (String.valueOf(lanes[1])) {
            case "centerBassSwap":
                swap(c, D, 0.5, hb);
                break;
            case "endBassSwap":
                swap(c, D, 0.875, hb);
                break;
            case "threeBandFade":
                swap(c, D, 0.5, hb);
                c.out.put("highDb", at(D, new double[][]{{0.5, 0}, {1, C}}));
                c.in.put("highDb", at(D, new double[][]{{0, C}, {0.5, 0}}));
                break;
            case "quickBassCut":
                c.out.put("bassDb", at(D, new double[][]{{0, 0}, {2 * hb, C}}));
                break;
            case "startBassSwap":
                swap(c, D, 0.125, hb);
                break;
            case "longBassCut":
                c.out.put("bassDb", at(D, new double[][]{{0, 0}, {0.5, C}}));
                break;
            case "bassFadeOut": {
                // an S-curve to CUT at the middle, then held
                double[][] a = new double[17][];
                for (int i = 0; i <= 16; i++) {
                    double t = i / 16.0;
                    a[i] = new double[]{t / 2, C * (1 - Math.cos(t * Math.PI)) / 2};
                }
                c.out.put("bassDb", at(D, a));
                break;
            }
            case "none":
                break;
            default:
                return null;
        }
        switch (String.valueOf(lanes[2])) {
            case "none":
                break;
            case "lpOut":
                c.out.put("lowpassHz", at(D, new double[][]{{0, 20000}, {1, LP_CLOSED}}));
                break;
            case "hpIn":
                c.in.put("highpassHz", at(D, new double[][]{{0, HP_CLOSED}, {0.5, 20}}));
                break;
            case "lpBoth":
                c.out.put("lowpassHz", at(D, new double[][]{{0.5, 20000}, {1, LP_CLOSED}}));
                c.in.put("lowpassHz", at(D, new double[][]{{0, LP_CLOSED}, {0.5, 20000}}));
                break;
            case "hpBoth":
                c.out.put("highpassHz", at(D, new double[][]{{0.5, 20}, {1, HP_CLOSED}}));
                c.in.put("highpassHz", at(D, new double[][]{{0, HP_CLOSED}, {0.5, 20}}));
                break;
            case "lpInHpOut":
                c.out.put("highpassHz", at(D, new double[][]{{0, 20}, {1, HP_CLOSED}}));
                c.in.put("lowpassHz", at(D, new double[][]{{0, LP_CLOSED}, {1, 20000}}));
                break;
            case "hpOut":
                c.out.put("highpassHz", at(D, new double[][]{{0, 20}, {1, HP_CLOSED}}));
                break;
            case "lpIn":
                c.in.put("lowpassHz", at(D, new double[][]{{0, LP_CLOSED}, {1, 20000}}));
                break;
            case "hpInLpOut":
                c.out.put("lowpassHz", at(D, new double[][]{{0, 20000}, {1, LP_CLOSED}}));
                c.in.put("highpassHz", at(D, new double[][]{{0, HP_CLOSED}, {1, 20}}));
                break;
            case "hpHalfOut":
                c.out.put("highpassHz", at(D, new double[][]{{0.5, 20}, {1, HP_CLOSED}}));
                break;
            case "noiseOutEnd":
                c.out.put("noise", at(D, new double[][]{{0.5, 0}, {1, 1}}));
                break;
            default:
                return null;
        }
        // the Effects lane (§12 rule 4; missing: none), a send on the outgoing deck
        String fx = lanes.length > FX && lanes[FX] != null ? lanes[FX] : "none";
        if (!fx.equals("none")) {
            FxShape fs = FX_SHAPES.get(fx);
            if (fs == null) return null;
            c.out.put(fs.send, at(D, fs.curve));
            c.fxTime = fxTime(fs.send.equals("echoSend") ? fs.beats : 0, fs.send.equals("delaySend") ? fs.beats : 0, beatSec);
        }
        // the Looping lane (§13; missing: none): N beats of A, looped by the engine
        String lo = lanes.length > LOOPING && lanes[LOOPING] != null ? lanes[LOOPING] : "none";
        if (!lo.equals("none")) {
            if (!Arrays.asList(LOOPINGS).contains(lo)) return null;
            c.loopBeats = Integer.parseInt(lo.substring(4));
        }
        return c;
    }

    /** An Effects shape (editor.md §12 rule 4): the send it moves, its curve (x a fraction of the window), its time in beats. */
    static final class FxShape {
        final String send;
        final double[][] curve;
        final double beats;

        FxShape(String send, double[][] curve, double beats) {
            this.send = send;
            this.curve = curve;
            this.beats = beats;
        }
    }

    static final Map<String, FxShape> FX_SHAPES = new LinkedHashMap<>();
    static final double FX_ECHO_BEATS = 0.75, FX_DELAY_BEATS = 0.5;

    static {
        double[][] cut = {{0.75, 0}, {1, 0.5}}, out = {{0.5, 0}, {1, 0.5}};
        FX_SHAPES.put("echo1CutEnd", new FxShape("echoSend", cut, 1));
        FX_SHAPES.put("echo34CutEnd", new FxShape("echoSend", cut, 0.75));
        FX_SHAPES.put("echoHalfCutEnd", new FxShape("echoSend", cut, 0.5));
        FX_SHAPES.put("echo1OutEnd", new FxShape("echoSend", out, 1));
        FX_SHAPES.put("echo34OutEnd", new FxShape("echoSend", out, 0.75));
        FX_SHAPES.put("echoHalfOutEnd", new FxShape("echoSend", out, 0.5));
        FX_SHAPES.put("delay34CutEnd", new FxShape("delaySend", cut, 0.75));
        FX_SHAPES.put("delayHalfCutEnd", new FxShape("delaySend", cut, 0.5));
        FX_SHAPES.put("reverbCutEnd", new FxShape("reverbSend", cut, 0));
        FX_SHAPES.put("reverbOutEnd", new FxShape("reverbSend", out, 0));
        FX_SHAPES.put("reverbOutCenter", new FxShape("reverbSend", new double[][]{{0.25, 0}, {0.5, 0.5}, {0.75, 0}}, 0));
    }

    /** The echo's and the delay's time in seconds (§12 rule 3): [echoSec, delaySec]; 0 beats: the default. */
    static double[] fxTime(double echoBeats, double delayBeats, double beatSec) {
        double b = beatSec > 0 ? beatSec : 0.5;
        return new double[]{r6((echoBeats > 0 ? echoBeats : FX_ECHO_BEATS) * b), r6((delayBeats > 0 ? delayBeats : FX_DELAY_BEATS) * b)};
    }

    private static void swap(Curves c, double D, double centre, double hb) {
        c.out.put("bassDb", at(D, new double[][]{{centre - hb, 0}, {centre + hb, CUT_DB}}));
        c.in.put("bassDb", at(D, new double[][]{{0, CUT_DB}, {centre - hb, CUT_DB}, {centre + hb, 0}}));
    }

    /** Points at fractions of the window, in seconds (rounded as the extension rounds them). */
    private static double[][] at(double D, double[][] pts) {
        double[][] r = new double[pts.length][];
        for (int i = 0; i < pts.length; i++) r[i] = new double[]{r6(pts[i][0] * D), r6(pts[i][1])};
        return r;
    }

    private static double r6(double v) {
        return Math.round(v * 1e6) / 1e6;
    }

    // ---------------------------------------------------------------------------------------------
    // drawn curves (editor.md §10)

    public static final String[] LANES = {"volume", "eq", "effect", "fx"};
    public static final int LANE_COUNT = 4, FX = 3;
    /** A drawn lane's name in the lanes (its points are in [drawn]). */
    public static final String DRAW = "draw";
    /** 20 gates of 4 points (a stutter) fit. */
    public static final int DRAW_MAX_POINTS = 128;
    /** Each lane's plan curves, and their names in the stored deck (§10 rule 1; mid, noise and fx: §12). */
    static final String[][] DRAW_KEYS = {{"gain"}, {"bassDb", "midDb", "highDb"}, {"lowpassHz", "highpassHz", "noise"}, {"echoSend", "reverbSend", "delaySend"}};
    static final String[][] DRAW_NAMES = {{"gain"}, {"bass", "mid", "high"}, {"lp", "hp", "noise"}, {"echo", "reverb", "delay"}};

    /** An amount (0..1): the volume, the noise and the sends. */
    static boolean amount(String key) {
        return key.equals("gain") || key.equals("noise") || key.endsWith("Send");
    }

    private static double lo(String key) {
        return amount(key) ? 0 : key.endsWith("Db") ? CUT_DB : 20;
    }

    private static double hi(String key) {
        return amount(key) ? 1 : key.endsWith("Db") ? 0 : 20000;
    }

    private static boolean hz(String key) {
        return key.endsWith("Hz");
    }

    private static int laneIndex(String lane) {
        return Arrays.asList(LANES).indexOf(lane);
    }

    /**
     * A lane's drawing (editor.md §10 rule 1): unit beat (x in beats of A from the window's start) or
     * sec; each deck's curves by their stored name (volume: "gain", saved as the deck's list itself).
     */
    public static final class Drawing {
        public final String unit;
        public final Map<String, double[][]> out = new LinkedHashMap<>(), in = new LinkedHashMap<>();
        /** An Effects drawing's echo and delay times in beats (§12 rule 1); 0: the default. */
        public double echoBeats, delayBeats;

        public Drawing(String unit) {
            this.unit = unit;
        }

        /** As saved: a volume deck is its list, an EQ, effect or Effects deck a map of its curves. */
        public Map<String, Object> toJson(String lane) {
            Map<String, Object> m = new LinkedHashMap<>();
            m.put("unit", unit);
            m.put("out", deckJson(lane, out));
            m.put("in", deckJson(lane, in));
            if (echoBeats > 0) m.put("echoBeats", echoBeats);
            if (delayBeats > 0) m.put("delayBeats", delayBeats);
            return m;
        }

        /** The same curves with the Effects times of [d]. */
        Drawing timed(Drawing d) {
            echoBeats = d.echoBeats;
            delayBeats = d.delayBeats;
            return this;
        }

        private static Object deckJson(String lane, Map<String, double[][]> deck) {
            if (lane.equals("volume")) return pointsJson(deck.get("gain"));
            Map<String, Object> m = new LinkedHashMap<>();
            for (Map.Entry<String, double[][]> e : deck.entrySet()) m.put(e.getKey(), pointsJson(e.getValue()));
            return m;
        }

        /** A drawing as given, not checked (automix.js pointCurves reads the lanes as they are). */
        @SuppressWarnings("unchecked")
        static Drawing read(String lane, Object json) {
            int k = laneIndex(lane);
            if (!(json instanceof Map) || k < 0) return null;
            Map<String, Object> m = (Map<String, Object>) json;
            Drawing d = new Drawing(str(m.get("unit")));
            for (int side = 0; side < 2; side++) {
                Object deck = m.get(side == 0 ? "out" : "in");
                Map<String, double[][]> to = side == 0 ? d.out : d.in;
                for (String name : DRAW_NAMES[k]) {
                    Object pts = k == 0 ? deck : deck instanceof Map ? ((Map<String, Object>) deck).get(name) : null;
                    if (pts instanceof List && !((List<?>) pts).isEmpty()) {
                        List<?> l = (List<?>) pts;
                        double[][] r = new double[l.size()][];
                        for (int i = 0; i < l.size(); i++) {
                            List<?> p = (List<?>) l.get(i);
                            r[i] = new double[]{((Number) p.get(0)).doubleValue(), ((Number) p.get(1)).doubleValue()};
                        }
                        to.put(name, r);
                    }
                }
            }
            if (k == FX) times(d, m);
            return d;
        }
    }

    /** An Effects drawing's times as read (§12 rule 1: echoBeats 1, 0.75 or 0.5; delayBeats 0.75 or 0.5; else none). */
    private static void times(Drawing d, Map<String, Object> m) {
        Object e = m.get("echoBeats"), l = m.get("delayBeats");
        if (e instanceof Number) {
            double v = ((Number) e).doubleValue();
            if (v == 1 || v == 0.75 || v == 0.5) d.echoBeats = v;
        }
        if (l instanceof Number) {
            double v = ((Number) l).doubleValue();
            if (v == 0.75 || v == 0.5) d.delayBeats = v;
        }
    }

    private static List<Object> pointsJson(double[][] pts) {
        List<Object> l = new ArrayList<>();
        if (pts != null) for (double[] p : pts) l.add(Arrays.asList((Object) p[0], p[1]));
        return l;
    }

    /** Rule 4: x (beats of A, or seconds) to seconds of the mix; under a glide each beat its own length. */
    public static double drawSec(double x, String unit, double beatSec, Planner.Glide glide) {
        if ("sec".equals(unit)) return x;
        if (glide != null && glide.q != 0 && glide.beats > 0) {
            Planner.GlideSteps G = Planner.glideSteps(glide.q, glide.beats, glide.beatOutSec);
            int B = G.dur.length, k = (int) Math.min(B - 1, Math.max(0, Math.floor(x)));
            return G.at[k] + (x - k) * G.dur[k];
        }
        return x * (beatSec > 0 ? beatSec : 0.5);
    }

    /** Seconds of the mix to x (drawSec's inverse, for the editor). */
    public static double drawX(double t, String unit, double beatSec, Planner.Glide glide) {
        if ("sec".equals(unit)) return t;
        if (glide != null && glide.q != 0 && glide.beats > 0) {
            Planner.GlideSteps G = Planner.glideSteps(glide.q, glide.beats, glide.beatOutSec);
            int B = G.dur.length, k = 0;
            while (k < B - 1 && G.at[k + 1] <= t) k++;
            return k + (t - G.at[k]) / G.dur[k];
        }
        return t / (beatSec > 0 ? beatSec : 0.5);
    }

    private static double valueAt(double[] a, double[] b, double t, boolean hz) {
        double f = (t - a[0]) / Math.max(1e-12, b[0] - a[0]);
        return hz ? a[1] * Math.pow(b[1] / a[1], f) : a[1] + (b[1] - a[1]) * f;
    }

    /**
     * Rules 3 to 5: the drawn lanes (by lane index; null: not drawn) as plan curves over a window
     * of D seconds. A step plays as an 8 ms ramp; points past D are cut, the value at D the last.
     */
    public static Curves pointCurves(Drawing[] drawn, double D, double beatSec, Planner.Glide glide) {
        Curves res = new Curves();
        res.durationSec = r6(D);
        for (int k = 0; k < LANES.length; k++) {
            Drawing d = drawn == null || k >= drawn.length ? null : drawn[k];
            if (d == null) continue;
            for (int side = 0; side < 2; side++) {
                Map<String, double[][]> deck = side == 0 ? d.out : d.in, to = side == 0 ? res.out : res.in;
                for (int j = 0; j < DRAW_KEYS[k].length; j++) {
                    double[][] pts = deck.get(DRAW_NAMES[k][j]);
                    if (pts == null || pts.length == 0) continue;
                    boolean hz = hz(DRAW_KEYS[k][j]);
                    int n = pts.length;
                    double[][] ts = new double[n][];
                    for (int i = 0; i < n; i++) ts[i] = new double[]{drawSec(pts[i][0], d.unit, beatSec, glide), pts[i][1]};
                    // a step (two points at one x): its second point 8 ms on, held at the next point's t
                    for (int i = 1; i < n; i++) {
                        if (pts[i][0] == pts[i - 1][0]) ts[i][0] = Math.min(ts[i][0] + CUT_RAMP_SEC, i + 1 < n ? ts[i + 1][0] : Double.POSITIVE_INFINITY);
                    }
                    // the window's end: later points cut, the value at D the last one
                    int past = -1;
                    for (int i = 0; i < n && past < 0; i++) if (ts[i][0] > D + 1e-9) past = i;
                    List<double[]> c = new ArrayList<>();
                    if (past == 0) c.add(new double[]{0, ts[0][1]});
                    else {
                        for (int i = 0; i < (past < 0 ? n : past); i++) c.add(ts[i]);
                        if (past > 0 && c.get(c.size() - 1)[0] < D - 1e-9) c.add(new double[]{D, valueAt(ts[past - 1], ts[past], D, hz)});
                    }
                    double[][] r = new double[c.size()][];
                    for (int i = 0; i < r.length; i++) r[i] = new double[]{r6(c.get(i)[0]), r6(c.get(i)[1])};
                    to.put(DRAW_KEYS[k][j], r);
                }
            }
        }
        return res;
    }

    private static double r3(double v) {
        return Math.round(v * 1e3) / 1e3;
    }

    /** Rule 2: a curve as saved (rounded, clamped, sorted with ties in drawn order, 2 at one x, 128 at most); null: none left. */
    private static double[][] cleanPoints(Object pts, String key) {
        if (!(pts instanceof List)) return null;
        List<double[]> ok = new ArrayList<>();
        for (Object p : (List<?>) pts) {
            if (!(p instanceof List) || ((List<?>) p).size() < 2) continue;
            Object x = ((List<?>) p).get(0), v = ((List<?>) p).get(1);
            if (!(x instanceof Number) || !(v instanceof Number)) continue;
            double xd = ((Number) x).doubleValue(), vd = ((Number) v).doubleValue();
            if (Double.isNaN(xd) || Double.isInfinite(xd) || Double.isNaN(vd) || Double.isInfinite(vd)) continue;
            double cv = Math.max(lo(key), Math.min(hi(key), vd));
            ok.add(new double[]{Math.max(0, r3(xd)), hz(key) ? Math.round(cv) : r3(cv)});
        }
        ok.sort((a, b) -> Double.compare(a[0], b[0])); // stable: ties keep the order drawn
        List<double[]> kept = new ArrayList<>();
        for (double[] p : ok) {
            if (kept.size() >= DRAW_MAX_POINTS) break;
            int n = kept.size();
            if (n >= 2 && kept.get(n - 1)[0] == p[0] && kept.get(n - 2)[0] == p[0]) continue; // a third at one x
            kept.add(p);
        }
        return kept.isEmpty() ? null : kept.toArray(new double[0][]);
    }

    /**
     * Rule 2: a drawing as saved (automix.js normalizeDrawing): a Drawing; "none" for an EQ or effect
     * drawing with no curve left; null when invalid (no unit, or a volume deck with no points).
     */
    @SuppressWarnings("unchecked")
    public static Object normalizeDrawing(String lane, Object json) {
        int k = laneIndex(lane);
        if (!(json instanceof Map) || k < 0) return null;
        Map<String, Object> m = (Map<String, Object>) json;
        Object unit = m.get("unit");
        if (!"beat".equals(unit) && !"sec".equals(unit)) return null;
        Drawing d = new Drawing((String) unit);
        boolean any = false;
        for (int side = 0; side < 2; side++) {
            Object deck = m.get(side == 0 ? "out" : "in");
            Map<String, double[][]> to = side == 0 ? d.out : d.in;
            if (k == 0) {
                double[][] c = cleanPoints(deck, "gain");
                if (c == null) return null;
                to.put("gain", c);
                any = true;
            } else {
                for (int j = 0; j < DRAW_KEYS[k].length; j++) {
                    double[][] c = cleanPoints(deck instanceof Map ? ((Map<String, Object>) deck).get(DRAW_NAMES[k][j]) : null, DRAW_KEYS[k][j]);
                    if (c != null) {
                        to.put(DRAW_NAMES[k][j], c);
                        any = true;
                    }
                }
            }
        }
        if (k == FX) times(d, m);
        return any ? d : "none";
    }

    /**
     * Rule 6: a named shape as a drawing, so Draw starts from the shape (automix.js shapeDrawing):
     * the shape's curves read back to x, an 8 ms ramp read back as a step. As normalizeDrawing.
     */
    public static Object shapeDrawing(String lane, String shape, double D, double beatSec, Planner.Glide glide, String unit) {
        int k = laneIndex(lane);
        if (k < 0) return null;
        String[] l = {"crossfade", "none", "none", "none", "none"};
        l[k] = shape;
        Curves pc = namedCurves(l, D, beatSec);
        if (pc == null) return null;
        Map<String, Object> d = new LinkedHashMap<>();
        d.put("unit", unit);
        for (int side = 0; side < 2; side++) {
            Map<String, double[][]> from = side == 0 ? pc.out : pc.in;
            Object deck;
            if (k == 0) deck = toX(from.get("gain"), unit, beatSec, glide);
            else {
                Map<String, Object> m = new LinkedHashMap<>();
                for (int j = 0; j < DRAW_KEYS[k].length; j++) {
                    if (from.containsKey(DRAW_KEYS[k][j])) m.put(DRAW_NAMES[k][j], toX(from.get(DRAW_KEYS[k][j]), unit, beatSec, glide));
                }
                deck = m;
            }
            d.put(side == 0 ? "out" : "in", deck);
        }
        FxShape fs = k == FX ? FX_SHAPES.get(shape) : null;
        if (fs != null && fs.send.equals("echoSend")) d.put("echoBeats", fs.beats);
        if (fs != null && fs.send.equals("delaySend")) d.put("delayBeats", fs.beats);
        return normalizeDrawing(lane, d);
    }

    private static List<Object> toX(double[][] pts, String unit, double beatSec, Planner.Glide glide) {
        double[][] xs = new double[pts.length][];
        for (int i = 0; i < pts.length; i++) xs[i] = new double[]{r3(drawX(pts[i][0], unit, beatSec, glide)), pts[i][1]};
        for (int i = 1; i < pts.length; i++) {
            if (pts[i][0] - pts[i - 1][0] <= CUT_RAMP_SEC + 1e-6 && pts[i][0] > pts[i - 1][0]) xs[i][0] = xs[i - 1][0];
        }
        for (double[] x : xs) x[1] = r3(x[1]);
        return pointsJson(xs);
    }

    // ---------------------------------------------------------------------------------------------
    // the window (editor.md §6)

    /**
     * A saved position back to song seconds on a grid (downbeatSec, beatSec of that song; NaN beat:
     * no grid, the saved seconds as they are). More than a beat from the saved seconds: the grid
     * changed under it, so the saved seconds snap to the new grid's nearest downbeat (moved).
     */
    public static Resolved resolveWindow(Position pos, double downbeatSec, double beatSec) {
        if (pos == null) return null;
        double nudge = pos.nudgeMs / 1000.0;
        if (!(beatSec > 0) || Double.isNaN(downbeatSec) || Double.isInfinite(downbeatSec)) return new Resolved(pos.sec, false, false, pos.bar);
        // seconds only: the song's nearest beat, the nudge on top; never moved
        if (pos.secOnly) {
            long j = Math.round((pos.sec - nudge - downbeatSec) / beatSec);
            return new Resolved(r6(downbeatSec + j * beatSec + nudge), false, true, (int) Math.floorDiv(j, 4L));
        }
        double bar = 4 * beatSec;
        double t = downbeatSec + pos.bar * bar + pos.beat * beatSec + nudge;
        if (Double.isNaN(pos.sec) || Math.abs(t - pos.sec) <= beatSec) return new Resolved(r6(t), false, true, pos.bar);
        int k = (int) Math.round((pos.sec - downbeatSec) / bar);
        return new Resolved(r6(downbeatSec + k * bar), true, true, k);
    }

    static Resolved resolveWindow(Position pos, Planner.Grid g) {
        return g == null ? resolveWindow(pos, Double.NaN, Double.NaN) : resolveWindow(pos, g.downbeatSec, g.beatSec);
    }

    /** A position at song seconds [sec] snapped to a grid's nearest downbeat (or beat): snap() of positionOf. */
    public static Position snap(double sec, double downbeatSec, double beatSec, boolean toBeats) {
        return positionOf(sec, downbeatSec, beatSec, true, toBeats);
    }

    /**
     * Song seconds as a saved position (automix-overview.js positionOf): snapped, the nearest
     * downbeat (or beat); else the beat at or before it plus the rest as a nudge in 10 ms steps.
     * No grid (NaN beat): bar 0 and the seconds as they are.
     */
    public static Position positionOf(double sec, double downbeatSec, double beatSec, boolean snap, boolean toBeats) {
        if (!(beatSec > 0) || Double.isNaN(downbeatSec)) return new Position(0, 0, 0, Math.round(sec * 1e3) / 1e3);
        long j;
        if (snap) {
            j = toBeats ? Math.round((sec - downbeatSec) / beatSec) : 4 * Math.round((sec - downbeatSec) / (4 * beatSec));
            int bar = (int) Math.floorDiv(j, 4L);
            return new Position(bar, (int) (j - 4L * bar), 0, Math.round((downbeatSec + j * beatSec) * 1e3) / 1e3);
        }
        j = (long) Math.floor((sec - downbeatSec) / beatSec + 1e-9);
        int bar = (int) Math.floorDiv(j, 4L);
        int nudge = (int) (Math.round((sec - downbeatSec - j * beatSec) * 100) * 10);
        return new Position(bar, (int) (j - 4L * bar), nudge, Math.round(sec * 1e3) / 1e3);
    }

    // ---------------------------------------------------------------------------------------------

    private static String str(Object v) {
        return v instanceof String ? (String) v : null;
    }

    private static int intOf(Object v, int dflt) {
        return v instanceof Number ? (int) Math.round(((Number) v).doubleValue()) : dflt;
    }

    /** The lane names in the order the editor's dropdowns show them. */
    public static List<String> options(String lane) {
        return Arrays.asList(lane.equals("volume") ? VOLUMES : lane.equals("eq") ? EQS : lane.equals("fx") ? FXS : lane.equals("looping") ? LOOPINGS : EFFECTS);
    }
}
