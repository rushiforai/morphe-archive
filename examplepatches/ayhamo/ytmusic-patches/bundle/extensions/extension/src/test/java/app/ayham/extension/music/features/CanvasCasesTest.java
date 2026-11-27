package app.ayham.extension.music.features;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

import app.ayham.extension.music.automix.Json;

/**
 * The shared canvas cases (spec/canvas/canvas-cases.json, canvas.md) run against the phone's code.
 * Every group is run; the ones the phone can't run are counted as skipped, with the reason. The
 * per-group counts are printed (the test report's standard output).
 */
public class CanvasCasesTest {
    private static final int W = ClipJudge.W, H = ClipJudge.H;

    /** spec/canvas, found by walking up from the working directory (/spec in the Docker build). */
    private static File dir() {
        for (File d = new File("").getAbsoluteFile(); d != null; d = d.getParentFile()) {
            File s = new File(d, "spec/canvas");
            if (s.isDirectory()) return s;
        }
        throw new AssertionError("spec/canvas not found above " + new File("").getAbsolutePath());
    }

    @SuppressWarnings("unchecked")
    private static Map<String, Object> cases() throws Exception {
        File f = new File(dir(), "canvas-cases.json");
        return (Map<String, Object>) Json.parse(new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8));
    }

    /** One group's tally: passed, skipped (with why) and the failures. */
    private static final class Tally {
        int pass, skip;
        final List<String> fails = new ArrayList<>();
        final Set<String> skipWhy = new HashSet<>();
    }

    private final Map<String, Tally> tallies = new LinkedHashMap<>();

    private Tally tally(String group) {
        return tallies.computeIfAbsent(group, g -> new Tally());
    }

    private void check(String group, Map<String, Object> c, boolean ok, Object got) {
        Tally t = tally(group);
        if (ok) t.pass++;
        else t.fails.add(group + " '" + c.get("name") + "': got " + got + ", expected " + Json.write(c.get("expect")));
    }

    private void skip(String group, String why) {
        Tally t = tally(group);
        t.skip++;
        t.skipWhy.add(why);
    }

    // ------------------------------------------------------------------------------- reading

    @SuppressWarnings("unchecked")
    private static Map<String, Object> map(Object o) {
        return (Map<String, Object>) o;
    }

    @SuppressWarnings("unchecked")
    private static List<Object> list(Object o) {
        return (List<Object>) o;
    }

    private static double num(Object o) {
        return o == null ? 0 : ((Number) o).doubleValue();
    }

    private static long lng(Object o) {
        return Math.round(num(o));
    }

    private static Long orNull(Object o) {
        return o == null ? null : lng(o);
    }

    private static String str(Object o) {
        return o == null ? null : (String) o;
    }

    private static boolean near(double a, double b, double tol) {
        return Math.abs(a - b) <= tol;
    }

    /** A 32 x 18 grid as the notes write it: flat, texture with bars, or columns. */
    private static int[] frame(Object o) {
        Map<String, Object> f = map(o);
        int[] g = new int[W * H];
        if (f.containsKey("flat")) {
            Arrays.fill(g, (int) lng(f.get("flat")));
        } else if (f.containsKey("cols")) {
            List<Object> cols = list(f.get("cols"));
            for (int y = 0; y < H; y++) for (int x = 0; x < W; x++) g[y * W + x] = (int) lng(cols.get(x));
        } else {
            int seed = (int) lng(f.get("texture")), bar = (int) lng(f.get("barValue"));
            List<Object> b = list(f.get("bars"));
            int l = (int) lng(b.get(0)), t = (int) lng(b.get(1)), r = (int) lng(b.get(2)), bo = (int) lng(b.get(3));
            for (int y = 0; y < H; y++)
                for (int x = 0; x < W; x++) {
                    boolean inBar = x < l || x >= W - r || y < t || y >= H - bo;
                    g[y * W + x] = inBar ? bar : 60 + (x * 37 + y * 11 + seed * 53) % 120;
                }
        }
        return g;
    }

    private static List<int[]> frames(Object o) {
        List<int[]> out = new ArrayList<>();
        for (Object f : list(o)) out.add(frame(f));
        return out;
    }

    /** A timed list: the frames, and their times in [times]. */
    private static List<int[]> timed(Object o, List<Long> times) {
        Map<String, Object> m = map(o);
        boolean fps30 = Boolean.TRUE.equals(m.get("fps30"));
        long every = fps30 ? 0 : lng(m.get("everyMs"));
        List<int[]> out = new ArrayList<>();
        for (Object run : list(m.get("runs"))) {
            List<Object> r = list(run);
            int[] f = frame(r.get(1));
            for (long k = lng(r.get(0)); k > 0; k--) {
                int i = out.size();
                times.add(fps30 ? (long) Math.floor(i * 1000.0 / 30) : i * every);
                out.add(f);
            }
        }
        return out;
    }

    private static float[] floats(Object o) {
        List<Object> l = list(o);
        float[] a = new float[l.size()];
        for (int i = 0; i < a.length; i++) a[i] = (float) num(l.get(i));
        return a;
    }

    private static String jwt(Object header, Object payload) {
        java.util.Base64.Encoder e = java.util.Base64.getUrlEncoder().withoutPadding();
        return e.encodeToString(Json.write(header).getBytes(StandardCharsets.UTF_8)) + "."
                + e.encodeToString(Json.write(payload).getBytes(StandardCharsets.UTF_8)) + ".sig";
    }

    /** A w x h ARGB frame with [bar] black rows above and below (-1: all black), as SpotifyCanvasTest draws one. */
    private static int[] letterboxed(int w, int h, int bar) {
        int[] px = new int[w * h];
        for (int y = 0; y < h; y++)
            for (int x = 0; x < w; x++)
                px[y * w + x] = bar < 0 || y < bar || y >= h - bar ? 0xFF000000 : 0xFF808080 + ((x * 7 + y * 3) & 0x3F);
        return px;
    }

    // ------------------------------------------------------------------------------- the run

    @Test
    public void everyCanvasCase() throws Exception {
        Map<String, Object> all = cases();
        for (Map.Entry<String, Object> e : all.entrySet()) {
            if (e.getKey().equals("notes")) continue;
            for (Object o : list(e.getValue())) run(e.getKey(), map(o));
        }
        StringBuilder report = new StringBuilder("canvas cases:\n");
        List<String> fails = new ArrayList<>();
        int pass = 0, skip = 0, total = 0;
        for (Map.Entry<String, Tally> e : tallies.entrySet()) {
            Tally t = e.getValue();
            int n = t.pass + t.skip + t.fails.size();
            pass += t.pass;
            skip += t.skip;
            total += n;
            report.append(String.format(java.util.Locale.ROOT, "  %-13s %3d/%-3d pass, %d skipped%s%n", e.getKey(), t.pass, n, t.skip,
                    t.skipWhy.isEmpty() ? "" : " (" + String.join("; ", t.skipWhy) + ")"));
            fails.addAll(t.fails);
        }
        report.append(String.format(java.util.Locale.ROOT, "  total %d/%d pass, %d skipped, %d failed%n", pass, total, skip, fails.size()));
        for (String f : fails) report.append("  FAIL ").append(f).append('\n');
        System.out.print(report);
        assertTrue(report.toString(), fails.isEmpty());
    }

    private void run(String g, Map<String, Object> c) throws Exception {
        Object want = c.get("expect");
        switch (g) {
            case "sourceOrder":
                // §1's order lives in AnimatedCover.onSong's lookup thread (Apple, then the video, then Spotify, saved
                // answers first): no pure selection to call, and its §12 lines are left as they are
                skip(g, "no pure source selection on the phone (AnimatedCover.onSong)");
                return;
            case "cache": {
                Map<String, Object> in = map(c.get("input"));
                String got;
                if ("lookup".equals(c.get("kind"))) {
                    boolean exists = Boolean.TRUE.equals(in.get("fileExists"));
                    String v = CanvasCache.read(str(in.get("value")), p -> exists, lng(in.get("now")));
                    got = v == null ? null : v.isEmpty() ? "miss" : "clip";
                } else {
                    String src = str(in.get("source")), id = str(in.get("songId")), t = str(in.get("title")), a = str(in.get("artist"));
                    switch (src) {
                        case "video": got = CanvasCache.videoKey(id); break;
                        case "spotify": got = CanvasCache.spotifyKey(t, a); break;
                        case "apple": got = CanvasCache.appleKey(t, a, Boolean.TRUE.equals(in.get("tall"))); break;
                        case "downloadedSpotify": got = CanvasCache.spotifyIdKey(id); break;
                        case "downloaded": got = CanvasCache.idKey(id); break;
                        default: got = "?" + src;
                    }
                }
                check(g, c, Objects.equals(got, want), got);
                return;
            }
            case "appleScore": {
                Map<String, Object> w = map(c.get("want")), h = map(c.get("hit")), ex = map(want);
                Integer s = AppleCanvas.score(str(h.get("name")), str(h.get("artistName")), str(h.get("albumName")),
                        str(w.get("title")), str(w.get("artist")), str(w.get("album")));
                boolean taken = AppleCanvas.rank(new Integer[]{s}).length == 1;
                boolean ok = (ex.get("score") == null ? s == null : s != null && s == lng(ex.get("score"))) && taken == (Boolean) ex.get("taken");
                check(g, c, ok, "{score " + s + ", taken " + taken + "}");
                return;
            }
            case "appleRank": {
                Map<String, Object> w = map(c.get("want"));
                List<Object> hits = list(c.get("hits"));
                Integer[] scores = new Integer[hits.size()];
                for (int i = 0; i < scores.length; i++) {
                    Map<String, Object> h = map(hits.get(i));
                    scores[i] = AppleCanvas.score(str(h.get("name")), str(h.get("artistName")), str(h.get("albumName")),
                            str(w.get("title")), str(w.get("artist")), str(w.get("album")));
                }
                // the first ranked hit with inline motion art (no album is read: no network)
                String got = null;
                for (int i : AppleCanvas.rank(scores))
                    if (Boolean.TRUE.equals(map(hits.get(i)).get("motion"))) {
                        got = str(map(hits.get(i)).get("id"));
                        break;
                    }
                check(g, c, Objects.equals(got, want), got);
                return;
            }
            case "appleToken": {
                List<String> jwts = new ArrayList<>();
                for (Object t : list(c.get("tokens"))) jwts.add(jwt(map(t).get("header"), map(t).get("payload")));
                Set<String> refused = new HashSet<>();
                if (c.get("rejected") != null) for (Object i : list(c.get("rejected"))) refused.add(jwts.get((int) lng(i)));
                int got = AppleCanvas.pickToken(jwts, lng(c.get("now")), refused);
                check(g, c, want == null ? got == -1 : got == lng(want), got < 0 ? null : got);
                return;
            }
            case "appleMotion": {
                Map<String, Object> video = map(c.get("video"));
                String[] m = AppleCanvas.motionUrls((key, field) -> {
                    Object asset = video.get(key);
                    return asset == null ? null : str(map(asset).get(field));
                });
                boolean ok;
                if (want == null) ok = m == null;
                else {
                    Map<String, Object> ex = map(want);
                    ok = m != null && Objects.equals(m[0], ex.get("primary")) && Objects.equals(m[1], ex.get("alternate"))
                            && Objects.equals(m[2], ex.get("tall"));
                }
                check(g, c, ok, m == null ? null : Arrays.toString(m));
                return;
            }
            case "spotifyMatch": {
                Map<String, Object> in = map(c.get("input"));
                boolean got = SpotifyCanvas.matches(str(in.get("title")), str(in.get("artist")), str(in.get("album")), lng(in.get("durationMs")),
                        str(in.get("foundTitle")), str(in.get("foundArtist")), str(in.get("foundAlbum")), lng(in.get("foundDurationMs")),
                        str(in.get("primary")), str(in.get("foundPrimary")));
                check(g, c, got == (Boolean) want, got);
                return;
            }
            case "spotifyMedia": {
                boolean got = SpotifyCanvas.trusted(str(c.get("url")));
                check(g, c, got == (Boolean) want, got);
                return;
            }
            case "spotifyCanvas": {
                String got = SpotifyCanvas.canvasOf(c.get("answer"));
                check(g, c, java.util.Objects.equals(got, want), got);
                return;
            }
            case "spotifyTotp": {
                // the key is the xor'd values joined as decimal digits (spotlib Totp.kt)
                String got = SpotifyCanvas.totp(lng(c.get("nowMs")));
                check(g, c, got.equals(str(c.get("expect"))), got);
                return;
            }
            case "videoMatch": {
                Map<String, Object> song = map(c.get("song"));
                List<String> names = new ArrayList<>();
                for (Object a : list(song.get("artists"))) names.add(str(map(a).get("name")));
                List<String[]> videos = new ArrayList<>();
                for (Object o : list(c.get("videos"))) {
                    Map<String, Object> v = map(o);
                    videos.add(new String[]{str(v.get("id")), str(v.get("title")), str(map(list(v.get("artists")).get(0)).get("name")),
                            String.valueOf(lng(v.get("durationSec")))});
                }
                String[] got = VideoCanvas.pick(str(song.get("title")), VideoCanvas.artists(String.join(" & ", names)), lng(song.get("durationSec")), videos);
                String id = got == null ? null : got[0];
                check(g, c, Objects.equals(id, want), id);
                return;
            }
            case "bestPart": {
                List<Object> in = list(c.get("intensity"));
                double[] v = new double[in.size()];
                for (int i = 0; i < v.length; i++) v[i] = num(in.get(i));
                long got = VideoCanvas.peakMs(v, lng(c.get("segmentMs")), lng(c.get("durationMs")));
                check(g, c, want == null ? got < 0 : got >= 0 && near(got, num(want), 0.5), got < 0 ? null : got);
                return;
            }
            case "noFrames": {
                long[] got = ClipJudge.noFrames(lng(c.get("lengthMs")));
                List<Object> ex = list(want);
                check(g, c, got[0] == lng(ex.get(0)) && got[1] == lng(ex.get(1)), Arrays.toString(got));
                return;
            }
            case "bars": {
                float[] got = ClipJudge.bars(frames(c.get("frames")));
                List<Object> ex = list(want);
                boolean ok = true;
                for (int i = 0; i < 4; i++) ok &= near(got[i], num(ex.get(i)), 1e-6);
                check(g, c, ok, Arrays.toString(got));
                return;
            }
            case "still": {
                boolean got = ClipJudge.still(frames(c.get("frames")), floats(c.get("bars")));
                check(g, c, got == (Boolean) want, got);
                return;
            }
            case "windows": {
                List<double[]> got = ClipJudge.windows(frames(c.get("frames")), lng(c.get("intervalMs")), lng(c.get("lengthMs")), new float[4]);
                List<Object> ex = list(want);
                boolean ok = got.size() == ex.size();
                for (int i = 0; ok && i < ex.size(); i++) {
                    List<Object> w = list(ex.get(i));
                    for (int k = 0; k < 3; k++) ok &= near(got.get(i)[k], num(w.get(k)), 1e-9);
                }
                StringBuilder s = new StringBuilder();
                for (double[] w : got) s.append(Arrays.toString(w));
                check(g, c, ok, s);
                return;
            }
            case "choose": {
                List<double[]> windows = new ArrayList<>();
                for (Object o : list(c.get("windows"))) {
                    List<Object> w = list(o);
                    windows.add(new double[]{num(w.get(0)), num(w.get(1)), num(w.get(2))});
                }
                double[] got = ClipJudge.choose(windows, lng(c.get("lengthMs")), orNull(c.get("peakMs")), orNull(c.get("chorusMs")));
                check(g, c, want == null ? got == null : got != null && got[0] == num(want), got == null ? null : got[0]);
                return;
            }
            case "cropX": {
                float got = ClipJudge.cropX(frames(c.get("frames")), new float[4]);
                check(g, c, near(got, num(want), 1e-6), got);
                return;
            }
            case "loopEnd": {
                List<Long> tl = new ArrayList<>();
                List<int[]> fr = timed(c.get("frames"), tl);
                long[] times = new long[tl.size()];
                for (int i = 0; i < times.length; i++) times[i] = tl.get(i);
                long got = ClipJudge.end(fr, times, lng(c.get("framesEndMs")));
                Map<String, Object> ex = map(want);
                boolean ok = Boolean.TRUE.equals(ex.get("flashing")) ? got == -1 : got == lng(ex.get("endMs"));
                check(g, c, ok, got);
                return;
            }
            case "judge": {
                ClipJudge.Loop l = ClipJudge.judge(frames(c.get("frames")), lng(c.get("intervalMs")), lng(c.get("lengthMs")),
                        orNull(c.get("peakMs")), orNull(c.get("chorusMs")));
                boolean ok = "still".equals(want) ? l == null
                        : l != null && l.startMs == lng(map(want).get("startMs")) && l.endMs == lng(map(want).get("endMs"));
                check(g, c, ok, l == null ? "still" : l.startMs + "-" + l.endMs);
                return;
            }
            case "display": {
                Map<String, Object> in = map(c.get("input"));
                String kind = str(c.get("kind"));
                if ("tallClip".equals(kind)) {
                    boolean got = AnimatedCover.tallClip((int) lng(in.get("width")), (int) lng(in.get("height")));
                    check(g, c, got == (Boolean) want, got);
                } else if ("letterboxZoom".equals(kind)) {
                    int w = (int) lng(in.get("width")), h = (int) lng(in.get("height"));
                    float got = AnimatedCover.letterboxZoom(letterboxed(w, h, (int) lng(in.get("bar"))), w, h);
                    check(g, c, near(got, num(want), 1e-5), got);
                } else {
                    // a look kept on the phone: the tall clip fades by Metrolist's title-anchored bounds
                    // (AnimatedCover fadeStart / seam), not BitChord's banner x 0.42 over the clip's bottom
                    skip(g, "clipFade: the phone keeps Metrolist's title-anchored fade (a look)");
                }
                return;
            }
            case "backdrop": {
                Map<String, Object> in = map(c.get("input"));
                switch (str(c.get("kind"))) {
                    case "blurRadius": {
                        float r = ArtBleed.blurRadiusAt((float) num(in.get("row")));
                        int[] lv = ArtBleed.blurLevels(r);
                        Map<String, Object> ex = map(want);
                        check(g, c, near(r, num(ex.get("radius")), 1e-4) && lv[0] == lng(ex.get("lower")) && lv[1] == lng(ex.get("upper")),
                                r + " " + Arrays.toString(lv));
                        return;
                    }
                    case "bleedRows": {
                        int w = (int) lng(in.get("width")), top = ArtBleed.detailTop(w, (int) lng(in.get("artHeight")));
                        int soft = ArtBleed.softTop(w, top);
                        Map<String, Object> ex = map(want);
                        check(g, c, top == lng(ex.get("detailTop")) && soft == lng(ex.get("softTop")), top + "/" + soft);
                        return;
                    }
                    case "coverZoom": {
                        int vw = (int) lng(in.get("viewportW")), vh = (int) lng(in.get("viewportH"));
                        float aspect = (float) (num(in.get("artH")) / num(in.get("artW")));
                        float z = ArtBleed.coverZoom(vw, vh, aspect);
                        int width = ArtBleed.containerWidth(vw, vh, aspect);
                        Map<String, Object> ex = map(want);
                        check(g, c, near(z, num(ex.get("zoom")), 1e-5) && width == lng(ex.get("width")), z + "/" + width);
                        return;
                    }
                    case "stripRows": {
                        int got = ArtBleed.stripRows((int) lng(in.get("artHeight")));
                        check(g, c, got == lng(want), got);
                        return;
                    }
                    case "meshLift": {
                        List<Object> rgb = list(in.get("rgb"));
                        int p = ArtMesh.lift((float) (num(rgb.get(0)) / 255), (float) (num(rgb.get(1)) / 255), (float) (num(rgb.get(2)) / 255), new float[3]);
                        int[] got = {(p >> 16) & 0xFF, (p >> 8) & 0xFF, p & 0xFF};
                        List<Object> ex = list(want);
                        check(g, c, got[0] == lng(ex.get(0)) && got[1] == lng(ex.get(1)) && got[2] == lng(ex.get(2)), Arrays.toString(got));
                        return;
                    }
                    default:
                        check(g, c, false, "unknown kind " + c.get("kind"));
                        return;
                }
            }
            case "badge": {
                Map<String, Object> in = map(c.get("input"));
                float got = "bandCentre".equals(c.get("kind"))
                        ? PlayerScreen.bandCentre((float) num(in.get("progress")), (float) num(in.get("width")))
                        : PlayerScreen.chromeWhite((float) num(in.get("alpha")));
                check(g, c, near(got, num(want), 1e-5), got);
                return;
            }
            case "settings": {
                Map<String, Object> in = map(c.get("input"));
                Object got;
                switch (str(c.get("kind"))) {
                    case "settingsOrder":
                        got = CanvasSettings.parseOrder(str(in.get("stored")));
                        break;
                    case "settingsEnabled":
                        got = CanvasSettings.parseEnabled(str(in.get("stored")));
                        break;
                    default: {
                        List<Object> vs = list(in.get("variants"));
                        long[][] v = new long[vs.size()][];
                        for (int i = 0; i < v.length; i++) {
                            List<Object> x = list(vs.get(i));
                            v[i] = new long[]{lng(x.get(0)), lng(x.get(1)), lng(x.get(2))};
                        }
                        got = (long) CanvasSettings.pickVariant(v, in.get("cap") == null ? null : (int) lng(in.get("cap")));
                    }
                }
                check(g, c, Json.write(got).equals(Json.write(want)), Json.write(got));
                return;
            }
            case "songMenu": {
                Map<String, Object> in = map(c.get("input"));
                boolean[] r = CanvasChoices.rows((Boolean) in.get("canvasOn"), (Boolean) in.get("useVideos"), (Boolean) in.get("isSong"),
                        (Boolean) in.get("hasLoop"), (Boolean) in.get("loopOff"), (Boolean) in.get("loopShows"));
                Map<String, Object> got = new java.util.LinkedHashMap<>();
                got.put("canvasSwitch", r[0]);
                got.put("pickVideo", r[1]);
                got.put("pickPart", r[2]);
                got.put("notThisVideo", r[3]);
                check(g, c, Json.write(got).equals(Json.write(want)), Json.write(got));
                return;
            }
            case "pickPart": {
                Map<String, Object> in = map(c.get("input"));
                List<Object> os = list(in.get("others"));
                long[] o = new long[os.size()];
                for (int i = 0; i < o.length; i++) o[i] = lng(os.get(i));
                long[] r = CanvasChoices.pickPart(lng(in.get("startMs")), o, lng(in.get("pickMs")));
                Map<String, Object> w = map(want);
                List<Object> wo = list(w.get("others"));
                boolean ok = r[0] == lng(w.get("startMs")) && r.length == wo.size() + 1;
                for (int i = 0; ok && i < wo.size(); i++) ok = r[i + 1] == lng(wo.get(i));
                check(g, c, ok, java.util.Arrays.toString(r));
                return;
            }
            case "videoChoices": {
                Map<String, Object> in = map(c.get("input"));
                List<String> found = new ArrayList<>(), rej = new ArrayList<>();
                for (Object x : list(in.get("found"))) found.add(str(x));
                for (Object x : list(in.get("rejected"))) rej.add(str(x));
                List<String> got = CanvasChoices.videoChoices(str(in.get("pairing")), found, new java.util.HashSet<>(rej));
                List<String> w = new ArrayList<>();
                for (Object x : list(want)) w.add(str(x));
                check(g, c, got.equals(w), got);
                return;
            }
            case "songReset": {
                // the PC's choice: loopOff/spotifyOff/appleOff, use, picked, part {video, startMs}, rejected
                Map<String, Object> ch = map(map(c.get("input")).get("choice"));
                CanvasChoices.Song s = new CanvasChoices.Song();
                if (Boolean.TRUE.equals(ch.get("loopOff"))) s.off.add(CanvasSettings.VIDEO);
                if (Boolean.TRUE.equals(ch.get("spotifyOff"))) s.off.add(CanvasSettings.SPOTIFY);
                if (Boolean.TRUE.equals(ch.get("appleOff"))) s.off.add(CanvasSettings.APPLE);
                s.use = str(ch.get("use"));
                s.video = str(ch.get("picked"));
                Map<String, Object> part = map(ch.get("part"));
                if (part != null) {
                    s.partVideo = str(part.get("video"));
                    s.partMs = lng(part.get("startMs"));
                }
                if (ch.get("rejected") != null) for (Object x : list(ch.get("rejected"))) s.rejected.add(str(x));
                boolean got = CanvasChoices.hasChoice(s);
                check(g, c, got == (Boolean) want, got);
                return;
            }
            case "videoArtists": {
                Map<String, Object> in = map(c.get("input"));
                List<String> got = Arrays.asList(VideoCanvas.artists(str(in.get("artist"))));
                List<String> w = new ArrayList<>();
                for (Object x : list(want)) w.add(str(x));
                check(g, c, got.equals(w), got);
                return;
            }
            case "snap": {
                Map<String, Object> in = map(c.get("input"));
                List<Object> ls = list(in.get("lineStarts"));
                long[] st = new long[ls.size()];
                for (int i = 0; i < st.length; i++) st[i] = lng(ls.get(i));
                Map<String, Object> t = map(in.get("tempo"));
                long got = t == null ? BestPart.snap(lng(in.get("targetMs")), st, null, false, 0)
                        : BestPart.snap(lng(in.get("targetMs")), st, ((Number) t.get("bpm")).doubleValue(), (Boolean) t.get("steady"), lng(t.get("firstBeatMs")));
                check(g, c, got == lng(want), got);
                return;
            }
            case "bestPartButton": {
                Map<String, Object> in = map(c.get("input"));
                boolean got = BestPart.shows(lng(in.get("atMs")), lng(in.get("startMs")), lng(in.get("knownAtMs")));
                check(g, c, got == (Boolean) want, got);
                return;
            }
            case "chorus": {
                Map<String, Object> in = map(c.get("input"));
                List<Object> ls = list(in.get("lines"));
                long[] st = new long[ls.size()];
                String[] tx = new String[ls.size()];
                for (int i = 0; i < st.length; i++) {
                    st[i] = lng(map(ls.get(i)).get("timeMs"));
                    tx[i] = str(map(ls.get(i)).get("text"));
                }
                Long got = BestPart.chorusMs(lng(in.get("durationMs")), st, tx);
                check(g, c, want == null ? got == null : got != null && got == lng(want), got);
                return;
            }
            case "titleGate": {
                Map<String, Object> in = map(c.get("input"));
                boolean got = ClipGate.titleSays(str(in.get("songTitle")), str(in.get("videoTitle")));
                check(g, c, got == (Boolean) want, got);
                return;
            }
            case "clipFind": {
                Map<String, Object> in = map(c.get("input")), song = map(in.get("song")), vids = map(in.get("videos"));
                final List<Object> others = list(in.get("others"));
                ClipGate.Look look = new ClipGate.Look() {
                    @Override
                    public ClipGate.Video video(String id) {
                        Map<String, Object> v = map(vids.get(id));
                        if (v == null) return null;
                        ClipGate.Video x = new ClipGate.Video();
                        x.type = str(v.get("type"));
                        x.title = str(v.get("title"));
                        x.status = str(v.get("status"));
                        boolean still = Boolean.TRUE.equals(v.get("still"));
                        x.still = () -> still;
                        return x;
                    }

                    @Override
                    public List<String> others() {
                        List<String> out = new ArrayList<>();
                        for (Object o : others) out.add(str(o));
                        return out;
                    }
                };
                Map<String, Object> choice = map(song.get("choice"));
                String picked = choice == null ? null : str(choice.get("picked"));
                if (picked != null && choice.get("rejected") != null && list(choice.get("rejected")).contains(picked)) picked = null;
                ClipGate.Result r = ClipGate.find(str(song.get("title")), Boolean.TRUE.equals(song.get("notASong")), str(in.get("first")), look,
                        picked, choice != null && Boolean.TRUE.equals(choice.get("only")), Boolean.TRUE.equals(in.get("lyricFirst")));
                Map<String, Object> ex = map(want);
                boolean ok = Objects.equals(r.videoId, ex.get("videoId")) && Objects.equals(r.why, ex.get("why")) && r.otherSearches == lng(ex.get("otherSearches"));
                check(g, c, ok, "{videoId " + r.videoId + ", why " + r.why + ", otherSearches " + r.otherSearches + "}");
                return;
            }
            default:
                check(g, c, false, "unknown group");
        }
    }
}
