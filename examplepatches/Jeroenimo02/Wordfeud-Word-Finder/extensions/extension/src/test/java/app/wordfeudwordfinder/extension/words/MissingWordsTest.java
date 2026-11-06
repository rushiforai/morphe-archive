package app.wordfeudwordfinder.extension.words;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import app.wordfeudwordfinder.extension.core.Storage;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

public class MissingWordsTest {
    @Rule public TemporaryFolder tmp = new TemporaryFolder();

    private final List<String> sent = new ArrayList<>();

    private WordReporter reporter() {
        return new WordReporter("https://w.example/report", (u, json) -> {
            try {
                JSONObject o = new JSONObject(json);
                JSONArray a = o.getJSONArray("words");
                for (int i = 0; i < a.length(); i++) sent.add(o.getString("type") + ":" + a.getString(i));
            } catch (Exception e) {
                throw new java.io.IOException(e);
            }
        }, Runnable::run);
    }

    private final WordGraph graph = WordGraph.build(Arrays.asList("NEIGEN", "KAT"));

    @Test
    public void reportsOnlyWordsMissingFromTheListOncePerDevice() throws Exception {
        Storage storage = new Storage(tmp.getRoot());
        MissingWords m = new MissingWords(storage, reporter());
        assertEquals(Arrays.asList("TONG"), m.check(2, graph, Arrays.asList("NEIGEN", "TONG", "kat", "tong")));
        assertEquals(Arrays.asList("add:TONG"), sent);
        // Same words again, also after a restart (new instance, same storage): nothing new.
        assertTrue(m.check(2, graph, Arrays.asList("TONG")).isEmpty());
        assertTrue(new MissingWords(storage, reporter()).check(2, graph, Arrays.asList("TONG")).isEmpty());
        assertEquals(1, sent.size());
        // Per ruleset: the same word for another language is reported separately.
        assertEquals(Arrays.asList("TONG"), m.check(4, graph, Arrays.asList("TONG")));
    }

    @Test
    public void nothingWhenReportingIsOffOrInputMissing() {
        Storage storage = new Storage(tmp.getRoot());
        WordReporter off = new WordReporter("", (u, json) -> sent.add(json), Runnable::run);
        assertTrue(new MissingWords(storage, off).check(2, graph, Arrays.asList("TONG")).isEmpty());
        MissingWords m = new MissingWords(storage, reporter());
        assertTrue(m.check(2, null, Arrays.asList("TONG")).isEmpty());
        assertTrue(m.check(2, graph, null).isEmpty());
        assertTrue(m.check(2, graph, Arrays.asList("A", " ", "")).isEmpty());
        assertTrue(sent.isEmpty());
    }

    @Test
    public void atMostMaxPerCheck() {
        List<String> many = new ArrayList<>();
        for (int i = 0; i < 40; i++) many.add("X" + (char) ('A' + i % 26) + (char) ('A' + i / 26));
        MissingWords m = new MissingWords(new Storage(tmp.getRoot()), reporter());
        assertEquals(MissingWords.MAX_PER_CHECK, m.check(2, graph, many).size());
        assertEquals(40 - MissingWords.MAX_PER_CHECK, m.check(2, graph, many).size());
    }
}
