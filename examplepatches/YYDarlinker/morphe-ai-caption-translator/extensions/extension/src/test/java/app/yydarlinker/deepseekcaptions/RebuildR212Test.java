package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.util.*;
import org.json.*;
import org.junit.Test;

/** R2.12 regressions derived from the 2026-09-23 two-model diagnostic review. */
public class RebuildR212Test {
  @Test public void providerDsmlSuffixDoesNotRelaxTheSourceContract() throws Exception {
    RebuildSource s=RebuildContractTest.source("Hello world.",500);
    RebuildPlanner.Block b=RebuildContractTest.block(s);
    JSONObject event=new JSONObject(RebuildContractTest.event(0,1,"你好，世界。").toString()).put("source",s.text(0,1));
    String json=RebuildContractTest.reply(b,new JSONArray().put(event));
    RebuildProtocol.Plan p=RebuildProtocol.parseBound(json+"</｜｜DSML｜｜ parameter>\n</｜｜DSML｜｜ invoke>",s,b);
    assertEquals(1,p.events.size());
    assertEquals(0,p.events.get(0).from);
    assertEquals(1000,p.events.get(0).end);
    try {
      String bad=json.replace("Hello world.","Hello fabricated.");
      RebuildProtocol.parseBound(bad+"</｜｜DSML｜｜ parameter>",s,b);
      fail("provider wrapper must not allow changed source");
    } catch (RebuildProtocol.Invalid expected) {
      assertTrue(expected.code.equals("source_quote_mismatch") || expected.code.equals("source_coverage"));
    }
  }

  @Test public void incompleteSourceFragmentBecomesARepairCandidate() throws Exception {
    RebuildSource s=RebuildContractTest.source("the americans have",300);
    RebuildPlanner.Block b=RebuildContractTest.block(s);
    RebuildProtocol.Plan p=RebuildProtocol.parse(
        RebuildContractTest.reply(b,new JSONArray().put(RebuildContractTest.event(0,2,"呢"))),s,b);
    assertTrue(p.issues.stream().anyMatch(x->x.code.equals("fragmentary_translation")&&x.repair));
    assertTrue(RebuildReview.shouldRepair(p,1,0,0,b.end));
  }

  @Test public void oversegmentedBlockIsRepairCandidateWithoutChangingTimes() throws Exception {
    RebuildSource s=RebuildContractTest.source(String.join(" ",Collections.nCopies(56,"word")),300);
    RebuildPlanner.Block b=RebuildContractTest.block(s);
    JSONArray events=new JSONArray();
    for(int i=0;i<14;i++) events.put(RebuildContractTest.event(i*4,i*4+3,"这一句"));
    RebuildProtocol.Plan p=RebuildProtocol.parse(RebuildContractTest.reply(b,events),s,b);
    assertTrue(p.issues.stream().anyMatch(x->x.code.equals("fragmented_plan")&&!x.repair));
    assertFalse("Event count alone must not spend another paid model call",
        RebuildReview.shouldRepair(p,1,0,0,b.end));
    for(RebuildProtocol.Event e:p.events) {
      assertEquals(s.words.get(e.from).start,e.start);
      assertEquals(s.words.get(e.to).end,e.end);
    }
  }

  @Test public void structuralSourceFailuresAllowOnlyOneTargetedExtraAttempt() {
    assertTrue(RebuildReview.structuralRetry("source_quote_mismatch; range=1-2"));
    assertFalse("unobserved structural errors do not merit a third paid call",RebuildReview.structuralRetry("missing_source"));
    assertFalse(RebuildReview.structuralRetry("json"));
    assertFalse(RebuildReview.structuralRetry("http_500"));
  }

  @Test public void knownEquipmentAndAdjacentNumberMistakesAreTargeted() throws Exception {
    RebuildSource equipment=RebuildContractTest.source("the size of a country's tank fleet",300);
    RebuildPlanner.Block eb=RebuildContractTest.block(equipment);
    RebuildProtocol.Plan ep=RebuildProtocol.parse(
        RebuildContractTest.reply(eb,new JSONArray().put(RebuildContractTest.event(0,equipment.words.size()-1,"一个国家坦克舰队的规模"))),equipment,eb);
    assertTrue(ep.issues.stream().anyMatch(x->x.code.equals("possible_equipment_term")&&x.repair));

    RebuildSource numbers=RebuildContractTest.source("about 50 20 aircraft",300);
    RebuildPlanner.Block nb=RebuildContractTest.block(numbers);
    RebuildProtocol.Plan np=RebuildProtocol.parse(
        RebuildContractTest.reply(nb,new JSONArray().put(RebuildContractTest.event(0,numbers.words.size()-1,"大约50至20架飞机"))),numbers,nb);
    assertTrue(np.issues.stream().anyMatch(x->x.code.equals("numeric_range_invention")&&x.repair));
    assertTrue("The invented range is quarantined, not displayed",RebuildReview.blocked(np,np.events.get(0)));
  }
}
