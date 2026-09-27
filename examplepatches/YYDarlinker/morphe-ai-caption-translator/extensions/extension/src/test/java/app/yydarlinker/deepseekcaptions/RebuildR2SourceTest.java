package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.util.*;
import org.json.*;
import org.junit.Test;

/** Real user supplied transcript replay + pathological transport cases. No remote model calls. */
public class RebuildR2SourceTest {
  static byte[] fixture() throws Exception {
    try (java.io.InputStream in =
        RebuildR2SourceTest.class.getResourceAsStream("/r2/mH5TlcMo_m4.en.srt")) {
      assertNotNull(in);
      return in.readAllBytes();
    }
  }

  static RebuildSource json(JSONArray events) throws Exception {
    return RebuildContractTest.json(new JSONObject().put("events", events).toString());
  }

  static JSONObject cue(long start, long duration, String text, boolean win) throws Exception {
    JSONObject e =
        new JSONObject()
            .put("tStartMs", start)
            .put("dDurationMs", duration)
            .put("segs", new JSONArray().put(new JSONObject().put("utf8", text)));
    if (win) e.put("wWinId", 1);
    return e;
  }

  static void exactOrder(RebuildSource source, List<String> expected) {
    assertEquals(expected.size(), source.words.size());
    for (int i = 0; i < expected.size(); i++) {
      assertEquals("token " + i, expected.get(i), source.words.get(i).text);
      assertTrue(source.words.get(i).end > source.words.get(i).start);
      if (i > 0) assertTrue(source.words.get(i).start >= source.words.get(i - 1).end);
    }
  }

  static void replay(CaptionDocument.Parsed doc, RebuildSource s) {
    assertEquals(1484, doc.cues().size());
    List<String> expected = new ArrayList<>();
    for (CaptionDocument.Cue c : doc.cues()) expected.addAll(RebuildSource.tokens(c.text));
    exactOrder(s, expected);
    assertTrue(s.coarseCueReconstructed);
    String text = s.text(0, s.words.size() - 1);
    assertTrue(
        text.contains("the pla was not born as a mechanized industrialized fighting machine"));
    assertTrue(text.contains("a mixture of symmetric and asymmetric conflict against japan"));
    assertTrue(text.contains("china and another power might be"));
    assertTrue(text.contains("change after deng xiaoping rose to power in the late 1970s"));
    assertTrue(text.contains("the military shared millions")); // ASR error stays source evidence.
    assertFalse(text.contains("after deng experience xiaoping"));
    int at = 0;
    for (RebuildPlanner.Block b : RebuildPlanner.plan(s)) {
      assertEquals(at, b.from);
      assertTrue(b.end - b.start <= RebuildPlanner.MAX_SPAN);
      at = b.to + 1;
    }
    assertEquals(s.words.size(), at);
  }

  @Test
  public void all1484SrtCuesKeepEveryTokenInOrder() throws Exception {
    byte[] b = fixture();
    CaptionDocument.Parsed doc = CaptionDocument.parse(b, "application/x-subrip");
    replay(doc, RebuildSource.read(b, doc));
  }

  @Test
  public void sameFullTrackInJson3WithoutWindowIds() throws Exception {
    replayJson(false);
  }

  @Test
  public void sameFullTrackInJson3WithWindowIds() throws Exception {
    replayJson(true);
  }

  static void replayJson(boolean win) throws Exception {
    CaptionDocument.Parsed doc = CaptionDocument.parse(fixture(), "application/x-subrip");
    JSONArray es = new JSONArray();
    for (CaptionDocument.Cue c : doc.cues())
      es.put(cue(c.startMs, c.endMs - c.startMs, c.text, win));
    replay(doc, json(es));
  }

  @Test
  public void justTwoOverlappingCuesAreNeverInterleaved() throws Exception {
    RebuildSource s =
        json(
            new JSONArray()
                .put(cue(0, 5000, "Remember that the PLA was not", false))
                .put(cue(1800, 4000, "born as a mechanized fighting machine", false)));
    assertEquals(
        "Remember that the PLA was not born as a mechanized fighting machine",
        s.text(0, s.words.size() - 1));
    assertEquals(1800, s.words.get(5).end);
    assertEquals(1800, s.words.get(6).start);
  }

  @Test
  public void mixedNativeAndCoarseDoesNotReintroduceWordSorting() throws Exception {
    JSONObject nativeCue =
        new JSONObject()
            .put("tStartMs", 2000)
            .put("dDurationMs", 1000)
            .put(
                "segs",
                new JSONArray().put(new JSONObject().put("utf8", "machine").put("tOffsetMs", 0)));
    RebuildSource s =
        json(
            new JSONArray()
                .put(cue(0, 4000, "not born as a", true))
                .put(nativeCue)
                .put(cue(3000, 3000, "it was revolutionary", false)));
    assertEquals("not born as a machine it was revolutionary", s.text(0, s.words.size() - 1));
    assertEquals(RebuildSource.Precision.NATIVE, s.words.get(4).precision);
  }

  @Test
  public void repeatedSpeechAcrossOverlappingCuesIsNotDeleted() throws Exception {
    RebuildSource s =
        json(
            new JSONArray().put(cue(0, 3000, "no no", false)).put(cue(1000, 3000, "no no", false)));
    assertEquals("no no no no", s.text(0, s.words.size() - 1));
  }

  @Test
  public void numericSuffixesStayAttachedWithoutEatingChinese() {
    assertEquals(
        Arrays.asList("1970s", "3D", "1080p", "1.5%", "20", "枚", "导", "弹"),
        RebuildSource.tokens("1970s 3D 1080p 1.5% 20枚导弹"));
  }

  @Test
  public void simultaneousCoarseTextIsKeptWithoutFakeWordTimes() throws Exception {
    RebuildSource s =
        json(
            new JSONArray()
                .put(cue(0, 2000, "Speaker one.", false))
                .put(cue(0, 2000, "Speaker two.", false)));
    assertEquals("Speaker one. Speaker two.", s.text(0, s.words.size() - 1));
  }

  @Test
  public void nativeMissingOffsetRunIsNotDropped() throws Exception {
    RebuildSource s =
        json(
            new JSONArray()
                .put(
                    new JSONObject()
                        .put("tStartMs", 0)
                        .put("dDurationMs", 2000)
                        .put(
                            "segs",
                            new JSONArray()
                                .put(new JSONObject().put("utf8", "one ").put("tOffsetMs", 0))
                                .put(new JSONObject().put("utf8", "two "))
                                .put(
                                    new JSONObject()
                                        .put("utf8", "three")
                                        .put("tOffsetMs", 1000)))));
    assertEquals("one two three", s.text(0, s.words.size() - 1));
    assertEquals(RebuildSource.Precision.ESTIMATED, s.words.get(0).precision);
    assertEquals(1000, s.words.get(2).start);
  }

  @Test
  public void sourceTimeIsIndependentOfTargetLengthAfterRepair() throws Exception {
    RebuildSource s =
        json(
            new JSONArray()
                .put(cue(0, 4000, "one two three", false))
                .put(cue(1600, 4000, "four five six", false)));
    RebuildPlanner.Block b = RebuildContractTest.block(s);
    RebuildProtocol.Plan a =
        RebuildProtocol.parse(
            RebuildContractTest.reply(
                b, new JSONArray().put(RebuildContractTest.event(0, 5, "一二三四五六。"))),
            s,
            b);
    RebuildProtocol.Plan z =
        RebuildProtocol.parse(
            RebuildContractTest.reply(
                b,
                new JSONArray().put(RebuildContractTest.event(0, 5, "这是比较长的一份译文，用来核对时间不受译文长度影响。"))),
            s,
            b);
    assertEquals(a.events.get(0).start, z.events.get(0).start);
    assertEquals(a.events.get(0).end, z.events.get(0).end);
  }

  @Test
  public void payloadOffersContinuousReadableSourceNotJustIsolatedIds() throws Exception {
    RebuildSource s =
        RebuildContractTest.source("The PLA was not born as a fighting machine.", 350);
    JSONObject p = RebuildProtocol.payload(s, RebuildContractTest.block(s), "zh-Hans", "");
    assertEquals(s.text(0, s.words.size() - 1), p.getString("source_text"));
    assertEquals(s.words.size(), p.getJSONArray("owned_tokens").length());
    assertEquals("event-rebuild-r2.12", RebuildProtocol.VERSION);
  }

  @Test
  public void longParagraphCannotPassParagraphGate() throws Exception {
    RebuildSource s =
        RebuildContractTest.source(String.join(" ", Collections.nCopies(34, "word")), 340);
    String text = "大量国产设计的武器装备，其中大部分解放军使用的装备，在冷战大部分时期要么是经授权、要么是未经授权仿制或衍生于苏联设计，这一整段译文不应该作为一条字幕事件显示。";
    RebuildProtocol.Plan plan=RebuildProtocol.parse(
        RebuildContractTest.reply(
            RebuildContractTest.block(s),
            new JSONArray().put(RebuildContractTest.event(0, 33, text))),
        s,
        RebuildContractTest.block(s));
    assertTrue(plan.issues.stream().anyMatch(x->x.code.equals("paragraph")));
  }

  @Test
  public void preferredClauseCutIsNotMarkedAsASilenceOrSentence() {
    RebuildSource s =
        RebuildContractTest.source(
            String.join(" ", Collections.nCopies(26, "word"))
                + " but it was not mechanized "
                + String.join(" ", Collections.nCopies(30, "word")),
            700);
    RebuildPlanner.Block b = RebuildPlanner.plan(s).get(0);
    assertEquals("but", s.words.get(b.to + 1).text);
    assertTrue(b.continuedAfter);
  }

  @Test
  public void completeShortRepliesRemainValid() throws Exception {
    RebuildSource s = RebuildContractTest.source("No. Yes.", 400);
    RebuildProtocol.Plan p =
        RebuildProtocol.parse(
            RebuildContractTest.reply(
                RebuildContractTest.block(s),
                new JSONArray()
                    .put(RebuildContractTest.event(0, 0, "不。"))
                    .put(RebuildContractTest.event(1, 1, "是。"))),
            s,
            RebuildContractTest.block(s));
    assertEquals(2, p.events.size());
  }
}
