package app.yydarlinker.deepseekcaptions;
import org.junit.*;
import static org.junit.Assert.*;
import org.json.*;
import okhttp3.mockwebserver.*;
import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

/** Real loopback HTTP through the production client. No paid endpoint or real credentials used. */
public class ProviderIntegrationTest {
    MockWebServer server; AtomicInteger calls=new AtomicInteger();
    DeepSeekConfig.Snapshot config;
    @Before public void setup() throws Exception {
        ContextualBatchApiClient.resetRejection();
        server=new MockWebServer();server.start();
        config=new DeepSeekConfig.Snapshot(true,server.url("/").toString(),
            "deepseek-flash","Faithful translation",18,70,"FAKE-LOCAL-TEST-KEY");
    }
    @After public void teardown()throws Exception{server.shutdown();ContextualBatchApiClient.resetRejection();}
    private void start(int policy) {
        server.setDispatcher(new Dispatcher() { @Override public MockResponse dispatch(RecordedRequest exchange) {
            calls.incrementAndGet();String body=exchange.getBody().readUtf8();
            String reply;int status;
            try {
                JSONObject request=new JSONObject(body);
                boolean jsonWord=request.getJSONArray("messages").toString().toLowerCase().contains("json");
                boolean reject=policy==2 || !jsonWord || (policy==1 && request.has("response_format"));
                if(reject) {status=400;reply="{\"error\":{\"code\":\"invalid_request_error\",\"param\":null,\"message\":\"invalid request: response_format\"}}";}
                else {
                    status=200;
                    JSONObject payload=new JSONObject(request.getJSONArray("messages").getJSONObject(1).getString("content"));
                    JSONArray targets=payload.getJSONArray("targets"),rows=new JSONArray();
                    for(int i=0;i<targets.length();i++) {JSONObject t=targets.getJSONObject(i);
                        rows.put(new JSONObject().put("id",t.getString("id")).put("segments",new JSONArray()
                            .put(new JSONArray().put(t.getString("source_text")).put("你好，世界。"))));}
                    reply=new JSONObject().put("choices",new JSONArray().put(new JSONObject().put("finish_reason","stop")
                        .put("message",new JSONObject().put("content",new JSONObject().put("translations",rows).toString())))).toString();
                }
            }catch(Exception failed){status=500;reply="{}";}
            return new MockResponse().setResponseCode(status).setBody(reply).setHeader("Content-Type","application/json");
        }});
    }

    @Test public void actualRequestProducesNonemptySubtitle() throws Exception {
        start(0);assertEquals("你好，世界。",ContextualBatchApiClient.test(config));assertEquals(1,calls.get());
    }
    @Test public void optionalJsonModeIsNegotiatedOnlyOnce() throws Exception {
        start(1);assertEquals("你好，世界。",ContextualBatchApiClient.test(config));assertEquals(2,calls.get());
    }
    @Test public void repeated400StopsInsteadOf42Calls() throws Exception {
        start(2);
        try {ContextualBatchApiClient.test(config);fail();}catch(ContextualBatchApiClient.PermanentException expected) {
            assertTrue(expected.getMessage().contains("已停止"));assertFalse(expected.getMessage().contains("FAKE"));}
        assertEquals(2,calls.get());
        List<SourceAtomTimeline.Atom> atoms=Arrays.asList(new SourceAtomTimeline.Atom(0,1000,"Hello",0,true));
        TranslationUnitTimeline.Unit u=new TranslationUnitTimeline.Unit(0,"u",0,0,0,0,0,1000,"Hello",TranslationUnitTimeline.Confidence.HIGH,"test");
        for(int i=0;i<40;i++) try {
            ContextualBatchApiClient.translate(Collections.singletonList(u),atoms,Collections.emptyList(),Collections.emptyList(),config,
                TargetLanguage.SIMPLIFIED_CHINESE,null,true);fail();
        }catch(ContextualBatchApiClient.PermanentException expected){}
        assertEquals(2,calls.get());
    }
    @Test public void productionRequestToDisplayClockShowsText() throws Exception {
        start(0);
        List<SourceAtomTimeline.Atom> atoms=Arrays.asList(new SourceAtomTimeline.Atom(1000,1500,"Hello",0,true),
            new SourceAtomTimeline.Atom(1500,2400,"world.",0,true));
        TranslationUnitTimeline.Unit u=new TranslationUnitTimeline.Unit(0,"w0",0,1,0,0,1000,2400,"Hello world.",TranslationUnitTimeline.Confidence.HIGH,"test");
        ContextualBatchApiClient.Result r=ContextualBatchApiClient.translate(Collections.singletonList(u),atoms,
            Collections.emptyList(),Collections.emptyList(),config,TargetLanguage.SIMPLIFIED_CHINESE,null,true);
        AnchoredCaptionPlan a=r.plansById.get("w0");assertNotNull(a);
        List<ContextualUnitCaptionController.DisplaySlice> slices=new ArrayList<>();
        for(AnchoredCaptionPlan.Segment segment:a.segments) slices.add(new ContextualUnitCaptionController.DisplaySlice(segment.startMs,segment.endMs,segment.text));
        ContextualUnitCaptionController.DisplayPlan display=new ContextualUnitCaptionController.DisplayPlan(slices,"test","",0,0,u.sourceText,a.canonical);
        assertEquals("你好，世界。",display.textAt(1600));
        assertEquals("",display.textAt(999));assertEquals("",display.textAt(2400));
    }
    @Test public void requestIsPortableBudgetedAndJsonPromptExplicit() throws Exception {
        JSONObject r=ProviderRequestPolicy.request(config,AnchoredCaptionPlan.PROMPT,new JSONObject(),999999);
        assertEquals(3072,r.getInt("max_tokens"));assertFalse(r.has("thinking"));assertFalse(r.has("temperature"));
        assertTrue(r.getJSONArray("messages").getJSONObject(0).getString("content").contains("JSON"));
        assertTrue(ProviderRequestPolicy.removeOptional(r));assertEquals(3072,r.getInt("max_tokens"));
        assertFalse(ProviderRequestPolicy.removeOptional(r));
    }
}
