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
public class NetworkFailureContractTest {
    MockWebServer server;
    RebuildSource source;
    RebuildPlanner.Block block;
    final CaptionLanguageContext language=CaptionLanguageContext.explicit("en","zh-Hans");
    final List<String> failures=new CopyOnWriteArrayList<>();
    final List<TranslationSettings> scopes=new CopyOnWriteArrayList<>();
    int attempts;
    Field hostField;Object previousHost;
    @Rule public org.junit.rules.TestName testName=new org.junit.rules.TestName();

    @Before public void before() throws Exception {
        RebuildController.stop();RebuildApi.reset();RebuildStream.fixtureHost="";
        server=new MockWebServer();server.start();
        hostField=TranslationRuntime.class.getDeclaredField("host");hostField.setAccessible(true);previousHost=hostField.get(null);
        TranslationRuntime.install(new TranslationRuntime.Host(){
            TranslationSettings settings(android.content.Context c){return config("fixture-key");}
            TranslationSourceAccess.Source load(android.content.Context c,String u,boolean translate,DeepSeekApiClient.RequestControl control){throw new AssertionError("unmapped source load");}
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
        System.out.println("M5A_HTTP "+new JSONObject().put("test",testName.getMethodName()).put("http",server.getRequestCount()).put("attempts",attempts).put("audit_batches",scopes.size()).put("failures",new JSONArray(failures)));
        RebuildController.stop();RebuildApi.reset();RebuildStream.fixtureHost="";
        TranslationAudit.install(new TranslationAudit.Sink(){});hostField.set(null,previousHost);server.shutdown();
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

    @Test public void configurationBlockIsPerEndpointModelKeyAndResetClearsIt() throws Exception {
        for(int status:new int[]{401,403,404}){
            TranslationSettings c=config("fixture-key-"+status);
            server.enqueue(error(status,"fixture refusal"));
            assertTrue(failed(c).configuration);int sent=server.getRequestCount();int began=scopes.size();
            assertEquals("http_"+status,failed(c).code);
            assertEquals("blocked call emits no HTTP",sent,server.getRequestCount());
            assertEquals("blocked call opens no audit batch",began,scopes.size());
        }
        server.enqueue(ok());assertNotNull(call(config("fixture-other-key"),null));
        RebuildApi.reset();server.enqueue(ok());assertNotNull(call(config("fixture-key-401"),null));
        assertEquals(5,server.getRequestCount());assertEquals(5,attempts);
    }

    @Test public void optionalNegotiationAddsOneHttpAndIsRemembered() throws Exception {
        server.enqueue(error(400,"response_format unsupported"));server.enqueue(ok());server.enqueue(ok());
        assertNotNull(call(config("fixture-key"),null));assertNotNull(call(config("fixture-key"),null));
        assertTrue(request().has("response_format"));assertFalse(request().has("response_format"));assertFalse(request().has("response_format"));
        assertEquals(3,attempts);assertEquals(2,scopes.size());assertEquals(3,server.getRequestCount());
        assertEquals(Collections.singletonList("HTTP_CONFIG:http_400"),failures);
    }

    @Test public void rejectedStreamAndOptionalNegotiationAreThreeHttpNotThreeLogicalTasks() throws Exception {
        RebuildStream.fixtureHost=server.getHostName();
        server.enqueue(error(400,"stream unsupported"));server.enqueue(error(422,"response_format unsupported"));server.enqueue(ok());
        assertNotNull(call(config("fixture-key"),null));
        JSONObject a=request(),b=request(),c=request();assertTrue(a.getBoolean("stream"));assertFalse(b.getBoolean("stream"));
        assertFalse(c.getBoolean("stream"));assertTrue(b.has("response_format"));assertFalse(c.has("response_format"));
        assertEquals(1,scopes.size());assertEquals(3,attempts);assertEquals(3,server.getRequestCount());assertEquals(2,failures.size());
    }

    @Test public void inspectionIsBlockLocalButOrdinary403BlocksConfiguration() throws Exception {
        server.enqueue(error(400,"data_inspection_failed"));server.enqueue(ok());
        RebuildApi.Failure f=failed(config("fixture-key"));assertEquals("content_filter",f.code);assertFalse(f.configuration);
        assertNotNull(call(config("fixture-key"),null));assertEquals(2,server.getRequestCount());
        server.enqueue(error(403,"data_inspection_failed"));assertTrue(failed(config("fixture-key")).configuration);
        assertEquals("http_403",failed(config("fixture-key")).code);assertEquals(3,server.getRequestCount());
    }

    @Test public void providerRetryAfterPreservesDateAndLongDeltaM5b() throws Exception {
        long at=(System.currentTimeMillis()/1000+300)*1000;
        String date=java.time.format.DateTimeFormatter.RFC_1123_DATE_TIME.format(java.time.Instant.ofEpochMilli(at).atZone(java.time.ZoneOffset.UTC));
        String[] headers={"17",date,"300","invalid","-2",""};long[] observed={17000,-1,300000,0,0,0};
        for(int i=0;i<headers.length;i++){
            MockResponse response=error(429,"fixture rate limit");if(!headers[i].isEmpty())response.setHeader("Retry-After",headers[i]);server.enqueue(response);
            long before=System.currentTimeMillis();RebuildApi.Failure f=failed(config("fixture-key"));long after=System.currentTimeMillis();
            assertFalse(f.configuration);assertEquals("http_429",f.code);
            if(observed[i]<0)assertTrue(f.delay>=at-after && f.delay<=at-before);else assertEquals(observed[i],f.delay);
        }
        assertEquals(300000,RetryAfter.delayMs("300",0));assertEquals(6,server.getRequestCount());assertEquals(6,attempts);
        assertEquals("diagnostic category does not imply controller terminal",6,failures.stream().filter(s->s.equals("HTTP_CONFIG:http_429")).count());
    }

    @Test public void controllerWaitUsesMaximumAndProviderGateWithoutSleeping() throws Exception {
        // Feed an actual HTTP failure to the actual rejection decision; this is not a full tick replay.
        for(int status:new int[]{429,503}){
            server.enqueue(error(status,"fixture outage").setHeader("Retry-After","17"));RebuildApi.Failure f=failed(config("fixture-key"));
            RebuildController.Session s=new RebuildController.Session(RuntimeEnvironment.getApplication(),"fixture",owner(),"scope","zh-Hans",config("fixture-key"),false,true,language);
            s.work.initialize(1);s.work.slots[0].state=RebuildController.RUNNING;s.work.slots[0].attempts=1;
            RebuildController.Job job=new RebuildController.Job(s,0,true);s.work.slots[0].attempt=job.attempt;
            Field active=RebuildController.class.getDeclaredField("active");active.setAccessible(true);active.set(null,s);
            Method rejected=RebuildController.class.getDeclaredMethod("rejected",RebuildController.Session.class,RebuildController.Job.class,RebuildPlanner.Block.class,Exception.class);rejected.setAccessible(true);
            long now=SystemClock.elapsedRealtime();rejected.invoke(null,s,job,block,f);
            assertEquals(RebuildController.WAITING,s.work.slots[0].state);assertFalse(s.terminal);assertEquals(now+17000,s.work.slots[0].retryAt);assertEquals(now+17000,s.work.providerRetry);
            s.work.slots[0].attempts=3;s.work.slots[0].attempt=job.attempt;rejected.invoke(null,s,job,block,new IOException("fixture network"));
            assertEquals("late network failure retains the existing parent gate",now+17000,s.work.slots[0].retryAt);assertEquals("network errors retain the previous provider gate",now+17000,s.work.providerRetry);
            RebuildController.Session fresh=new RebuildController.Session(RuntimeEnvironment.getApplication(),"fixture",owner(),"scope","zh-Hans",config("fixture-key"),false,true,language);
            fresh.work.initialize(1);fresh.work.slots[0].state=RebuildController.RUNNING;fresh.work.slots[0].attempts=3;
            RebuildController.Job freshJob=new RebuildController.Job(fresh,0,true);fresh.work.slots[0].attempt=freshJob.attempt;active.set(null,fresh);
            rejected.invoke(null,fresh,freshJob,block,new IOException("fixture network without older gate"));
            assertEquals("independent Session retains exact local backoff",now+15000,fresh.work.slots[0].retryAt);assertEquals(0,fresh.work.providerRetry);
            RebuildController.stop();
        }
        assertEquals(2,server.getRequestCount());
    }

    @Test public void invalidJsonAndTruncatedOutputNeverBecomePlansOrInternalRetries() throws Exception {
        server.enqueue(new MockResponse().setBody("{broken"));
        try{call(config("fixture-key"),null);fail("invalid JSON accepted");}catch(JSONException expected){}
        server.enqueue(new MockResponse().setBody("{\"choices\":[{\"finish_reason\":\"length\",\"message\":{\"content\":\"{}\"}}]}"));
        try{call(config("fixture-key"),null);fail("truncation accepted");}catch(RebuildProtocol.Invalid expected){assertEquals("output_truncated",expected.code);}
        assertEquals(2,server.getRequestCount());assertEquals(2,attempts);assertEquals(2,scopes.size());
    }

    @Test public void realWireDisconnectIsTransportFailureWithNoAutomaticPostReplay() throws Exception {
        server.enqueue(new MockResponse().setSocketPolicy(SocketPolicy.DISCONNECT_AT_START));
        try{call(config("fixture-key"),null);fail("disconnect accepted");}catch(RebuildApi.TransportFailure f){
            assertEquals(TranslationAudit.FailureCategory.NETWORK_IO,f.category);assertFalse(f.cancelled);assertTrue(f.remainingMs>=0);
        }
        assertEquals(1,server.getRequestCount());assertEquals(1,attempts);
    }

    @Test public void cancelledBeforeAdmissionHasZeroHttpAndZeroAttempts() throws Exception {
        DeepSeekApiClient.RequestControl cancelled=new DeepSeekApiClient.RequestControl(){public boolean isCancelled(){return true;}public void onConnection(HttpURLConnection c){}};
        try{call(config("fixture-key"),cancelled);fail("cancelled call accepted");}catch(InterruptedException expected){}
        assertEquals(0,server.getRequestCount());assertEquals(0,attempts);
    }

    @Test public void retiredSentNegotiationRefusesNewAttemptWhileOldAuditAndUnsentRulesRemainM5c() throws Exception {
        CountDownLatch arrived=new CountDownLatch(1),release=new CountDownLatch(1);
        MockResponse success=ok();java.util.concurrent.atomic.AtomicInteger count=new java.util.concurrent.atomic.AtomicInteger();
        server.setDispatcher(new Dispatcher(){public MockResponse dispatch(RecordedRequest r) throws InterruptedException {
            if(count.incrementAndGet()==1){arrived.countDown();if(!release.await(3,TimeUnit.SECONDS))throw new AssertionError("fixture release timeout");return error(400,"response_format unsupported");}
            return success;
        }});
        TranslationSettings old=config("fixture-old-key"),replacement=new TranslationSettings(true,server.url("/v1").toString(),"fixture-new-model","faithful","fixture-new-key","stored_custom");
        RebuildController.Session s=new RebuildController.Session(RuntimeEnvironment.getApplication(),"fixture",owner(),"old","zh-Hans",old,false,true,language);
        RebuildController.Job sent=new RebuildController.Job(s,0,true),unsent=new RebuildController.Job(s,1,false);
        Field active=RebuildController.class.getDeclaredField("active");active.setAccessible(true);active.set(null,s);
        ExecutorService executor=Executors.newSingleThreadExecutor();
        try{
            Future<RebuildProtocol.Plan> pending=executor.submit(()->call(old,sent));assertTrue(arrived.await(2,TimeUnit.SECONDS));assertTrue(sent.attempt.sent);
            s.retire();assertFalse(RebuildController.current(s));assertNull(s.publication.reserve());assertFalse(sent.isCancelled());assertTrue(unsent.isCancelled());
            release.countDown();try{pending.get(3,TimeUnit.SECONDS);fail("retired negotiation admitted");}
            catch(ExecutionException expected){assertTrue(expected.getCause() instanceof InterruptedException);}
            int admitted=attempts;try{call(old,unsent);fail("unsent retired work admitted");}catch(InterruptedException expected){}
            assertEquals(admitted,attempts);assertNotNull(call(replacement,null));
            assertEquals("Bearer fixture-old-key",server.takeRequest(2,TimeUnit.SECONDS).getHeader("Authorization"));
            assertEquals("Bearer fixture-new-key",server.takeRequest(2,TimeUnit.SECONDS).getHeader("Authorization"));
            assertSame(old,scopes.get(0));assertSame(replacement,scopes.get(scopes.size()-1));
            assertNotEquals(RebuildCache.identity(source,old,"zh-Hans",language),RebuildCache.identity(source,replacement,"zh-Hans",language));
            assertEquals(2,server.getRequestCount());assertEquals(2,attempts);
        }finally{release.countDown();s.cancel();executor.shutdownNow();assertTrue(executor.awaitTermination(3,TimeUnit.SECONDS));}
    }

    @Test public void credentialOnlyReplacementSharesSemanticDiskCacheIdentity() throws Exception {
        // Observation, not an assertion of per-profile cache isolation: session and transport
        // identities include the credential, but the existing semantic disk identity does not.
        assertNotEquals(CaptionCredentialRef.of(config("fixture-old-key").apiKey).fingerprint,
                CaptionCredentialRef.of(config("fixture-new-key").apiKey).fingerprint);
        assertEquals(RebuildCache.identity(source,config("fixture-old-key"),"zh-Hans",language),
                RebuildCache.identity(source,config("fixture-new-key"),"zh-Hans",language));
        assertEquals(0,server.getRequestCount());
    }

    @Test public void deadlineTimerAndCancellationPrecedenceUseActualGuard() throws Exception {
        CountDownLatch disconnected=new CountDownLatch(1);
        HttpURLConnection connection=new HttpURLConnection(server.url("/guard").url()){
            public void connect(){}public boolean usingProxy(){return false;}public void disconnect(){disconnected.countDown();}
        };
        try(NetworkDeadline guard=new NetworkDeadline(connection,System.nanoTime())){
            assertTrue(disconnected.await(2,TimeUnit.SECONDS));assertTrue(guard.timerFired());
            assertEquals(TranslationAudit.FailureCategory.DEADLINE_EXPIRED,RebuildApi.transportCategory(new SocketException(),"read",guard,false));
            assertEquals(TranslationAudit.FailureCategory.CANCELLED,RebuildApi.transportCategory(new SocketTimeoutException(),"connect",guard,true));
        }
        try(NetworkDeadline guard=new NetworkDeadline(connection,System.nanoTime()+TimeUnit.SECONDS.toNanos(30))){
            assertEquals(TranslationAudit.FailureCategory.CONNECT_TIMEOUT,RebuildApi.transportCategory(new SocketTimeoutException(),"connect",guard,false));
            assertEquals(TranslationAudit.FailureCategory.READ_TIMEOUT,RebuildApi.transportCategory(new SocketTimeoutException(),"read",guard,false));
            guard.close();assertFalse(guard.timerFired());
        }
        assertEquals(0,server.getRequestCount());
    }
}
