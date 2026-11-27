package app.ayham.extension.music.features;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import app.ayham.extension.music.automix.Json;

/**
 * The shared lyrics cases (spec/lyrics/lyrics-cases.json, lyrics.md) run against the phone's strip.
 * Groups for code that isn't ours are counted apart, with the reason: the full view's, and Morphe's
 * own (its lyrics parser, providers, cache and full view: the rulebook covers what we built).
 */
public class LyricsCasesTest {
    private static File dir() {
        for (File d = new File("").getAbsoluteFile(); d != null; d = d.getParentFile()) {
            File s = new File(d, "spec/lyrics");
            if (s.isDirectory()) return s;
        }
        throw new AssertionError("spec/lyrics not found above " + new File("").getAbsolutePath());
    }

    @SuppressWarnings("unchecked")
    private static Map<String, Object> map(Object o) {
        return (Map<String, Object>) o;
    }

    @SuppressWarnings("unchecked")
    private static List<Object> list(Object o) {
        return (List<Object>) o;
    }

    private static long lng(Object o) {
        return ((Number) o).longValue();
    }

    @Test
    public void sharedCases() throws Exception {
        Map<String, Object> all = map(Json.parse(new String(Files.readAllBytes(new File(dir(), "lyrics-cases.json").toPath()), StandardCharsets.UTF_8)));
        StringBuilder report = new StringBuilder("lyrics cases:\n");
        List<String> fails = new ArrayList<>();
        int pass = 0, skip = 0;
        for (Map.Entry<String, Object> g : all.entrySet()) {
            if (g.getKey().equals("notes")) continue;
            int gp = 0, gs = 0;
            for (Object o : list(g.getValue())) {
                Map<String, Object> c = map(o), in = map(c.get("input"));
                Object want = c.get("expect");
                String got;
                boolean ok;
                switch (g.getKey()) {
                    case "currentLine": {
                        List<Object> s = list(in.get("starts"));
                        long[] st = new long[s.size()];
                        for (int i = 0; i < st.length; i++) st[i] = lng(s.get(i));
                        int r = LyricTiming.currentLine(st, lng(in.get("position")));
                        ok = r == lng(want);
                        got = String.valueOf(r);
                        break;
                    }
                    case "gaps": {
                        List<Object> ls = list(in.get("lines"));
                        long[] st = new long[ls.size()], en = new long[ls.size()];
                        for (int i = 0; i < st.length; i++) {
                            Map<String, Object> l = map(ls.get(i));
                            long[] ws = null, we = null;
                            if (l.get("words") != null) {
                                List<Object> w = list(l.get("words"));
                                ws = new long[w.size()];
                                we = new long[w.size()];
                                for (int k = 0; k < ws.length; k++) {
                                    ws[k] = lng(map(w.get(k)).get("start"));
                                    we[k] = lng(map(w.get(k)).get("end"));
                                }
                            }
                            st[i] = LyricTiming.startOf(lng(l.get("start")), ws, we);
                            en[i] = lng(l.get("end"));
                        }
                        List<long[]> r = LyricTiming.gaps(st, en);
                        StringBuilder b = new StringBuilder("[");
                        for (long[] x : r) b.append(b.length() > 1 ? "," : "").append("[").append(x[0]).append(",").append(x[1]).append("]");
                        got = b.append("]").toString();
                        ok = got.equals(Json.write(want).replace(" ", ""));
                        break;
                    }
                    // sides and activeLines: the full view's (the strip has one line, lyrics.md §2.7,
                    // §5.5); parse and lrcOffset: Morphe's own, not ours (the strip reads lines from
                    // Morphe's parser); offset: Morphe's own (the strip is on Morphe's offsets and its position)
                    case "sides":
                    case "activeLines":
                    case "parse":
                    case "lrcOffset":
                    case "offset":
                        gs++;
                        continue;
                    default:
                        // a new group: decide whether it is the strip's before it can pass
                        if (gs++ == 0) fails.add("unknown group '" + g.getKey() + "': run it here or name it as not ours");
                        continue;
                }
                if (ok) gp++;
                else fails.add(g.getKey() + " '" + c.get("name") + "': got " + got + ", expected " + Json.write(want));
            }
            pass += gp;
            skip += gs;
            report.append(String.format("  %-12s %d pass, %d not ours%n", g.getKey(), gp, gs));
        }
        report.append("  total ").append(pass).append(" pass, ").append(skip).append(" not ours (Morphe's own or the full view's), ").append(fails.size()).append(" failed\n");
        for (String f : fails) report.append("  FAIL ").append(f).append('\n');
        System.out.println(report);
        assertTrue(report.toString(), fails.isEmpty());
    }
}
