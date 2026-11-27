package app.jimaku.extension.jobs;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import app.jimaku.extension.SharedCases;

/** Runs the extension's time-left cases (tests/shared/time-left.json); its `about` says how to read them. */
public class TimeLeftTest {
    private static final JSONObject CASES = read();

    private static JSONObject read() {
        try {
            return SharedCases.read("time-left.json");
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
    }

    /** As close as {@code digits} decimal places ask, as vitest's toBeCloseTo, or within 1e-9 without. */
    private static void close(String what, double expected, double actual, Object digits) throws Exception {
        double tolerance = digits instanceof Number ? Math.pow(10, -((Number) digits).intValue()) / 2 : 1e-9;
        assertTrue(what + ": expected " + expected + ", got " + actual, Math.abs(actual - expected) < tolerance);
    }

    private static Object digitsAt(JSONArray triple) throws Exception {
        return triple.length() > 2 && !triple.isNull(2) ? triple.get(2) : null;
    }

    static TimedJob job(JSONObject change) throws Exception {
        JSONObject base = CASES.getJSONObject("base").getJSONObject("job");
        JSONObject merged = new JSONObject(base.toString());
        for (java.util.Iterator<String> keys = change.keys(); keys.hasNext(); ) {
            String key = keys.next();
            merged.put(key, change.get(key));
        }
        return new TimedJob(
                JobKind.of(merged.getString("kind")),
                JobState.of(merged.getString("state")),
                merged.isNull("percent") ? null : merged.getDouble("percent"),
                merged.getDouble("since"),
                sample(merged, "first"),
                sample(merged, "last"));
    }

    private static TimedJob.Sample sample(JSONObject job, String key) throws Exception {
        if (job.isNull(key)) return null;
        JSONObject sample = job.getJSONObject(key);
        return new TimedJob.Sample(sample.getDouble("at"), sample.getDouble("percent"));
    }

    private static Glide progress(JSONObject spec) throws Exception {
        return TimeLeft.progressOf(job(spec.getJSONObject("job")), spec.getDouble("duration"), spec.getBoolean("translates"), spec.getDouble("now"));
    }

    private static Glide glideOf(JSONObject spec) throws Exception {
        if (spec.has("even")) {
            JSONArray e = spec.getJSONArray("even");
            return TimeLeft.evenGlide(e.getDouble(0), e.getDouble(1), e.getDouble(2), e.getDouble(3), e.getDouble(4));
        }
        Glide glide = progress(spec.getJSONObject("progress"));
        assertNotNull(glide);
        return glide;
    }

    private static double pace(Glide glide, double at) throws Exception {
        return (TimeLeft.standing(glide, at + 100) - TimeLeft.standing(glide, at)) * 10;
    }

    @Test
    public void secondsLeft() throws Exception {
        JSONArray cases = CASES.getJSONArray("secondsLeft");
        for (int i = 0; i < cases.length(); i++) {
            JSONObject c = cases.getJSONObject(i);
            double left = TimeLeft.secondsLeft(job(c.getJSONObject("job")), c.getDouble("duration"), c.getBoolean("translates"), c.getDouble("now"));
            close(c.getString("name"), c.getDouble("is"), left, c.opt("digits"));
        }
    }

    @Test
    public void words() throws Exception {
        JSONArray words = CASES.getJSONArray("words");
        for (int i = 0; i < words.length(); i++) {
            JSONArray pair = words.getJSONArray(i);
            String expected = pair.isNull(1) ? null : pair.getString(1);
            assertEquals("at " + pair.getDouble(0), expected, TimeLeft.timeLeftText(Locale.ENGLISH, pair.getDouble(0)));
        }
    }

    @Test
    public void progressOf() throws Exception {
        JSONArray cases = CASES.getJSONArray("progressOf");
        int digits = CASES.getInt("progressDigits");
        for (int i = 0; i < cases.length(); i++) {
            JSONObject c = cases.getJSONObject(i);
            String name = c.getString("name");
            Glide glide = progress(c);
            if (c.isNull("is")) {
                assertNull(name, glide);
                continue;
            }
            assertNotNull(name, glide);
            JSONObject is = c.getJSONObject("is");
            if (is.has("from")) close(name + " from", is.getDouble("from"), glide.from, digits);
            if (is.has("to")) close(name + " to", is.getDouble("to"), glide.to, digits);
            if (is.has("seconds")) close(name + " seconds", is.getDouble("seconds"), glide.seconds, digits);
            if (is.has("ceiling")) close(name + " ceiling", is.getDouble("ceiling"), glide.ceiling, digits);
        }
    }

    @Test
    public void glides() throws Exception {
        JSONArray cases = CASES.getJSONArray("glides");
        for (int i = 0; i < cases.length(); i++) {
            JSONObject c = cases.getJSONObject(i);
            String name = c.getString("name");
            Glide glide = glideOf(c.getJSONObject("glide"));
            JSONArray stands = c.optJSONArray("standing");
            for (int j = 0; stands != null && j < stands.length(); j++) {
                JSONArray s = stands.getJSONArray(j);
                close(name + " at " + s.getDouble(0), s.getDouble(1), TimeLeft.standing(glide, s.getDouble(0)), digitsAt(s));
            }
            JSONArray paces = c.optJSONArray("pace");
            for (int j = 0; paces != null && j < paces.length(); j++) {
                JSONArray p = paces.getJSONArray(j);
                close(name + " pace at " + p.getDouble(0), p.getDouble(1), pace(glide, p.getDouble(0)), digitsAt(p));
            }
            JSONArray slower = c.optJSONArray("slower");
            for (int j = 0; slower != null && j < slower.length(); j++) {
                JSONArray s = slower.getJSONArray(j);
                assertTrue(name + " slower", pace(glide, s.getDouble(0)) < pace(glide, s.getDouble(1)));
            }
            JSONArray from = c.optJSONArray("from");
            if (from != null) close(name + " from", from.getDouble(0), glide.from, from.get(1));
            JSONArray above = c.optJSONArray("above");
            for (int j = 0; above != null && j < above.length(); j++) {
                JSONArray a = above.getJSONArray(j);
                assertTrue(name + " above", TimeLeft.standing(glide, a.getDouble(0)) > a.getDouble(1));
            }
        }
    }

    @Test
    public void onward() throws Exception {
        JSONArray cases = CASES.getJSONArray("onward");
        for (int i = 0; i < cases.length(); i++) {
            JSONObject c = cases.getJSONObject(i);
            String name = c.getString("name");
            JSONArray reads = c.getJSONArray("reads");
            List<Glide> glides = new ArrayList<>();
            for (int j = 0; j < reads.length(); j++) {
                JSONObject read = reads.getJSONObject(j);
                Glide glide = TimeLeft.progressOf(job(read.getJSONObject("job")), c.getDouble("duration"), c.getBoolean("translates"), read.getDouble("at"));
                assertNotNull(name, glide);
                glides.add(glide);
            }
            Glide first = glides.get(0);
            Glide shown = null;
            double before = 0;
            JSONObject each = c.optJSONObject("eachAsFirst");
            for (int j = 0; j < glides.size(); j++) {
                shown = TimeLeft.onward(shown, glides.get(j));
                double at = reads.getJSONObject(j).getDouble("at");
                if (each != null && j > 0) {
                    JSONArray after = each.getJSONArray("after");
                    for (int k = 0; k < after.length(); k++) {
                        double later = at + after.getDouble(k);
                        close(name + " at " + later, TimeLeft.standing(first, later), TimeLeft.standing(shown, later), each.getInt("digits"));
                    }
                }
                if (c.optBoolean("neverBack")) {
                    double now = TimeLeft.standing(shown, at);
                    assertTrue(name + " at " + at, now >= before - 1e-9);
                    before = now;
                }
            }
            JSONObject asFirst = c.optJSONObject("asFirst");
            if (asFirst != null) {
                JSONArray ats = asFirst.getJSONArray("at");
                for (int k = 0; k < ats.length(); k++) {
                    close(name, TimeLeft.standing(first, ats.getDouble(k)), TimeLeft.standing(shown, ats.getDouble(k)), asFirst.getInt("digits"));
                }
            }
            if (c.has("toAsFirst")) close(name + " to", first.to, shown.to, c.getInt("toAsFirst"));
            JSONArray firstStanding = c.optJSONArray("firstStanding");
            for (int k = 0; firstStanding != null && k < firstStanding.length(); k++) {
                JSONArray s = firstStanding.getJSONArray(k);
                close(name + " first", s.getDouble(1), TimeLeft.standing(first, s.getDouble(0)), digitsAt(s));
            }
            JSONArray from = c.optJSONArray("from");
            if (from != null) close(name + " from", from.getDouble(0), shown.from, from.get(1));
            JSONArray fromAsFirstAt = c.optJSONArray("fromAsFirstAt");
            if (fromAsFirstAt != null) {
                close(name + " from", TimeLeft.standing(first, fromAsFirstAt.getDouble(0)), shown.from, fromAsFirstAt.get(1));
            }
            if (c.optBoolean("toAtLeastFrom")) assertTrue(name, shown.to >= shown.from);
        }
    }

    @Test
    public void course() throws Exception {
        JSONArray cases = CASES.getJSONArray("course");
        for (int i = 0; i < cases.length(); i++) {
            JSONObject c = cases.getJSONObject(i);
            String name = c.getString("name");
            Glide glide = glideOf(c.getJSONObject("glide"));
            List<TimeLeft.Point> points = TimeLeft.course(glide, c.getDouble("now"));
            JSONArray first = c.optJSONArray("first");
            if (first != null) {
                assertEquals(name, first.getDouble(0), points.get(0).at, 0);
                assertEquals(name, first.getDouble(1), points.get(0).share, 0);
            }
            JSONArray through = c.optJSONArray("through");
            for (int k = 0; through != null && k < through.length(); k++) {
                JSONArray t = through.getJSONArray(k);
                TimeLeft.Point found = null;
                for (TimeLeft.Point point : points) if (Math.abs(point.at - t.getDouble(0)) < 1e-6) found = point;
                assertNotNull(name + " through " + t.getDouble(0), found);
                close(name, t.getDouble(1), found.share, digitsAt(t));
            }
            for (int k = 0; k < points.size(); k++) {
                TimeLeft.Point point = points.get(k);
                close(name + " point " + k, TimeLeft.standing(glide, point.at), point.share, 6);
                if (k > 0) {
                    assertTrue(name, point.at > points.get(k - 1).at);
                    assertTrue(name, point.share >= points.get(k - 1).share);
                }
            }
            TimeLeft.Point last = points.get(points.size() - 1);
            assertEquals(name, c.getDouble("end"), last.share, 0);
            assertTrue(name, TimeLeft.standing(glide, last.at - 100) < c.getDouble("end"));
            if (!c.isNull("length")) assertEquals(name, c.getInt("length"), points.size());
        }
    }
}
