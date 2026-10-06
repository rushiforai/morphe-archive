package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import org.junit.*;
import org.json.*;
import java.util.*;
import java.nio.charset.StandardCharsets;

/** Captured R2.5 replay is rejection evidence, not a newly generated model-quality benchmark. */
public class RebuildR26Test {
  static JSONArray fixture() throws Exception {
    try(java.io.InputStream in=RebuildR26Test.class.getResourceAsStream("/r26/captured-events.json")) {
      return new JSONArray(new String(in.readAllBytes(),StandardCharsets.UTF_8));
    }
  }
  static RebuildSource source(JSONArray rows) throws Exception {
    TreeMap<Integer,RebuildSource.Word> words=new TreeMap<>();
    for(int i=0;i<rows.length();i++){
      JSONObject s=rows.getJSONObject(i).getJSONObject("source");
      JSONArray ts=s.getJSONArray("owned_tokens"),time=s.getJSONArray("diagnostic_only_source_times");
      for(int j=0;j<ts.length();j++) {JSONArray t=ts.getJSONArray(j),at=time.getJSONArray(j);
        words.put(t.getInt(0),new RebuildSource.Word(t.getString(1),at.getLong(1),at.getLong(2),at.getInt(3),RebuildSource.Precision.ESTIMATED));}
    }
    return new RebuildSource(new ArrayList<>(words.values()));
  }
  static RebuildPlanner.Block block(JSONObject row,RebuildSource s)throws Exception {
    String[] id=row.getJSONObject("source").getString("block").substring(1).split("_");
    return new RebuildPlanner.Block(Integer.parseInt(id[0]),Integer.parseInt(id[1]),Integer.parseInt(id[2]),s);
  }
  static JSONObject quoted(RebuildSource s,int f,int t,String translation)throws Exception {
    return RebuildContractTest.event(f,t,translation).put("source",s.text(f,t));
  }
  @Test public void capturedRepairedTanksCarriersDriftIsRejected()throws Exception {
    JSONArray rows=fixture();RebuildSource s=source(rows);JSONObject row=rows.getJSONObject(4);assertEquals(7,row.getInt("request"));
    try{RebuildProtocol.parse(row.getJSONObject("response").toString(),s,block(row,s));fail("captured semantic drift passed");}
    catch(RebuildProtocol.Invalid e){assertEquals("semantic_anchor_leak",e.code);assertTrue(e.detail.contains("268-294"));}
  }
  @Test public void correctedSourceAlignedComparisonPasses()throws Exception {
    RebuildSource s=source(fixture());RebuildPlanner.Block b=new RebuildPlanner.Block(3,243,325,s);
    JSONArray es=new JSONArray().put(quoted(s,243,267,"然而，有些人对俄罗斯胜利日阅兵中驶过红场的四辆T-14坦克更印象深刻"))
      .put(quoted(s,268,280,"却不如对中国从零建立航母舰队那样关注"))
      .put(quoted(s,281,294,"中国还先于除美国之外的各国列装第五代战斗机"))
      .put(quoted(s,295,313,"并在过去二十年中大幅推进几乎各方面军事能力的现代化"))
      .put(quoted(s,314,325,"事实上，解放军能力的转型"));
    RebuildProtocol.Plan p=RebuildProtocol.parseBound(RebuildContractTest.reply(b,es),s,b);
    assertEquals(5,p.events.size());assertEquals(s.words.get(268).start,p.events.get(1).start);
  }
  @Test public void exactQuoteIsMandatoryInProduction()throws Exception {
    RebuildSource s=RebuildContractTest.source("Hello world.",500);RebuildPlanner.Block b=RebuildContractTest.block(s);
    try{RebuildProtocol.parseBound(RebuildContractTest.reply(b,new JSONArray().put(RebuildContractTest.event(0,1,"你好"))),s,b);fail();}
    catch(RebuildProtocol.Invalid e){assertEquals("source_quote_required",e.code);}
  }
  @Test public void wrongSourceQuoteIsNotAcceptedWithCorrectIds()throws Exception {
    RebuildSource s=RebuildContractTest.source("Hello world.",500);RebuildPlanner.Block b=RebuildContractTest.block(s);
    try{RebuildProtocol.parseBound(RebuildContractTest.reply(b,new JSONArray().put(quoted(s,0,1,"你好").put("source","Another source."))),s,b);fail();}
    catch(RebuildProtocol.Invalid e){assertEquals("source_quote_mismatch",e.code);}
  }
  @Test public void exactQuoteWhitespaceIsHarmless()throws Exception {
    RebuildSource s=RebuildContractTest.source("Hello world.",500);RebuildPlanner.Block b=RebuildContractTest.block(s);
    assertEquals(1,RebuildProtocol.parseBound(RebuildContractTest.reply(b,new JSONArray().put(quoted(s,0,1,"你好").put("source","Hello   world."))),s,b).events.size());
  }
  @Test public void sourceQuoteDoesNotPretendToProveSemanticEquivalence()throws Exception {
    RebuildSource s=RebuildContractTest.source("This is blue.",500);RebuildPlanner.Block b=RebuildContractTest.block(s);
    // Deliberately wrong translation demonstrates the honest boundary of local checks.
    assertEquals(1,RebuildProtocol.parseBound(RebuildContractTest.reply(b,new JSONArray().put(quoted(s,0,s.words.size()-1,"这是红色的"))),s,b).events.size());
  }
  @Test public void nonChineseTranslationDoesNotNeedChineseEquipmentWords()throws Exception {
    RebuildSource s=RebuildContractTest.source("Aircraft carriers and tanks.",500);RebuildPlanner.Block b=RebuildContractTest.block(s);
    for(String t:Arrays.asList("Porte-avions et chars.","空母と戦車です。","Aircraft carriers and tanks."))
      assertEquals(1,RebuildProtocol.parseBound(RebuildContractTest.reply(b,new JSONArray().put(quoted(s,0,3,t))),s,b).events.size());
  }
  @Test public void genericCarrierTankAndArmadaAreNotForcedMilitaryEntities()throws Exception {
    RebuildSource s=RebuildContractTest.source("The carrier filled a water tank near an armada.",500);RebuildPlanner.Block b=RebuildContractTest.block(s);
    RebuildProtocol.parseBound(RebuildContractTest.reply(b,new JSONArray().put(quoted(s,0,s.words.size()-1,"运输者在舰队附近装满了水箱"))),s,b);
  }
  @Test public void adjacentAsrDigitsCannotInventRange()throws Exception {
    RebuildSource s=RebuildContractTest.source("about 50 20 fifth generation aircraft",400);RebuildPlanner.Block b=RebuildContractTest.block(s);
    try {
      RebuildProtocol.parseBound(RebuildContractTest.reply(b,new JSONArray().put(
          quoted(s,0,s.words.size()-1,"约50至20架五代战机"))),s,b);
      fail("Published parser must reject this invented range");
    } catch(RebuildProtocol.Invalid expected) {
      assertEquals("numeric_range_invention",expected.code);
    }
  }
  @Test public void authenticNumberRangeAndGroupedThousandsRemainValid()throws Exception {
    for(String raw:Arrays.asList("50 to 60 aircraft","10 000 tanks")){
      RebuildSource s=RebuildContractTest.source(raw,500);RebuildPlanner.Block b=RebuildContractTest.block(s);
      RebuildProtocol.parseBound(RebuildContractTest.reply(b,new JSONArray().put(quoted(s,0,s.words.size()-1,raw.startsWith("50")?"50至60架飞机":"一万辆坦克"))),s,b);
    }
  }
  @Test public void plannerDoesNotLeaveResourceCutAtIfAndColdStartIsSmaller()throws Exception {
    RebuildSource s=source(fixture());List<RebuildPlanner.Block> blocks=RebuildPlanner.plan(s);
    assertTrue(blocks.get(0).end<=12000);int next=0;
    for(RebuildPlanner.Block b:blocks){assertEquals(next,b.from);next=b.to+1;assertTrue(b.end-b.start<=30000);assertTrue(b.to-b.from+1<=160);assertTrue(s.text(b.from,b.to).length()<=1800);}
    assertEquals(s.words.size(),next);
  }
  @Test public void danglingHardLimitDoesNotMakeAllResponsesImpossible()throws Exception {
    RebuildSource s=RebuildContractTest.source("because because because because",500);RebuildPlanner.Block b=new RebuildPlanner.Block(0,0,1,s);
    RebuildProtocol.parseBound(RebuildContractTest.reply(b,new JSONArray().put(quoted(s,0,1,"因为，因为"))),s,b);
  }
  @Test public void terminalNoAndRelativeClauseEndingWithRemainValid()throws Exception {
    RebuildSource s=RebuildContractTest.source("No. This is the person I work with. Next.",400);RebuildPlanner.Block b=RebuildContractTest.block(s);
    RebuildProtocol.parseBound(RebuildContractTest.reply(b,new JSONArray().put(quoted(s,0,0,"不" )).put(quoted(s,1,s.words.size()-2,"这就是我的同事")).put(quoted(s,s.words.size()-1,s.words.size()-1,"下一项"))),s,b);
  }
  @Test public void replayEveryCapturedResponseAndReportLimits()throws Exception {
    JSONArray rows=fixture();RebuildSource s=source(rows);JSONObject results=new JSONObject();int rejected=0,reviewed=0;
    for(int i=0;i<rows.length();i++){
      JSONObject r=rows.getJSONObject(i);String result="passes_local_checks_NOT_semantic_proof";
      try{RebuildProtocol.Plan p=RebuildProtocol.parse(r.getJSONObject("response").toString(),s,block(r,s)); if(p.issues.stream().anyMatch(x->x.code.equals("paragraph"))){result="paragraph_review_display_ready_NOT_semantic_proof";reviewed++;}}
      catch(RebuildProtocol.Invalid e){result=e.code;rejected++;}
      results.put("request_"+r.getInt("request"),result);
    }
    assertEquals(31,rows.length());assertTrue(rejected+reviewed>=4);
    System.out.println("R26_CAPTURE_REPLAY="+results);
  }
}
