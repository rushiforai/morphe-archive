package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import java.util.*;
import org.json.*;
import org.junit.Test;
public class N30SourceBreakTest {
 static RebuildSource device()throws Exception {
  JSONObject fixture=new JSONObject(new String(N30SourceBreakTest.class.getResourceAsStream("/n30/source-break-device.json").readAllBytes(),java.nio.charset.StandardCharsets.UTF_8));
  List<RebuildSource.Word> words=new ArrayList<>();
  for(int i=0;i<354;i++)words.add(new RebuildSource.Word("context",i*300L,i*300L+200,i,RebuildSource.Precision.ESTIMATED));
  JSONArray rows=fixture.getJSONArray("words");for(int i=0;i<rows.length();i++){JSONObject w=rows.getJSONObject(i);words.add(new RebuildSource.Word(w.getString("text"),w.getLong("start"),w.getLong("end"),w.getInt("cue"),RebuildSource.Precision.valueOf(w.getString("precision"))));}
  return new RebuildSource(words);
 }
 static void contract(RebuildSource source,CaptionLanguageContext language)throws Exception {
  List<RebuildPlanner.Block> blocks=RebuildPlanner.plan(source,language);int next=0;
  for(RebuildPlanner.Block b:blocks){assertEquals(next,b.from);assertEquals(source.words.get(b.from).start,b.start);assertEquals(source.words.get(b.to).end,b.end);
   for(int i=b.from+1;i<=b.to;i++)assertFalse(b.id(),RebuildPlanner.hardBreakBefore(source,i));
   assertEquals(0,RebuildProtocol.payload(source,b,language.profile.id,"",language).getJSONArray("source_breaks_before").length());next=b.to+1;
  }assertEquals(source.words.size(),next);
 }
 @Test public void actualThreeRejectedResponsesStayRejectedButPlannerNeverRequestsThatIllegalOwner()throws Exception {
  RebuildSource source=device();CaptionLanguageContext language=CaptionLanguageContext.explicit("en","zh-Hans");
  JSONObject fixture=new JSONObject(new String(getClass().getResourceAsStream("/n30/source-break-device.json").readAllBytes(),"UTF-8"));
  RebuildPlanner.Block before=new RebuildPlanner.Block(7,354,387,source);JSONArray responses=fixture.getJSONArray("responses");assertEquals(3,responses.length());
  for(int i=0;i<responses.length();i++)try{RebuildProtocol.parseBound(responses.getJSONObject(i).getString("response"),source,before,language);fail("old cross-break plan must be rejected");}catch(RebuildProtocol.Invalid expected){assertEquals("crosses_source_break",expected.code);}
  contract(source,language);List<RebuildPlanner.Block> after=RebuildPlanner.plan(source,language);
  assertTrue(after.stream().anyMatch(b->b.to==380));assertTrue(after.stream().anyMatch(b->b.from==381));
  assertFalse(after.stream().anyMatch(b->b.from<381&&b.to>=381));
  N28CGeometryTest.export("n30-source-break-device.json",new JSONObject().put("before_rejections",3).put("after_cross_break_blocks",0).put("gap_ms",722).put("after_blocks",new JSONArray(after.stream().filter(b->b.to>=354).map(b->b.id()).toArray())));
 }
 @Test public void allHardGapsAndSpeakerMarkersSplitAtArbitraryPositionsAcrossLanguages()throws Exception {
  String[] locales={"en","fr","ja","ar"};int[] sizes={9,27,72,121};int[] breaks={2,13,41,77};
  for(int k=0;k<locales.length;k++)for(RebuildSource.Precision precision:RebuildSource.Precision.values()){
   List<RebuildSource.Word> words=new ArrayList<>();long at=0;
   for(int i=0;i<sizes[k];i++){if(i==breaks[k])at+=650;String word=locales[k].equals("ja")?"字幕":locales[k].equals("ar")?"نص":"parole";if(i==sizes[k]-2)word=">> "+word;
    words.add(new RebuildSource.Word(word,at,at+300,i/3,precision));at+=300;}
   contract(new RebuildSource(words),CaptionLanguageContext.explicit(locales[k],"en"));
  }
 }
 @Test public void actualManualAndAutoVttAndJson3KeepAllOwnershipAndStableIndependentCacheKeys()throws Exception {
  JSONArray evidence=new JSONArray();
  for(String mode:new String[]{"manual","auto"})for(String format:new String[]{"vtt","json3"}){
   byte[] body=getClass().getResourceAsStream("/n30/"+mode+"."+format).readAllBytes();
   CaptionDocument.Parsed parsed=CaptionDocument.parse(body,format.equals("json3")?"application/json":"text/vtt");
   RebuildSource source=RebuildSource.read(body,parsed);CaptionLanguageContext language=CaptionLanguageContext.explicit("en","zh-Hans");contract(source,language);
   List<RebuildPlanner.Block> blocks=RebuildPlanner.plan(source,language);int hard=0;for(int i=1;i<source.words.size();i++)if(RebuildPlanner.hardBreakBefore(source,i))hard++;
   Set<String> keys=new HashSet<>();JSONArray window=new JSONArray();
   for(RebuildPlanner.Block b:blocks){assertTrue(keys.add(b.id()));if(b.end<112000||b.start>127500)continue;
    RebuildProtocol.Plan p=RebuildProtocol.parseBound(new JSONObject().put("block",b.id()).put("events",new JSONArray().put(new JSONObject().put("from",b.from).put("to",b.to).put("source",source.text(b.from,b.to)).put("text","这是一段完整的测试翻译。"))).toString(),source,b,language);
    assertEquals(b.start,p.events.get(0).start);assertEquals(b.end,p.events.get(0).end);
    window.put(new JSONObject().put("block",b.id()).put("start_ms",b.start).put("end_ms",b.end).put("owned_tokens",b.to-b.from+1).put("source",source.text(b.from,b.to)));
   }
   assertTrue(source.words.size()>500);assertTrue(window.length()>0);
   evidence.put(new JSONObject().put("source",mode+"."+format).put("words",source.words.size()).put("hard_breaks",hard).put("blocks",blocks.size()).put("illegal_blocks",0).put("owned_window",window));
  }
  N28CGeometryTest.export("n30-source-break-four-inputs.json",new JSONObject().put("rows",evidence).put("response_kind","deterministic_local_fixture_not_provider_translation"));
 }
 @Test public void punctuationWithoutHardSilenceDoesNotBecomeMandatoryNetworkOwnershipBoundary()throws Exception {
  List<RebuildSource.Word> words=Arrays.asList(new RebuildSource.Word("Hello.",0,600,0,RebuildSource.Precision.NATIVE),new RebuildSource.Word("Again.",620,1100,1,RebuildSource.Precision.NATIVE));
  RebuildSource source=new RebuildSource(words);assertFalse(RebuildPlanner.hardBreakBefore(source,1));assertEquals(1,RebuildPlanner.plan(source).size());
 }
}
