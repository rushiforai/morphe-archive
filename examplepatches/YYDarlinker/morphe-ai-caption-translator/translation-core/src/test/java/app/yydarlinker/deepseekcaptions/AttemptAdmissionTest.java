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
public class AttemptAdmissionTest {
    MockWebServer server;
    RebuildSource source;
    RebuildPlanner.Block block;
    final CaptionLanguageContext language=CaptionLanguageContext.explicit("en","zh-Hans");
    final List<String> failures=new CopyOnWriteArrayList<>();
    final List<TranslationSettings> scopes=new CopyOnWriteArrayList<>();
    int attempts;
    final List<String> timeline=new CopyOnWriteArrayList<>();
    Field hostField;Object previousHost;
    TranslationAudit.Sink previousAudit;
    final List<String> responses=new CopyOnWriteArrayList<>();
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
        Field auditField=TranslationAudit.class.getDeclaredField("sink");auditField.setAccessible(true);previousAudit=(TranslationAudit.Sink)auditField.get(null);
        TranslationAudit.install(new TranslationAudit.Sink(){
            public TranslationAudit.Request begin(TranslationSettings c,boolean p,int t,int n,int tc,int nc,String bucket){
                scopes.add(c);return new TranslationAudit.Request(c);
            }
            public int attempt(TranslationAudit.Request r,int bytes){timeline.add("admitted_attempt="+(attempts+1));return ++attempts;}
            public void response(TranslationAudit.Request r,int a,JSONObject root){responses.add("attempt="+a+" usage="+root.optJSONObject("usage"));}
            public void failure(TranslationAudit.Request r,int a,TranslationAudit.FailureCategory c,String reason){failures.add(c+":"+reason);}
        });
    }
    @After public void after() throws Exception {
        System.out.println("M5C_HTTP "+new JSONObject().put("test",testName.getMethodName()).put("http",server.getRequestCount()).put("attempts",attempts).put("audit_batches",scopes.size()).put("failures",new JSONArray(failures)).put("timeline",new JSONArray(timeline)).put("responses",new JSONArray(responses)));
        RebuildController.stop();RebuildApi.reset();RebuildStream.fixtureHost="";
        TranslationAudit.install(previousAudit);hostField.set(null,previousHost);server.shutdown();
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
                .put("finish_reason","stop").put("message",new JSONObject().put("content",content)))).put("usage",new JSONObject().put("total_tokens",7)).toString());
    }
    JSONObject request() throws Exception {RecordedRequest r=server.takeRequest(2,TimeUnit.SECONDS);assertNotNull(r);return new JSONObject(r.getBody().readUtf8());}
    String owner() throws Exception {Field f=RebuildController.class.getDeclaredField("video");f.setAccessible(true);return (String)f.get(null);}

    RebuildController.Session session(TranslationSettings cfg,String scope) throws Exception {
        RebuildController.Session s=new RebuildController.Session(RuntimeEnvironment.getApplication(),"fixture",owner(),scope,"zh-Hans",cfg,false,true,language);
        Field active=RebuildController.class.getDeclaredField("active");active.setAccessible(true);active.set(null,s);return s;
    }
    void interrupted(Future<?> pending) throws Exception {
        try { pending.get(3,TimeUnit.SECONDS);fail("retired attempt completed instead of refusing new POST"); }
        catch(ExecutionException e){assertTrue("unexpected failure: "+e.getCause(),e.getCause() instanceof InterruptedException);}
    }
    /** Server dispatch and the client completion callback are independent observations. */
    void awaitBodySent(RebuildController.Job job, Future<?> pending) throws Exception {
        long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(3);
        while(!job.attempt.sent){
            if(pending.isDone())pending.get(); // surface a transport failure instead of hiding it
            if(System.nanoTime()>=deadline)fail("client bodySent not observed before retirement; timeline="+timeline);
            java.util.concurrent.locks.LockSupport.parkNanos(TimeUnit.MILLISECONDS.toNanos(1));
        }
    }
    void held(MockResponse first,boolean success,boolean stop) throws Exception {
        CountDownLatch arrived=new CountDownLatch(1),release=new CountDownLatch(1);
        java.util.concurrent.atomic.AtomicInteger count=new java.util.concurrent.atomic.AtomicInteger();
        TranslationSettings old=config("fixture-old-key");
        TranslationSettings replacement=new TranslationSettings(true,server.url("/v1").toString(),"fixture-new-model","faithful","fixture-new-key","stored_custom");
        RebuildController.Session s=session(old,"old");RebuildController.Job job=new RebuildController.Job(s,0,true);
        MockResponse good=ok();
        server.setDispatcher(new Dispatcher(){public MockResponse dispatch(RecordedRequest r) throws InterruptedException {
            if(!"POST".equals(r.getMethod())||!"/v1/chat/completions".equals(r.getPath()))throw new AssertionError("unmapped fixture request");
            int n=count.incrementAndGet();timeline.add("server_received="+n+" auth="+r.getHeader("Authorization")+" body="+r.getBody().clone().readUtf8());
            if(n==1){arrived.countDown();if(!release.await(5,TimeUnit.SECONDS))throw new AssertionError("fixture release timeout");return first;}
            if(!"Bearer fixture-new-key".equals(r.getHeader("Authorization")))timeline.add("UNEXPECTED_OLD_POST");
            return good;
        }});
        ExecutorService executor=Executors.newSingleThreadExecutor();
        try {
            Future<RebuildProtocol.Plan> pending=executor.submit(()->call(old,job));
            assertTrue(arrived.await(3,TimeUnit.SECONDS));awaitBodySent(job,pending);assertTrue("first bodySent before retirement",job.attempt.sent);timeline.add("first_bodySent=true");
            s.retire();timeline.add("retired");assertFalse(RebuildController.current(s));assertNull(s.publication.reserve());assertFalse(job.isCancelled());
            if(stop){s.cancel();timeline.add("STOPPED");assertTrue(job.isCancelled());}
            release.countDown();timeline.add("released");
            if(success&&!stop)assertNotNull("old sent success must still parse",pending.get(3,TimeUnit.SECONDS));
            else if(stop){try{pending.get(3,TimeUnit.SECONDS);fail("STOPPED read completed");}catch(ExecutionException e){assertNotNull(e.getCause());}}
            else interrupted(pending);
            if(success&&!stop)assertEquals("old usage retained",1,responses.size());
            if(!success)assertEquals("old refusal audit retained",1,failures.size());
            assertTrue(job.attempt.sent);assertFalse(RebuildController.current(s));assertNull(s.publication.reserve());
            assertEquals("no new old POST",1,server.getRequestCount());assertEquals("no new old audit attempt",1,attempts);
            assertSame(old,scopes.get(0));
            RebuildController.Session fresh=session(replacement,"new");RebuildController.Job current=new RebuildController.Job(fresh,0,true);
            assertNotNull(call(replacement,current));assertTrue(current.attempt.sent);assertTrue(RebuildController.current(fresh));
            assertEquals(2,server.getRequestCount());assertEquals(2,attempts);assertSame(replacement,scopes.get(scopes.size()-1));
            RecordedRequest a=server.takeRequest(2,TimeUnit.SECONDS),b=server.takeRequest(2,TimeUnit.SECONDS);
            assertEquals("Bearer fixture-old-key",a.getHeader("Authorization"));assertEquals("Bearer fixture-new-key",b.getHeader("Authorization"));
            assertEquals("fixture-model",new JSONObject(a.getBody().readUtf8()).getString("model"));
            assertEquals("fixture-new-model",new JSONObject(b.getBody().readUtf8()).getString("model"));
            fresh.cancel();
        } finally {release.countDown();s.cancel();executor.shutdownNow();assertTrue(executor.awaitTermination(3,TimeUnit.SECONDS));}
    }
    @Test public void serverReceiptCanLeadTheClientBodySentCallback() throws Exception {
        CountDownLatch arrived=new CountDownLatch(1),callbackEntered=new CountDownLatch(1);
        CountDownLatch markSent=new CountDownLatch(1),reply=new CountDownLatch(1);
        RebuildController.Session s=session(config("fixture-key"),"server-leading");
        RebuildController.Job job=new RebuildController.Job(s,0,true);
        MockResponse good=ok();
        server.setDispatcher(new Dispatcher(){public MockResponse dispatch(RecordedRequest request) throws InterruptedException {
            assertEquals("POST",request.getMethod());assertEquals("/v1/chat/completions",request.getPath());
            arrived.countDown();if(!reply.await(5,TimeUnit.SECONDS))throw new AssertionError("reply gate timeout");return good;
        }});
        class ObservedControl implements DeepSeekApiClient.RequestControl,RebuildStream.Early {
            public boolean tryBeginAttempt(){return job.tryBeginAttempt();}
            public boolean isCancelled(){return job.isCancelled();}
            public void onConnection(HttpURLConnection c){job.onConnection(c);}
            public void onRequestBodySent(){
                callbackEntered.countDown();
                try {if(!markSent.await(3,TimeUnit.SECONDS))throw new AssertionError("client gate timeout");}
                catch(InterruptedException e){Thread.currentThread().interrupt();throw new AssertionError(e);}
                job.onRequestBodySent();
            }
            public void onQualityEvidence(JSONObject source,String response,String metadata){job.onQualityEvidence(source,response,metadata);}
            public void onProvisional(RebuildProtocol.Plan prefix){job.onProvisional(prefix);}
        }
        ExecutorService worker=Executors.newSingleThreadExecutor();
        try {
            Future<RebuildProtocol.Plan> pending=worker.submit(()->call(s.config,new ObservedControl()));
            assertTrue(arrived.await(3,TimeUnit.SECONDS));assertTrue(callbackEntered.await(3,TimeUnit.SECONDS));
            assertFalse("server receipt is not the client sent acknowledgement",job.attempt.sent);
            assertTrue(RebuildController.current(s));assertEquals(1,server.getRequestCount());
            markSent.countDown();awaitBodySent(job,pending);assertTrue(job.attempt.sent);
            s.retire();assertFalse(RebuildController.current(s));assertNull(s.publication.reserve());
            reply.countDown();assertNotNull(pending.get(3,TimeUnit.SECONDS));
            assertEquals(1,server.getRequestCount());assertEquals(1,attempts);assertTrue(failures.isEmpty());
        } finally {markSent.countDown();reply.countDown();s.cancel();worker.shutdownNow();assertTrue(worker.awaitTermination(3,TimeUnit.SECONDS));}
    }
    @Test public void retiredOptionalNegotiationRefusesSecondPost() throws Exception {held(error(400,"response_format unsupported"),false,false);}
    @Test public void retiredHttpStreamFallbackRefusesSecondPost() throws Exception {RebuildStream.fixtureHost=server.getHostName();held(error(400,"stream unsupported"),false,false);}
    @Test public void retiredInStreamErrorRefusesSecondPost() throws Exception {RebuildStream.fixtureHost=server.getHostName();held(new MockResponse().setHeader("Content-Type","text/event-stream").setBody("data: {\"error\":{\"message\":\"fixture unavailable\"}}\n\n"),false,false);}
    @Test public void retiredSentSuccessStillCompletesWithoutPublication() throws Exception {held(ok(),true,false);}
    @Test public void stoppedUpgradeRevokesSentReadAndFreshSessionWorks() throws Exception {held(ok(),false,true);}
    @Test public void queuedUnsentJobRefusesFirstPostAfterReplacement() throws Exception {
        TranslationSettings old=config("fixture-old-key");RebuildController.Session s=session(old,"queued");RebuildController.Job job=new RebuildController.Job(s,0,true);
        CountDownLatch queued=new CountDownLatch(1),release=new CountDownLatch(1);ExecutorService executor=Executors.newSingleThreadExecutor();
        try {
            Future<?> pending=executor.submit(()->{queued.countDown();assertTrue(release.await(3,TimeUnit.SECONDS));return call(old,job);});
            assertTrue(queued.await(2,TimeUnit.SECONDS));s.retire();RebuildController.Session fresh=session(config("fixture-new-key"),"new");release.countDown();
            interrupted(pending);assertFalse(job.attempt.sent);assertEquals(0,server.getRequestCount());assertEquals(0,attempts);
            server.enqueue(ok());assertNotNull(call(fresh.config,new RebuildController.Job(fresh,0,true)));assertEquals(1,server.getRequestCount());fresh.cancel();
        }finally{release.countDown();s.cancel();executor.shutdownNow();assertTrue(executor.awaitTermination(3,TimeUnit.SECONDS));}
    }
    @Test public void currentInStreamErrorFallsBackAndSucceeds() throws Exception {
        RebuildStream.fixtureHost=server.getHostName();RebuildController.Session s=session(config("fixture-key"),"current");
        server.enqueue(new MockResponse().setHeader("Content-Type","text/event-stream").setBody("data: {\"error\":{\"message\":\"fixture unavailable\"}}\n\n"));server.enqueue(ok());
        assertNotNull(call(s.config,new RebuildController.Job(s,0,true)));assertTrue(request().getBoolean("stream"));assertFalse(request().getBoolean("stream"));
        assertEquals(2,server.getRequestCount());assertEquals(2,attempts);assertEquals(1,scopes.size());s.cancel();
    }
    @Test public void currentJobKeepsTwoAndThreePostNegotiation() throws Exception {
        for(boolean streaming:new boolean[]{false,true}){
            RebuildApi.reset();RebuildStream.fixtureHost=streaming?server.getHostName():"";
            RebuildController.Session s=session(config("fixture-key"),"current");int start=server.getRequestCount(),a=attempts;
            try {
                if(streaming)server.enqueue(error(400,"stream unsupported"));
                server.enqueue(error(422,"response_format unsupported"));server.enqueue(ok());
                assertNotNull(call(s.config,new RebuildController.Job(s,0,true)));
                int expected=streaming?3:2;assertEquals(expected,server.getRequestCount()-start);assertEquals(expected,attempts-a);
                JSONObject first=request();assertEquals(streaming,first.getBoolean("stream"));assertTrue(first.has("response_format"));
                if(streaming){JSONObject second=request();assertFalse(second.getBoolean("stream"));assertTrue(second.has("response_format"));}
                assertFalse(request().has("response_format"));
            } finally {s.cancel();}
        }
    }
    @Test public void admittedAttemptStoppedBeforeTransportKeepsAuditWithoutHttp() throws Exception {
        RebuildController.Session s=session(config("fixture-key"),"admitted");RebuildController.Job job=new RebuildController.Job(s,0,true);
        CountDownLatch admitted=new CountDownLatch(1),release=new CountDownLatch(1);ExecutorService executor=Executors.newSingleThreadExecutor();
        TranslationAudit.install(new TranslationAudit.Sink(){
            public TranslationAudit.Request begin(TranslationSettings c,boolean p,int t,int n,int tc,int nc,String bucket){scopes.add(c);return new TranslationAudit.Request(c);}
            public int attempt(TranslationAudit.Request r,int bytes){attempts++;timeline.add("admitted_before_STOPPED");admitted.countDown();try{if(!release.await(3,TimeUnit.SECONDS))throw new AssertionError("release timeout");}catch(InterruptedException e){throw new AssertionError(e);}return attempts;}
        });
        try {
            Future<?> pending=executor.submit(()->call(s.config,job));assertTrue(admitted.await(2,TimeUnit.SECONDS));s.cancel();timeline.add("STOPPED_before_transport");release.countDown();interrupted(pending);
            assertFalse(job.attempt.sent);assertEquals(1,attempts);assertEquals(1,scopes.size());assertEquals(0,server.getRequestCount());assertTrue(responses.isEmpty());
        }finally{release.countDown();s.cancel();executor.shutdownNow();assertTrue(executor.awaitTermination(3,TimeUnit.SECONDS));}
    }
}
