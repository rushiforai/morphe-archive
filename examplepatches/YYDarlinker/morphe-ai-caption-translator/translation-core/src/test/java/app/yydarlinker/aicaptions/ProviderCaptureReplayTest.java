package app.yydarlinker.aicaptions;

import static app.yydarlinker.aicaptions.TranslationPlaybackFixture.readResource;
import static org.junit.Assert.*;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.function.Predicate;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
public class ProviderCaptureReplayTest {
    static final String SRT = "/r2/mH5TlcMo_m4.en.srt";

    static List<JSONObject> rows(String resource) throws Exception {
        String content = new String(readResource(resource), StandardCharsets.UTF_8);
        List<JSONObject> result = new ArrayList<>();
        if (resource.endsWith(".jsonl")) {
            for (String line : content.split("\n")) if (!line.isBlank()) result.add(new JSONObject(line));
        } else {
            JSONArray array = new JSONArray(content);
            for (int i = 0; i < array.length(); i++) result.add(array.getJSONObject(i));
        }
        return result;
    }

    static JSONObject payload(JSONObject row) throws Exception {
        return row.getJSONObject(row.has("payload") ? "payload" : "source");
    }

    static int index(JSONObject row) throws Exception {
        return Integer.parseInt(payload(row).getString("block").split("_")[0].substring(1));
    }

    static long edge(JSONObject row, boolean end) throws Exception {
        JSONArray times = payload(row).getJSONArray("diagnostic_only_source_times");
        return times.getJSONArray(end ? times.length() - 1 : 0).getLong(end ? 2 : 1);
    }

    static TranslationCaptureReplay replay(String resource, List<JSONObject> rows) throws Exception {
        List<JSONObject> requests = new ArrayList<>();
        boolean fullTrack = resource.contains("/r211/") || resource.startsWith("/r28/") || resource.startsWith("/display/");
        if (fullTrack) for (JSONObject row : rows("/r28/captured-events.json")) requests.add(payload(row));
        for (JSONObject row : rows) requests.add(payload(row));
        return new TranslationCaptureReplay(fullTrack ? readResource(SRT) : null, "application/x-subrip",
                requests, "en", "zh-Hans", 46);
    }

    static void receive(TranslationCaptureReplay player, JSONObject row, String expected, boolean quotes) throws Exception {
        assertEquals("capture " + row.getInt("request"), expected,
                player.receive(payload(row), row.get("response").toString(), quotes));
    }

    static void assertCapture(String path, int count, boolean quotes) throws Exception {
        List<JSONObject> rows = rows(path);
        assertEquals(path, count, rows.size());
        TranslationCaptureReplay player = replay(path, rows);
        for (JSONObject row : rows) {
            String expected = "";
            if (path.startsWith("/r26/") && row.getInt("request") == 6) expected = "source_coverage";
            if (path.startsWith("/r26/") && row.getInt("request") == 19) expected = "dependent_source_end";
            receive(player, row, expected, quotes);
        }
    }

    @Test public void legacyCaptureRetainsItsTwoStructuralRejections() throws Exception {
        assertCapture("/r26/captured-events.json", 31, false);
    }

    @Test public void quotedR27CaptureRemainsSourceBound() throws Exception {
        assertCapture("/r27/captured-events.json", 27, true);
    }

    @Test public void quotedR28CaptureRemainsSourceBound() throws Exception {
        assertCapture("/r28/captured-events.json", 36, true);
    }

    @Test public void allSevenDeepSeekReboundRepliesAreAcceptedLocally() throws Exception {
        assertCapture("/r211/deepseek-rebound.json", 7, true);
    }

    @Test public void bothQwenRiskRepliesRemainDisplayable() throws Exception {
        assertCapture("/r211/qwen-risk.json", 2, true);
    }

    @Test public void everyDeepSeekExchangeIsConsumedIncludingCapturesOutsideTheOpening() throws Exception {
        assertCapture("/display/deepseek-flash.jsonl", 19, true);
    }

    @Test public void everyQwenExchangeIsConsumedIncludingTheLaterCapture() throws Exception {
        assertCapture("/display/qwen3.8-flash.jsonl", 12, true);
    }

    @Test public void deepSeekOpeningKeepsIts88Pages() throws Exception {
        timeline("deepseek-flash", "DEEPSEEK", 0, 14, 88);
    }

    @Test public void repairedDeepSeekOpeningChangesAtASharedBoundary() throws Exception {
        timeline("deepseek-flash", "DEEPSEEK_REPAIR", 1, 1, 8);
    }

    @Test public void qwenOpeningKeepsIts39Pages() throws Exception {
        timeline("qwen3.8-flash", "QWEN", 0, 10, 39);
    }

    void timeline(String file, String label, int first, int last, int count) throws Exception {
        String path = "/display/" + file + ".jsonl";
        List<JSONObject> rows = rows(path);
        TranslationCaptureReplay player = replay(path, rows);
        JSONObject[] opening = new JSONObject[last + 1];
        JSONObject repair = null;
        for (JSONObject row : rows) {
            int block = index(row);
            if (block < first || block > last) continue;
            if (opening[block] == null) opening[block] = row;
            else if (block == 1) repair = row;
        }
        for (int block = first; block <= last; block++) receive(player, opening[block], "", true);
        List<String> actual = new ArrayList<>();
        String previous = "";
        for (long time = edge(opening[first], false); time < edge(opening[last], true); time += 40) {
            if (repair != null && time <= 9920 && 9920 < time + 40) receive(player, repair, "", true);
            TranslationCaptureReplay.Page page = player.at(time);
            if (page == null || page.id.equals(previous)) continue;
            actual.add(String.format(Locale.ROOT, "%.2fs\t%s\t%s", time / 1000.0, page.id, page.text));
            previous = page.id;
        }
        List<String> expected = new String(readResource("/wave4a/display-timeline.tsv"), StandardCharsets.UTF_8)
                .lines().filter(line -> line.startsWith(label + "\t"))
                .map(line -> line.substring(label.length() + 1)).collect(java.util.stream.Collectors.toList());
        assertEquals(count, expected.size());
        assertEquals(label, expected, actual);
    }
}

