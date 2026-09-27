package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import org.junit.Test;
import org.json.*;
import java.util.*;
import java.nio.charset.StandardCharsets;
public class RebuildR28CapturedTest {
  static byte[] resource(String name)throws Exception{try(java.io.InputStream in=RebuildR28CapturedTest.class.getResourceAsStream("/r28/"+name)){return in.readAllBytes();}}
  static JSONArray records()throws Exception{return new JSONArray(new String(resource("captured-events.json"),StandardCharsets.UTF_8));}
  static RebuildSource cachedSource;
  static synchronized RebuildSource source()throws Exception{
    if(cachedSource!=null)return cachedSource;
    byte[] bytes=resource("original.srt");RebuildSource original=RebuildSource.read(bytes,CaptionDocument.parse(bytes,"application/x-subrip"));
    List<RebuildSource.Word> words=new ArrayList<>(original.words);JSONArray rows=records();
    for(int i=0;i<rows.length();i++){JSONObject s=rows.getJSONObject(i).getJSONObject("source");JSONArray ts=s.getJSONArray("owned_tokens"),tm=s.getJSONArray("diagnostic_only_source_times");for(int j=0;j<ts.length();j++){JSONArray t=ts.getJSONArray(j),m=tm.getJSONArray(j);int id=t.getInt(0);assertEquals(words.get(id).text,t.getString(1));words.set(id,new RebuildSource.Word(t.getString(1),m.getLong(1),m.getLong(2),m.getInt(3),RebuildSource.Precision.ESTIMATED));}}
    return cachedSource=new RebuildSource(words);
  }
  static RebuildProtocol.Plan plan(int request)throws Exception{RebuildSource s=source();JSONArray rows=records();for(int i=0;i<rows.length();i++){JSONObject r=rows.getJSONObject(i);if(r.getInt("request")==request)return RebuildProtocol.parseBound(r.getJSONObject("response").toString(),s,RebuildR26Test.block(r,s));}throw new AssertionError();}
  @Test public void capturedDateIsNotRejected()throws Exception{assertEquals(2,plan(30).events.size());}
  @Test public void futureOverflowDoesNotEraseEarlierEvents()throws Exception{RebuildProtocol.Plan p=RebuildReview.withLayoutReview(plan(32),x->x.length()<50);assertFalse(RebuildReview.blocked(p,p.events.get(0)));assertTrue(RebuildReview.blocked(p,p.events.get(2)));assertTrue(p.issues.stream().anyMatch(x->x.code.equals("possible_arithmetic_misread")));}
  @Test public void paragraphIsQuarantinedWithoutLosingFullResponse()throws Exception{RebuildProtocol.Plan p=plan(38);assertEquals(3,p.events.size());assertFalse(RebuildReview.blocked(p,p.events.get(0)));assertTrue(RebuildReview.blocked(p,p.events.get(2)));}
  @Test public void repairedDependenceDoesNotRetainMultiplicationRisk()throws Exception{assertFalse(plan(33).issues.stream().anyMatch(x->x.code.equals("possible_arithmetic_misread")));}
  @Test public void observedSubjectAndPolarityErrorsAreReviewed()throws Exception{assertTrue(plan(20).issues.stream().anyMatch(x->x.code.equals("possible_subject_attachment")));assertTrue(plan(36).issues.stream().anyMatch(x->x.code.equals("possible_polarity_change")));}
  @Test public void allCapturedResponsesRetainSourceCoverage()throws Exception{for(int i=3;i<=38;i++)assertNotNull(plan(i));}
  @Test public void plannerPreservesDirectionNounAndListMarker()throws Exception{
    RebuildSource s=source();long begin=System.nanoTime();List<RebuildPlanner.Block> bs=RebuildPlanner.plan(s);int next=0;
    for(RebuildPlanner.Block b:bs){assertEquals(next,b.from);next=b.to+1;assertTrue(b.end-b.start<=30000);assertTrue(b.to-b.from<160);assertNotEquals(362,b.to);assertNotEquals(450,b.to);assertNotEquals(557,b.to);}
    assertEquals(9684,next);System.out.println("R28_PLANNER_FULL_SOURCE_MS="+(System.nanoTime()-begin)/1000000);
  }
  @Test public void dateFormsAndMultipleDatesAreCompared(){assertTrue(RebuildNumbers.safe("February 24th","二月二十四日"));assertTrue(RebuildNumbers.safe("November 2nd","十一月二日"));assertTrue(RebuildNumbers.safe("February 24th and March 2nd","2月24日与3月2日"));assertFalse(RebuildNumbers.safe("February 24th and March 2nd","2月24日与3月3日"));assertTrue(RebuildNumbers.safe("February 24th","le 24 février"));assertFalse(RebuildNumbers.safe("there are 24 ships","有25艘船"));}
  @Test public void genuineMathematicalProductNotFlagged(){RebuildSource s=RebuildContractTest.source("the mathematical equation is a product of two values",400);List<RebuildReview.Issue> issues=RebuildReview.inspect(s,RebuildContractTest.block(s),Collections.singletonList(new RebuildProtocol.Event(0,s.words.size()-1,0,5000,"数学等式是两数的乘积")));assertFalse(issues.stream().anyMatch(x->x.code.equals("possible_arithmetic_misread")));}
  @Test public void faithfulNotAlwaysNotFlagged(){RebuildSource s=RebuildContractTest.source("carriers aren't always included in the defense budget",400);assertFalse(RebuildReview.inspect(s,RebuildContractTest.block(s),Collections.singletonList(new RebuildProtocol.Event(0,s.words.size()-1,0,5000,"航母并非总被计入国防预算"))).stream().anyMatch(x->x.code.equals("possible_polarity_change")));}
}
