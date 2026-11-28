package app.yydarlinker.aicaptions;

import static app.yydarlinker.aicaptions.TranslationPlaybackFixture.readResource;
import static org.junit.Assert.*;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
public class SourceTrackReplayTest {
    @Test public void nativeJson3SourceAndAllRequestBodiesMatchCapturedBaseline() throws Exception {
        assertPlan("JSON3", capture("/golden/mH5TlcMo_m4.en.json3.gz", "application/json", "en"));
    }

    @Test public void vttSourceAndAllRequestBodiesMatchCapturedBaseline() throws Exception {
        assertPlan("VTT", capture("/golden/mH5TlcMo_m4.en.vtt.gz", "text/vtt", "en"));
    }

    @Test public void srtSourceAndAllRequestBodiesMatchCapturedBaseline() throws Exception {
        assertPlan("SRT", capture(ProviderCaptureReplayTest.SRT, "application/x-subrip", "en"));
    }

    @Test public void estimatedSourceAndAllRequestBodiesMatchCapturedBaseline() throws Exception {
        String resource = "/r28/captured-events.json";
        assertPlan("CAPTURED", ProviderCaptureReplayTest.replay(resource, ProviderCaptureReplayTest.rows(resource)));
    }

    @Test public void fullEnglishTrackPreservesTheOpeningPhraseWithoutDoubling() throws Exception {
        assertTrack("r3", "en", "I just bought this entire", false);
    }

    @Test public void fullChineseTrackPreservesTheOpeningPhraseWithoutDoubling() throws Exception {
        assertTrack("r3", "zh-Hans", "我刚刚把这家超市买了下来", false);
    }

    @Test public void pairedEnglishCueUpdatesCollapseWithoutReorderingSpeech() throws Exception {
        assertTrack("r151", "en", "I just bought this entire", true);
    }

    @Test public void pairedChineseCueUpdatesCollapseWithoutReorderingSpeech() throws Exception {
        assertTrack("r151", "zh-Hans", "我刚刚把这家超市买了下来", true);
    }

    static TranslationCaptureReplay capture(String path, String type, String language) throws Exception {
        return new TranslationCaptureReplay(readResource(path), type, List.of(), language, language, 46);
    }

    static void assertTrack(String capture, String language, String first, boolean paired) throws Exception {
        String path = "/" + capture + "/plN7JMbadRg." + language + ".json3.gz";
        byte[] bytes = readResource(path);
        if (paired) {
            JSONArray rows = new JSONObject(new String(bytes, StandardCharsets.UTF_8)).getJSONArray("events");
            assertEquals(160, rows.length());
            var starts = new java.util.HashSet<Long>();
            for (int i = 0; i < rows.length(); i++) starts.add(rows.getJSONObject(i).getLong("tStartMs"));
            assertEquals(80, starts.size());
        }
        TranslationCaptureReplay replay = capture(path, "application/json", language);
        JSONArray tokens = replay.sourceTokens();
        StringBuilder text = new StringBuilder();
        long end = 0;
        for (int i = 0; i < tokens.length(); i++) {
            JSONArray token = tokens.getJSONArray(i);
            if (paired) assertTrue("token " + i, token.getLong(1) >= end);
            end = token.getLong(2);
            text.append(token.getString(0).replace(" ", ""));
        }
        String phrase = first.replace(" ", "");
        assertTrue(text.toString(), text.indexOf(phrase) >= 0);
        assertEquals(text.indexOf(phrase), text.lastIndexOf(phrase));
        assertFalse(text.toString().matches("(?s).*[\\u200b\\u2060\\ufeff].*"));
        assertFalse(replay.requests(language, "ja").isEmpty());
    }

    static void assertPlan(String name, TranslationCaptureReplay replay) throws Exception {
        String expected = new String(readResource("/wave4a/source-plan.tsv"), StandardCharsets.UTF_8)
                .lines().filter(line -> line.startsWith(name + "\t")).findFirst().orElseThrow();
        JSONArray tokens = replay.sourceTokens();
        StringBuilder timings = new StringBuilder();
        for (int i = 0; i < tokens.length(); i++) {
            JSONArray token = tokens.getJSONArray(i);
            for (int field = 0; field < token.length(); field++) {
                if (field > 0) timings.append('|');
                timings.append(token.get(field));
            }
            timings.append('\n');
        }
        StringBuilder actual = new StringBuilder(name + "\twords=" + tokens.length() + ":" + digest(timings.toString()));
        for (String[] pair : List.of(new String[]{"en", "zh-Hans"}, new String[]{"en", "ja"},
                new String[]{"ja", "zh-Hans"}, new String[]{"es", "en"})) {
            List<String> requests = replay.requests(pair[0], pair[1]);
            StringBuilder ranges = new StringBuilder();
            for (String body : requests) {
                JSONObject request = new JSONObject(body);
                String[] block = request.getString("block").split("_");
                ranges.append(block[1]).append('-').append(block[2])
                        .append(request.getBoolean("continued_before") ? '<' : '.')
                        .append(request.getBoolean("continued_after") ? '>' : '.').append(';');
            }
            actual.append(';').append(pair[0]).append('>').append(pair[1]).append('=').append(requests.size())
                    .append(':').append(digest(ranges.toString()))
                    .append(':').append(digest(String.join("\n", requests) + "\n"));
        }
        assertEquals(expected, actual.toString());
    }

    static String digest(String value) throws Exception {
        byte[] hash = MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
        StringBuilder output = new StringBuilder();
        for (int i = 0; i < 8; i++) output.append(String.format(Locale.ROOT, "%02x", hash[i] & 255));
        return output.toString();
    }
}

