package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Test;

/**
 * Automix plans every 250 ms tick. The song's whole-song walks (the sung-span carve, the anchor
 * search, the whole-song loudness) are done once, not again each tick: the extension's crackle
 * (c42bb5f) was a cache keyed on the analysis object, which the planner copies every plan.
 */
@SuppressWarnings("unchecked")
public class PlanCacheTest {
    private static void clear() {
        Planner.CARVED.clear();
        Planner.ANCHOR_CANDS.clear();
        Planner.WHOLE_LOUDNESS.clear();
    }

    private static int misses() {
        return Planner.CARVED.misses + Planner.ANCHOR_CANDS.misses + Planner.WHOLE_LOUDNESS.misses;
    }

    @Test
    public void aLaterTickOnCopiesWalksNothingAgainAndPlansTheSame() throws Exception {
        File dir = null;
        for (File d = new File("").getAbsoluteFile(); d != null && dir == null; d = d.getParentFile())
            if (new File(d, "spec/automix/pairs").isDirectory()) dir = new File(d, "spec/automix/pairs");
        int pairs = 0;
        for (File f : dir.listFiles((d, n) -> n.endsWith(".json"))) {
            Map<String, Object> pair = (Map<String, Object>) Json.parse(new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8));
            List<Object> songs = (List<Object>) pair.get("songs");
            Map<String, Object> a = (Map<String, Object>) songs.get(0), b = (Map<String, Object>) songs.get(1);
            Analysis from = Analysis.fromJson((Map<String, Object>) a.get("analysis"));
            Analysis to = Analysis.fromJson((Map<String, Object>) b.get("analysis"));
            Planner.Settings s = new Planner.Settings();
            s.version = 3;
            double pos = Math.max(30, from.durationSec - 95);

            clear();
            String first = tick(s, from, to, a, b, pos);
            int walked = misses();
            // the next tick: the analysis copied and the spans built again, as Automix.tick does
            String next = tick(s, from.copy(), to.copy(), a, b, pos);
            assertEquals(f.getName() + ": a later tick walks the songs again", walked, misses());
            assertEquals(f.getName(), first, next);
            // and the cached answers are the walks' own
            clear();
            assertEquals(f.getName() + ": the plan differs without the caches", first, tick(s, from, to, a, b, pos));
            pairs++;
        }
        assertTrue(pairs > 0);
    }

    private static String tick(Planner.Settings s, Analysis from, Analysis to, Map<String, Object> a, Map<String, Object> b, double pos) {
        Planner.Sung sung = new Planner.Sung();
        sung.out = spans(a);
        sung.in = spans(b);
        double earliest = pos + Mix.HAND_LEAD + 0.5;
        return Planner.plan(s, "a", "b", from, to, from.durationSec, pos, earliest, sung, null, 1, 1)
                + " | " + Planner.plan(s, "a", "b", from, to, from.durationSec, pos, earliest, sung, null, 1, 1, true);
    }

    private static double[][] spans(Map<String, Object> song) {
        if (!(song.get("lines") instanceof List)) return null;
        List<Planner.LineShape> shapes = new ArrayList<>();
        for (Object o : (List<Object>) song.get("lines")) {
            Map<String, Object> l = (Map<String, Object>) o;
            double end = !(l.get("end") instanceof Number) ? Double.NaN : Json.num(l, "end");
            shapes.add(new Planner.LineShape(Json.num(l, "start"), end, (int) Json.num(l, "words"), null));
        }
        double[][] sp = Planner.sungSpansFromLines(shapes);
        return sp.length > 0 ? sp : null;
    }
}
