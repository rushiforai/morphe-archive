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
 * spec/addons/pick-cases.json, check by check: the pick rules and the client's readings (tier,
 * kbps, probe verdict, parameters, stream answer, base URL), as scripts/addon_pick_tests.mjs reads them.
 */
@RunWith(Parameterized.class)
@SuppressWarnings("unchecked")
public class PickCasesTest {
    interface Check {
        Object[] run();   // {got, want}
    }

    @Parameterized.Parameters(name = "{0}")
    public static Collection<Object[]> cases() {
        Map<String, Object> doc = Spec.read("pick-cases.json");
        List<Object[]> out = new ArrayList<>();
        for (Object o : (List<Object>) doc.get("rowsToOpen")) {
            final Map<String, Object> c = (Map<String, Object>) o;
            out.add(new Object[]{"rowsToOpen: " + c.get("name"), (Check) () -> {
                Map<String, Object> opt = (Map<String, Object>) c.get("opt");
                double slack = opt != null && opt.get("slackSec") instanceof Number ? ((Number) opt.get("slackSec")).doubleValue() : 5;
                boolean forDownload = opt != null && Boolean.TRUE.equals(opt.get("forDownload"));
                Pick.Choice r = Pick.rowsToOpen((List<Object>) c.get("rows"), Spec.target(c.get("target")), slack, forDownload);
                List<Object> open = new ArrayList<>();
                for (Pick.Row row : r.open) open.add(row.id);
                List<Object> refused = new ArrayList<>();
                for (Pick.Refusal f : r.refused) {
                    Map<String, Object> m = new LinkedHashMap<>();
                    m.put("id", f.id);
                    m.put("why", f.why);
                    refused.add(m);
                }
                Map<String, Object> got = new LinkedHashMap<>();
                got.put("open", open);
                got.put("refused", refused);
                return new Object[]{got, c.get("expect")};
            }});
        }
        for (Object o : (List<Object>) doc.get("tierOf")) {
            final List<Object> c = (List<Object>) o;
            out.add(new Object[]{"tierOf \"" + c.get(0) + "\"", (Check) () -> new Object[]{Pick.tierOf(c.get(0)), c.get(1)}});
        }
        for (Object o : (List<Object>) doc.get("kbps")) {
            final List<Object> c = (List<Object>) o;
            out.add(new Object[]{"kbps " + c.get(0), (Check) () -> {
                Map<String, Object> raw = new LinkedHashMap<>();
                raw.put("id", "a");
                raw.put("title", "t");
                raw.putAll((Map<String, Object>) c.get(0));
                return new Object[]{Pick.rowOf(raw).kbps, c.get(1)};
            }});
        }
        for (Object o : (List<Object>) doc.get("probeVerdict")) {
            final Map<String, Object> c = (Map<String, Object>) o;
            out.add(new Object[]{"probe: " + c.get("name"), (Check) () -> {
                Map<String, Object> h = (Map<String, Object>) c.get("head");
                Pick.Head head = new Pick.Head();
                head.status = h.get("status") instanceof Number ? ((Number) h.get("status")).intValue() : null;
                head.contentRange = (String) h.get("contentRange");
                head.contentLength = (String) h.get("contentLength");
                Map<String, Object> row = (Map<String, Object>) c.get("row");
                Double kbps = row.get("kbps") instanceof Number ? ((Number) row.get("kbps")).doubleValue() : null;
                Pick.Verdict v = Pick.probeVerdict(head, (String) row.get("tier"), kbps,
                        ((Number) c.get("songSec")).doubleValue(), ((Number) c.get("slackSec")).doubleValue());
                Map<String, Object> got = new LinkedHashMap<>();
                got.put("ok", v.ok);
                if (v.why != null) got.put("why", v.why);
                return new Object[]{got, c.get("expect")};
            }});
        }
        for (Object o : (List<Object>) doc.get("paramsFor")) {
            final Map<String, Object> c = (Map<String, Object>) o;
            out.add(new Object[]{"paramsFor: " + c.get("name"), (Check) () -> {
                Map<String, Object> man = (Map<String, Object>) c.get("manifest");
                List<String[]> p = Protocol.paramsFor(Protocol.readSettings(man.get("settings")), (String) c.get("tier"), (String) c.get("picked"));
                List<Object> got = new ArrayList<>();
                for (String[] kv : p) {
                    List<Object> pair = new ArrayList<>();
                    pair.add(kv[0]);
                    pair.add(kv[1]);
                    got.add(pair);
                }
                return new Object[]{got, c.get("expect")};
            }});
        }
        for (Object o : (List<Object>) doc.get("readStream")) {
            final Map<String, Object> c = (Map<String, Object>) o;
            out.add(new Object[]{"readStream: " + c.get("name"), (Check) () -> {
                Protocol.Stream s = Protocol.readStream(c.get("answer"), null);
                Map<String, Object> all = new LinkedHashMap<>();
                all.put("miss", s.miss);
                all.put("url", s.url);
                all.put("codec", s.codec);
                all.put("transport", s.transport);
                all.put("tier", s.tier);
                all.put("sampleRate", s.sampleRate);
                all.put("bitDepth", s.bitDepth);
                all.put("bitrate", s.bitrate);
                all.put("mimeType", s.mimeType);
                all.put("headers", s.miss != null ? null : s.headers);
                all.put("cached", s.miss != null ? null : s.cached);
                Map<String, Object> want = (Map<String, Object>) c.get("expect");
                Map<String, Object> got = new LinkedHashMap<>();
                for (String k : want.keySet()) got.put(k, all.get(k));
                return new Object[]{got, want};
            }});
        }
        for (Object o : (List<Object>) doc.get("baseOf")) {
            final List<Object> c = (List<Object>) o;
            out.add(new Object[]{"baseOf \"" + c.get(0) + "\"", (Check) () -> new Object[]{Protocol.baseOf((String) c.get(0)), c.get(1)}});
        }
        for (Object o : (List<Object>) doc.get("sameAddon")) {
            final List<Object> c = (List<Object>) o;
            out.add(new Object[]{"sameAddon " + c.get(0) + " ~ " + c.get(1),
                    (Check) () -> new Object[]{Protocol.sameAddon((String) c.get(0), (String) c.get(1)), c.get(2)}});
        }
        for (Object o : (List<Object>) doc.get("qualityRank")) {
            Map<String, Object> c = (Map<String, Object>) o;
            out.add(new Object[]{"qualityRank: " + c.get("name"),
                    (Check) () -> new Object[]{(double) Pick.qualityRank(stream(c.get("stream"))), ((Number) c.get("expect")).doubleValue()}});
        }
        for (Object o : (List<Object>) doc.get("floorVerdict")) {
            Map<String, Object> c = (Map<String, Object>) o;
            out.add(new Object[]{"floorVerdict: " + c.get("name"), (Check) () -> {
                String why = Pick.floorRefusal(stream(c.get("stream")), ((Number) c.get("ytKbps")).doubleValue());
                return new Object[]{why == null ? (Object) Boolean.TRUE : why, c.get("expect")};
            }});
        }
        for (Object o : (List<Object>) doc.get("upgradeWanted")) {
            Map<String, Object> c = (Map<String, Object>) o;
            out.add(new Object[]{"upgradeWanted: " + c.get("name"), (Check) () -> {
                Pick.Upgrade u = Pick.upgradeWanted(stream(c.get("stream")), (String) c.get("tier"), Boolean.TRUE.equals(c.get("cached")));
                Map<String, Object> got = null;
                if (u != null) {
                    got = new LinkedHashMap<>();
                    got.put("aboveOnly", u.aboveOnly);
                    got.put("minRank", (double) u.minRank);
                }
                Object want = c.get("expect");
                if (want instanceof Map) {
                    Map<String, Object> w = new LinkedHashMap<>((Map<String, Object>) want);
                    w.put("minRank", ((Number) w.get("minRank")).doubleValue());
                    want = w;
                }
                return new Object[]{got, want};
            }});
            // AddonPrep.playing asks by the copy's kept rank: the same answer
            out.add(new Object[]{"upgradeWanted by rank: " + c.get("name"), (Check) () -> {
                Protocol.Stream st = stream(c.get("stream"));
                String tier = (String) c.get("tier");
                boolean cached = Boolean.TRUE.equals(c.get("cached"));
                Pick.Upgrade a = Pick.upgradeWanted(st, tier, cached), b = Pick.upgradeWanted(Pick.qualityRank(st), tier, cached);
                return new Object[]{b == null ? null : b.aboveOnly + "/" + b.minRank, a == null ? null : a.aboveOnly + "/" + a.minRank};
            }});
        }
        for (Object o : (List<Object>) doc.get("loudnessGain")) {
            Map<String, Object> c = (Map<String, Object>) o;
            Map<String, Object> ac = (Map<String, Object>) c.get("audioConfig");
            Object l = ac.get("loudnessDb");
            double db = OffsetFit.loudnessGainDb(l instanceof Number ? ((Number) l).doubleValue() : Double.NaN);
            out.add(new Object[]{"loudnessGain: " + c.get("name"),
                    (Check) () -> new Object[]{db + 0.0, ((Number) c.get("expectDb")).doubleValue() + 0.0}});
        }
        for (Object o : (List<Object>) doc.get("windowLevel")) {
            Map<String, Object> c = (Map<String, Object>) o;
            if (c.get("name") == null) continue;   // its _about
            Map<String, Object> in = (Map<String, Object>) c.get("input");
            out.add(new Object[]{"windowLevel: " + c.get("name"), (Check) () -> {
                double ytDb = num(in, "ytDb"), fileDb = num(in, "fileDb"), off = num(in, "offsetSec"), silent = num(in, "fileSilentSec");
                // the envelopes as the group's _about builds them: 40 s of 10 ms frames
                float[] yt = new float[4000], file = new float[4000];
                for (int i = 0; i < yt.length; i++) yt[i] = (float) (Math.pow(10, ytDb / 20) * (0.05 + 0.04 * Math.sin(i / 37.0)));
                double k = Math.pow(10, (fileDb - ytDb) / 20);
                for (int i = 0; i < file.length; i++) {
                    int j = (int) Math.round(i - off / 0.01);
                    file[i] = j < 0 || j >= yt.length || i * 0.01 < silent ? 0 : (float) (yt[j] * k);
                }
                double db = OffsetFit.windowLevelDb(OffsetFit.windowGainDb(yt, file, off, num(in, "fromSec"), num(in, "untilSec")));
                return new Object[]{Math.round(db * 1e4) / 1e4, ((Number) c.get("expectDb")).doubleValue() + 0.0};
            }});
        }
        return out;
    }

    private static double num(Map<String, Object> m, String k) {
        return m.get(k) instanceof Number ? ((Number) m.get(k)).doubleValue() : 0;
    }

    private static Protocol.Stream stream(Object o) {
        Map<String, Object> m = (Map<String, Object>) o;
        Protocol.Stream st = new Protocol.Stream();
        st.codec = (String) m.get("codec");
        st.tier = (String) m.get("tier");
        if (m.get("bitDepth") != null) st.bitDepth = ((Number) m.get("bitDepth")).doubleValue();
        if (m.get("sampleRate") != null) st.sampleRate = ((Number) m.get("sampleRate")).doubleValue();
        if (m.get("bitrate") != null) st.bitrate = ((Number) m.get("bitrate")).doubleValue();
        return st;
    }

    private final Check check;

    public PickCasesTest(String name, Check check) {
        this.check = check;
    }

    @Test
    public void matchesTheSpec() {
        Object[] r = check.run();
        assertTrue("want " + r[1] + "\n got " + r[0], Spec.same(r[0], r[1]));
    }
}
