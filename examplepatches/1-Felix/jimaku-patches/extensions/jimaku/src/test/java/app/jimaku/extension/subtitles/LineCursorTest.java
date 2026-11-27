package app.jimaku.extension.subtitles;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import app.jimaku.extension.SharedCases;

public class LineCursorTest {
    @Test
    public void passesTheSharedCases() throws Exception {
        JSONArray cases = cases();
        for (int c = 0; c < cases.length(); c++) {
            JSONObject testCase = cases.getJSONObject(c);
            String name = testCase.getString("name");
            LineCursor cursor = new LineCursor(lines(testCase.getJSONArray("lines")));
            JSONArray steps = testCase.getJSONArray("steps");
            for (int s = 0; s < steps.length(); s++) {
                JSONObject step = steps.getJSONObject(s);
                double t = step.getDouble("t");
                String expected = step.isNull("text") ? null : step.getString("text");
                Line line = cursor.at(t);
                assertEquals(name + " at " + t, expected, line == null ? null : line.text);
            }
        }
    }

    @Test
    public void sharedCasesCoverBoundariesSeeksAndGaps() throws Exception {
        JSONArray cases = cases();
        List<String> names = new ArrayList<>();
        for (int c = 0; c < cases.length(); c++) names.add(cases.getJSONObject(c).getString("name"));
        assertTrue(names.toString(), names.contains("moves to the next line at a boundary where two lines touch"));
        assertTrue(names.toString(), names.contains("seeks forward and back"));
        assertTrue(names.toString(), names.contains("seeks back into a gap and forward out of it"));
        assertTrue(names.toString(), names.contains("shows nothing in a gap or after the last line"));
    }

    private static JSONArray cases() throws Exception {
        return SharedCases.read("line-cursor.json").getJSONArray("cases");
    }

    private static List<Line> lines(JSONArray array) throws Exception {
        List<Line> lines = new ArrayList<>();
        for (int i = 0; i < array.length(); i++) {
            JSONObject line = array.getJSONObject(i);
            lines.add(new Line(line.getDouble("start"), line.getDouble("end"), line.getString("text")));
        }
        return lines;
    }
}
