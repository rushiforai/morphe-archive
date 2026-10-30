package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * N41 regressions: an authored cue is the display unit. Translation may use several events inside a
 * cue, but an event may never cross a cue and every cue must be covered.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
public class AuthoredCueContractTest {
    private static final CaptionLanguageContext JA_ZH =
            CaptionLanguageContext.explicit("ja", "zh-Hans");
    private static final TranslationSettings CFG =
            new TranslationSettings(
                    true,
                    "https://example.invalid/v1",
                    "fixture-model",
                    "faithful",
                    "fixture-key",
                    "stored_custom");

    private static RebuildSource source(String... cues) {
        List<RebuildSource.Word> words = new ArrayList<>();
        long at = 1_000;
        for (int cue = 0; cue < cues.length; cue++) {
            for (String token : RebuildSource.tokens(cues[cue])) {
                words.add(
                        new RebuildSource.Word(
                                token, at, at + 400, cue, RebuildSource.Precision.NATIVE));
                at += 500;
            }
        }
        return new RebuildSource(words);
    }

    private static RebuildPlanner.Block block(RebuildSource s) {
        List<RebuildPlanner.Block> blocks = RebuildPlanner.planAuthored(s, JA_ZH);
        assertEquals("synthetic cues must stay one request block", 1, blocks.size());
        return blocks.get(0);
    }

    private static JSONObject event(RebuildSource s, int from, int to, String text)
            throws Exception {
        return new JSONObject()
                .put("from", from)
                .put("to", to)
                .put("source", s.text(from, to))
                .put("text", text);
    }

    private static String reply(RebuildPlanner.Block b, JSONArray events) throws Exception {
        return new JSONObject().put("block", b.id()).put("events", events).toString();
    }

    @Test
    public void authoredBlockCarriesItsCueContract() {
        RebuildSource s = source("最近のニュースを見ました", "天気がいいので散歩します", "始めよう");
        RebuildPlanner.Block b = block(s);
        assertTrue(b.authored);
        assertEquals(3, b.cues.size());
        assertEquals(0, b.cues.get(0).index);
        assertEquals(s.words.get(0).start, b.cues.get(0).start);
        assertEquals(s.words.get(b.cues.get(0).to).end, b.cues.get(0).end);
        assertEquals(1, b.cues.get(1).index);
        assertEquals(2, b.cues.get(2).index);
        assertFalse(new RebuildPlanner.Block(0, 0, s.words.size() - 1, s).authored);
    }

    @Test
    public void severalEventsInsideOneCueBecomeOneCueUnit() throws Exception {
        RebuildSource s = source("最近のニュースを見ました", "天気がいいので散歩します", "始めよう");
        RebuildPlanner.Block b = block(s);
        int firstCue = b.cues.get(0).index;
        int secondCue = b.cues.get(1).index;
        int thirdCue = b.cues.get(2).index;
        RebuildPlanner.Block.CueRange first = b.cue(firstCue);
        RebuildPlanner.Block.CueRange second = b.cue(secondCue);
        RebuildPlanner.Block.CueRange third = b.cue(thirdCue);
        assertTrue("first cue must have a split token", first.to > first.from);

        JSONArray events =
                new JSONArray()
                        .put(event(s, first.from, first.from, "译一"))
                        .put(event(s, first.from + 1, first.to, "译二"))
                        .put(event(s, second.from, second.to, "译三"))
                        .put(event(s, third.from, third.to, "译四"));
        RebuildProtocol.Plan plan =
                RebuildProtocol.parseBound(reply(b, events), s, b, JA_ZH);
        assertEquals(4, plan.events.size());

        List<RebuildDisplayGroups.Unit> units =
                RebuildCueContract.units(0, s, b, plan.events, JA_ZH);
        assertEquals(3, units.size());
        assertEquals(first.start, units.get(0).start);
        assertEquals(first.end, units.get(0).end);
        assertTrue(units.get(0).text.contains("译一"));
        assertTrue(units.get(0).text.contains("译二"));
        assertEquals(second.start, units.get(1).start);
        assertEquals(second.end, units.get(1).end);
        assertEquals(third.start, units.get(2).start);
        assertEquals(third.end, units.get(2).end);

        CaptionRenderSpec spec = JA_ZH.renderSpec.withAuthored();
        List<RebuildPageLayout.Page> pages =
                RebuildPageLayout.unitPages(
                        units.get(0).text,
                        units.get(0).start,
                        units.get(0).end,
                        value -> value.codePointCount(0, value.length()) <= 12,
                        value -> value.codePointCount(0, value.length()) <= 24,
                        spec);
        assertEquals(1, pages.size());
        assertEquals("AUTHORED_CUE", pages.get(0).timingBasis);
        assertEquals(first.start, pages.get(0).start);
        assertEquals(first.end, pages.get(0).end);
    }

    @Test
    public void anEventThatCrossesACueIsPublishedAsAnEventPage() throws Exception {
        RebuildSource s = source("最近のニュースを見ました", "天気がいいので散歩します", "始めよう");
        RebuildPlanner.Block b = block(s);
        JSONArray events =
                new JSONArray()
                        .put(
                                event(
                                        s,
                                        b.cues.get(0).from,
                                        b.cues.get(1).to,
                                        "合并了两个 cue"));
        // The crossing is a presentation fact, not a protocol failure: the reply is accepted.
        RebuildProtocol.Plan plan =
                RebuildProtocol.parseBound(reply(b, events), s, b, JA_ZH);
        assertEquals(1, plan.events.size());

        RebuildCueProjection.Result projection =
                RebuildCueProjection.project(0, s, b, plan.events, JA_ZH);
        assertEquals("no cue is exactly tiled", 0, projection.cuePages);
        assertEquals("the crossing event becomes one page", 1, projection.eventPages);
        assertEquals(1, projection.units.size());
        assertEquals("合并了两个 cue", projection.units.get(0).text);
        assertTrue(
                "the page starts with the conversation, not with nothing",
                projection.units.get(0).covers(b.cues.get(0).start));
    }

    @Test
    public void aSkippedCueIsRejected() throws Exception {
        // The skipped text is longer than the tolerated hole: a genuine omission still fails
        // closed, unlike a mere cue-boundary disagreement.
        RebuildSource s = source("甲のニュース", "あの話題について詳しく説明します", "乙の話");
        RebuildPlanner.Block b = block(s);
        JSONArray events =
                new JSONArray()
                        .put(event(s, b.cues.get(0).from, b.cues.get(0).to, "甲译"))
                        .put(event(s, b.cues.get(2).from, b.cues.get(2).to, "乙译"));
        try {
            RebuildProtocol.parseBound(reply(b, events), s, b, JA_ZH);
            fail("skipped cue accepted");
        } catch (RebuildProtocol.Invalid expected) {
            assertTrue(
                    expected.code,
                    expected.code.equals("authored_cue_hole")
                            || expected.code.equals("authored_cue_coverage")
                            || expected.code.equals("source_coverage")
                            || expected.code.equals("missing_source"));
        }
    }

    @Test
    public void authoredPromptAddsCueContractWithoutReplacingQualityGuidance() {
        RebuildSource s = source("最近のニュースを見ました", "天気がいいので散歩します", "始めよう");
        RebuildPlanner.Block b = block(s);
        String authored = RebuildApi.prompt(CFG, "zh-Hans", JA_ZH, b);
        String auto = RebuildApi.prompt(CFG, "zh-Hans", JA_ZH, null);
        assertTrue(authored.contains("preferred page boundaries"));
        assertTrue("a sentence may span an author boundary", authored.contains("an event may span the boundary"));
        assertTrue(authored.contains("display_cues"));
        assertTrue(authored.contains(RebuildGuidance.SENTENCE));
        assertFalse(auto.contains("preferred page boundaries"));

        JSONObject payload;
        try {
            payload = RebuildProtocol.payload(s, b, "zh-Hans", "", JA_ZH);
        } catch (Exception impossible) {
            throw new AssertionError(impossible);
        }
        assertTrue(payload.optBoolean("authored"));
        assertEquals(3, payload.optJSONArray("display_cues").length());
        JSONObject autoPayload;
        try {
            autoPayload =
                    RebuildProtocol.payload(
                            s,
                            new RebuildPlanner.Block(0, 0, s.words.size() - 1, s),
                            "zh-Hans",
                            "",
                            JA_ZH);
        } catch (Exception impossible) {
            throw new AssertionError(impossible);
        }
        assertFalse(autoPayload.optBoolean("authored"));
        assertNull(autoPayload.optJSONArray("display_cues"));
    }

    @Test
    public void cacheIdentitySeparatesAuthoredCueContract() {
        RebuildSource s = source("最近のニュースを見ました", "天気がいいので散歩します", "始めよう");
        String authored = RebuildCache.identity(s, CFG, "zh-Hans", JA_ZH, true);
        String automatic = RebuildCache.identity(s, CFG, "zh-Hans", JA_ZH, false);
        assertNotEquals(authored, automatic);

        RebuildSource changedCue = source("最近天気", "がいい", "始めよう");
        assertNotEquals(
                authored,
                RebuildCache.identity(changedCue, CFG, "zh-Hans", JA_ZH, true));
    }

    @Test
    public void aPartialAuthoredReplyPublishesCompleteCuesAndHolesTheRest() throws Exception {
        RebuildSource s = source("最近のニュースを見ました", "天気がいいので散歩します", "始めよう");
        RebuildPlanner.Block b = block(s);
        JSONArray events =
                new JSONArray()
                        .put(event(s, b.cues.get(0).from, b.cues.get(0).to, "看了最近的新闻"))
                        .put(event(s, b.cues.get(2).from, b.cues.get(2).to, "开始吧"));
        RebuildProtocol.Plan plan =
                RebuildProtocol.parseBestEffort(reply(b, events), s, b, JA_ZH);
        assertTrue("a salvaged authored plan is partial", plan.partial);
        assertEquals("the two complete cues are published", 2, plan.events.size());
        assertEquals("the missing cue is an explicit hole", 1, plan.holes.size());
        assertEquals(
                "the display can project exactly the complete cues",
                2,
                RebuildCueContract.unitsPartial(0, s, b, plan.events, JA_ZH).size());
    }

    @Test
    public void punctuationOnlyQuoteDifferenceIsNotAQuoteMismatch() throws Exception {
        RebuildSource s = source("「最近」のApple製品");
        RebuildPlanner.Block b = new RebuildPlanner.Block(0, 0, s.words.size() - 1, s);
        String quoted = s.text(0, s.words.size() - 1).replace('「', '“').replace('」', '”');
        JSONArray events =
                new JSONArray()
                        .put(
                                new JSONObject()
                                        .put("from", 0)
                                        .put("to", s.words.size() - 1)
                                        .put("source", quoted)
                                        .put("text", "“最近的Apple产品”"));
        RebuildProtocol.Plan plan =
                RebuildProtocol.parseBound(reply(b, events), s, b, JA_ZH);
        assertEquals(1, plan.events.size());
    }

    @Test
    public void json3FormatEvidenceIsRecorded() throws Exception {
        String json =
                "{\"events\":[{\"tStartMs\":0,\"dDurationMs\":1000,\"segs\":[{\"utf8\":\"hello\"}]}]}";
        byte[] body = json.getBytes(java.nio.charset.StandardCharsets.UTF_8);
        RebuildSource s = RebuildSource.read(body, CaptionDocument.parse(body, "application/json"));
        assertTrue(s.formatEvidence, s.formatEvidence.contains("detected_fmt=json3"));
        assertEquals(0, s.nativeWordCount());
    }
    @Test
    public void d2HoleAndPageRepairsKeepTheirDifferentAuthoredCueIdentities() {
        RebuildSource source = source("が", "しかし今日は楽しい");
        RebuildPlanner.Block parent = block(source);
        assertEquals(2, parent.cues.size());
        List<RebuildPlanner.Block.CueRange> groups = RebuildCueContract.groups(source, parent);
        assertEquals("fragment cues form one display group", 1, groups.size());
        RebuildPlanner.Block.CueRange first = parent.cues.get(0), group = groups.get(0);
        assertNotNull(RebuildReplyPreparation.holeBlock(parent, source, new int[]{first.from, first.to}));
        assertNull(RebuildReplyPreparation.pageBlock(parent, source, first.from, first.to));
        assertNull(RebuildReplyPreparation.holeBlock(parent, source, new int[]{group.from, group.to}));
        assertNotNull(RebuildReplyPreparation.pageBlock(parent, source, group.from, group.to));
        assertArrayEquals(new int[]{group.from, group.to},
                RebuildReplyPreparation.pageRange(parent, source, first.start));
    }

}
