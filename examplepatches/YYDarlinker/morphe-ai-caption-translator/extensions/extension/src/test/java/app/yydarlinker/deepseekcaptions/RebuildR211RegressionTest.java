package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;
import org.junit.Test;

/** Sanitized exact fragments from user-provided R2.8 diagnostics, not provider or phone acceptance. */
public class RebuildR211RegressionTest {
  private static JSONArray rows() throws Exception {
    try (java.io.InputStream in=RebuildR211RegressionTest.class.getResourceAsStream("/r211/deepseek-rebound.json")) {
      return new JSONArray(new String(in.readAllBytes(), StandardCharsets.UTF_8));
    }
  }
  private static JSONArray qwen() throws Exception {
    try (java.io.InputStream in=RebuildR211RegressionTest.class.getResourceAsStream("/r211/qwen-risk.json")) {
      return new JSONArray(new String(in.readAllBytes(),StandardCharsets.UTF_8));
    }
  }
  private static RebuildSource source() throws Exception { return sourceFor(rows()); }
  private static RebuildSource sourceFor(JSONArray captured) throws Exception {
    List<RebuildSource.Word> words=new ArrayList<>(RebuildR28CapturedTest.source().words);
    for(int i=0;i<captured.length();i++) {
      JSONObject source=captured.getJSONObject(i).getJSONObject("source");
      JSONArray tokens=source.getJSONArray("owned_tokens"), times=source.getJSONArray("diagnostic_only_source_times");
      for(int j=0;j<tokens.length();j++) {
        JSONArray t=tokens.getJSONArray(j),time=times.getJSONArray(j);
        int id=t.getInt(0);
        assertEquals("not the same source token",words.get(id).text,t.getString(1));
        words.set(id,new RebuildSource.Word(t.getString(1),time.getLong(1),time.getLong(2),time.getInt(3),RebuildSource.Precision.ESTIMATED));
      }
    }
    return new RebuildSource(words);
  }
  @Test public void allSevenRejectedButCompleteQuotesAreRecoveredWithNoNewApiCall() throws Exception {
    RebuildSource s=source();JSONArray captured=rows();assertEquals(7,captured.length());
    for(int i=0;i<captured.length();i++) {
      JSONObject record=captured.getJSONObject(i);
      RebuildPlanner.Block b=RebuildR26Test.block(record,s);
      RebuildProtocol.Plan plan=RebuildProtocol.parseBound(record.getJSONObject("response").toString(),s,b);
      assertTrue("expected a local source rebind: request="+record.getInt("request"),plan.reboundEvents>0);
      assertEquals(b.from,plan.events.get(0).from);
      assertEquals(b.to,plan.events.get(plan.events.size()-1).to);
      for(int j=1;j<plan.events.size();j++)assertEquals(plan.events.get(j-1).to+1,plan.events.get(j).from);
      assertEquals("canonical cached response needs no second rebind",0,RebuildProtocol.parseBound(plan.json,s,b).reboundEvents);
    }
  }
  private static void rejected(JSONObject response,RebuildSource s,RebuildPlanner.Block b) throws Exception {
    try {RebuildProtocol.parseBound(response.toString(),s,b);fail("tampered quotes/IDs accepted");}
    catch(RebuildProtocol.Invalid expected) {assertTrue(expected.code,Arrays.asList("source_quote_mismatch","source_coverage","numeric_substitution","missing_source","source_quote_required","crosses_source_break").contains(expected.code));}
  }
  @Test public void cannotRecoverDeletedAddedReorderedOrChangedSourceTokens() throws Exception {
    RebuildSource s=source();JSONObject original=rows().getJSONObject(0);RebuildPlanner.Block b=RebuildR26Test.block(original,s);
    JSONObject missing=new JSONObject(original.getJSONObject("response").toString());
    JSONObject first=missing.getJSONArray("events").getJSONObject(0);
    first.put("source",first.getString("source").replaceFirst("^\\S+\\s*",""));rejected(missing,s,b);
    JSONObject inserted=new JSONObject(original.getJSONObject("response").toString());
    first=inserted.getJSONArray("events").getJSONObject(0);first.put("source",first.getString("source")+" fabricated");rejected(inserted,s,b);
    JSONObject reordered=new JSONObject(original.getJSONObject("response").toString());
    first=reordered.getJSONArray("events").getJSONObject(0);String[] words=first.getString("source").split(" ");
    String temp=words[0];words[0]=words[1];words[1]=temp;first.put("source",String.join(" ",words));rejected(reordered,s,b);
    JSONObject badId=new JSONObject(original.getJSONObject("response").toString());
    first=badId.getJSONArray("events").getJSONObject(0);first.put("from",b.from+1);
    assertTrue("full exact quotes may repair misclaimed IDs",RebuildProtocol.parseBound(badId.toString(),s,b).reboundEvents>0);
    JSONObject noQuote=new JSONObject(original.getJSONObject("response").toString());
    noQuote.getJSONArray("events").getJSONObject(0).remove("source");rejected(noQuote,s,b);
    JSONObject outOfBlock=new JSONObject(original.getJSONObject("response").toString());
    outOfBlock.getJSONArray("events").getJSONObject(0).put("from",b.to+1);rejected(outOfBlock,s,b);
  }
  @Test public void equalRiskRepairIsNotPreferredOverExistingPlan() {
    RebuildProtocol.Event event=new RebuildProtocol.Event(0,0,0,1000,"译文");
    RebuildReview.Issue problem=new RebuildReview.Issue(0,0,"dependent_boundary","source split",true);
    RebuildProtocol.Plan old=new RebuildProtocol.Plan(Collections.singletonList(event),"old",Collections.singletonList(problem));
    RebuildProtocol.Plan changed=new RebuildProtocol.Plan(Collections.singletonList(event),"changed",Collections.singletonList(problem));
    assertSame("no-risk-improvement candidate should not replace previous plan",old,RebuildReview.prefer(old,changed));
    RebuildProtocol.Plan improved=new RebuildProtocol.Plan(Collections.singletonList(event),"good",Collections.emptyList());
    assertSame(improved,RebuildReview.prefer(old,improved));
  }
  @Test public void capturedRisksAreWarningsNotFakeSemanticCertificates() throws Exception {
    JSONArray captured=qwen();RebuildSource evidence=sourceFor(captured);
    JSONObject licenseRecord=captured.getJSONObject(0);
    RebuildProtocol.Plan license=RebuildProtocol.parseBound(licenseRecord.getJSONObject("response").toString(),evidence,RebuildR26Test.block(licenseRecord,evidence));
    assertTrue(license.issues.stream().anyMatch(x->x.code.equals("possible_authorization_expansion")));
    RebuildProtocol.Plan longCaption=RebuildR28CapturedTest.plan(38);
    assertTrue(longCaption.issues.stream().anyMatch(x->x.code.equals("dense_long_event_watch")));
    JSONObject numberRecord=captured.getJSONObject(1);
    RebuildProtocol.Plan number=RebuildProtocol.parseBound(numberRecord.getJSONObject("response").toString(),evidence,RebuildR26Test.block(numberRecord,evidence));
    assertTrue(number.issues.stream().anyMatch(x->x.code.equals("possible_number_loss")));
    RebuildSource src=RebuildContractTest.source("the americans have",400);
    RebuildPlanner.Block b=RebuildContractTest.block(src);
    RebuildProtocol.Event fragment=new RebuildProtocol.Event(b.from,b.to,b.start,b.end,"呢");
    assertTrue(RebuildReview.inspect(src,b,Collections.singletonList(fragment)).stream().anyMatch(x->x.code.equals("fragmentary_translation")));
    assertFalse("advisory is not a hard semantic validator",RebuildReview.blocked(new RebuildProtocol.Plan(Collections.singletonList(fragment),"{}",RebuildReview.inspect(src,b,Collections.singletonList(fragment))),fragment));
  }
}
