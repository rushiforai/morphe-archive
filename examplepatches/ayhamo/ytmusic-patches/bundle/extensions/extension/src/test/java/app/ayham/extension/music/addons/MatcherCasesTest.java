package app.ayham.extension.music.addons;

import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

/**
 * spec/addons/matcher-cases.json, case by case: the answers BitChord's own TrackMatcher gives
 * (what scripts/addon_matcher_fixtures.mjs checks the extension's port against).
 */
@RunWith(Parameterized.class)
@SuppressWarnings("unchecked")
public class MatcherCasesTest {
    @Parameterized.Parameters(name = "{0}")
    public static Collection<Object[]> cases() {
        Map<String, Object> doc = Spec.read("matcher-cases.json");
        List<Object[]> out = new ArrayList<>();
        for (Object c : (List<Object>) doc.get("cases")) out.add(new Object[]{"match: " + ((Map<?, ?>) c).get("name"), c, false});
        for (Object q : (List<Object>) doc.get("queries")) out.add(new Object[]{"queries: " + ((Map<?, ?>) q).get("name"), q, true});
        return out;
    }

    private final Map<String, Object> c;
    private final boolean isQuery;

    public MatcherCasesTest(String name, Object c, boolean isQuery) {
        this.c = (Map<String, Object>) c;
        this.isQuery = isQuery;
    }

    @Test
    public void matchesTheSpec() {
        TrackMatcher.Target target = Spec.target(c.get("target"));
        Object got;
        if (isQuery) {
            got = TrackMatcher.queries(target);
        } else {
            List<TrackMatcher.Candidate> rows = new ArrayList<>();
            for (Object o : (List<Object>) c.get("candidates")) {
                Map<String, Object> m = (Map<String, Object>) o;
                TrackMatcher.Candidate r = new TrackMatcher.Candidate();
                r.id = (String) m.get("id");
                r.title = (String) m.get("title");
                r.artist = (String) m.get("artist");
                r.album = (String) m.get("album");
                r.durationSec = m.get("durationSec") instanceof Number ? ((Number) m.get("durationSec")).doubleValue() : null;
                r.explicit = (Boolean) m.get("explicit");
                rows.add(r);
            }
            Map<String, Object> scores = new LinkedHashMap<>();
            List<Object> rejected = new ArrayList<>();
            for (TrackMatcher.Candidate r : rows) {
                Integer s = TrackMatcher.score(r, target);
                if (s != null) scores.put(r.id, s);
                else rejected.add(r.id);
            }
            List<Object> ranked = new ArrayList<>();
            for (TrackMatcher.Candidate r : TrackMatcher.ranked(rows, target)) ranked.add(r.id);
            Map<String, Object> g = new LinkedHashMap<>();
            g.put("pick", ranked.isEmpty() ? null : ranked.get(0));
            g.put("ranked", ranked);
            g.put("scores", scores);
            g.put("rejected", rejected);
            got = g;
        }
        Object want = c.get("expect");
        assertTrue("want " + want + "\n got " + got, Spec.same(got, want));
    }
}
