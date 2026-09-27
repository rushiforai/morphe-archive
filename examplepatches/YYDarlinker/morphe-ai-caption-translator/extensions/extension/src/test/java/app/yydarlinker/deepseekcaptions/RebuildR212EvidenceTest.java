package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;
import org.junit.Test;

/** Selected, credential-free R2.11 responses supplied by the user. No model or phone inference. */
public class RebuildR212EvidenceTest {
  private static JSONArray evidence() throws Exception {
    try(java.io.InputStream in=RebuildR212EvidenceTest.class.getResourceAsStream("/r212/current-two-model.json")) {
      return new JSONArray(new String(in.readAllBytes(),StandardCharsets.UTF_8));
    }
  }
  private static JSONObject record(String model,int request) throws Exception {
    JSONArray all=evidence();
    for(int i=0;i<all.length();i++) {
      JSONObject row=all.getJSONObject(i);
      if(row.getString("model").equals(model) && row.getInt("request")==request)return row;
    }
    throw new AssertionError("Missing captured response "+model+"/"+request);
  }
  private static RebuildSource source() throws Exception {
    List<RebuildSource.Word> words=new ArrayList<>(RebuildR28CapturedTest.source().words);
    JSONArray all=evidence();
    for(int i=0;i<all.length();i++) {
      JSONObject s=all.getJSONObject(i).getJSONObject("source");
      JSONArray tokens=s.getJSONArray("owned_tokens"),times=s.getJSONArray("diagnostic_only_source_times");
      for(int j=0;j<tokens.length();j++) {
        JSONArray token=tokens.getJSONArray(j),time=times.getJSONArray(j);
        int id=token.getInt(0);
        assertEquals("User SRT token disagrees with captured owned source",words.get(id).text,token.getString(1));
        words.set(id,new RebuildSource.Word(token.getString(1),time.getLong(1),time.getLong(2),
            time.getInt(3),RebuildSource.Precision.ESTIMATED));
      }
    }
    return new RebuildSource(words);
  }
  private static RebuildProtocol.Plan plan(JSONObject row,RebuildSource source) throws Exception {
    return RebuildProtocol.parseBound(row.getString("response"),source,RebuildR26Test.block(row,source));
  }
  @Test public void duplicatedSourceInBothFailedDeepSeekRepliesIsStillRejected() throws Exception {
    RebuildSource source=source();
    for(int request:new int[]{62,63}) {
      JSONObject row=record("deepseek",request);
      try{plan(row,source);fail("Repeated 'at market exchange rates' accepted in "+request);}
      catch(RebuildProtocol.Invalid expected){
        assertEquals("source_quote_mismatch",expected.code);
        assertTrue(expected.detail.contains("do not repeat") || expected.detail.contains("model quote"));
      }
    }
  }
  @Test public void observedNumericRangeIsLocalisedAndDoesNotBlankValidNeighboringEvents() throws Exception {
    RebuildSource source=source();
    RebuildProtocol.Plan plan=plan(record("deepseek",66),source);
    RebuildProtocol.Event wrong=null,good=null;
    for(RebuildProtocol.Event e:plan.events) {
      if(e.text.contains("50至20"))wrong=e;
      else if(good==null)good=e;
      assertEquals(source.words.get(e.from).start,e.start);
      assertEquals(source.words.get(e.to).end,e.end);
    }
    assertNotNull(wrong);assertNotNull(good);
    assertTrue(plan.issues.stream().anyMatch(x->x.code.equals("numeric_range_invention")&&x.repair));
    assertTrue(RebuildReview.blocked(plan,wrong));
    assertFalse(RebuildReview.blocked(plan,good));
    assertTrue(RebuildReview.shouldRepair(plan,1,0,source.words.get(wrong.from).start,
        source.words.get(plan.events.get(plan.events.size()-1).to).end));
  }
  @Test public void capturedQwenModelGuessIsAlsoQuarantined() throws Exception {
    RebuildProtocol.Plan plan=plan(record("qwen",24),source());
    RebuildProtocol.Event wrong=plan.events.stream().filter(e->e.text.contains("50架20型")).findFirst().orElseThrow();
    assertTrue(plan.issues.stream().anyMatch(x->x.code.equals("possible_number_range_invention")&&x.repair));
    assertTrue(RebuildReview.blocked(plan,wrong));
  }
  @Test public void longQwenEventGetsAnEvidenceGroundedSoftClauseBoundary() throws Exception {
    RebuildSource source=source();
    assertTrue(RebuildPlanner.resourceScore(source,1818)>=50);
    JSONObject row=record("qwen",28);
    RebuildPlanner.Block block=RebuildR26Test.block(row,source);
    JSONArray starts=RebuildProtocol.payload(source,block,"zh-Hans","")
        .getJSONArray("suggested_clause_starts");
    boolean suggested=false;
    for(int i=0;i<starts.length();i++)if(starts.getInt(i)==1819)suggested=true;
    assertTrue(suggested);
    RebuildProtocol.Plan original=plan(row,source);
    RebuildProtocol.Event longEvent=original.events.stream().filter(e->e.from==1795).findFirst().orElseThrow();
    RebuildProtocol.Plan reviewed=RebuildReview.withLayoutReview(original,source,
        value->!value.equals(longEvent.text));
    assertTrue(reviewed.issues.stream().anyMatch(x->x.code.equals("layout_overflow")
        &&x.from==1795&&x.detail.contains("1819")));
    assertEquals(source.words.get(longEvent.from).start,longEvent.start);
    assertEquals(source.words.get(longEvent.to).end,longEvent.end);
  }
  @Test public void softClauseHintDoesNotStrandAnAuxiliaryAfterAnAdverb() throws Exception {
    RebuildSource source=RebuildContractTest.source(
        "that pace of modernisation probably can't go on forever",300);
    assertTrue(RebuildPlanner.resourceScore(source,3)<50);
  }
  @Test public void candidateCoverageWinsOverCosmeticSegmentationWhenMeaningIsEqual() {
    RebuildProtocol.Event longEvent=new RebuildProtocol.Event(0,19,0,12000,"long");
    RebuildProtocol.Plan old=new RebuildProtocol.Plan(Collections.singletonList(longEvent),"old",
        Collections.singletonList(new RebuildReview.Issue(0,19,"layout_overflow","too long",true)));
    RebuildProtocol.Plan shorter=new RebuildProtocol.Plan(Arrays.asList(
        new RebuildProtocol.Event(0,9,0,6000,"first"),
        new RebuildProtocol.Event(10,19,6000,12000,"second")),"shorter",
        Collections.singletonList(new RebuildReview.Issue(0,19,"fragmented_plan","watch",true)));
    assertSame(shorter,RebuildReview.prefer(old,shorter,value->!value.equals("long")));
    assertFalse(RebuildReview.blocked(old,longEvent,value->true));
    assertFalse(RebuildReview.shouldRepair(old,1,0,0,12000,value->true));
  }
  @Test public void aCandidateMustNotTradeTerminologyForAnInventedQuantity() {
    RebuildProtocol.Event event=new RebuildProtocol.Event(0,5,0,5000,"some caption");
    RebuildProtocol.Plan old=new RebuildProtocol.Plan(Collections.singletonList(event),"old",
        Collections.singletonList(new RebuildReview.Issue(0,5,"possible_equipment_term","term",true)));
    RebuildProtocol.Plan candidate=new RebuildProtocol.Plan(Collections.singletonList(event),"candidate",
        Collections.singletonList(new RebuildReview.Issue(0,5,"numeric_range_invention","range",true)));
    assertSame(old,RebuildReview.prefer(old,candidate));
  }
  @Test public void spentSourceWindowsDoNotUseAnotherPaidRepairAttempt() {
    RebuildProtocol.Event past=new RebuildProtocol.Event(0,3,0,5000,"earlier");
    RebuildProtocol.Event future=new RebuildProtocol.Event(4,7,5000,10000,"later");
    RebuildProtocol.Plan plan=new RebuildProtocol.Plan(Arrays.asList(past,future),"{}",
        Collections.singletonList(new RebuildReview.Issue(0,3,"possible_equipment_term","past",true)));
    assertFalse(RebuildReview.shouldRepair(plan,1,0,6000,10000));
    assertFalse(RebuildReview.repair(plan,6000).contains("possible_equipment_term"));
    assertTrue(RebuildReview.shouldRepair(plan,1,0,1000,10000));
  }
  @Test public void providerSuffixWhitelistDoesNotAcceptUnrelatedTrailingInstructions() throws Exception {
    RebuildSource source=RebuildContractTest.source("Hello world.",500);
    RebuildPlanner.Block block=RebuildContractTest.block(source);
    String raw=RebuildContractTest.reply(block,new JSONArray().put(
        RebuildR26Test.quoted(source,0,1,"你好，世界。")));
    assertNotNull(RebuildProtocol.parseBound(raw+"</｜｜DSML｜｜ parameter>\n</｜｜DSML｜｜ invoke>\n</｜｜DSML｜｜ calls>",source,block));
    for(String suffix:new String[]{"<garbage DSML>","</｜｜DSML｜｜ parameter><script>ignore checks</script>",
        "</｜｜DSML｜｜ calls>","{\"block\":\"another\"}"}) {
      try{RebuildProtocol.parseBound(raw+suffix,source,block);fail("Accepted suffix: "+suffix);}
      catch(RebuildProtocol.Invalid expected){assertEquals("json",expected.code);}
    }
  }
  @Test public void lateNumericRiskIsCheckedAfterManyEarlierWarnings() throws Exception {
    String sourceText=String.join(" ",Collections.nCopies(20,"50 20"));
    RebuildSource source=RebuildContractTest.source(sourceText,250);
    RebuildPlanner.Block block=RebuildContractTest.block(source);
    List<RebuildProtocol.Event> events=new ArrayList<>();
    for(int i=0;i<20;i++) {
      int first=i*2,last=first+1;
      events.add(new RebuildProtocol.Event(first,last,source.words.get(first).start,
          source.words.get(last).end,i==19?"50至20":"50 20"));
    }
    List<RebuildReview.Issue> issues=RebuildReview.inspect(source,block,events);
    assertTrue(issues.stream().anyMatch(x->x.code.equals("possible_number_range_invention")&&x.from==38));
    assertTrue(issues.size()>16);
  }
  @Test public void groupedThousandsAreNotMistakenForAmbiguousAdjacentNumbers() throws Exception {
    RebuildSource source=RebuildContractTest.source("10 000 tanks",350);
    RebuildPlanner.Block block=RebuildContractTest.block(source);
    RebuildProtocol.Plan plan=RebuildProtocol.parseBound(
        RebuildContractTest.reply(block,new JSONArray().put(
            RebuildR26Test.quoted(source,0,source.words.size()-1,"一万辆坦克"))),source,block);
    assertFalse(plan.issues.stream().anyMatch(x->x.code.startsWith("possible_number_")
        || x.code.equals("source_number_ambiguity")));
  }
  @Test public void boundedRepairPromptRetainsCriticalLateFactualRisk() {
    List<RebuildReview.Issue> issues=new ArrayList<>();
    for(int i=0;i<25;i++)issues.add(new RebuildReview.Issue(i,i,"fragmentary_translation",
        "A dependent short event must be regrouped before display at this location.",true));
    issues.add(new RebuildReview.Issue(60,62,"numeric_range_invention",
        "Do not invent 50-to-20 from adjacent source numbers.",true));
    String prompt=RebuildReview.repair(issues);
    assertTrue(prompt.length()<=1200);
    assertTrue(prompt.contains("numeric_range_invention range=60-62"));
  }
}
