package app.tikkamasalla.stremio.oneahead;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** Standalone tests (no JUnit) for the R5 premiere reference: episode order from both id forms, and the season's
 * earliest episode kept as a reference by the query order, the candidate cap and the planner. Exit 1 on any failure. */
public class OneAheadPremiereSelfTest {
    static int fails = 0, total = 0;

    static void ok(String name, boolean cond) {
        total++;
        if (!cond) fails++;
        System.out.println((cond ? "ok   " : "FAIL ") + name);
    }

    static OneAheadPlanner.FileRef ref(String ep, long size, boolean cached) {
        return new OneAheadPlanner.FileRef(ep, ep, 42, size, 100 + ep.hashCode(), 2700, OneAheadPlanner.Container.MKV,
                false, cached, "eng", -1);
    }

    public static void main(String[] a) {
        ok("bench id", Arrays.equals(Detector.epOrder("mouse_s01e04"), new int[]{1, 4}));
        ok("stremio id", Arrays.equals(Detector.epOrder("tt0903747:5:3"), new int[]{5, 3}));
        ok("kitsu id orders by episode", Detector.before(Detector.epOrder("kitsu:7442:2"), Detector.epOrder("kitsu:7442:10")));
        ok("unknown id never earlier", !Detector.before(Detector.epOrder("movie"), Detector.epOrder("tt1:1:1")));
        ok("null id unknown", Detector.epOrder(null)[0] == Integer.MAX_VALUE);

        // seven usable references, the premiere the largest and uncached: it still leads the plan
        OneAheadPlanner.FileRef target = ref("tt9:1:6", 900_000_000L, false);
        List<OneAheadPlanner.FileRef> refs = new ArrayList<>();
        refs.add(ref("tt9:1:1", 2_000_000_000L, false));
        for (int e = 2; e <= 5; e++) refs.add(ref("tt9:1:" + e, 300_000_000L + e, true));
        refs.add(ref("tt9:1:7", 310_000_000L, true));
        refs.add(ref("tt9:1:8", 320_000_000L, true));
        OneAheadPlanner.Outcome o = new OneAheadPlanner().plan(target, refs, new OneAheadPlanner.Usage());
        ok("plan ok", o.ok());
        ok("premiere pinned first", o.ok() && o.plan.refs.get(0).ref.episodeId.equals("tt9:1:1"));
        ok("still five references", o.ok() && o.plan.refs.size() == 5);
        // the premiere target pins nothing earlier than itself
        OneAheadPlanner.Outcome p = new OneAheadPlanner().plan(ref("tt9:1:1", 900_000_000L, false), refs.subList(1, 7), new OneAheadPlanner.Usage());
        ok("premiere target: cached first as before", p.ok() && p.plan.refs.get(0).ref.cached);

        List<String> season = Arrays.asList("s:1:1", "s:1:2", "s:1:3", "s:1:4", "s:1:5", "s:1:6", "s:1:7", "s:1:8");
        List<String> q = OneAheadGate.queryOrder(season, "s:1:4");
        ok("query asks the first episode first", q.get(0).equals("s:1:1"));
        ok("query keeps every episode once", q.size() == 5 && q.containsAll(Arrays.asList("s:1:1", "s:1:2", "s:1:3", "s:1:5", "s:1:6")));
        ok("premiere target queries no extra", !OneAheadGate.queryOrder(season, "s:1:1").contains("s:1:1"));

        List<OneAheadGate.Candidate> ordered = new ArrayList<>();
        for (int e = 2; e <= 7; e++) ordered.add(new OneAheadGate.Candidate("s:1:" + e, "", OneAheadGate.KIND_CACHED_FEATURES, 1));
        ordered.add(new OneAheadGate.Candidate("s:1:1", "x.mkv", OneAheadGate.KIND_STREAM, 5));
        List<OneAheadGate.Candidate> cap = OneAheadGate.capForPlanner(ordered, "");
        ok("cap keeps the earliest", cap.get(0).episodeId.equals("s:1:1") && cap.size() == OneAheadPlanner.MAX_REFS);

        System.out.println("TOTAL " + total + " FAIL " + fails);
        System.exit(fails == 0 ? 0 : 1);
    }
}
