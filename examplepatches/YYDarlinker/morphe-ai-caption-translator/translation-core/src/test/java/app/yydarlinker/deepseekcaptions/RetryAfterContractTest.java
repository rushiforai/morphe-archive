package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.os.SystemClock;
import java.io.IOException;
import java.lang.reflect.*;
import java.net.*;
import java.util.*;
import java.util.concurrent.*;
import okhttp3.mockwebserver.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Offline observations of the existing contract, including explicitly documented discrepancies. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28, manifest=Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class RetryAfterContractTest {
    MockWebServer server;
    RebuildSource source;
    RebuildPlanner.Block block;
    final CaptionLanguageContext language=CaptionLanguageContext.explicit("en","zh-Hans");
    final List<String> failures=new CopyOnWriteArrayList<>();
    final List<TranslationSettings> scopes=new CopyOnWriteArrayList<>();
    int attempts;
    volatile SourceRecoveryPolicy.Failure sourceFailure;
    final java.util.concurrent.atomic.AtomicInteger sourceLoads=new java.util.concurrent.atomic.AtomicInteger();
    final CountDownLatch accepted=new CountDownLatch(1);

    Field hostField;Object previousHost;
    @Rule public org.junit.rules.TestName testName=new org.junit.rules.TestName();

    @Before public void before() throws Exception {
        RebuildController.stop();RebuildCache.clear(RuntimeEnvironment.getApplication());RebuildApi.reset();RebuildStream.fixtureHost="";
        server=new MockWebServer();server.start();
        hostField=TranslationRuntime.class.getDeclaredField("host");hostField.setAccessible(true);previousHost=hostField.get(null);
        TranslationRuntime.install(new TranslationRuntime.Host(){
            TranslationSettings settings(android.content.Context c){return config("fixture-key");}
            TranslationSourceAccess.Source load(android.content.Context c,String u,boolean translate,DeepSeekApiClient.RequestControl control) throws Exception {
                sourceLoads.incrementAndGet();if(sourceFailure!=null)throw sourceFailure;
                throw new AssertionError("unmapped source load");
            }
            void mark(android.content.Context c,String stage,String detail,CaptionCredentialRef credential){
                if(stage.equals("REBUILD_EVENTS_ACCEPTED"))accepted.countDown();
            }
        });
        source=RebuildContractTest.source("Hello world.",500);block=RebuildContractTest.block(source);
        TranslationAudit.install(new TranslationAudit.Sink(){
            public TranslationAudit.Request begin(TranslationSettings c,boolean p,int t,int n,int tc,int nc,String bucket){
                scopes.add(c);return new TranslationAudit.Request(c);
            }
            public int attempt(TranslationAudit.Request r,int bytes){return ++attempts;}
            public void failure(TranslationAudit.Request r,int a,TranslationAudit.FailureCategory c,String reason){failures.add(c+":"+reason);}
        });
    }
    @After public void after() throws Exception {
        System.out.println("M5B_HTTP "+new JSONObject().put("test",testName.getMethodName()).put("http",server.getRequestCount()).put("attempts",attempts).put("audit_batches",scopes.size()).put("failures",new JSONArray(failures)));
        RebuildController.stop();RebuildApi.reset();RebuildStream.fixtureHost="";
        TranslationAudit.install(new TranslationAudit.Sink(){});hostField.set(null,previousHost);server.shutdown();RebuildCache.clear(RuntimeEnvironment.getApplication());
    }
    TranslationSettings config(String key){return new TranslationSettings(true,server.url("/v1").toString(),"fixture-model","faithful",key,"stored_custom");}
    RebuildProtocol.Plan call(TranslationSettings c,DeepSeekApiClient.RequestControl control) throws Exception {
        return RebuildApi.translate(source,block,c,"zh-Hans",control,true,"",language);
    }
    RebuildApi.Failure failed(TranslationSettings c) throws Exception {
        try{call(c,null);fail("expected provider failure");return null;}catch(RebuildApi.Failure e){return e;}
    }
    MockResponse error(int status,String body){return new MockResponse().setResponseCode(status).setBody(body);}
    MockResponse ok() throws Exception {
        String content=RebuildContractTest.reply(block,new JSONArray().put(RebuildContractTest.event(0,source.words.size()-1,"你好，世界。")
                .put("source",source.text(0,source.words.size()-1))));
        return new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject()
                .put("finish_reason","stop").put("message",new JSONObject().put("content",content)))).toString());
    }
    JSONObject request() throws Exception {RecordedRequest r=server.takeRequest(2,TimeUnit.SECONDS);assertNotNull(r);return new JSONObject(r.getBody().readUtf8());}
    String owner() throws Exception {Field f=RebuildController.class.getDeclaredField("video");f.setAccessible(true);return (String)f.get(null);}

    @Test public void providerKeepsThreeHundredSeconds() throws Exception {
        server.enqueue(error(429,"fixture limit").setHeader("Retry-After","300"));
        RebuildApi.Failure f=failed(config("fixture-key"));
        System.out.println("M5B_RED_GREEN delta300="+f.delay);
        assertEquals(300000,f.delay);assertEquals(1,server.getRequestCount());
    }
    @Test public void providerKeepsFutureGmtDate() throws Exception {
        long at=(System.currentTimeMillis()/1000+300)*1000;
        String date=java.time.format.DateTimeFormatter.RFC_1123_DATE_TIME.format(java.time.Instant.ofEpochMilli(at).atZone(java.time.ZoneOffset.UTC));
        server.enqueue(error(503,"fixture unavailable").setHeader("Retry-After",date));
        long before=System.currentTimeMillis();RebuildApi.Failure f=failed(config("fixture-key"));long after=System.currentTimeMillis();
        System.out.println("M5B_RED_GREEN date="+date+" delay="+f.delay+" bounds="+(at-after)+".."+(at-before));
        assertTrue("future HTTP date lost: "+f.delay,f.delay>=at-after && f.delay<=at-before);
        assertEquals(1,server.getRequestCount());
    }
    @Test public void fixedClockParsingAndSaturatingArithmetic() {
        long now=1893456000000L;
        assertEquals(17000,RetryAfter.delayMs(" 17 ",now));
        assertEquals(300000,RetryAfter.delayMs("300",now));
        assertEquals(300000,RetryAfter.delayMs("Tue, 1 Jan 2030 00:05:00 GMT",now));
        assertEquals(0,RetryAfter.delayMs("Tue, 1 Jan 2030 00:00:00 GMT",now));
        assertEquals(0,RetryAfter.delayMs("Mon, 31 Dec 2029 23:59:59 GMT",now));
        for(String value:new String[]{null,""," ","invalid","-2","+2","1.5","999999999999999999999x"})
            assertEquals("invalid: "+value,0,RetryAfter.delayMs(value,now));
        long boundary=Long.MAX_VALUE/1000;
        assertEquals(boundary*1000,RetryAfter.delayMs(Long.toString(boundary),now));
        for(String value:new String[]{Long.toString(boundary+1),Long.toString(Long.MAX_VALUE),"99999999999999999999999999999999999999"})
            assertEquals(value,Long.MAX_VALUE,RetryAfter.delayMs(value,now));
        assertEquals(Long.MAX_VALUE,RetryAfter.delayMs("Tue, 1 Jan 2030 00:00:00 GMT",Long.MIN_VALUE));
        assertEquals(Long.MAX_VALUE-1,RetryAfter.after(Long.MAX_VALUE-10,9));
        assertEquals(Long.MAX_VALUE,RetryAfter.after(Long.MAX_VALUE-10,10));
        assertEquals(Long.MAX_VALUE,RetryAfter.after(Long.MAX_VALUE-10,11));
        assertEquals(Long.MAX_VALUE,RetryAfter.after(100,Long.MAX_VALUE));
        assertEquals(-1,RetryAfter.after(Long.MIN_VALUE,Long.MAX_VALUE));
        assertEquals(100,RetryAfter.after(100,-1));
    }
    RebuildController.Session session() throws Exception {
        RebuildController.Session s=new RebuildController.Session(RuntimeEnvironment.getApplication(),"fixture",owner(),"scope","zh-Hans",config("fixture-key"),false,true,language);
        s.source=source;s.blocks=Collections.singletonList(block);s.cacheKey=RebuildCache.identity(source,s.config,"zh-Hans",language);
        s.work.initialize(1);s.work.slots[0].cacheChecked=true;
        Field active=RebuildController.class.getDeclaredField("active");active.setAccessible(true);active.set(null,s);return s;
    }
    void invoke(String name,RebuildController.Session s) throws Exception {
        Method m=RebuildController.class.getDeclaredMethod(name,RebuildController.Session.class);m.setAccessible(true);m.invoke(null,s);
    }
    void reject(RebuildController.Session s,Exception failure) throws Exception {
        RebuildController.Job job=new RebuildController.Job(s,0,true);s.work.slots[0].attempt=job.attempt;s.work.slots[0].state=RebuildController.RUNNING;s.work.slots[0].attempts=Math.max(1,s.work.slots[0].attempts);
        Method m=RebuildController.class.getDeclaredMethod("rejected",RebuildController.Session.class,RebuildController.Job.class,RebuildPlanner.Block.class,Exception.class);
        m.setAccessible(true);m.invoke(null,s,job,block,failure);
    }
    void advance(long ms){org.robolectric.shadows.ShadowSystemClock.advanceBy(java.time.Duration.ofMillis(ms));}
    void ordinaryGate(String header,int status) throws Exception {
        server.enqueue(error(status,"fixture wait").setHeader("Retry-After",header));
        RebuildApi.Failure f=failed(config("fixture-key"));RebuildController.Session s=session();
        long start=SystemClock.elapsedRealtime();reject(s,f);long gate=s.work.providerRetry;
        assertEquals(start+Math.max(1200,f.delay),s.work.slots[0].retryAt);assertEquals(start+Math.max(5000,f.delay),gate);
        server.enqueue(ok());invoke("schedule",s);assertEquals(1,server.getRequestCount());assertNull(s.work.slots[0].attempt);
        advance(gate-start-1);invoke("schedule",s);assertEquals(1,server.getRequestCount());assertNull(s.work.slots[0].attempt);
        System.out.println("M5B_GATE before elapsed="+SystemClock.elapsedRealtime()+" retryAt="+s.work.slots[0].retryAt+" providerRetry="+gate+" http="+server.getRequestCount());
        advance(1);invoke("schedule",s);
        assertTrue("deadline admits and accepts a real POST",accepted.await(3,TimeUnit.SECONDS));
        synchronized(s){assertNotNull(s.work.slots[0].accepted);assertEquals(RebuildController.READY,s.work.slots[0].state);assertEquals(2,s.work.slots[0].attempts);}
        assertEquals(2,server.getRequestCount());assertEquals(2,attempts);
        System.out.println("M5B_GATE recovered elapsed="+SystemClock.elapsedRealtime()+" http="+server.getRequestCount()+" accepted=true delay="+f.delay);
    }
    @Test public void ordinarySchedulerWaitsFullThreeHundredSecondsAndRecovers() throws Exception {ordinaryGate("300",429);}
    @Test public void ordinarySchedulerWaitsParsedDateAndRecovers() throws Exception {
        long at=(System.currentTimeMillis()/1000+300)*1000;
        ordinaryGate(java.time.format.DateTimeFormatter.RFC_1123_DATE_TIME.format(java.time.Instant.ofEpochMilli(at).atZone(java.time.ZoneOffset.UTC)),503);
    }
    @Test public void shorterServerDelayCannotShortenLocalBackoffOrExistingProviderGate() throws Exception {
        server.enqueue(error(503,"fixture wait").setHeader("Retry-After","300"));
        RebuildApi.Failure f=failed(config("fixture-key"));RebuildController.Session s=session();reject(s,f);long gate=s.work.providerRetry;
        server.enqueue(error(429,"fixture short wait").setHeader("Retry-After","1"));
        f=failed(config("fixture-key"));s.work.slots[0].attempts=3;reject(s,f);
        assertEquals(gate,s.work.slots[0].retryAt);assertEquals(gate,s.work.providerRetry);
        advance(15000);invoke("schedule",s);assertEquals(2,server.getRequestCount());assertNull(s.work.slots[0].attempt);
        RebuildController.Session fresh=session();fresh.work.slots[0].attempts=3;reject(fresh,f);
        assertEquals("1s server delay cannot shorten exact 15s backoff in a fresh Session",SystemClock.elapsedRealtime()+15000,fresh.work.slots[0].retryAt);
        assertEquals(SystemClock.elapsedRealtime()+5000,fresh.work.providerRetry);
        assertEquals(gate,s.work.slots[0].retryAt);assertEquals(gate,s.work.providerRetry);
        System.out.println("M5B_GATE retained="+gate+" independentLocalBackoff=15000 http="+server.getRequestCount());
    }
    @Test public void hugeWireDelaySaturatesActualProviderAndBlockGates() throws Exception {
        for(String header:new String[]{"9223372036854776","9223372036854775807","99999999999999999999999999999999"}){
            server.enqueue(error(429,"fixture huge wait").setHeader("Retry-After",header));
            RebuildApi.Failure f=failed(config("fixture-key"));assertEquals(Long.MAX_VALUE,f.delay);
            RebuildController.Session s=session();reject(s,f);assertEquals(Long.MAX_VALUE,s.work.slots[0].retryAt);assertEquals(Long.MAX_VALUE,s.work.providerRetry);
            int count=server.getRequestCount();advance(300000);invoke("schedule",s);assertEquals(count,server.getRequestCount());assertNull(s.work.slots[0].attempt);
            // Isolate the per-block gate as well as the combined/provider gate.
            s.work.providerRetry=0;invoke("schedule",s);assertEquals(count,server.getRequestCount());assertNull(s.work.slots[0].attempt);
            s.work.providerRetry=Long.MAX_VALUE;reject(s,new RebuildApi.Failure("http_503",false,17000));
            assertEquals(Long.MAX_VALUE,s.work.providerRetry);invoke("schedule",s);assertEquals(count,server.getRequestCount());assertNull(s.work.slots[0].attempt);
            System.out.println("M5B_OVERFLOW header="+header+" providerRetry="+s.work.providerRetry+" http="+count);
            RebuildController.stop();
        }
    }
    @Test public void sourceLoadFailureSaturatesActualSourceGateWithoutBusyLoop() throws Exception {
        sourceFailure=new SourceRecoveryPolicy.Failure("http_429",true,Long.MAX_VALUE,null);
        RebuildController.Session s=session();s.source=null;s.blocks=null;s.loading=true;s.sourceJob=new RebuildController.Job(s,-1,false);
        invoke("load",s);assertEquals(1,sourceLoads.get());assertEquals(Long.MAX_VALUE,s.sourceRetry);assertFalse(s.loading);assertFalse(s.terminal);
        advance(300000);for(int i=0;i<3;i++)invoke("kick",s);
        assertEquals(1,sourceLoads.get());assertFalse(s.loading);assertEquals(0,server.getRequestCount());
        System.out.println("M5B_SOURCE_GATE sourceRetry="+s.sourceRetry+" elapsed="+SystemClock.elapsedRealtime()+" loads="+sourceLoads.get());
    }
    @Test public void wireInvalidMissingAndOrdinaryDelaysHaveNoInternalReplay() throws Exception {
        for(int status:new int[]{429,503})for(String header:new String[]{"17","0","-2","invalid"," ",""}){
            MockResponse response=error(status,"fixture failure");if(!header.isEmpty())response.setHeader("Retry-After",header);server.enqueue(response);
            int prior=server.getRequestCount();RebuildApi.Failure f=failed(config("fixture-key"));assertEquals(header.equals("17")?17000:0,f.delay);
            assertFalse(f.configuration);assertEquals(prior+1,server.getRequestCount());
            RebuildController.Session s=session();reject(s,f);assertEquals(SystemClock.elapsedRealtime()+Math.max(1200,f.delay),s.work.slots[0].retryAt);
            assertEquals(SystemClock.elapsedRealtime()+Math.max(5000,f.delay),s.work.providerRetry);RebuildController.stop();
        }
        assertEquals(12,attempts);
    }
}
