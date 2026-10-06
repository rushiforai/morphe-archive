package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.util.*;
import org.json.JSONArray;
import org.junit.Test;

/** N9: the frozen block-1 comparison owns both the carrier and T-62s anchors. */
public class RebuildN9AnchorTest {
  private static final String COMPARISON = "after all who cares how many nuclear aircraft carriers or stealth bombers the americans have if ivan's got 10 000 t-62s rusting in siberia somewhere";

  @Test public void bothRejectedPhoneResponsesKeepTheirOwnEquipmentAnchors() throws Exception {
    RebuildSource s=RebuildContractTest.source("a country's tank fleet " + COMPARISON,400);
    RebuildPlanner.Block b=RebuildContractTest.block(s);
    assertEquals("a country's tank fleet",s.text(0,3));
    assertEquals(RebuildSemantics.Evidence.SUPPORTED,RebuildSemantics.evidence(2,s.text(4,s.words.size()-1),s.text(0,s.words.size()-1)));
    assertTrue(RebuildSemantics.models(s.text(4,s.words.size()-1)).contains("t-62"));
    for(String translated:Arrays.asList(
        "毕竟，如果伊万在西伯利亚某处有10000辆生锈的T-62坦克，谁还管美国人有多少核动力航母或隐形轰炸机呢？",
        "毕竟若伊万在西伯利亚某处有1万辆T-62坦克在生锈，谁还在乎美国人有多少核航母或隐身轰炸机")) {
      RebuildSemantics.validatePlan(s,b,Arrays.asList(
          new RebuildProtocol.Event(0,3,0,1600,"一国坦克部队的规模"),
          new RebuildProtocol.Event(4,s.words.size()-1,1600,s.words.size()*400L,translated)));
    }
  }

  @Test public void explicitModelMovedIntoCarrierOnlyEventStillFails() throws Exception {
    RebuildSource s=RebuildContractTest.source("tank fleet aircraft carriers t-62s",500);
    RebuildPlanner.Block b=RebuildContractTest.block(s);
    List<RebuildProtocol.Event> events=Arrays.asList(
        new RebuildProtocol.Event(0,1,0,1000,"坦克部队"),
        new RebuildProtocol.Event(2,3,1000,2000,"T-62坦克和航母"),
        new RebuildProtocol.Event(4,4,2000,2500,"T-62"));
    try {RebuildSemantics.validatePlan(s,b,events);fail("cross-event T-62 transfer accepted");}
    catch(RebuildProtocol.Invalid ex) {assertEquals("semantic_anchor_leak",ex.code);assertTrue(ex.detail.contains("model=t-62"));}
  }

  @Test public void genericTankMovedIntoCarrierOnlyEventStillFails() throws Exception {
    RebuildSource s=RebuildContractTest.source("tank fleet aircraft carriers",500);
    RebuildPlanner.Block b=RebuildContractTest.block(s);
    List<RebuildProtocol.Event> events=Arrays.asList(
        new RebuildProtocol.Event(0,1,0,1000,"坦克部队"),
        new RebuildProtocol.Event(2,3,1000,2000,"航母和坦克"));
    try {RebuildSemantics.validatePlan(s,b,events);fail("cross-event tank transfer accepted");}
    catch(RebuildProtocol.Invalid ex) {assertEquals("semantic_anchor_leak",ex.code);assertTrue(ex.detail.contains("incompatible explicit equipment anchor"));}
  }


  @Test public void oneBoundedLiveBlockOneResponsePassesProductionParser() throws Exception {
    RebuildSource s=RebuildR26Test.source(RebuildR26Test.fixture());
    RebuildPlanner.Block b=new RebuildPlanner.Block(1,25,97,s);
    JSONArray events=new JSONArray()
        .put(RebuildR26Test.quoted(s,25,41,"互联网上充斥着文章和排名，全都自信地将俄罗斯列为第二"))
        .put(RebuildR26Test.quoted(s,42,52,"天哪，甚至有几篇把俄罗斯排在了第一"))
        .put(RebuildR26Test.quoted(s,53,72,"大概是那些认为军事实力终极评判标准仍是国家坦克舰队规模的人写的"))
        .put(RebuildR26Test.quoted(s,73,97,"毕竟，如果伊万在西伯利亚某处有1万辆T-62坦克在生锈，谁还管美国人有多少核航母或隐形轰炸机呢"));
    RebuildProtocol.Plan parsed=RebuildProtocol.parseBound(RebuildContractTest.reply(b,events),s,b);
    assertEquals(4,parsed.events.size());
    assertEquals(73,parsed.events.get(3).from);
    assertEquals(97,parsed.events.get(3).to);
    assertNotNull(parsed.at(s.words.get(73).start));
  }
}
