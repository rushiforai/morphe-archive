package app.wordfeudwordfinder.extension.words;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.json.JSONObject;
import org.junit.Test;

public class WordReporterTest {
    private final List<String[]> sent = new ArrayList<>();

    private WordReporter reporter(String url) {
        return new WordReporter(url, (u, json) -> sent.add(new String[] {u, json}), Runnable::run);
    }

    @Test
    public void sendsOnlyRulesetWordsAndPatchVersion() throws Exception {
        reporter("https://w.example/report").report(2, Arrays.asList("NDJ", "XY"));
        assertEquals(1, sent.size());
        assertEquals("https://w.example/report", sent.get(0)[0]);
        JSONObject o = new JSONObject(sent.get(0)[1]);
        assertEquals(4, o.length());
        assertEquals("remove", o.getString("type"));
        assertEquals(2, o.getInt("ruleset"));
        assertEquals("NDJ", o.getJSONArray("words").getString(0));
        assertEquals("XY", o.getJSONArray("words").getString(1));
        assertTrue(o.has("patch"));
    }

    @Test
    public void additionsAreSentInChunksOfEight() throws Exception {
        List<String> words = new ArrayList<>();
        for (int i = 0; i < 10; i++) words.add("W" + (char) ('A' + i));
        reporter("https://w.example/report").reportAdditions(2, words);
        assertEquals(2, sent.size());
        JSONObject first = new JSONObject(sent.get(0)[1]);
        assertEquals("add", first.getString("type"));
        assertEquals(8, first.getJSONArray("words").length());
        assertEquals(2, new JSONObject(sent.get(1)[1]).getJSONArray("words").length());
    }

    @Test
    public void offWithoutHttpsAddressOrWords() {
        assertFalse(reporter("").enabled());
        reporter("").report(2, Arrays.asList("NDJ"));
        reporter(null).report(2, Arrays.asList("NDJ"));
        reporter("http://w.example/report").report(2, Arrays.asList("NDJ"));
        reporter("https://w.example/report").report(2, Collections.emptyList());
        reporter("https://w.example/report").report(2, null);
        assertTrue(sent.isEmpty());
    }

    @Test
    public void failuresAreSwallowed() {
        WordReporter r = new WordReporter("https://w.example/report", (u, json) -> {
            throw new java.io.IOException("offline");
        }, Runnable::run);
        r.report(2, Arrays.asList("NDJ")); // no exception
        WordReporter rejecting = new WordReporter("https://w.example/report", (u, json) -> { }, task -> {
            throw new java.util.concurrent.RejectedExecutionException();
        });
        rejecting.report(2, Arrays.asList("NDJ")); // no exception
    }

    @Test
    public void buildWithoutAddressReportsNothing() {
        // gradle.properties has an empty wordReportUrl in this repository until the worker is deployed.
        assertEquals(!WordListManifest.REPORT_URL.isEmpty(), WordReporter.fromBuild().enabled());
    }
}
