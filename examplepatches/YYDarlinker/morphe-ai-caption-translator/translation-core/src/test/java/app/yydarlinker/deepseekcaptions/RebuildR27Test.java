package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import org.junit.*;
import org.json.*;
import java.util.*;
import java.nio.charset.StandardCharsets;

public class RebuildR27Test {
  static JSONArray fixture()throws Exception {
    try(java.io.InputStream in=RebuildR27Test.class.getResourceAsStream("/r27/captured-events.json")) {
      return new JSONArray(new String(in.readAllBytes(),StandardCharsets.UTF_8));
    }
  }
  static RebuildProtocol.Plan plan(int request)throws Exception {
    JSONArray rows=fixture();RebuildSource s=RebuildR26Test.source(rows);
    for(int i=0;i<rows.length();i++){JSONObject r=rows.getJSONObject(i);if(r.getInt("request")==request)
      return RebuildProtocol.parseBound(r.getJSONObject("response").toString(),s,RebuildR26Test.block(r,s));}
    throw new AssertionError();
  }
  @Test public void capturedSamResponsesAreNotHardRejected()throws Exception {
    assertEquals(6,plan(10).events.size());assertEquals(6,plan(11).events.size());
  }
  @Test public void everyCapturedResponseRetainsStructuralCoverage()throws Exception {
    for(int i=5;i<=31;i++)assertNotNull(plan(i));
  }
  @Test public void omittedNegativeConclusionTriggersBoundedReviewNotRejection()throws Exception {
    RebuildProtocol.Plan p=plan(15);
    assertTrue(p.issues.stream().anyMatch(x->x.code.equals("possible_omission")&&x.from==689));
    assertTrue(RebuildReview.shouldRepair(p,1,0,0,10000));
    assertTrue(RebuildReview.shouldRepair(p,2,1,0,10000));
    assertFalse(RebuildReview.shouldRepair(p,3,2,0,10000));
    assertFalse(RebuildReview.shouldRepair(p,1,RebuildReview.MAX_SESSION_REPAIRS,0,10000));
    assertFalse(RebuildReview.shouldRepair(p,1,0,10000,10000));
    assertNotNull(p.at(214000)); // soft evidence alone must not become a 26-second English block.
  }
  @Test public void nextSubjectAttachedToPriorClauseIsReviewed()throws Exception {
    assertTrue(plan(22).issues.stream().anyMatch(x->x.code.equals("dependent_boundary")&&x.to==1229));
  }
  @Test public void capturedReachAndComparisonAvoidRetiredSpecificReviews()throws Exception {
    RebuildProtocol.Plan captured=plan(9);
    for(String code:Arrays.asList("possible_relation_omission","possible_comparison_misread"))
      assertFalse(code,captured.issues.stream().anyMatch(x->x.code.equals(code)));
  }
  @Test public void actualJointParticipationWithoutComparisonIsNotFlagged()throws Exception {
    RebuildSource s=RebuildContractTest.source("They are with China building a fleet together.",500);
    RebuildPlanner.Block b=RebuildContractTest.block(s);
    List<RebuildProtocol.Event> es=Collections.singletonList(new RebuildProtocol.Event(0,s.words.size()-1,0,5000,"他们与中国一起建造舰队"));
    assertTrue(RebuildReview.inspect(s,b,es).isEmpty());
  }
  @Test public void faithfulReachSynonymsAreNotForcedToUseOneVerb()throws Exception {
    JSONArray rows=fixture();RebuildSource s=RebuildR26Test.source(rows);JSONObject r=rows.getJSONObject(4);
    for(String text:Arrays.asList("1996年，中国或可用几十枚常规弹道武器覆盖朝鲜半岛","1996年，中国几十枚常规弹道武器的射程可及朝鲜半岛")) {
      JSONObject response=new JSONObject(r.getJSONObject("response").toString());response.getJSONArray("events").getJSONObject(4).put("text",text);
      RebuildProtocol.Plan p=RebuildProtocol.parseBound(response.toString(),s,RebuildR26Test.block(r,s));
      assertFalse(p.issues.stream().anyMatch(x->x.code.equals("possible_relation_omission")));
    }
  }
  @Test public void ambiguousNumbersAreNotCorrectedOrHardRejected()throws Exception {
    RebuildProtocol.Plan p=plan(25);
    assertTrue(p.issues.stream().anyMatch(x->x.code.equals("source_number_ambiguity")&&!x.repair));
    assertTrue(p.events.get(1).text.contains("50"));
  }
  @Test public void namesWaterAndMilitaryAbbreviationsAreNotDomainClassified() throws Exception {
    for(String raw:Arrays.asList("Sam said hello to his friends", "a water tank in the garden",
        "chinese sams covered bases", "surface-to-air missiles")) {
      RebuildSource s=RebuildContractTest.source(raw,500);RebuildPlanner.Block b=RebuildContractTest.block(s);
      RebuildProtocol.Plan p=RebuildProtocol.parseBound(RebuildContractTest.reply(b,new JSONArray().put(
          RebuildR26Test.quoted(s,0,s.words.size()-1,"这段文字完整地表达了原文的内容"))),s,b);
      assertEquals(1,p.events.size());
      assertFalse(p.issues.stream().anyMatch(x->x.code.equals("anchor_unknown")));
    }
  }
  @Test public void identifiersKeepExistingLiteralCaseAndUnicodeBoundaries() {
    assertTrue(RebuildSemantics.literalModels("in 20 years and by 10 o'clock").isEmpty());
    assertTrue(RebuildSemantics.literalModels("四辆T-14坦克").isEmpty());
    assertTrue(RebuildSemantics.literalModels("t 14 tanks").isEmpty());
    for(String raw:Arrays.asList(" T-14 ","(T-14)"))
      assertEquals(Collections.singleton("T-14"),RebuildSemantics.literalModels(raw));
    assertTrue(RebuildSemantics.literalModels("t-14s").isEmpty());
  }
  @Test public void pronounOrUnknownSynonymIsNotPositiveContradiction()throws Exception {
    RebuildSource s=RebuildContractTest.source("There are missiles. They defend the bases.",500);
    RebuildPlanner.Block b=RebuildContractTest.block(s);
    List<RebuildProtocol.Event> events=Arrays.asList(new RebuildProtocol.Event(0,2,0,1500,"这里有导弹"),new RebuildProtocol.Event(3,s.words.size()-1,1500,5000,"这些导弹保护基地"));
    RebuildSemantics.validatePlan(s,b,events);
  }
  @Test public void requestPlanRespectsProtectedDependenciesAndHardLimits()throws Exception {
    RebuildSource s=RebuildR26Test.source(fixture());int expected=0;
    for(RebuildPlanner.Block b:RebuildPlanner.plan(s)){
      assertEquals(expected,b.from);expected=b.to+1;
      assertTrue(b.to-b.from+1<=160);assertTrue(b.end-b.start<=30000);
      assertFalse("cut "+b.to+" "+s.text(Math.max(0,b.to-2),Math.min(s.words.size()-1,b.to+2)),RebuildPlanner.protectedCut(s,b.to));
    }
    assertEquals(s.words.size(),expected);
  }
  @Test public void capturedComparisonAndBallisticNounAreNotSplitAtRequestBoundary()throws Exception {
    RebuildSource s=RebuildR26Test.source(fixture());List<RebuildPlanner.Block> bs=RebuildPlanner.plan(s);
    assertTrue(bs.stream().anyMatch(b->b.from<=243&&b.to>=313));
    assertTrue(bs.stream().anyMatch(b->b.from<=334&&b.to>=350));
    for(RebuildPlanner.Block b:bs)assertFalse("determiner cut",s.words.get(b.to).text.equals("every"));
  }
  @Test public void payloadCarriesSoftBoundaryHintsWithoutEditingSource()throws Exception {
    RebuildSource s=RebuildContractTest.source("growth that would follow deng reduced the share of gdp",500);
    RebuildPlanner.Block b=RebuildContractTest.block(s);JSONObject p=RebuildProtocol.payload(s,b,"zh-Hans","");
    assertEquals(s.text(0,s.words.size()-1),p.getString("source_text"));
    assertTrue(p.getJSONArray("avoid_event_end_after").toString().contains("4"));
  }
  @Test public void faithfulNegationAndNonChineseTranslationsAvoidOmissionReview()throws Exception {
    JSONArray rows=fixture();RebuildSource s=RebuildR26Test.source(rows);JSONObject row=rows.getJSONObject(10);assertEquals(15,row.getInt("request"));
    String[][] cases={
      {"最后说明限制：这期虽谈现代化为何迅速，但这种速度恐怕难以永远持续。","zh-Hans"},
      {"This pace probably cannot go on forever.","en"}};
    for(String[] c:cases){
      JSONObject response=new JSONObject(row.getJSONObject("response").toString());response.getJSONArray("events").getJSONObject(0).put("text",c[0]);
      RebuildProtocol.Plan p=RebuildProtocol.parseBound(response.toString(),s,RebuildR26Test.block(row,s),
              CaptionLanguageContext.explicit("en",c[1]));
      assertFalse(p.issues.stream().anyMatch(x->x.code.equals("possible_omission")));
    }
  }
  @Test public void worseRepairCannotOverwriteWholeCandidate()throws Exception {
    RebuildProtocol.Plan bad=plan(15),good=plan(10);
    assertSame(good,RebuildReview.prefer(good,bad));
    assertSame(good,RebuildReview.prefer(bad,good));
    assertSame(bad,RebuildReview.prefer(null,bad));
  }
}
