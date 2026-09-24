package app.yydarlinker.deepseekcaptions;
import org.junit.*;import static org.junit.Assert.*;import java.util.*;import org.json.*;import okhttp3.mockwebserver.*;
public class Recovery110HttpTest {
 @Test public void recoveryUsesOneActualHttpAttemptAndNoExtraPass()throws Exception{
  MockWebServer server=new MockWebServer();server.start();
  try{
   ContextualBatchApiClient.resetRejection();
   String content=new JSONObject().put("translations",new JSONArray().put(new JSONObject().put("id","w0").put("segments",new JSONArray().put(new JSONObject().put("source","Hello world").put("translation","你好，世界。"))))).toString();
   server.enqueue(new MockResponse().setResponseCode(200).setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject().put("finish_reason","stop").put("message",new JSONObject().put("content",content)))).toString()));
   DeepSeekConfig.Snapshot config=new DeepSeekConfig.Snapshot(true,server.url("/").toString(),"deepseek-flash","Faithful",18,70,"FAKE-LOCAL-KEY");
   List<SourceAtomTimeline.Atom> atoms=Arrays.asList(new SourceAtomTimeline.Atom(0,1000,"Hello",0,true),new SourceAtomTimeline.Atom(1000,2000,"world",0,true));
   TranslationUnitTimeline.Unit unit=new TranslationUnitTimeline.Unit(0,"w0",0,1,0,0,0,2000,"Hello world",TranslationUnitTimeline.Confidence.HIGH,"test");
   ContextualBatchApiClient.Result result=ContextualBatchApiClient.translate(Arrays.asList(unit),atoms,Collections.emptyList(),Collections.emptyList(),config,TargetLanguage.SIMPLIFIED_CHINESE,null,true,Collections.singletonMap("w0","incomplete token coverage;last=1;ends=0"));
   assertEquals(1,result.validCount());assertEquals(1,server.getRequestCount());
   JSONObject request=new JSONObject(server.takeRequest().getBody().readUtf8());
   JSONObject payload=new JSONObject(request.getJSONArray("messages").getJSONObject(1).getString("content"));
   assertFalse(payload.getJSONArray("targets").getJSONObject(0).has("response_mode"));
   assertTrue(payload.getJSONArray("targets").getJSONObject(0).has("repair_instruction"));
   assertTrue(request.getInt("max_tokens")<=3072);
  }finally{server.shutdown();ContextualBatchApiClient.resetRejection();}
 }
 @Test public void currentOnlyRequestKeepsBothReadOnlyContextSides()throws Exception{
  MockWebServer server=new MockWebServer();server.start();try{
   ContextualBatchApiClient.resetRejection();
   String content="{\"translations\":[{\"id\":\"w0\",\"segments\":[[\"Hello world\",\"你好世界\"]]}]}";
   server.enqueue(new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject().put("finish_reason","stop").put("message",new JSONObject().put("content",content)))).toString()));
   DeepSeekConfig.Snapshot config=new DeepSeekConfig.Snapshot(true,server.url("/").toString(),"deepseek-flash","Faithful",18,70,"FAKE-LOCAL-KEY");
   List<SourceAtomTimeline.Atom> atoms=Arrays.asList(new SourceAtomTimeline.Atom(0,1000,"Hello",0,true),new SourceAtomTimeline.Atom(1000,2000,"world",0,true));
   TranslationUnitTimeline.Unit unit=new TranslationUnitTimeline.Unit(0,"w0",0,1,0,0,0,2000,"Hello world",TranslationUnitTimeline.Confidence.HIGH,"test");
   assertEquals(1,ContextualBatchApiClient.translate(Arrays.asList(unit),atoms,Arrays.asList("Previous context."),Arrays.asList("Following context."),config,TargetLanguage.SIMPLIFIED_CHINESE,null,true).validCount());
   JSONObject request=new JSONObject(server.takeRequest().getBody().readUtf8());JSONObject payload=new JSONObject(request.getJSONArray("messages").getJSONObject(1).getString("content"));
   assertEquals(1,payload.getJSONArray("targets").length());assertEquals("Previous context.",payload.getString("context_before"));assertEquals("Following context.",payload.getString("context_after"));assertEquals(1,server.getRequestCount());
  }finally{server.shutdown();ContextualBatchApiClient.resetRejection();}
 }
}
