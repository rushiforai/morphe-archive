package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.util.*;
import java.nio.file.*;
import java.nio.charset.StandardCharsets;
import org.json.*;
import org.junit.Test;

/**
 * N24 review regression: the two N23 B-lane rules were withdrawn and the N22 detector set is back.
 * The 540-event corpus replay is kept as a ledger and now writes to .verification/n24 so the
 * historical .verification/n23 result is never overwritten.
 */
public class RebuildN23ReviewTest {
  private List<RebuildReview.Issue> issues(String english, String chinese) {
    RebuildSource source = RebuildContractTest.source(english, 323);
    RebuildProtocol.Event event = new RebuildProtocol.Event(0, source.words.size()-1, 0, 8000, chinese);
    return RebuildReview.inspect(source, RebuildContractTest.block(source), Collections.singletonList(event));
  }

  /** N22 behaviour: the source-side pattern alone is not enough; the target must carry 之后/之後. */
  @Test public void subjectAttachmentNeedsTheChineseClauseMarkerAgain() {
    String source="foreign investment and the explosive economic growth that would follow deng reduced the share of gdp that was focused on the pla";
    assertTrue("N22 required the Chinese marker before flagging",
        issues(source,"外资以及邓之后爆发的经济增长，降低了GDP中用于解放军的份额")
            .stream().anyMatch(i->i.code.equals("possible_subject_attachment")&&i.repair));
    assertFalse("wording drift is no longer rescued, matching N22",
        issues(source,"外资以及随之而来的经济爆发式增长，降低了国内生产总值中用于解放军的份额")
            .stream().anyMatch(i->i.code.equals("possible_subject_attachment")));
    assertTrue("the N22 path still blocks the flagged translation",
        RebuildReview.semanticBlocked(new RebuildProtocol.Plan(Collections.singletonList(
            new RebuildProtocol.Event(0,21,384639,391744,"外资以及邓之后爆发的经济增长，降低了GDP中用于解放军的份额")),"{}",
            issues(source,"外资以及邓之后爆发的经济增长，降低了GDP中用于解放军的份额")),
            new RebuildProtocol.Event(0,21,384639,391744,"外资以及邓之后爆发的经济增长，降低了GDP中用于解放军的份额")));
  }

  /** N23 added a licensed/unlicensed omission rule; N24 withdraws it and keeps only the N22 rule. */
  @Test public void licensedOmissionRuleIsGoneWhileAuthorizationExpansionStays() {
    String source="were either licensed or unlicensed copies or derivatives of soviet designs whether";
    assertFalse("the withdrawn rule must not flag a source with no head noun in the target",
        issues(source,"无论是经授权还是未经授权，").stream().anyMatch(i->i.code.equals("possible_omission")));
    assertFalse("withdrawn rule must not flag an unrelated licensed sentence either",
        issues("whether these systems were authorized","无论是经授权还是未经授权，").stream().anyMatch(i->i.code.equals("possible_omission")));
    assertEquals("a faithful translation stays clean", Collections.emptyList(), issues(source,"要么是授权或未经授权仿制苏联设计的复制品或衍生型号"));
    assertTrue("the N22 authorization-expansion check survives the revert",
        issues(source,"这些要么是合法的，要么是非法的仿制或衍生型号").stream().anyMatch(i->i.code.equals("possible_authorization_expansion")));
  }

  @Test public void replayExactly540MirrorEventsThroughProductionReview() throws Exception {
    JSONObject corpus;
    try(java.io.InputStream in=getClass().getResourceAsStream("/r29/captured-events.json")) {
      corpus=new JSONObject(new String(in.readAllBytes(),StandardCharsets.UTF_8));
    }
    List<RebuildSource.Word> words=new ArrayList<>();
    JSONArray raw=corpus.getJSONArray("source_word_times");
    for(int i=0;i<raw.length();i++) {
      JSONArray w=raw.getJSONArray(i);
      words.add(new RebuildSource.Word(w.getString(1),w.getLong(2),w.getLong(3),w.getInt(4),RebuildSource.Precision.valueOf(w.getString(5))));
    }
    RebuildSource source=new RebuildSource(words);
    JSONArray events;
    try(java.io.InputStream in=getClass().getResourceAsStream("/n23/offline-layout-mirror.json")) {
      assertNotNull("tracked original N20 mirror",in);
      events=new JSONObject(new String(in.readAllBytes(),StandardCharsets.UTF_8)).getJSONArray("events");
    }
    assertEquals(540,events.length());
    Map<Integer,RebuildPlanner.Block> blocks=new HashMap<>();
    JSONArray bs=corpus.getJSONArray("blocks");
    for(int i=0;i<bs.length();i++) {JSONObject b=bs.getJSONObject(i);blocks.put(b.getInt("index"),new RebuildPlanner.Block(b.getInt("index"),b.getInt("from"),b.getInt("to"),source));}
    JSONObject report=new JSONObject();
    for(String code:new String[]{"possible_subject_attachment","possible_omission"}) {
      JSONArray hits=new JSONArray();
      for(int i=0;i<events.length();i++) {
        JSONObject e=events.getJSONObject(i);
        RebuildProtocol.Event event=new RebuildProtocol.Event(e.getInt("from"),e.getInt("to"),e.getLong("start"),e.getLong("end"),e.getString("text"));
        for(RebuildReview.Issue issue:RebuildReview.inspect(source,blocks.get(e.getInt("block")),Collections.singletonList(event)))
          if(issue.code.equals(code)) hits.put(new JSONObject().put("event_index",i).put("block",e.getInt("block")).put("from",event.from).put("to",event.to).put("source",source.text(event.from,event.to)).put("text",event.text));
      }
      report.put(code,new JSONObject().put("count",hits.length()).put("events",hits));
      System.out.println("N24_REVIEW "+code+" hits="+hits.length()+" events="+hits);
      assertTrue("N24 stop line: more than five hits",hits.length()<=5);
    }
    report.put("reverted_rules",new JSONArray().put("possible_subject_attachment target-side 之后|之後 gate restored")
        .put("possible_omission licensed-or-unlicensed head-noun rule removed"));
    report.put("observed_subject_attachment_hits",report.getJSONObject("possible_subject_attachment").getInt("count"));
    Path output=Path.of(System.getProperty("scheduler.output"));
    Files.createDirectories(output);
    Files.write(output.resolve("review-hits.json"),report.toString(2).getBytes(StandardCharsets.UTF_8));
  }
}
