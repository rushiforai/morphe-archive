package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.app.Activity;
import android.os.SystemClock;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import okhttp3.mockwebserver.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Actual HTTP, Job trace, controller decision and application accounting/report adapters. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28, manifest=Config.NONE, shadows=M6aFailureDiagnosticsTest.Keys.class)
@LooperMode(LooperMode.Mode.PAUSED)
public class M6aFailureDiagnosticsTest {
    @Implements(SecureApiKey.class) public static class Keys {
        @Implementation public static String load(android.content.Context c){return "fixture-secret";}
    }
    Activity activity;
    MockWebServer server;
    ExecutorService caller;
    Object host,audit,output,port,services;
    RebuildSource source;
    RebuildPlanner.Block block;
    final CaptionLanguageContext language=CaptionLanguageContext.explicit("en","zh-Hans");
    @Rule public org.junit.rules.TestName name=new org.junit.rules.TestName();
    Object field(Class<?> c,String n) throws Exception {Field f=c.getDeclaredField(n);f.setAccessible(true);return f.get(null);}
    void set(Class<?> c,String n,Object v) throws Exception {Field f=c.getDeclaredField(n);f.setAccessible(true);f.set(null,v);}
    @Before public void before() throws Exception {
        RebuildController.stop();RebuildApi.reset();
        host=field(TranslationRuntime.class,"host");audit=field(TranslationAudit.class,"sink");output=field(TranslationOutput.class,"sink");
        port=field(CaptionActions.class,"port");services=field(CaptionActions.class,"services");
        activity=Robolectric.buildActivity(Activity.class).setup().get();CaptionApplication.setMainActivity(activity);
        CaptionDiagnostics.clear(activity);CaptionDiagnosticsWriter.drainNow(activity);TokenCostAudit.clear(activity);
        server=new MockWebServer();server.setDispatcher(new Dispatcher(){
            public MockResponse dispatch(RecordedRequest r){throw new AssertionError("unmapped HTTP: "+r);}
        });server.start();server.setDispatcher(new QueueDispatcher());
        caller=Executors.newSingleThreadExecutor(r->new Thread(r,"m6a-provider-fixture"));
        List<RebuildSource.Word> words=new ArrayList<>();int i=0;
        for(String token:RebuildSource.tokens("Hello world.")){words.add(new RebuildSource.Word(token,i*500,(i+1)*500,0,RebuildSource.Precision.NATIVE));i++;}
        source=new RebuildSource(words);block=new RebuildPlanner.Block(0,0,words.size()-1,source);
    }
    @After public void after() throws Exception {
        try {
            System.out.println("M6A_FAILURE test="+name.getMethodName()+";http="+server.getRequestCount()+";audit="+field(TokenCostAudit.class,"memoryState"));
            RebuildController.stop();CaptionDiagnosticsWriter.drainNow(activity);server.shutdown();
            caller.shutdownNow();assertTrue(caller.awaitTermination(3,TimeUnit.SECONDS));
        } finally {
            set(TranslationRuntime.class,"host",host);set(TranslationAudit.class,"sink",audit);set(TranslationOutput.class,"sink",output);
            set(CaptionActions.class,"port",port);set(CaptionActions.class,"services",services);activity.finish();RebuildApi.reset();
        }
    }
    RebuildController.Session session() throws Exception {
        TranslationSettings config=new TranslationSettings(true,server.url("/v1").toString(),"fixture-model","faithful","fixture-secret","stored_custom");
        RebuildController.Session s=new RebuildController.Session(activity,"fixture",(String)field(RebuildController.class,"video"),"scope","zh-Hans",config,false,true,language);
        s.source=source;s.blocks=Collections.singletonList(block);s.states=new int[]{RebuildController.RUNNING};s.attempts=new int[]{1};s.retryAt=new long[1];s.reasons=new String[1];
        s.plans=new RebuildProtocol.Plan[1];s.provisional=new RebuildProtocol.Plan[1];s.pendingPlans=new RebuildProtocol.Plan[1];s.jobs=new RebuildController.Job[1];
        s.cacheChecked=new boolean[]{true};s.slowRetries=new int[1];s.pageRepairCount=new int[1];s.uncoveredSince=new long[1];
        set(RebuildController.class,"active",s);return s;
    }
    Exception request(RebuildController.Session s) throws Exception {
        RebuildController.Job job=new RebuildController.Job(s,0,true);s.jobs[0]=job;
        Exception failure=caller.submit(()->{
            try{RebuildApi.translate(source,block,s.config,"zh-Hans",job,true,"",language);throw new AssertionError("expected failure");}
            catch(Exception e){return e;}
        }).get(3,TimeUnit.SECONDS);
        Method reject=RebuildController.class.getDeclaredMethod("rejected",RebuildController.Session.class,RebuildController.Job.class,RebuildPlanner.Block.class,Exception.class);
        reject.setAccessible(true);reject.invoke(null,s,job,block,failure);return failure;
    }
    String decision(RebuildController.Session s) {
        String history=CaptionDiagnostics.history(activity);
        return Arrays.stream(history.split("\n")).filter(x->x.contains("REBUILD_FAILURE_DECISION")&&x.contains("session="+s.id+";")).reduce((a,b)->b).orElse("");
    }
    long count(String key) throws Exception {return ((JSONObject)field(TokenCostAudit.class,"memoryState")).getJSONObject("buckets").getJSONObject("all").optLong(key);}
    void gated(RebuildController.Session s) throws Exception {
        int sent=server.getRequestCount();Method schedule=RebuildController.class.getDeclaredMethod("schedule",RebuildController.Session.class);schedule.setAccessible(true);schedule.invoke(null,s);
        assertNull(s.jobs[0]);assertEquals(sent,server.getRequestCount());
    }
    @Test public void sameLegacyBucketReportsDifferentActualWaitFilterAndTerminalDecisions() throws Exception {
        int[] statuses={401,429,503,400};String[] reasons={"http_401","http_429","http_503","content_filter"};
        for(int i=0;i<statuses.length;i++) {
            RebuildController.stop();RebuildApi.reset();RebuildController.Session s=session();
            MockResponse response=new MockResponse().setResponseCode(statuses[i]).setBody(i==3?"data_inspection_failed":"fixture refusal");
            if(i==1||i==2)response.setHeader("Retry-After","17");server.enqueue(response);
            long now=SystemClock.elapsedRealtime();Exception failure=request(s);assertTrue(failure instanceof RebuildApi.Failure);
            assertEquals(reasons[i],((RebuildApi.Failure)failure).code);assertEquals(i==0,((RebuildApi.Failure)failure).configuration);
            assertEquals(i==0,s.terminal);assertEquals(i==3,s.filteredBlocks.contains(0));
            assertEquals(i==0||i==3?RebuildController.FAILED:RebuildController.WAITING,s.states[0]);
            String facts=decision(s);assertFalse("missing facts from the actual decision",facts.isEmpty());
            assertTrue(facts,facts.contains("reason="+reasons[i]+";"));assertTrue(facts,facts.contains("configuration="+(i==0)+";"));
            assertTrue(facts,facts.contains("terminal="+s.terminal+";"));assertTrue(facts,facts.contains("filtered="+(i==3)+";"));
            assertTrue(facts,facts.contains("retry_at_elapsed_ms="+s.retryAt[0]+";"));
            assertTrue(facts,facts.contains("provider_retry_at_elapsed_ms="+s.providerRetry+";"));
            if(i==1||i==2){assertEquals(now+17000,s.retryAt[0]);assertEquals(now+17000,s.providerRetry);}
            gated(s);assertEquals(i+1,server.getRequestCount());
            System.out.println("M6A_DECISION "+facts);
        }
        assertEquals(4,count("logical_requests"));assertEquals(4,count("attempts"));assertEquals(4,count("category_http_config"));
        assertEquals(1,count("http_429_failures"));assertEquals(1,count("http_5xx_failures"));assertEquals(1,count("http_4xx_failures"));assertEquals(1,count("http_other_failures"));
    }
    @Test public void realDisconnectAndStructuralRefusalKeepTheirReasonAndAccountingBoundaries() throws Exception {
        server.enqueue(new MockResponse().setSocketPolicy(SocketPolicy.DISCONNECT_AT_START));RebuildController.Session s=session();
        assertTrue(request(s) instanceof RebuildApi.TransportFailure);String facts=decision(s);
        assertTrue(facts,facts.contains("configuration=unknown;"));assertFalse(s.terminal);assertEquals(1,count("category_network_io"));gated(s);
        RebuildController.stop();s=session();server.enqueue(new MockResponse().setBody("{\"choices\":[{\"finish_reason\":\"length\",\"message\":{\"content\":\"{}\"}}]}"));
        assertTrue(request(s) instanceof RebuildProtocol.Invalid);facts=decision(s);assertTrue(facts,facts.contains("reason=output_truncated;"));assertFalse(s.terminal);gated(s);
        assertEquals(2,count("attempts"));assertEquals(1,count("failures"));assertEquals(1,count("quality_rejected_units"));assertEquals(0,count("category_http_config"));
    }
    @Test public void cancellationBeforeAdmissionDoesNotPretendAnAttemptReachedTheServer() throws Exception {
        RebuildController.Session s=session();RebuildController.Job job=new RebuildController.Job(s,0,true);s.jobs[0]=job;job.cancelled=true;
        try{RebuildApi.translate(source,block,s.config,"zh-Hans",job,true,"",language);fail("cancelled admitted");}catch(InterruptedException expected){}
        assertEquals(0,server.getRequestCount());assertEquals(0,count("attempts"));assertEquals(0,count("failures"));assertEquals("",decision(s));
    }
    @Test public void reportExplainsTheLegacyBucketAndUnknownServerReceiptWithoutChangingTotals() {
        CaptionDiagnostics.mark(activity,"REBUILD_TEST","fixture-secret",CaptionCredentialRef.of("fixture-secret"));
        String export=CaptionDiagnostics.fullText(activity);
        assertTrue(export,export.contains("HTTP_CONFIG"));assertTrue(export,export.contains("server receipt"));
        assertFalse(export.contains("fixture-secret"));assertTrue(export.contains("completeness=bounded_not_guaranteed"));
        assertTrue(CaptionDiagnostics.reportText(activity,true).contains("HTTP_CONFIG"));
    }
}
