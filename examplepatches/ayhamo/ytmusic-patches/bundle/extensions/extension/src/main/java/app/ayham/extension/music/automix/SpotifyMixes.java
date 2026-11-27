package app.ayham.extension.music.automix;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

/**
 * A Spotify mix export imported as it is (spec/automix/spotify-mixes.md, automix.js readSpotifyMixes
 * and spotifyOverride): "spotify-mix-export" version 3, the songs' YouTube ids in youtubeVideoId.
 * Each Spotify mix becomes a custom override with seconds-only windows; the queue is the playlist's
 * tracks in order.
 */
final class SpotifyMixes {
    static final String FORMAT = "spotify-mix-export";
    static final int VERSION = 3;
    private static final Pattern VIDEO_ID = Pattern.compile("^[A-Za-z0-9_-]{11}$");
    private static final double TWO_53 = 9007199254740992.0;
    // rule 4: the names as Spotify's editor shows them (research/spotify-mixes/tools/style_names.json)
    private static final Map<Integer, String> VOLUME = map(1, "centerCut", 2, "crossfade", 5, "fadeInFadeOut", 6, "smooth", 7, "overlap",
            9, "fadeInCutOut", 10, "cutInFadeOut", 11, "fadeInFastOut", 12, "fadeIn1BarCutOut", 13, "overlap1BarCutOut");
    private static final Map<Integer, String> EQ = map(0, "none", 1, "threeBandFade", 4, "centerBassSwap", 10, "endBassSwap", 11, "startBassSwap",
            12, "quickBassCut", 13, "longBassCut", 15, "bassFadeOut");
    private static final Map<Integer, String> FILTER = map(0, "none", 5, "hpIn", 6, "hpOut", 7, "hpBoth", 9, "lpIn", 10, "lpOut", 11, "lpBoth",
            12, "hpInLpOut", 13, "lpInHpOut", 14, "hpHalfOut", 15, "noiseOutEnd");
    // (fx 3, 4, 5, 10, 11 have no name yet: each comes with a drawing, which carries it)
    private static final Map<Integer, String> FX = map(0, "none", 1, "reverbOutCenter", 2, "reverbCutEnd", 3, "reverbOutEnd", 4, "echoHalfCutEnd",
            5, "echoHalfOutEnd", 6, "echo34CutEnd", 7, "echo34OutEnd", 8, "delayHalfCutEnd", 9, "delay34CutEnd", 10, "echo1CutEnd", 11, "echo1OutEnd");
    // rule 6: the style alone sets the Looping lane (editor.md §13)
    private static final Map<Integer, String> LOOP = map(0, "none", 1, "loop2", 2, "loop4", 3, "loop8", 4, "loop16", 8, "loop1");
    private static final Map<String, String> DEFAULT = new LinkedHashMap<>();

    static {
        DEFAULT.put("volume", "overlap");
        DEFAULT.put("eq", "centerBassSwap");
        DEFAULT.put("effect", "none");
        DEFAULT.put("fx", "none");
        DEFAULT.put("looping", "none");
    }

    private SpotifyMixes() {
    }

    private static Map<Integer, String> map(Object... kv) {
        Map<Integer, String> m = new LinkedHashMap<>();
        for (int i = 0; i < kv.length; i += 2) m.put((Integer) kv[i], (String) kv[i + 1]);
        return m;
    }

    /** What a file loses on the way (rule 9's notes). */
    static final class Lost {
        int unnamed, late;
        final Set<String> notCarried = new LinkedHashSet<>();
    }

    /** Rules 1, 2, 7, 8, 9: the file read into [r] (its mixes and skips by MixFile.collect). */
    @SuppressWarnings("unchecked")
    static MixFile.Read read(Map<String, Object> j) {
        MixFile.Read r = new MixFile.Read();
        Object v = j.get("version");
        double ver = v instanceof Number ? ((Number) v).doubleValue() : Double.NaN;
        if (!(ver >= 1) || ver != Math.rint(ver)) return refuse(r, "the Spotify mix file has no valid version");
        if (ver > VERSION) return refuse(r, "this Spotify mix file is version " + (long) ver + ", newer than this app reads (" + VERSION + "): update the app to import it");
        if (ver < VERSION) return refuse(r, "this Spotify mix file is version " + (long) ver + ": it has no YouTube ids yet (version " + VERSION + " has them)");
        Object list = j.get("mixes");
        if (!(list instanceof List) || ((List<?>) list).isEmpty()) return refuse(r, "the mix file has no mixes");
        List<Object> mixes = (List<Object>) list;
        if (mixes.size() > MixFile.MAX) return refuse(r, "the mix file has " + mixes.size() + " mixes: " + MixFile.MAX + " is the most");
        Lost lost = new Lost();
        List<MixFile.Item> items = new ArrayList<>();
        for (int i = 0; i < mixes.size(); i++) {
            Map<String, Object> m = mixes.get(i) instanceof Map ? (Map<String, Object>) mixes.get(i) : new LinkedHashMap<>();
            Object idx = m.get("index");
            int n = idx instanceof Number && ((Number) idx).doubleValue() == Math.rint(((Number) idx).doubleValue()) ? ((Number) idx).intValue() : i + 1;
            MixFile.Song from = song(m.get("from")), to = song(m.get("to"));
            if (from == null || to == null) {
                Object t = from == null ? m.get("from") : m.get("to");
                Object title = t instanceof Map ? ((Map<String, Object>) t).get("title") : null;
                items.add(MixFile.Item.skip(n, "no YouTube id for " + (title instanceof String && !((String) title).isEmpty() ? title : "a song")));
                continue;
            }
            // (a mix of a millisecond with no start: Spotify's straight cut, its No transition, rule 3)
            // (no durationMs at all is no valid timing, rule 7)
            double dur = num(m.get("durationMs"));
            if (Double.isFinite(dur) && dur < 100 && !Double.isFinite(num(m.get("fromStartMs")))) {
                Map<String, Object> none = new LinkedHashMap<>();
                none.put("v", 1);
                none.put("preset", "none");
                items.add(new MixFile.Item(n, from, to, none));
                continue;
            }
            Map<String, Object> ov = override(m, lost);
            items.add(ov != null ? new MixFile.Item(n, from, to, ov) : MixFile.Item.skip(n, "its timing is not valid"));
        }
        MixFile.collect(items, r);
        r.queue = new ArrayList<>();
        Object pl = j.get("playlist");
        Object tracks = pl instanceof Map ? ((Map<String, Object>) pl).get("tracks") : null;
        if (tracks instanceof List) {
            for (Object t : (List<Object>) tracks) {
                MixFile.Song s = song(t);
                if (s != null && (r.queue.isEmpty() || !r.queue.get(r.queue.size() - 1).equals(s.videoId))) r.queue.add(s.videoId);
            }
        }
        if (lost.unnamed > 0) r.notes.add(lost.unnamed + " lane" + (lost.unnamed == 1 ? "" : "s") + " in a Spotify style with no match here play the default shape");
        if (!lost.notCarried.isEmpty()) r.notes.add("not carried: " + String.join(", ", lost.notCarried));
        if (lost.late > 0) {
            r.notes.add(lost.late + " mix" + (lost.late == 1 ? "" : "es") + " bring" + (lost.late == 1 ? "s" : "")
                    + " B in late in an older export's unsigned time: here B starts with the mix");
        }
        if (pl instanceof Map && ((Map<String, Object>) pl).get("name") instanceof String) r.name = ((String) ((Map<String, Object>) pl).get("name")).trim();
        return r;
    }

    private static MixFile.Read refuse(MixFile.Read r, String why) {
        r.refused = why;
        return r;
    }

    @SuppressWarnings("unchecked")
    private static MixFile.Song song(Object t) {
        if (!(t instanceof Map)) return null;
        Map<String, Object> m = (Map<String, Object>) t;
        Object id = m.get("youtubeVideoId");
        if (!(id instanceof String) || !VIDEO_ID.matcher((String) id).matches()) return null;
        String artist = null;
        if (m.get("artists") instanceof List) {
            List<String> a = new ArrayList<>();
            for (Object x : (List<Object>) m.get("artists")) a.add(String.valueOf(x));
            artist = String.join(", ", a);
        }
        return new MixFile.Song((String) id, m.get("title") instanceof String ? (String) m.get("title") : null, artist);
    }

    private static double num(Object v) {
        return v instanceof Number ? ((Number) v).doubleValue() : Double.NaN;
    }

    /** JavaScript's truthiness, for the file's optional fields. */
    private static boolean truthy(Object v) {
        if (v == null || Boolean.FALSE.equals(v)) return false;
        if (v instanceof Number) return ((Number) v).doubleValue() != 0 && !Double.isNaN(((Number) v).doubleValue());
        return !(v instanceof String) || !((String) v).isEmpty();
    }

    private static double r3(double v) {
        return Math.round(v * 1000) / 1000.0;
    }

    private static double clamp(double v, double lo, double hi) {
        return Math.max(lo, Math.min(hi, v));
    }

    /** A y value of the file's curves to this app's (and whether a segment's points are taken as they are). */
    private interface Y {
        double at(double y);

        default boolean linear() {
            return true;
        }
    }

    private static final Y GAIN = y -> clamp(y, 0, 1);
    /** noiseColor: 0.5 or below is no noise; above, the noise's level up to 1 (rule 5). */
    private static final Y ABOVE = y -> clamp((y - 0.5) / 0.5, 0, 1);
    private static final Y DB = y -> y >= 0.5 ? 0 : MixOverride.CUT_DB * (0.5 - y) / 0.5;
    private static final Y RAW = new Y() {
        public double at(double y) {
            return y;
        }

        public boolean linear() {
            return false;
        }
    };

    /** Rule 5: a Spotify curve (segments of fractions, lines or cubic Béziers) as [x, v] points in N units. */
    @SuppressWarnings("unchecked")
    private static List<double[]> points(Object segs, Y f, double N) {
        List<double[]> pts = new ArrayList<>();
        if (segs instanceof List) {
            for (Object so : (List<Object>) segs) {
                if (!(so instanceof Map)) continue;
                Map<String, Object> s = (Map<String, Object>) so;
                List<double[]> P = new ArrayList<>();
                if (s.get("points") instanceof List) {
                    // a point that isn't two numbers is left out (a malformed file never throws)
                    for (Object p : (List<Object>) s.get("points")) {
                        if (!(p instanceof List) || ((List<?>) p).size() < 2) continue;
                        List<?> q = (List<?>) p;
                        double px = num(q.get(0)), py = num(q.get(1));
                        if (Double.isFinite(px) && Double.isFinite(py)) P.add(new double[]{px, py});
                    }
                }
                if (P.size() < 2) continue;
                double start = num(s.get("start")), end = num(s.get("end"));
                if (!Double.isFinite(start) || !Double.isFinite(end)) continue;
                java.util.function.DoubleUnaryOperator at = px -> (start + px * (end - start)) * N;
                if (P.size() == 4) {
                    for (int k = 0; k <= 8; k++) {
                        double t = k / 8.0, u = 1 - t;
                        double[] w = {u * u * u, 3 * u * u * t, 3 * u * t * t, t * t * t};
                        double x = 0, y = 0;
                        for (int i = 0; i < 4; i++) {
                            x += w[i] * P.get(i)[0];
                            y += w[i] * P.get(i)[1];
                        }
                        pts.add(new double[]{at.applyAsDouble(x), f.at(y)});
                    }
                } else if (f.linear()) {
                    for (double[] p : P) pts.add(new double[]{at.applyAsDouble(p[0]), f.at(p[1])});
                } else {
                    double[] a = P.get(0), b = P.get(P.size() - 1);
                    for (int k = 0; k <= 4; k++) {
                        double t = k / 4.0;
                        pts.add(new double[]{at.applyAsDouble(a[0] + t * (b[0] - a[0])), f.at(a[1] + t * (b[1] - a[1]))});
                    }
                }
            }
        }
        List<double[]> r = new ArrayList<>();
        for (double[] p : pts) r.add(new double[]{r3(clamp(p[0], 0, N)), r3(p[1])});
        List<double[]> out = new ArrayList<>();
        for (int i = 0; i < r.size(); i++) {
            if (i == 0 || r.get(i)[0] != r.get(i - 1)[0] || r.get(i)[1] != r.get(i - 1)[1]) out.add(r.get(i));
        }
        return out;
    }

    private static List<Object> json(List<double[]> pts) {
        List<Object> l = new ArrayList<>();
        for (double[] p : pts) l.add(Arrays.asList((Object) p[0], p[1]));
        return l;
    }

    private static List<Object> json(double[][] pts) {
        return json(Arrays.asList(pts));
    }

    private static Map<String, Object> deck(Object... kv) {
        Map<String, Object> m = new LinkedHashMap<>();
        for (int i = 0; i < kv.length; i += 2) m.put((String) kv[i], kv[i + 1]);
        return m;
    }

    /** A lane's shape as a drawing's JSON ({unit, out, in}): the deck a curve leaves out. */
    private static Map<String, Object> shape(String lane, String v, double D, double N, String unit) {
        Object s = MixOverride.shapeDrawing(lane, v, D, unit.equals("beat") ? D / N : 0.5, null, unit);
        if (s instanceof MixOverride.Drawing) return ((MixOverride.Drawing) s).toJson(lane);
        Map<String, Object> d = new LinkedHashMap<>();
        d.put("unit", unit);
        d.put("out", deck());
        d.put("in", deck());
        return d;
    }

    /** A curve's points if any is above 0 (the sends, the noise), else null. */
    private static List<double[]> above0(Object segs, Y f, double N) {
        if (!truthy(segs)) return null;
        List<double[]> pts = points(segs, f, N);
        for (double[] p : pts) if (p[1] > 0) return pts;
        return null;
    }

    /** Rules 3 to 6: one Spotify mix as an override's JSON (normalized by the reader), or null: no valid timing. */
    @SuppressWarnings("unchecked")
    static Map<String, Object> override(Map<String, Object> m, Lost lost) {
        double D = num(m.get("durationMs")) / 1000;
        double toStart = num(m.get("toStartMs")), fromStart = num(m.get("fromStartMs"));
        // a negative B start: B's 0:00 comes in that long after the mix starts (rule 3); an older
        // export carries one read as unsigned, 2^64 − x, too far off to read back: B starts with the
        // mix, and the summary says so
        if (toStart >= TWO_53) lost.late++;
        double late = toStart < 0 && !Double.isInfinite(toStart) ? r3(-toStart / 1000) : 0;
        if (!(D > 0) || !ms(fromStart)) return null;
        Object b = m.get("bars");
        int bars = 0;
        if (b instanceof Number) {
            double bv = ((Number) b).doubleValue();
            for (int ok : new int[]{2, 4, 8, 16, 32}) if (bv == ok) bars = ok;
        }
        String unit = bars > 0 ? "beat" : "sec";
        double N = bars > 0 ? bars * 4 : r3(D);
        Map<String, Object> st = m.get("style") instanceof Map ? (Map<String, Object>) m.get("style") : new LinkedHashMap<>();
        Map<String, Object> c = m.get("curves") instanceof Map ? (Map<String, Object>) m.get("curves") : new LinkedHashMap<>();
        Map<String, Object> lanes = new LinkedHashMap<>();
        String[] unset = baseLanes(st.get("basePresetId"));
        lanes.put("volume", pick(st, "volume", VOLUME, unset[0], c, lost));
        lanes.put("eq", pick(st, "eq", EQ, unset[1], c, lost));
        lanes.put("effect", pick(st, "filter", FILTER, unset[2], c, lost));
        lanes.put("fx", pick(st, "fx", FX, unset[3], c, lost));
        lanes.put("looping", pick(st, "looping", LOOP, unset[4], c, lost));
        Map<String, Object> cv = sub(c, "volume");
        if (cv != null) {
            Map<String, Object> base = shape("volume", (String) lanes.get("volume"), D, N, unit);
            Map<String, Object> from = sub(cv, "from"), to = sub(cv, "to");
            Map<String, Object> d = new LinkedHashMap<>();
            d.put("unit", unit);
            d.put("out", from != null && truthy(from.get("curve")) ? json(points(from.get("curve"), GAIN, N)) : base.get("out"));
            d.put("in", to != null && truthy(to.get("curve")) ? json(points(to.get("curve"), GAIN, N)) : base.get("in"));
            lanes.put("volume", d);
        }
        Map<String, Object> ce = sub(c, "eq");
        if (ce != null) {
            Map<String, Object> base = shape("eq", (String) lanes.get("eq"), D, N, unit);
            Map<String, Object> d = new LinkedHashMap<>();
            d.put("unit", unit);
            for (String dk : new String[]{"from", "to"}) {
                Map<String, Object> e = sub(ce, dk);
                Object b0 = base.get(dk.equals("from") ? "out" : "in");
                Object res;
                if (e == null || !truthy(e.get("low")) && !truthy(e.get("mid")) && !truthy(e.get("high"))) res = b0;
                else {
                    Map<String, Object> out = new LinkedHashMap<>();
                    String[][] bands = {{"low", "bass"}, {"mid", "mid"}, {"high", "high"}};
                    for (String[] band : bands) {
                        if (!truthy(e.get(band[0]))) continue;
                        List<double[]> pts = points(e.get(band[0]), DB, N);
                        boolean cut = false;
                        for (double[] p : pts) cut |= p[1] < 0;
                        if (cut) out.put(band[1], json(pts));
                    }
                    res = out;
                }
                d.put(dk.equals("from") ? "out" : "in", res);
            }
            lanes.put("eq", d);
        }
        Map<String, Object> cf = sub(c, "filter");
        if (cf != null) {
            Map<String, Object> base = shape("effect", (String) lanes.get("effect"), D, N, unit);
            Map<String, Object> d = new LinkedHashMap<>();
            d.put("unit", unit);
            for (String dk : new String[]{"from", "to"}) {
                Map<String, Object> f = sub(cf, dk);
                Object segs = f != null ? f.get("cutoff") : null, ns = f != null ? f.get("noiseColor") : null;
                Map<String, Object> b0 = (Map<String, Object>) base.get(dk.equals("from") ? "out" : "in");
                Object res;
                if (!truthy(segs) && !truthy(ns)) res = b0;
                else {
                    Map<String, Object> out = new LinkedHashMap<>();
                    if (truthy(segs)) {
                        List<double[]> lp = new ArrayList<>(), hp = new ArrayList<>();
                        boolean lpMoves = false, hpMoves = false;
                        for (double[] p : points(segs, RAW, N)) {
                            double y = p[1];
                            double l = y >= 0.5 ? 20000 : 20000 * Math.pow(MixOverride.LP_CLOSED / 20000, (0.5 - y) / 0.5);
                            double h = y >= 0.5 ? 20 * Math.pow(MixOverride.HP_CLOSED / 20, (y - 0.5) / 0.5) : 20;
                            lp.add(new double[]{p[0], r3(l)});
                            hp.add(new double[]{p[0], r3(h)});
                            lpMoves |= r3(l) < 20000;
                            hpMoves |= r3(h) > 20;
                        }
                        if (lpMoves) out.put("lp", json(lp));
                        if (hpMoves) out.put("hp", json(hp));
                    } else {
                        if (b0 != null && b0.containsKey("lp")) out.put("lp", b0.get("lp"));
                        if (b0 != null && b0.containsKey("hp")) out.put("hp", b0.get("hp"));
                    }
                    // the noise (rule 5): noiseColor 0.5 is none, above it the level up to 1
                    List<double[]> noise = above0(ns, ABOVE, N);
                    if (noise != null) out.put("noise", json(noise));
                    res = out;
                }
                d.put(dk.equals("from") ? "out" : "in", res);
            }
            lanes.put("effect", d);
            Map<String, Object> ff = sub(cf, "from"), ft = sub(cf, "to");
            if (ff != null && truthy(ff.get("resonance")) || ft != null && truthy(ft.get("resonance"))) lost.notCarried.add("filter resonance");
        }
        // rule 6: no jogwheel lane here (a style or a curve), named in the summary
        if (truthy(st.get("jogwheel")) || truthy(c.get("jogwheel"))) lost.notCarried.add("jogwheel");
        Map<String, Object> cx = sub(c, "fx");
        if (cx != null) {
            Map<String, Object> base = shape("fx", (String) lanes.get("fx"), D, N, unit);
            Map<String, Object> d = new LinkedHashMap<>();
            d.put("unit", unit);
            for (String dk : new String[]{"from", "to"}) {
                Map<String, Object> e = sub(cx, dk);
                Object res;
                if (e == null || !truthy(e.get("echo")) && !truthy(e.get("reverb")) && !truthy(e.get("delay"))) res = base.get(dk.equals("from") ? "out" : "in");
                else {
                    Map<String, Object> out = new LinkedHashMap<>();
                    for (String k : new String[]{"echo", "reverb", "delay"}) {
                        List<double[]> pts = above0(e.get(k), GAIN, N);
                        if (pts != null) out.put(k, json(pts));
                    }
                    res = out;
                }
                d.put(dk.equals("from") ? "out" : "in", res);
            }
            // a named Effects style sets the drawing's time (rule 5)
            MixOverride.FxShape t = MixOverride.FX_SHAPES.get(lanes.get("fx"));
            if (t != null && t.send.equals("echoSend")) d.put("echoBeats", t.beats);
            if (t != null && t.send.equals("delaySend")) d.put("delayBeats", t.beats);
            lanes.put("fx", d);
        }
        if ("none".equals(lanes.get("fx"))) lanes.remove("fx");
        if ("none".equals(lanes.get("looping"))) lanes.remove("looping");
        double fromBpm = num(m.get("fromBpm"));
        double gridBpm = fromBpm > 0 ? fromBpm : bars > 0 ? bars * 4 * 60 / D : Double.NaN;
        Map<String, Object> o = new LinkedHashMap<>();
        o.put("v", 1);
        o.put("preset", "custom");
        o.put("lanes", lanes);
        if (bars > 0) o.put("bars", bars);
        else o.put("beatMatch", "off");
        Map<String, Object> w = new LinkedHashMap<>();
        w.put("out", deck("sec", r3(fromStart / 1000)));
        // B's start: none → from 0; a negative one → from 0, that long after the mix starts (rule 3)
        Map<String, Object> in = deck("sec", r3((ms(toStart) ? toStart : 0) / 1000));
        if (late >= 0.001) in.put("delaySec", late);
        w.put("in", in);
        o.put("window", w);
        if (!Double.isNaN(gridBpm)) o.put("gridBpm", gridBpm);
        // each song's speed in the playlist (rule 10: f18 A's, f19 B's; missing is 1)
        double so = MixOverride.speed(num(m.get("f18"))), si = MixOverride.speed(num(m.get("f19")));
        if (!Double.isNaN(so) || !Double.isNaN(si)) {
            Map<String, Object> sp = new LinkedHashMap<>();
            if (!Double.isNaN(so)) sp.put("out", so);
            if (!Double.isNaN(si)) sp.put("in", si);
            o.put("speed", sp);
        }
        return o;
    }

    /** A time in ms as the file gives it: finite, not negative, under 2^53 (rule 3). */
    private static boolean ms(double v) {
        return Double.isFinite(v) && v >= 0 && v < TWO_53;
    }

    /** A lane's style (rule 4); a number with no name here counts only on a lane with no drawing: a drawing carries it. */
    private static String pick(Map<String, Object> st, String key, Map<Integer, String> map, String unset, Map<String, Object> curves, Lost lost) {
        Object v = st.get(key);
        if (v == null) return unset;
        if (v instanceof Number) {
            double d = ((Number) v).doubleValue();
            if (d == Math.rint(d) && map.containsKey((int) d)) return map.get((int) d);
        }
        if (!truthy(curves.get(key))) lost.unnamed++;
        return unset;
    }

    /**
     * What an unset lane plays (rule 4), by the mix's basePresetId (Spotify 9.2.2's preset enum): that
     * preset's lanes for today's presets, an older preset's own (5, 10, 19), else the default;
     * volume, eq, effect, fx, looping.
     */
    static String[] baseLanes(Object id) {
        String[] def = DEFAULT.values().toArray(new String[0]);
        if (!(id instanceof Number) || ((Number) id).doubleValue() != Math.rint(((Number) id).doubleValue())) return def;
        String preset = null;
        switch (((Number) id).intValue()) {
            case 1: preset = "smooth"; break;
            case 2: preset = "blend"; break;
            case 3: preset = "rise"; break;
            case 4: preset = "melt"; break;
            case 11: preset = "slam"; break;
            case 17: preset = "wave"; break;
            case 20: preset = "dissolve"; break;
            case 21: preset = "surge"; break;
            case 22: preset = "afterglow"; break;
            case 5: def[0] = "fadeInCutOut"; return def;
            case 10: def[1] = "centerBassSwap"; def[2] = "hpBoth"; return def;
            case 19: def[0] = "overlap"; def[1] = "centerBassSwap"; def[2] = "lpBoth"; return def;
            default: return def;
        }
        return MixOverride.lanesOf(preset).clone();
    }

    @SuppressWarnings("unchecked")
    private static Map<String, Object> sub(Map<String, Object> m, String k) {
        Object v = m.get(k);
        return v instanceof Map ? (Map<String, Object>) v : null;
    }
}
