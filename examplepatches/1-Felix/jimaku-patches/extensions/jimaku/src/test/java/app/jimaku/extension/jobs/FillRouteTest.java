package app.jimaku.extension.jobs;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import app.jimaku.extension.SharedCases;

/** Runs the extension's progress-bar cases (tests/shared/progress-bar.json); its `about` says how to read them. */
public class FillRouteTest {
    private static Glide even(JSONArray e) throws Exception {
        return TimeLeft.evenGlide(e.getDouble(0), e.getDouble(1), e.getDouble(2), e.getDouble(3), e.getDouble(4));
    }

    private static void point(String name, FillRoute.Point point, JSONArray expected) throws Exception {
        assertEquals(name + " at", expected.getDouble(0), point.at, 0.5);
        assertEquals(name + " share", expected.getDouble(1), point.share, 0.00005);
        assertEquals(name + " easing", "ease-out".equals(expected.getString(2)), point.easeOut);
    }

    @Test
    public void passesTheSharedCases() throws Exception {
        JSONArray cases = SharedCases.read("progress-bar.json").getJSONArray("cases");
        for (int i = 0; i < cases.length(); i++) {
            JSONObject c = cases.getJSONObject(i);
            String name = c.getString("name");
            FillRoute route = FillRoute.of(c.isNull("last") ? null : even(c.getJSONArray("last")), even(c.getJSONArray("glide")), c.getDouble("now"));
            assertEquals(name, c.getDouble("end"), route.end, 0.00005);
            if (c.optBoolean("still")) {
                assertTrue(name, route.points.isEmpty());
                continue;
            }
            if (c.has("first")) point(name, route.points.get(0), c.getJSONArray("first"));
            if (c.has("second")) point(name, route.points.get(1), c.getJSONArray("second"));
            if (c.optBoolean("allLinear")) for (FillRoute.Point p : route.points) assertTrue(name, !p.easeOut);
            if (c.has("reaches")) {
                JSONArray reaches = c.getJSONArray("reaches");
                Double at = null;
                for (FillRoute.Point p : route.points) if (Math.abs(p.share - reaches.getDouble(0)) < 1e-4) at = p.at;
                assertEquals(name, reaches.getDouble(1), at, 0.5);
            }
            for (int k = 1; k < route.points.size(); k++) {
                assertTrue(name, route.points.get(k).at > route.points.get(k - 1).at);
                assertTrue(name, route.points.get(k).share >= route.points.get(k - 1).share - 1e-12);
            }
            FillRoute.Point last = route.points.get(route.points.size() - 1);
            FillRoute.Point before = route.points.get(route.points.size() - 2);
            assertEquals(name, c.getDouble("end"), last.share, 0.00005);
            if (c.has("crawl")) {
                assertEquals(name, c.getDouble("crawl"), (last.share - before.share) / ((last.at - before.at) / 1000), 0.000005);
            }
        }
    }

    @Test
    public void standsAlongItsPointsAndEasesOutWhileCatchingUp() throws Exception {
        Glide last = TimeLeft.evenGlide(0.2, 0.6, 10000, 8, 0.8);
        FillRoute route = FillRoute.of(last, TimeLeft.evenGlide(0.5, 0.9, 11000, 10, 0.95), 11000);
        assertEquals(0.25, route.at(11000), 1e-9);
        // Halfway through the catch-up, ease-out has it three quarters of the way.
        assertEquals(0.25 + (0.512 - 0.25) * 0.75, route.at(11150), 1e-6);
        assertEquals(0.95, route.at(route.endsAt() + 1000), 1e-9);
    }
}
