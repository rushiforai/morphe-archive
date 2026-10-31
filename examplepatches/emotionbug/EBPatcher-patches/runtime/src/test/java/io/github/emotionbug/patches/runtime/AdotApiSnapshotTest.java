package io.github.emotionbug.patches.runtime;

import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 29)
public final class AdotApiSnapshotTest {
    // Mutable fixtures deliberately prove capture retains neither API objects nor their list.
    public static final class Api {
        public int a;
        public String b;
        public final List<Utterance> d = new ArrayList<>();
        Api(int self, String title) { a = self; b = title; }
    }

    public static final class Utterance {
        public int a;
        public String b;
        public int c;
        public long d;
        public long e;
        Utterance(int sequence, String message, int talker, long time, long duration) {
            a = sequence; b = message; c = talker; d = time; e = duration;
        }
    }

    private static Api api() {
        Api api = new Api(7, "Original call");
        api.d.add(new Utterance(41, "The remote person answers", 12, 4_000_000_000L, 1000));
        api.d.add(new Utterance(3, "I am the owner", 7, 200, 300));
        return api;
    }

    private static JSONObject row(int sequence, String message, int talker, long time, long duration) throws Exception {
        return new JSONObject().put("sequence", sequence).put("message", message).put("talker_id", talker)
                .put("talk_time", time).put("talk_duration", duration).put("is_edited", 0);
    }

    private static JSONObject canonical() throws Exception {
        return new JSONObject().put("briefing_info", new JSONArray().put(new JSONObject()
                .put("my_talk_id", 7).put("call_title", "Original call")))
                .put("briefing_converted_text", new JSONArray()
                        .put(row(3, "I am the owner", 7, 200, 300))
                        .put(row(41, "The remote person answers", 12, 4_000_000_000L, 1000)));
    }

    private static JSONObject info(JSONObject raw) throws Exception {
        return raw.getJSONArray("briefing_info").getJSONObject(0);
    }

    private static JSONObject first(JSONObject raw) throws Exception {
        return raw.getJSONArray("briefing_converted_text").getJSONObject(0);
    }

    @Test public void captureSurvivesSourceListAndObjectMutationBeforeExecutorReads() throws Exception {
        Api source = api();
        AdotApiSnapshot captured = AdotApiSnapshot.capture(source);
        Utterance old = source.d.get(0);
        old.a = 900; old.b = "Replacement generation"; old.c = 7; old.d = 5; old.e = 6;
        source.a = 12; source.b = "New title";
        source.d.clear();
        source.d.add(new Utterance(1, "Unrelated later transcript", 12, 0, 10));
        assertTrue(captured.matches(canonical()));
        assertFalse(AdotApiSnapshot.capture(source).matches(canonical()));
    }

    @Test public void rowOrderAndGeneratedIdsDoNotIdentifyGeneration() throws Exception {
        AdotApiSnapshot captured = AdotApiSnapshot.capture(api());
        JSONObject raw = canonical(); // Reverse API order, with no generated row IDs at all.
        assertTrue(captured.matches(raw));
        first(raw).put("_id", 999999L).put("briefing_info_id", 82);
        raw.getJSONArray("briefing_converted_text").getJSONObject(1).put("_id", 1);
        String unchanged = raw.toString();
        assertTrue(captured.matches(raw));
        assertEquals(unchanged, raw.toString());
    }

    @Test public void delayedCallbackCannotAuthenticateAnotherSpeakerGeneration() throws Exception {
        AdotApiSnapshot captured = AdotApiSnapshot.capture(api());
        JSONObject raw = canonical();
        info(raw).put("my_talk_id", 12);
        assertFalse(captured.matches(raw));
        info(raw).put("my_talk_id", 7);
        first(raw).put("talker_id", 12);
        raw.getJSONArray("briefing_converted_text").getJSONObject(1).put("talker_id", 7);
        assertFalse(captured.matches(raw));
        assertTrue(captured.matches(canonical()));
    }

    @Test public void everyTranscriptFieldAndEditMarkerMustMatch() throws Exception {
        AdotApiSnapshot captured = AdotApiSnapshot.capture(api());
        String[] keys = {"sequence", "message", "talker_id", "talk_time", "talk_duration", "is_edited"};
        Object[] changed = {4, "Changed owner words", 12, 201L, 301L, 1};
        for (int i = 0; i < keys.length; i++) {
            JSONObject raw = canonical();
            first(raw).put(keys[i], changed[i]);
            String unchanged = raw.toString();
            assertFalse(keys[i], captured.matches(raw));
            assertEquals(unchanged, raw.toString());
        }
        JSONObject changedRemote = canonical();
        changedRemote.getJSONArray("briefing_converted_text").getJSONObject(1).put("talk_time", 4_000_000_001L);
        assertFalse(captured.matches(changedRemote));
    }

    @Test public void countAndUniqueSequencesPreventPartialOrDuplicatedGenerationMatches() throws Exception {
        AdotApiSnapshot captured = AdotApiSnapshot.capture(api());
        JSONObject missing = canonical();
        missing.put("briefing_converted_text", new JSONArray().put(first(missing)));
        assertFalse(captured.matches(missing));
        JSONObject extra = canonical();
        extra.getJSONArray("briefing_converted_text").put(row(99, "Extra words", 7, 0, 1));
        assertFalse(captured.matches(extra));
        JSONObject duplicate = canonical();
        duplicate.getJSONArray("briefing_converted_text").put(1, new JSONObject(first(duplicate).toString()));
        assertFalse(captured.matches(duplicate));
        Api duplicateApi = api();
        duplicateApi.d.get(1).a = 41;
        assertThrows(IllegalArgumentException.class, () -> AdotApiSnapshot.capture(duplicateApi));
    }

    @Test public void nonNullTitleAuthenticatesWithoutOverwritingCanonicalMetadata() throws Exception {
        AdotApiSnapshot captured = AdotApiSnapshot.capture(api());
        JSONObject raw = canonical();
        info(raw).put("call_title", "Local replacement title");
        String unchanged = raw.toString();
        assertFalse(captured.matches(raw));
        assertEquals(unchanged, raw.toString());
        info(raw).put("call_title", JSONObject.NULL);
        assertFalse(captured.matches(raw));
        Api nullable = api(); nullable.b = null;
        assertTrue(AdotApiSnapshot.capture(nullable).matches(raw));
        info(raw).put("my_talk_id", 12);
        assertFalse(AdotApiSnapshot.capture(nullable).matches(raw));
    }

    @Test public void emptyGenerationMatchesOnlyEmptyRowsAndStillChecksIdentity() throws Exception {
        Api empty = new Api(7, "Original call");
        AdotApiSnapshot captured = AdotApiSnapshot.capture(empty);
        JSONObject raw = canonical();
        assertFalse(captured.matches(raw));
        raw.put("briefing_converted_text", new JSONArray());
        assertTrue(captured.matches(raw));
        assertFalse(AdotApiSnapshot.capture(api()).matches(raw));
        info(raw).put("my_talk_id", 12);
        assertFalse(captured.matches(raw));
        info(raw).put("my_talk_id", 7).put("call_title", "Another empty call");
        assertFalse(captured.matches(raw));
    }

    @Test public void absentIdentityOrRequiredRowFieldsCannotAuthenticate() throws Exception {
        AdotApiSnapshot captured = AdotApiSnapshot.capture(api());
        assertFalse(captured.matches(null));
        assertFalse(captured.matches(new JSONObject()));
        JSONObject raw = canonical();
        first(raw).remove("is_edited");
        assertFalse(captured.matches(raw));
        raw = canonical();
        info(raw).remove("my_talk_id");
        assertFalse(captured.matches(raw));
        raw = canonical();
        raw.getJSONArray("briefing_info").put(new JSONObject(info(raw).toString()));
        assertFalse(captured.matches(raw));
    }
}
