package io.github.emotionbug.patches.runtime;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 29)
public final class AdotSpeakerMappingTest {
    private static JSONObject segment(String text, String speaker, long start, long end) throws Exception {
        return new JSONObject().put("text", text).put("speaker", speaker).put("startMs", start).put("endMs", end);
    }

    private static JSONObject utterance(String text, int talker, long start, long end) throws Exception {
        return segment(text, "Native speaker", start, end).put("talkerId", talker);
    }

    private static JSONObject document(JSONObject... segments) throws Exception {
        JSONArray array = new JSONArray();
        for (JSONObject segment : segments) array.put(segment);
        return new JSONObject().put("title", "Original title").put("summary", "Original summary").put("segments", array);
    }

    private static JSONObject api(int self, JSONObject... segments) throws Exception {
        return document(segments).put("myTalkId", self);
    }

    private static int talker(JSONObject mapped, int index) throws Exception {
        Object id = mapped.getJSONArray("segments").getJSONObject(index).get("talkerId");
        assertTrue(id instanceof Integer);
        assertTrue((Integer) id >= 0);
        return (Integer) id;
    }

    @Test public void reversedStereoChannelsFollowIndependentNativeIdentity() throws Exception {
        JSONObject local = document(
                segment("The remote person has arrived", "Channel 1", 0, 1000),
                segment("I am the device owner speaking", "Channel 2", 1000, 2000),
                segment("yes", "Channel 1", 2000, 2500),
                segment("okay", "Channel 2", 2500, 3000));
        JSONObject mapped = AdotSpeakerMapping.resolve(local, api(7,
                utterance("The remote person has arrived", 12, 0, 1000),
                utterance("I am the device owner speaking", 7, 1000, 2000)), "auto");
        assertEquals(12, talker(mapped, 0));
        assertEquals(7, talker(mapped, 1));
        assertEquals(12, talker(mapped, 2));
        assertEquals(7, talker(mapped, 3));
        assertEquals(7, mapped.getInt("myTalkId"));
        assertTrue(mapped.getString("speakerMapping").startsWith("Mapped"));
        assertTrue(mapped.getString("speakerMapping").contains("stereo"));
    }

    @Test public void mixedMonoMapsUtterancesWithoutPropagatingOneAnchor() throws Exception {
        JSONObject mapped = AdotSpeakerMapping.resolve(document(
                segment("The first caller is speaking", "Channel 1", 0, 1000),
                segment("The second caller answers now", "Channel 1", 1000, 2000),
                segment("An unmatched utterance follows", "Channel 1", 2000, 3000)), api(9,
                utterance("The first caller is speaking", 9, 0, 1000),
                utterance("The second caller answers now", 4, 1000, 2000)), "auto");
        assertEquals(9, talker(mapped, 0));
        assertEquals(4, talker(mapped, 1));
        assertNotEquals(9, talker(mapped, 2));
        assertNotEquals(4, talker(mapped, 2));
        assertTrue(mapped.getString("speakerMapping").startsWith("Partial"));
    }

    @Test public void bothSidesRepeatingSamePhraseCannotSupplyIdentity() throws Exception {
        JSONObject mapped = AdotSpeakerMapping.resolve(document(
                segment("We will see you tomorrow", "Channel 1", 0, 1000),
                segment("We will see you tomorrow", "Channel 2", 1000, 2000)), api(3,
                utterance("We will see you tomorrow", 3, 0, 1000),
                utterance("We will see you tomorrow", 8, 1000, 2000)), "auto");
        assertNotEquals(3, talker(mapped, 0));
        assertNotEquals(8, talker(mapped, 0));
        assertNotEquals(3, talker(mapped, 1));
        assertNotEquals(8, talker(mapped, 1));
        assertNotEquals(talker(mapped, 0), talker(mapped, 1));
        assertTrue(mapped.getString("speakerMapping").startsWith("Unknown"));
    }

    @Test public void repeatedNativePhraseIsAmbiguousEvenForSingleLocalUtterance() throws Exception {
        JSONObject mapped = AdotSpeakerMapping.resolve(document(
                segment("Please confirm the appointment", "Channel 1", 0, 1000)), api(1,
                utterance("Please confirm the appointment", 1, 0, 1000),
                utterance("Please confirm the appointment", 2, 5000, 6000)), "auto");
        assertNotEquals(1, talker(mapped, 0));
        assertNotEquals(2, talker(mapped, 0));
    }

    @Test public void conflictingStereoEvidenceDoesNotSilentlyAssignSelf() throws Exception {
        JSONObject mapped = AdotSpeakerMapping.resolve(document(
                segment("This phrase identifies the owner", "Channel 1", 0, 1000),
                segment("This phrase identifies the remote", "Channel 1", 1000, 2000),
                segment("Unmatched second channel speech", "Channel 2", 2000, 3000)), api(6,
                utterance("This phrase identifies the owner", 6, 0, 1000),
                utterance("This phrase identifies the remote", 11, 1000, 2000)), "auto");
        for (int i = 0; i < 3; i++) {
            assertNotEquals(6, talker(mapped, i));
            assertNotEquals(11, talker(mapped, i));
        }
        assertTrue(mapped.getString("speakerMapping").contains("Conflicting"));
        assertTrue(mapped.getString("speakerMapping").startsWith("Unknown"));
    }

    @Test public void sameNativeIdentityOnBothStereoChannelsIsConflicting() throws Exception {
        JSONObject mapped = AdotSpeakerMapping.resolve(document(
                segment("First independently matching phrase", "Channel 1", 0, 1000),
                segment("Second independently matching phrase", "Channel 2", 1000, 2000)), api(2,
                utterance("First independently matching phrase", 2, 0, 1000),
                utterance("Second independently matching phrase", 2, 1000, 2000)), "auto");
        assertNotEquals(2, talker(mapped, 0));
        assertNotEquals(2, talker(mapped, 1));
        assertTrue(mapped.getString("speakerMapping").contains("Conflicting"));
    }

    @Test public void oneStereoAnchorDoesNotInferTheOtherChannelOrPropagate() throws Exception {
        JSONObject mapped = AdotSpeakerMapping.resolve(document(
                segment("This is the native owner phrase", "Channel 2", 0, 1000),
                segment("yes", "Channel 2", 1000, 2000),
                segment("Something different on the other side", "Channel 1", 2000, 3000)), api(5,
                utterance("This is the native owner phrase", 5, 0, 1000)), "auto");
        assertEquals(5, talker(mapped, 0));
        assertNotEquals(5, talker(mapped, 1));
        assertNotEquals(5, talker(mapped, 2));
    }

    @Test public void noApiDoesNotTrustLocalModelIdsOrChannelNumbers() throws Exception {
        JSONObject local = document(
                segment("This could be either caller", "Channel 1", 0, 1000).put("talkerId", 0),
                segment("This also could be either caller", "Channel 2", 1000, 2000).put("talkerId", 0))
                .put("myTalkId", 27).put("speakerMapping", "Model says mapped").put("speakerMappingVersion", 999);
        JSONObject mapped = AdotSpeakerMapping.resolve(local, null, "auto");
        assertEquals(0, mapped.getInt("myTalkId"));
        assertNotEquals(0, talker(mapped, 0));
        assertNotEquals(0, talker(mapped, 1));
        assertNotEquals(talker(mapped, 0), talker(mapped, 1));
        assertEquals(1, mapped.getInt("speakerMappingVersion"));
        assertTrue(mapped.getString("speakerMapping").startsWith("Unknown"));
        assertEquals(mapped.toString(), AdotSpeakerMapping.resolve(local, null, "auto").toString());
    }

    @Test public void explicitChannelChoiceWorksWithoutApiAndLeavesUnknownLabelsUnknown() throws Exception {
        JSONObject local = document(
                segment("yes", "Channel 1", 0, 1000),
                segment("okay", "Channel 2", 1000, 2000),
                segment("fine", "Channel 1", 2000, 3000),
                segment("unlabelled", "Speaker 1", 3000, 4000));
        JSONObject mapped = AdotSpeakerMapping.resolve(local, null, "Channel 2");
        assertEquals(0, talker(mapped, 1));
        assertNotEquals(0, talker(mapped, 0));
        assertEquals(talker(mapped, 0), talker(mapped, 2));
        assertNotEquals(0, talker(mapped, 3));
        assertNotEquals(talker(mapped, 0), talker(mapped, 3));
        assertTrue(mapped.getString("speakerMapping").contains("Manual self channel: Channel 2"));
        assertTrue(mapped.getString("speakerMapping").startsWith("Partial"));
        JSONObject reversed = AdotSpeakerMapping.resolve(local, null, "Channel 1");
        assertEquals(0, talker(reversed, 0));
        assertEquals(0, talker(reversed, 2));
        assertNotEquals(0, talker(reversed, 1));
    }

    @Test public void manualChoiceOverridesApiChannelEvidenceButKeepsNativeSelfId() throws Exception {
        JSONObject mapped = AdotSpeakerMapping.resolve(document(
                segment("I am actually the remote caller", "Channel 1", 0, 1000),
                segment("I am actually the device owner", "Channel 2", 1000, 2000)), api(4,
                utterance("I am actually the remote caller", 1, 0, 1000),
                utterance("I am actually the device owner", 4, 1000, 2000)), "Channel 1");
        assertEquals(4, mapped.getInt("myTalkId"));
        assertEquals(4, talker(mapped, 0));
        assertNotEquals(4, talker(mapped, 1));
        assertNotEquals(1, talker(mapped, 1));
        assertTrue(mapped.getString("speakerMapping").contains("Manual"));
    }

    @Test public void unknownIdsAvoidSelfAndAllNativeIdsIncludingUnmatchedOnes() throws Exception {
        JSONObject mapped = AdotSpeakerMapping.resolve(document(
                segment("An unmatched local utterance", "Channel 1", 0, 1000),
                segment("Another unmatched local utterance", "Channel 1", 1000, 2000)), api(0,
                utterance("Completely different native words", 1, 5000, 6000),
                utterance("Yet another native sentence", 2, 6000, 7000),
                utterance("The maximum integer identity", Integer.MAX_VALUE, 7000, 8000)), "auto");
        assertEquals(3, talker(mapped, 0));
        assertEquals(4, talker(mapped, 1));
    }

    @Test public void normalizesCasePunctuationAndSpacingAndAllowsUniqueContainment() throws Exception {
        JSONObject mapped = AdotSpeakerMapping.resolve(document(
                segment("  HELLO, this is MY appointment! ", "Channel 1", 50, 950),
                segment("내일 오후에 만나기로 했습니다", "Channel 1", 1000, 2000)), api(3,
                utterance("Hello this is my appointment today", 3, 0, 1000),
                utterance("내일오후에만나기로했습니다.", 7, 1000, 2000)), "auto");
        assertEquals(3, talker(mapped, 0));
        assertEquals(7, talker(mapped, 1));
    }

    @Test public void validDisjointOrTinyOverlapRejectsAnOtherwiseUniqueTextAnchor() throws Exception {
        JSONObject mapped = AdotSpeakerMapping.resolve(document(
                segment("A distinctive statement about tomorrow", "Channel 1", 0, 1000),
                segment("Another distinctive appointment statement", "Channel 1", 1000, 2000)), api(5,
                utterance("A distinctive statement about tomorrow", 5, 2000, 3000),
                utterance("Another distinctive appointment statement", 5, 1999, 2999)), "auto");
        assertNotEquals(5, talker(mapped, 0));
        assertNotEquals(5, talker(mapped, 1));
    }

    @Test public void timingAloneAndShortPhrasesDoNotInventIdentity() throws Exception {
        JSONObject mapped = AdotSpeakerMapping.resolve(document(
                segment("okay", "Channel 1", 0, 1000),
                segment("Entirely unrelated local transcription", "Channel 1", 1000, 2000)), api(1,
                utterance("okay", 1, 0, 1000),
                utterance("A very different native transcription", 1, 1000, 2000)), "auto");
        assertNotEquals(1, talker(mapped, 0));
        assertNotEquals(1, talker(mapped, 1));
    }

    @Test public void absentTimesDoNotPreventUniqueLongTextAnchors() throws Exception {
        JSONObject local = document(segment("Unique statement without any timestamps", "Channel 1", 0, 0)
                .put("startMs", JSONObject.NULL).put("endMs", JSONObject.NULL));
        JSONObject mapped = AdotSpeakerMapping.resolve(local, api(8,
                utterance("Unique statement without any timestamps", 8, 0, 0)), "auto");
        assertEquals(8, talker(mapped, 0));
        assertTrue(mapped.getJSONArray("segments").getJSONObject(0).isNull("startMs"));
    }

    @Test public void competingContainmentAnchorsAndReusedNativeUtterancesRemainUnknown() throws Exception {
        JSONObject local = document(segment("Please confirm tomorrow appointment", "Channel 1", 0, 1000));
        JSONObject mapped = AdotSpeakerMapping.resolve(local, api(3,
                utterance("Please confirm tomorrow appointment morning", 3, 0, 1000),
                utterance("Please confirm tomorrow appointment evening", 9, 0, 1000)), "auto");
        assertNotEquals(3, talker(mapped, 0));
        assertNotEquals(9, talker(mapped, 0));
        JSONObject reused = AdotSpeakerMapping.resolve(document(
                segment("Please confirm tomorrow appointment", "Channel 1", 0, 1000),
                segment("Confirm tomorrow appointment morning", "Channel 1", 0, 1000)), api(3,
                utterance("Please confirm tomorrow appointment morning", 3, 0, 1000)), "auto");
        assertNotEquals(3, talker(reused, 0));
        assertNotEquals(3, talker(reused, 1));
    }

    @Test public void invalidNativeIdsCannotAccidentallyEstablishDefaultSelf() throws Exception {
        JSONObject local = document(segment("A unique native utterance appears here", "Channel 1", 0, 1000));
        for (Object bad : new Object[] {JSONObject.NULL, "0", -1, 0.5, 2147483648L}) {
            JSONObject invalidApi = api(0, utterance("A unique native utterance appears here", 0, 0, 1000)).put("myTalkId", bad);
            JSONObject mapped = AdotSpeakerMapping.resolve(local, invalidApi, "auto");
            assertEquals(0, mapped.getInt("myTalkId"));
            assertNotEquals(0, talker(mapped, 0));
        }
        JSONObject mapped = AdotSpeakerMapping.resolve(local, api(0,
                utterance("A unique native utterance appears here", 0, 0, 1000).put("talkerId", "0")), "auto");
        assertNotEquals(0, talker(mapped, 0));
    }


    @Test public void largeContainmentSearchFailsClosedAndExactAnchorsStillWork() throws Exception {
        JSONObject local = document();
        JSONObject nativeDoc = api(0);
        for (int i = 0; i < 600; i++) {
            local.getJSONArray("segments").put(segment("Unmatched local phrase number " + i, "Channel 1", i * 1000L, (i + 1) * 1000L));
            nativeDoc.getJSONArray("segments").put(utterance("Unrelated native sentence number " + i, 0, i * 1000L, (i + 1) * 1000L));
        }
        local.getJSONArray("segments").put(segment("A final exact distinctive statement", "Channel 1", 700000, 701000));
        nativeDoc.getJSONArray("segments").put(utterance("A final exact distinctive statement", 0, 700000, 701000));
        JSONObject mapped = AdotSpeakerMapping.resolve(local, nativeDoc, "auto");
        assertTrue(mapped.getString("speakerMapping").contains("limit reached"));
        assertEquals(601, mapped.getJSONArray("segments").length());
        for (int i = 0; i < 600; i++) assertNotEquals(0, talker(mapped, i));
        assertEquals(0, talker(mapped, 600));
    }

    @Test public void explicitMonoSelectionEstablishesSelfAndEmptyInputStaysUnknown() throws Exception {
        JSONObject mono = document(
                segment("An explicitly selected mono utterance", "Channel 1", 0, 1000),
                segment("A second explicitly selected utterance", "Channel 1", 1000, 2000));
        JSONObject mapped = AdotSpeakerMapping.resolve(mono, null, "Channel 1");
        assertEquals(0, talker(mapped, 0));
        assertEquals(0, talker(mapped, 1));
        assertTrue(mapped.getString("speakerMapping").startsWith("Mapped"));
        JSONObject empty = AdotSpeakerMapping.resolve(document(), null, "auto");
        assertEquals(0, empty.getJSONArray("segments").length());
        assertEquals(0, empty.getInt("myTalkId"));
        assertEquals(1, empty.getInt("speakerMappingVersion"));
        assertTrue(empty.getString("speakerMapping").startsWith("Unknown"));
    }
}
