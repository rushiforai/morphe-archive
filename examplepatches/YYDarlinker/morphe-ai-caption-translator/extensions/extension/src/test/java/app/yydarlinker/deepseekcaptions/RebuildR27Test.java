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
  @Test public void missingReachRelationGetsSpecificReview()throws Exception {
    assertTrue(plan(9).issues.stream().anyMatch(x->x.code.equals("possible_relation_omission")&&x.from==334));
  }
  @Test public void comparisonMisreadAsJointParticipationGetsAdvisoryReview()throws Exception {
    assertTrue(plan(9).issues.stream().anyMatch(x->x.code.equals("possible_comparison_misread")&&x.from==269));
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
  @Test public void samNameAndWaterTankAreNotMilitarySupport() {
    assertFalse(RebuildSemantics.supports(3,"Sam said hello to his friends"));
    assertFalse(RebuildSemantics.supports(2,"a water tank in the garden"));
    assertTrue(RebuildSemantics.supports(3,"chinese sams covered bases"));
    assertTrue(RebuildSemantics.supports(3,"surface-to-air missiles"));
  }
  @Test public void ordinaryPrepositionsAreNotModelIdentifiers() {
    assertTrue(RebuildSemantics.models("in 20 years and by 10 o'clock").isEmpty());
    assertTrue(RebuildSemantics.models("四辆T-14坦克").contains("t-14"));
    assertTrue(RebuildSemantics.models("t 14 tanks").contains("t-14"));
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
    for(String text:Arrays.asList("最后说明限制：这期虽谈现代化为何迅速，但这种速度恐怕难以永远持续。","This pace probably cannot go on forever.")){
      JSONObject response=new JSONObject(row.getJSONObject("response").toString());response.getJSONArray("events").getJSONObject(0).put("text",text);
      RebuildProtocol.Plan p=RebuildProtocol.parseBound(response.toString(),s,RebuildR26Test.block(row,s));
      assertFalse(p.issues.stream().anyMatch(x->x.code.equals("possible_omission")));
    }
  }
  @Test public void worseRepairCannotOverwriteWholeCandidate()throws Exception {
    RebuildProtocol.Plan bad=plan(15),good=plan(10);
    assertSame(good,RebuildReview.prefer(good,bad));
    assertSame(good,RebuildReview.prefer(bad,good));
    assertSame(bad,RebuildReview.prefer(null,bad));
  }
  @Test public void originalNamedEquipmentDriftStillFails()throws Exception {
    JSONArray rows=RebuildR26Test.fixture();JSONObject r=rows.getJSONObject(4);RebuildSource s=RebuildR26Test.source(rows);
    try{RebuildProtocol.parse(r.getJSONObject("response").toString(),s,RebuildR26Test.block(r,s));fail();}
    catch(RebuildProtocol.Invalid ex){assertEquals("semantic_anchor_leak",ex.code);}
  }
}
