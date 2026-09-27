package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;
import org.junit.*;

/** Executable source/protocol invariants, not a claim of human translation quality. */
public class RebuildContractTest {
  static RebuildSource source(String text, long step) {
    List<RebuildSource.Word> w = new ArrayList<>();
    int i = 0;
    for (String t : RebuildSource.tokens(text)) {
      w.add(
          new RebuildSource.Word(
              t, i * step, (i + 1) * step, i / 6, RebuildSource.Precision.NATIVE));
      i++;
    }
    return new RebuildSource(w);
  }

  static RebuildSource json(String body) throws Exception {
    byte[] b = body.getBytes(StandardCharsets.UTF_8);
    return RebuildSource.read(b, CaptionDocument.parse(b, "application/json"));
  }

  static RebuildPlanner.Block block(RebuildSource s) {
    return new RebuildPlanner.Block(0, 0, s.words.size() - 1, s);
  }

  static String reply(RebuildPlanner.Block b, JSONArray es) throws Exception {
    return new JSONObject().put("block", b.id()).put("events", es).toString();
  }

  static JSONObject event(Object f, Object t, String x) throws Exception {
    return new JSONObject().put("from", f).put("to", t).put("text", x);
  }

  static void reject(String code, String reply, RebuildSource s, RebuildPlanner.Block b)
      throws Exception {
    try {
      RebuildProtocol.parse(reply, s, b);
      fail("accepted " + code);
    } catch (RebuildProtocol.Invalid e) {
      assertEquals(code, e.code);
    }
  }

  @Test
  public void nativeOffsetsAreExact() throws Exception {
    RebuildSource s =
        json(
            "{\"events\":[{\"tStartMs\":100,\"dDurationMs\":2000,\"segs\":[{\"utf8\":\"Hello"
                + " \",\"tOffsetMs\":0},{\"utf8\":\"world.\",\"tOffsetMs\":700}]}]}");
    assertEquals(100, s.words.get(0).start);
    assertEquals(800, s.words.get(1).start);
    assertEquals(2100, s.words.get(1).end);
    assertEquals(RebuildSource.Precision.NATIVE, s.words.get(1).precision);
  }

  @Test
  public void coarseCueNeverClaimsNativeWords() throws Exception {
    RebuildSource s =
        json(
            "{\"events\":[{\"tStartMs\":500,\"dDurationMs\":3000,\"segs\":[{\"utf8\":\"One two"
                + " three.\"}]}]}");
    for (RebuildSource.Word w : s.words)
      assertEquals(RebuildSource.Precision.ESTIMATED, w.precision);
    assertEquals(500, s.words.get(0).start);
    assertEquals(3500, s.words.get(2).end);
  }

  @Test
  public void nativeSegmentWithMultipleWordsIsEstimatedInside() throws Exception {
    RebuildSource s =
        json(
            "{\"events\":[{\"tStartMs\":0,\"dDurationMs\":2000,\"segs\":[{\"utf8\":\"two"
                + " words\",\"tOffsetMs\":0}]}]}");
    assertEquals(2, s.words.size());
    assertEquals(RebuildSource.Precision.ESTIMATED, s.words.get(0).precision);
  }

  @Test
  public void repeatedSpeechIsNotDeleted() {
    RebuildSource s = source("No no no. Yes yes.", 500);
    assertEquals("No no no. Yes yes.", s.text(0, s.words.size() - 1));
  }

  @Test
  public void appendedSpeechNotDropped() throws Exception {
    RebuildSource s =
        json(
            "{\"events\":[{\"tStartMs\":0,\"dDurationMs\":500,\"segs\":[{\"utf8\":\"Hello\"}]},{\"aAppend\":1,\"tStartMs\":500,\"dDurationMs\":500,\"segs\":[{\"utf8\":\"world\"}]}]}");
    assertEquals("Hello world", s.text(0, 1));
  }

  @Test
  public void noArtificialOneMillisecondWords() throws Exception {
    RebuildSource s =
        json(
            "{\"events\":[{\"tStartMs\":0,\"dDurationMs\":1,\"segs\":[{\"utf8\":\"one two"
                + " three\"}]}]}");
    assertEquals(1, s.words.size());
    assertEquals("one two three", s.words.get(0).text);
  }

  @Test
  public void decimalsRangesAndIdentifiersStayIntact() {
    assertEquals(
        Arrays.asList("GPT-5.6", "costs", "1.5%", "in", "5-10", "days."),
        RebuildSource.tokens("GPT-5.6 costs 1.5% in 5-10 days."));
  }

  @Test
  public void ordinarySoulIsNeverAutocorrected() {
    assertEquals("my soul", source("my soul", 500).text(0, 1));
  }

  @Test
  public void cjkReconstructsWithoutInsertedSpaces() {
    String x = "如果预算增加，我们可以买更多设备。";
    RebuildSource s = source(x, 150);
    assertEquals(x, s.text(0, s.words.size() - 1));
  }

  @Test
  public void contractionsPreserved() {
    assertEquals("We don't know.", source("We don't know.", 500).text(0, 2));
  }

  @Test
  public void sentencesCanShareAnApiBlock() {
    assertEquals(1, RebuildPlanner.plan(source("Yes. No. Maybe.", 500)).size());
  }

  @Test
  public void blockCoverageIsDeterministicAndBounded() {
    for (int n = 1; n <= 400; n++) {
      RebuildSource s = source(String.join(" ", Collections.nCopies(n, "word")), 300);
      List<RebuildPlanner.Block> bs = RebuildPlanner.plan(s);
      int at = 0;
      for (RebuildPlanner.Block b : bs) {
        assertEquals(at, b.from);
        assertTrue(b.to - b.from + 1 <= RebuildPlanner.MAX_WORDS);
        assertTrue(b.end - b.start <= RebuildPlanner.MAX_SPAN);
        at = b.to + 1;
      }
      assertEquals(n, at);
      assertEquals(bs.size(), RebuildPlanner.plan(s).size());
    }
  }

  @Test
  public void budgetBoundaryIsLabelledAsContinuation() {
    List<RebuildPlanner.Block> b =
        RebuildPlanner.plan(source(String.join(" ", Collections.nCopies(240, "word")), 500));
    assertTrue(b.get(0).continuedAfter);
    assertTrue(b.get(1).continuedBefore);
  }

  @Test
  public void silenceEndsOwnershipBlock() {
    List<RebuildSource.Word> w =
        Arrays.asList(
            new RebuildSource.Word("Hello", 0, 1000, 0, RebuildSource.Precision.NATIVE),
            new RebuildSource.Word("world", 2500, 3500, 1, RebuildSource.Precision.NATIVE));
    assertEquals(2, RebuildPlanner.plan(new RebuildSource(w)).size());
  }

  @Test
  public void singleResponseBindsActualSourceTime() throws Exception {
    RebuildSource s = source("Hello world.", 700);
    RebuildPlanner.Block b = block(s);
    RebuildProtocol.Plan p =
        RebuildProtocol.parse(reply(b, new JSONArray().put(event(0, 1, "你好，世界。"))), s, b);
    assertEquals(0, p.events.get(0).start);
    assertEquals(1400, p.events.get(0).end);
    assertNull(p.at(1400));
    assertNotNull(p.at(1399));
  }

  @Test
  public void translatedLengthCannotMoveTime() throws Exception {
    RebuildSource s = source("Hello world.", 700);
    RebuildPlanner.Block b = block(s);
    RebuildProtocol.Plan
        a = RebuildProtocol.parse(reply(b, new JSONArray().put(event(0, 1, "你好。"))), s, b),
        z =
            RebuildProtocol.parse(
                reply(b, new JSONArray().put(event(0, 1, "你好，世界，很高兴见到你。"))), s, b);
    assertEquals(a.events.get(0).end, z.events.get(0).end);
  }

  @Test
  public void coverageCannotSkipWords() throws Exception {
    RebuildSource s = source("one two three", 500);
    reject("source_coverage", reply(block(s), new JSONArray().put(event(1, 2, "你好"))), s, block(s));
  }

  @Test
  public void coverageCannotRepeatWords() throws Exception {
    RebuildSource s = source("one two three", 500);
    reject(
        "source_coverage",
        reply(block(s), new JSONArray().put(event(0, 1, "第一段")).put(event(1, 2, "第二段"))),
        s,
        block(s));
  }

  @Test
  public void completeCoverageIsMandatory() throws Exception {
    RebuildSource s = source("one two three", 500);
    reject("missing_source", reply(block(s), new JSONArray().put(event(0, 1, "一二"))), s, block(s));
  }

  @Test
  public void numericStringsAreNotIds() throws Exception {
    RebuildSource s = source("Hello", 500);
    reject("index_type", reply(block(s), new JSONArray().put(event("0", 0, "你好"))), s, block(s));
  }

  @Test
  public void fractionalIdsRejected() throws Exception {
    RebuildSource s = source("Hello", 500);
    reject("index_type", reply(block(s), new JSONArray().put(event(0, .5, "你好"))), s, block(s));
  }

  @Test
  public void foreignBlockRejected() throws Exception {
    RebuildSource s = source("Hello", 500);
    reject("block_identity", "{\"block\":\"other\",\"events\":[]}", s, block(s));
  }

  @Test
  public void emptySpeechRejected() throws Exception {
    RebuildSource s = source("Hello", 500);
    reject("empty_translation", reply(block(s), new JSONArray().put(event(0, 0, ""))), s, block(s));
  }

  @Test
  public void emptyMusicAllowed() throws Exception {
    RebuildSource s = source("[Music]", 500);
    RebuildProtocol.Plan p =
        RebuildProtocol.parse(
            reply(block(s), new JSONArray().put(event(0, s.words.size() - 1, ""))), s, block(s));
    assertEquals("", p.events.get(0).text);
  }

  @Test
  public void metadataAnnotationsNotBlindlyRemoved() {
    RebuildSource s = source("[NASA] announced a discovery.", 500);
    assertTrue(s.text(0, s.words.size() - 1).contains("NASA"));
  }

  @Test
  public void clearNumericSubstitutionRejected() throws Exception {
    RebuildSource s = source("20 missiles", 500);
    reject(
        "numeric_substitution",
        reply(block(s), new JSONArray().put(event(0, 1, "200枚导弹"))),
        s,
        block(s));
  }

  @Test
  public void spelledNumbersNotFalselyCertified() {
    assertTrue(RebuildProtocol.numbersSafe("20 missiles", "二十枚导弹"));
    assertTrue(RebuildProtocol.numbersSafe("10000 units", "1万件"));
  }

  @Test
  public void sourceSilenceCannotBeBridged() throws Exception {
    List<RebuildSource.Word> w =
        Arrays.asList(
            new RebuildSource.Word("Hello", 0, 500, 0, RebuildSource.Precision.NATIVE),
            new RebuildSource.Word("world", 1500, 2000, 1, RebuildSource.Precision.NATIVE));
    RebuildSource s = new RebuildSource(w);
    reject(
        "crosses_source_break",
        reply(block(s), new JSONArray().put(event(0, 1, "你好世界"))),
        s,
        block(s));
  }

  @Test
  public void shortCompleteReplyIsNotLocallyMerged() throws Exception {
    RebuildSource s = source("Yes. Next thought.", 400);
    RebuildProtocol.Plan p =
        RebuildProtocol.parse(
            reply(block(s), new JSONArray().put(event(0, 0, "是。")).put(event(1, 2, "下一点。"))),
            s,
            block(s));
    assertEquals(2, p.events.size());
    assertEquals(400, p.events.get(0).end);
  }

  @Test
  public void paragraphCannotBeMadeReady() throws Exception {
    RebuildSource s = source(String.join(" ", Collections.nCopies(30, "word")), 400);
    String text = String.join("", Collections.nCopies(70, "字")) + "。第二句。";
    RebuildProtocol.Plan p=RebuildProtocol.parse(reply(block(s), new JSONArray().put(event(0,29,text))),s,block(s));
    assertTrue(RebuildReview.blocked(p,p.events.get(0)));
  }

  @Test
  public void noTrailingProseOrTruncatedJsonSalvage() throws Exception {
    RebuildSource s = source("Hello", 500);
    String good = reply(block(s), new JSONArray().put(event(0, 0, "你好")));
    reject("json", good + " explanation", s, block(s));
    reject("json", good.substring(0, good.length() - 1), s, block(s));
  }

  @Test
  public void contextIsReadOnlyAndBounded() throws Exception {
    RebuildSource s = source(String.join(" ", Collections.nCopies(400, "longcontext")), 150);
    RebuildPlanner.Block b = RebuildPlanner.plan(s).get(1);
    JSONObject p = RebuildProtocol.payload(s, b, "ja", "");
    assertTrue(p.getString("context_before").length() <= 360);
    assertTrue(p.getString("context_after").length() <= 360);
    assertEquals(b.to - b.from + 1, p.getJSONArray("owned_tokens").length());
  }

  @Test
  public void noSourceTimePrecisionInflation() throws Exception {
    RebuildSource s =
        json(
            "{\"events\":[{\"tStartMs\":0,\"dDurationMs\":2000,\"segs\":[{\"utf8\":\"some"
                + " words\"}]}]}");
    assertEquals("estimated", RebuildProtocol.payload(s, block(s), "zh", "").getString("timing"));
  }

  @Test
  public void exactSchemaMatchesProductionContract() throws Exception {
    JSONObject props =
        RebuildProtocol.schema()
            .getJSONObject("json_schema")
            .getJSONObject("schema")
            .getJSONObject("properties");
    assertTrue(props.has("events"));
    assertFalse(props.has("translations"));
  }

  @Test
  public void oldCacheWireFormatRejected() throws Exception {
    RebuildSource s = source("Hello", 500);
    reject("block_identity", "{\"translations\":[{\"segments\":[[0,\"你好\"]]}]}", s, block(s));
  }

  @Test
  public void unambiguousNativeAlignmentReplacesTimes() {
    RebuildSource a = source("one two three four five six seven eight nine", 500);
    List<RebuildSource.Word> w = new ArrayList<>();
    for (RebuildSource.Word x : a.words)
      w.add(
          new RebuildSource.Word(
              x.text, x.start + 100, x.end + 100, x.cue, RebuildSource.Precision.NATIVE));
    RebuildSource b = a.align(new RebuildSource(w));
    assertEquals(100, b.words.get(0).start);
    assertEquals(RebuildSource.Precision.ALIGNED, b.words.get(0).precision);
  }

  @Test
  public void ambiguousRepetitionIsNotAClockAnchor() {
    RebuildSource a = source("word word word word word word word word word", 500);
    assertSame(a, a.align(a));
  }

  @Test
  public void estimatedReferenceCannotBeCalledNative() {
    RebuildSource a = source("one two three four five six seven eight nine", 500);
    List<RebuildSource.Word> w = new ArrayList<>();
    for (RebuildSource.Word x : a.words)
      w.add(
          new RebuildSource.Word(
              x.text, x.start + 100, x.end + 100, x.cue, RebuildSource.Precision.ESTIMATED));
    assertEquals(0, a.align(new RebuildSource(w)).words.get(0).start);
  }

  @Test
  public void clockBackSeekDoesNotStick() {
    RebuildClock c = new RebuildClock();
    c.reset(1);
    c.update(5000, 1000);
    c.update(2000, 1100);
    assertEquals(2000, c.position(1100, -1, 0, 0, 0));
  }

  @Test
  public void clockWithoutEvidenceDoesNotRunAhead() {
    RebuildClock c = new RebuildClock();
    c.reset(1);
    c.update(1000, 1000);
    assertEquals(1000, c.position(9000, -1, 0, 0, 0));
  }

  @Test
  public void pausedMediaStopsProjection() {
    RebuildClock c = new RebuildClock();
    c.reset(1);
    c.update(1000, 1000);
    assertEquals(1100, c.position(1100, 1000, 1000, 1, 3));
    assertEquals(1050, c.position(1200, 1050, 1150, 0, 2));
  }

  @Test
  public void staleMediaCannotBelongToNewVideo() {
    RebuildClock c = new RebuildClock();
    c.reset(2000);
    c.update(0, 2000);
    assertEquals(0, c.position(2100, 1000, 1500, 1, 3));
  }

  @Test
  public void nativeRollingWindowKeepsNewWordsWithoutDuplicatingMeasuredOnsets() throws Exception {
    RebuildSource s =
        json(
            "{\"events\":[{\"tStartMs\":0,\"dDurationMs\":2000,\"segs\":[{\"utf8\":\"one"
                + " \",\"tOffsetMs\":0},{\"utf8\":\"two \",\"tOffsetMs\":500},{\"utf8\":\"three"
                + " \",\"tOffsetMs\":1000}]},{\"tStartMs\":500,\"dDurationMs\":2000,\"segs\":[{\"utf8\":\"two"
                + " \",\"tOffsetMs\":0},{\"utf8\":\"three"
                + " \",\"tOffsetMs\":500},{\"utf8\":\"four.\",\"tOffsetMs\":1000}]}]}");
    assertEquals("one two three four.", s.text(0, s.words.size() - 1));
    assertEquals(4, s.words.size());
    assertEquals(1500, s.words.get(3).start);
  }

  @Test
  public void alignmentIdentityCannotEraseDecimalOrSign() {
    assertNotEquals(RebuildSource.key("1.5"), RebuildSource.key("15"));
    assertNotEquals(RebuildSource.key("-10"), RebuildSource.key("10"));
    assertEquals(RebuildSource.key("Hello!"), RebuildSource.key("hello"));
  }

  @Test
  public void multilingualContentSurvivesTokenization() {
    for (String text :
        new String[] {"这是一个完整的句子。", "これは字幕です。", "C'est déjà terminé.", "مرحبا بالعالم"}) {
      RebuildSource s = source(text, 500);
      assertEquals(text.replace(" ", ""), s.text(0, s.words.size() - 1).replace(" ", ""));
    }
  }

  static JSONObject frame(long start, long duration, String text, boolean append) throws Exception {
    return new JSONObject()
        .put("tStartMs", start)
        .put("dDurationMs", duration)
        .put("wWinId", 1)
        .put("aAppend", append ? 1 : 0)
        .put("segs", new JSONArray().put(new JSONObject().put("utf8", text)));
  }

  @Test
  public void coarseRollingWindowsProduceOnlyNewSpeech() throws Exception {
    String body =
        new JSONObject()
            .put(
                "events",
                new JSONArray()
                    .put(frame(0, 2000, "One", false))
                    .put(frame(500, 2000, "One two", false))
                    .put(frame(1000, 2000, "two", false))
                    .put(frame(1500, 2000, "two three.", false)))
            .toString();
    RebuildSource s = json(body);
    assertEquals("One two three.", s.text(0, s.words.size() - 1));
    assertEquals(3, s.words.size());
    assertEquals(500, s.words.get(1).start);
    assertEquals(1500, s.words.get(2).start);
  }

  @Test
  public void identicalSpokenRepetitionsAreNotProofOfRolling() throws Exception {
    RebuildSource s =
        json(
            new JSONObject()
                .put(
                    "events",
                    new JSONArray()
                        .put(frame(0, 1000, "No.", false))
                        .put(frame(500, 1000, "No.", false)))
                .toString());
    assertEquals("No. No.", s.text(0, s.words.size() - 1));
  }

  @Test
  public void explicitAppendIsNewContentEvenWhenWordsRepeat() throws Exception {
    RebuildSource s =
        json(
            new JSONObject()
                .put(
                    "events",
                    new JSONArray()
                        .put(frame(0, 1000, "No.", false))
                        .put(frame(500, 1000, "No.", true)))
                .toString());
    assertEquals("No. No.", s.text(0, s.words.size() - 1));
  }

  @Test
  public void nonOverlappingCaptionsKeepTheirRepeatedWords() throws Exception {
    RebuildSource s =
        json(
            new JSONObject()
                .put(
                    "events",
                    new JSONArray()
                        .put(frame(0, 1000, "One", false))
                        .put(frame(1500, 1000, "One two", false)))
                .toString());
    assertEquals("One One two", s.text(0, s.words.size() - 1));
  }

  @Test
  public void suppliedOverlappingSrtFragmentsKeepCueOrder() throws Exception {
    String body =
        "1\n00:05:44,400 --> 00:05:47,199\nhardware the pla like many aspects of\n\n"
            + "2\n00:05:46,720 --> 00:05:50,560\nchinese society would experience great\n\n"
            + "3\n00:05:49,600 --> 00:05:54,639\nchange after deng xiaoping rose to power\n\n"
            + "4\n00:05:51,919 --> 00:05:56,560\nin the late 1970s the military shared\n";
    byte[] bytes = body.getBytes(StandardCharsets.UTF_8);
    RebuildSource s =
        RebuildSource.read(bytes, CaptionDocument.parse(bytes, "application/x-subrip"));
    assertTrue("expected coarse reconstruction", s.coarseCueReconstructed);
    assertEquals(
        "hardware the pla like many aspects of chinese society would experience great change after "
            + "deng xiaoping rose to power in the late 1970s the military shared",
        s.text(0, s.words.size() - 1));
    for (int i = 1; i < s.words.size(); i++)
      assertTrue(
          "word timing must not go backwards", s.words.get(i).start >= s.words.get(i - 1).end);
  }

  @Test
  public void noOffsetJsonFragmentsKeepCueOrder() throws Exception {
    String body =
        new JSONObject()
            .put(
                "events",
                new JSONArray()
                    .put(
                        new JSONObject()
                            .put("tStartMs", 0)
                            .put("dDurationMs", 2800)
                            .put(
                                "segs",
                                new JSONArray()
                                    .put(
                                        new JSONObject()
                                            .put("utf8", "hardware the pla like many aspects of"))))
                    .put(
                        new JSONObject()
                            .put("tStartMs", 2320)
                            .put("dDurationMs", 3840)
                            .put(
                                "segs",
                                new JSONArray()
                                    .put(
                                        new JSONObject()
                                            .put(
                                                "utf8", "chinese society would experience great"))))
                    .put(
                        new JSONObject()
                            .put("tStartMs", 5200)
                            .put("dDurationMs", 5039)
                            .put(
                                "segs",
                                new JSONArray()
                                    .put(
                                        new JSONObject()
                                            .put(
                                                "utf8",
                                                "change after deng xiaoping rose to power"))))
                    .put(
                        new JSONObject()
                            .put("tStartMs", 7519)
                            .put("dDurationMs", 4641)
                            .put(
                                "segs",
                                new JSONArray()
                                    .put(
                                        new JSONObject()
                                            .put(
                                                "utf8", "in the late 1970s the military shared")))))
            .toString();
    RebuildSource s = json(body);
    assertTrue("expected coarse reconstruction", s.coarseCueReconstructed);
    assertEquals(
        "hardware the pla like many aspects of chinese society would experience great change after "
            + "deng xiaoping rose to power in the late 1970s the military shared",
        s.text(0, s.words.size() - 1));
  }
  @Test public void semanticAnchorsRejectEquipmentMovedFromNeighboringRange() throws Exception {
    RebuildSource source=source("Russia drives T-14 tanks but China builds an aircraft carrier fleet",300);
    RebuildPlanner.Block b=block(source);
    try { RebuildProtocol.parse(reply(b,new JSONArray().put(event(0,4,"俄罗斯" )).put(event(5,source.words.size()-1,"T-14坦克" ))),source,b); fail("semantic mismatch accepted"); }
    catch(RebuildProtocol.Invalid e){ assertTrue(e.code.startsWith("semantic_anchor_")); }
  }
  @Test public void semanticAnchorsAcceptEquipmentInItsOwnedRange() throws Exception {
    RebuildSource source=source("four t 14 armada tanks",300);RebuildPlanner.Block b=block(source);
    RebuildProtocol.Plan p=RebuildProtocol.parse(reply(b,new JSONArray().put(event(0,source.words.size()-1,"四辆T-14阿玛塔坦克"))),source,b);
    assertEquals(1,p.events.size());
  }
  @Test public void dependentSourceEndCannotBecomeVisibleEventBoundary() throws Exception {
    RebuildSource source=source("who cares how many carriers the americans have if ivan got tanks",300);RebuildPlanner.Block b=block(source);
    int ifIndex=-1;for(int n=0;n<source.words.size();n++)if("if".equalsIgnoreCase(source.words.get(n).text))ifIndex=n;
    reject("dependent_source_end",reply(b,new JSONArray().put(event(0,ifIndex,"毕竟谁在乎美国人有多少航母，如果")).put(event(ifIndex+1,source.words.size()-1,"伊万有坦克"))),source,b);
  }
  @Test public void sourceNormalizationKeepsHighConfidenceIdentifiersReadable() {
    assertEquals("four t 14 armada tanks and j 20 aircraft and r b",RebuildSemantics.normalized("four t 14 armada tanks and j 20 aircraft and r b"));
  }

}
