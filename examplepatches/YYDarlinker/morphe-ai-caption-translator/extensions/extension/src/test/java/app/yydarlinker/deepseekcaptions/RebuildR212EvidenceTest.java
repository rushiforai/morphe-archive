package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.util.*;
import org.json.JSONArray;
import org.junit.Test;

/** Published R2.12 legacy semantics. Snapshot-only improvement tests remain in base commit
 * 73660a8 and are classified in docs/implementation/source-authority-classification.json.
 * This class describes the old release; it does not recommend these behaviors for P2.
 */
public class RebuildR212EvidenceTest {
  @Test public void releaseRetriesAllRecordedStructuralErrorKinds() {
    for(String code:new String[]{"source_quote_mismatch","source_coverage","missing_source",
        "crosses_source_break","block_identity","source_quote_required"})
      assertTrue(code,RebuildReview.structuralRetry(code+"; details"));
    assertFalse(RebuildReview.structuralRetry("numeric_substitution"));
  }

  @Test public void releaseNumericRangeGuardUsesWholeOwnedSource() throws Exception {
    RebuildSource withConjunction=RebuildContractTest.source("50 20 and later",300);
    RebuildSemantics.validate(withConjunction,0,withConjunction.words.size()-1,"50至20和后面");
    RebuildSource withoutConjunction=RebuildContractTest.source("50 20",300);
    try {
      RebuildSemantics.validate(withoutConjunction,0,1,"50至20");
      fail("Published numeric range guard should reject this unlicensed range");
    } catch(RebuildProtocol.Invalid expected) {
      assertEquals("numeric_range_invention",expected.code);
    }
  }

  @Test public void releaseParserRejectsInventedRangeAsWholePlan() throws Exception {
    RebuildSource source=RebuildContractTest.source("50 20",300);
    RebuildPlanner.Block block=RebuildContractTest.block(source);
    String response=RebuildContractTest.reply(block,new JSONArray().put(
        RebuildR26Test.quoted(source,0,1,"50至20")));
    try {
      RebuildProtocol.parseBound(response,source,block);
      fail("Release must reject the candidate, not turn this into a local issue");
    } catch(RebuildProtocol.Invalid expected) {
      assertEquals("numeric_range_invention",expected.code);
    }
  }

  @Test public void releaseReviewOnlyInspectsFirstAdjacentNumberPairPerEvent() {
    RebuildSource source=RebuildContractTest.source("50 20 30 40",300);
    RebuildPlanner.Block block=RebuildContractTest.block(source);
    RebuildProtocol.Event event=new RebuildProtocol.Event(0,3,0,1200,"50 20 30 40");
    long count=RebuildReview.inspect(source,block,Collections.singletonList(event)).stream()
        .filter(issue->issue.code.equals("source_number_ambiguity")).count();
    assertEquals(1,count);
  }

  @Test public void releaseLayoutIsAdvisoryAndSemanticRepairRemainsBoundedByBlockEnd() {
    RebuildProtocol.Event event=new RebuildProtocol.Event(0,3,0,5000,"long caption");
    RebuildProtocol.Plan plan=new RebuildProtocol.Plan(Collections.singletonList(event),"{}",
        Collections.singletonList(new RebuildReview.Issue(0,3,"layout_overflow","old measured budget",true)));
    assertFalse(RebuildReview.blocked(plan,event));
    assertFalse(RebuildReview.shouldRepair(plan,1,0,4500,5000));
    assertFalse(RebuildReview.shouldRepair(plan,2,0,4500,5000));
    assertFalse(RebuildReview.shouldRepair(plan,1,0,5000,5000));
    RebuildProtocol.Plan semantic=new RebuildProtocol.Plan(Collections.singletonList(event),"{}",Collections.singletonList(
        new RebuildReview.Issue(0,3,"possible_polarity_change","semantic risk",true)));
    assertTrue(RebuildReview.blocked(semantic,event));assertTrue(RebuildReview.shouldRepair(semantic,1,0,4500,5000));
    assertFalse(RebuildReview.shouldRepair(semantic,1,0,5000,5000));
  }

  @Test public void releaseRepairPromptFollowsSourceIssueOrderAndStopsAtLimit() {
    List<RebuildReview.Issue> issues=new ArrayList<>();
    for(int i=0;i<25;i++)issues.add(new RebuildReview.Issue(i,i,"fragmentary_translation",
        "A dependent short event must be regrouped before display at this location.",true));
    issues.add(new RebuildReview.Issue(60,62,"numeric_range_invention","Late factual risk",true));
    String prompt=RebuildReview.repair(issues);
    assertFalse(prompt.contains("numeric_range_invention range=60-62"));
    assertTrue(prompt.length()<=1200);
  }

  @Test public void releasePlannerLacksNamedSubjectAuxiliarySoftHint() {
    RebuildSource source=RebuildContractTest.source("on the internet china doesn't know",300);
    assertTrue(RebuildPlanner.resourceScore(source,2)<50);
  }

  @Test public void releaseProviderWrapperAllowsBroadDsmlSuffix() throws Exception {
    RebuildSource source=RebuildContractTest.source("Hello world.",500);
    RebuildPlanner.Block block=RebuildContractTest.block(source);
    String response=RebuildContractTest.reply(block,new JSONArray().put(
        RebuildR26Test.quoted(source,0,1,"你好，世界。")));
    assertNotNull(RebuildProtocol.parseBound(response+"<garbage DSML>",source,block));
  }
}
