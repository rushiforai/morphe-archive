package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.*;
import java.io.*;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Same fixtures run against the entry controller and the extracted implementation. No model IO. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=28,manifest=Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class D1SourcePreparationTest {
    @Rule public org.junit.rules.TemporaryFolder owned=new org.junit.rules.TemporaryFolder(
            new File(System.getProperty("caption.workspace"),"work/temp"));
    @Rule public org.junit.rules.TestName name=new org.junit.rules.TestName();
    final CaptionLanguageContext language=CaptionLanguageContext.explicit("en","zh-Hans");
    final String url="https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en&kind=asr&tlang=zh-Hans";
    final List<String> trace=new CopyOnWriteArrayList<>(), shown=new CopyOnWriteArrayList<>();
    final AtomicInteger reads=new AtomicInteger(), references=new AtomicInteger(), models=new AtomicInteger();
    final CountDownLatch entered=new CountDownLatch(1), release=new CountDownLatch(1);
    ExecutorService worker; Context context; RebuildController.Session session;
    volatile boolean holdRaw, holdBuild, holdCache, manual, nativeWords, failReference, cancelReference;
    volatile boolean seekDuringBuild, stopDuringCache, changeUrl;
    volatile Exception sourceFailure;
    volatile String fetchedUrl, classifiedUrl, referenceUrl;
    Object oldHost,oldOutput,oldAudit;

    Object get(Class<?> type,String key) throws Exception {Field f=type.getDeclaredField(key);f.setAccessible(true);return f.get(null);}
    void set(Class<?> type,String key,Object value) throws Exception {Field f=type.getDeclaredField(key);f.setAccessible(true);f.set(null,value);}
    void gate() throws InterruptedException {entered.countDown();assertTrue("fixture gate timed out",release.await(3,TimeUnit.SECONDS));}
    TranslationSettings config(){return new TranslationSettings(true,"http://127.0.0.1:1/v1","fixture-model","faithful","fixture-key","stored_custom");}
    TranslationSourceAccess.Source raw() throws Exception {
        JSONArray events=new JSONArray();
        for(int i=0;i<3;i++){
            JSONArray segs=new JSONArray().put(new JSONObject().put("utf8",nativeWords?"Hello ":"Hello world.").put("tOffsetMs",0));
            if(nativeWords)segs.put(new JSONObject().put("utf8","world.").put("tOffsetMs",1000));
            events.put(new JSONObject().put("tStartMs",i*30000).put("dDurationMs",5000).put("segs",segs));
        }
        byte[] body=new JSONObject().put("events",events).toString().getBytes(StandardCharsets.UTF_8);
        return new TranslationSourceAccess.Source(body,CaptionDocument.parse(body,"application/json"),"fixture-reference",7,null);
    }
    @Before public void before() throws Exception {
        RebuildController.stop();RebuildApi.reset();
        oldHost=get(TranslationRuntime.class,"host");oldOutput=get(TranslationOutput.class,"sink");oldAudit=get(TranslationAudit.class,"sink");
        File cache=owned.newFolder("cache");
        context=new ContextWrapper(RuntimeEnvironment.getApplication()){
            @Override public Context getApplicationContext(){return this;}
            @Override public File getCacheDir(){
                assertFalse("cache IO under session lock",session!=null&&Thread.holdsLock(session));
                int n=reads.incrementAndGet();
                if(holdCache&&n==1)try {gate();}catch(InterruptedException e){throw new AssertionError(e);}
                if(stopDuringCache&&n==1)try {set(RebuildController.class,"active",null);}catch(Exception e){throw new AssertionError(e);}
                return cache;
            }
        };
        worker=Executors.newSingleThreadExecutor();
        TranslationRuntime.install(new TranslationRuntime.Host(){
            TranslationSettings settings(Context c){return config();}
            TranslationSourceAccess.Source load(Context c,String u,boolean translate,DeepSeekApiClient.RequestControl ctl) throws Exception {
                assertFalse(Thread.holdsLock(session));fetchedUrl=u;trace.add("fetch");
                if(holdRaw)gate();if(sourceFailure!=null)throw sourceFailure;
                if(changeUrl)session.url=url+"&stage=classification";
                return raw();
            }
            boolean authoredTrack(String u){
                assertFalse(Thread.holdsLock(session));classifiedUrl=u;trace.add("classify");
                assertNotNull("raw must be installed before heavy preparation",session.raw);
                if(session.sourceOnly)assertFalse("raw must already be shown",shown.isEmpty());
                if(changeUrl)session.url=url+"&stage=reference";
                if(seekDuringBuild)RebuildController.time(60000);
                if(holdBuild)try {gate();}catch(InterruptedException e){throw new AssertionError(e);}
                return manual;
            }
            TranslationSourceAccess.Source reference(Context c,String u,RebuildSource primary,DeepSeekApiClient.RequestControl ctl) throws Exception {
                assertFalse(Thread.holdsLock(session));references.incrementAndGet();referenceUrl=u;trace.add("reference");
                if(cancelReference){session.cancelled=true;throw new IOException("fixture reference cancelled");}
                if(failReference)throw new IOException("fixture reference unavailable");
                return raw();
            }
            void mark(Context c,String stage,String detail,CaptionCredentialRef credential){
                if(stage.startsWith("REBUILD_SOURCE")||stage.equals("ASR_REFERENCE_FETCH_FAILED")) {
                    assertSame("source diagnostics keep the original empty credential",CaptionCredentialRef.NONE,credential);
                    trace.add(stage+":"+detail.replaceAll("session=\\d+","session=<id>"));
                }
            }
        });
        TranslationOutput.install(new TranslationOutput.Sink(){
            public void showEvent(String text,TranslationOutput.RenderGuard g,String id,long start,long end,long at,CaptionRenderSpec spec){
                if(g.isValid()){shown.add(text);trace.add("show:"+text);g.onApplied();}
            }
        });
        TranslationAudit.install(new TranslationAudit.Sink(){
            public TranslationAudit.Request begin(TranslationSettings c,boolean p,int t,int n,int tc,int nc,String bucket){models.incrementAndGet();throw new AssertionError("unexpected model request");}
            public void cache(int total,int hits){trace.add("cache:"+total+":"+hits);}
        });
        RebuildController.video("abcdefghijk");RebuildController.time(0);
    }
    RebuildController.Session session(boolean sourceOnly) throws Exception {
        session=new RebuildController.Session(context,url,"abcdefghijk","fixture-scope","zh-Hans",config(),sourceOnly,sourceOnly,language);
        session.loading=true;session.sourceJob=new RebuildController.Job(session,-1,false);
        set(RebuildController.class,"active",session);return session;
    }
    Future<?> load() {return worker.submit(()->{
        try {Method m=RebuildController.class.getDeclaredMethod("load",RebuildController.Session.class);m.setAccessible(true);m.invoke(null,session);}
        catch(InvocationTargetException e){throw new AssertionError(e.getCause());}catch(Exception e){throw new AssertionError(e);}
    });}
    void finish(Future<?> f) throws Exception {release.countDown();f.get(3,TimeUnit.SECONDS);}
    void seed() throws Exception {
        RebuildSource source=RebuildSource.read(raw().body,raw().document,true);
        List<RebuildPlanner.Block> blocks=RebuildPlanner.plan(source,language);assertEquals(3,blocks.size());
        String key=RebuildCache.identity(source,config(),"zh-Hans",language,false);
        for(RebuildPlanner.Block b:blocks){
            JSONObject event=new JSONObject().put("from",b.from).put("to",b.to).put("source",source.text(b.from,b.to)).put("text","你好，世界。");
            String json=new JSONObject().put("block",b.id()).put("events",new JSONArray().put(event)).toString();
            RebuildProtocol.Plan plan=RebuildProtocol.parseBound(json,source,b,language);
            try(RebuildCache.Prepared p=RebuildCache.prepare(context,key,source,b,plan,language)){assertNotNull(p);assertTrue(p.commit());}
        }
        reads.set(0);
    }
    @After public void after() throws Exception {
        release.countDown();worker.shutdown();assertTrue(worker.awaitTermination(3,TimeUnit.SECONDS));
        try {System.out.println("D1_ORIGINAL "+name.getMethodName()+" "+new JSONArray(trace));assertEquals(0,models.get());RebuildController.stop();}
        finally {set(TranslationRuntime.class,"host",oldHost);set(TranslationOutput.class,"sink",oldOutput);set(TranslationAudit.class,"sink",oldAudit);}
    }
    @Test public void stopBeforeRawRejectsBothEarlyDisplayAndFinalInstallation() throws Exception {
        session(true);holdRaw=true;Future<?> f=load();assertTrue(entered.await(3,TimeUnit.SECONDS));RebuildController.stop();finish(f);
        assertNull(session.raw);assertNull(session.source);assertNull(session.blocks);assertTrue(shown.isEmpty());assertNull(classifiedUrl);
    }
    @Test public void replacingSourceJobDuringBuildRejectsFinalInstallation() throws Exception {
        session(true);holdBuild=true;Future<?> f=load();assertTrue(entered.await(3,TimeUnit.SECONDS));
        RebuildController.Job replacement=new RebuildController.Job(session,-1,false);
        synchronized(session){session.sourceJob=replacement;}finish(f);
        assertNotNull(session.raw);assertNull(session.source);assertNull(session.blocks);assertSame(replacement,session.sourceJob);assertTrue(session.loading);
    }
    @Test public void replacingOwnerDuringBuildRejectsFinalInstallation() throws Exception {
        session(true);holdBuild=true;Future<?> f=load();assertTrue(entered.await(3,TimeUnit.SECONDS));
        RebuildController.video("zyxwvutsrqp");finish(f);assertNotNull(session.raw);assertNull(session.source);assertNull(session.blocks);
    }
    @Test public void seekDuringWarmReadDropsHitsButKeepsValidSourceBuild() throws Exception {
        seed();session(false);holdCache=true;Future<?> f=load();assertTrue(entered.await(3,TimeUnit.SECONDS));
        int generation=session.generation;RebuildController.time(60000);assertTrue(session.generation>generation);finish(f);
        assertNotNull(session.source);assertEquals(3,session.blocks.size());assertFalse(session.loading);assertNull(session.sourceJob);
        assertEquals(2,reads.get());assertTrue(Arrays.stream(session.work.slots).map(slot -> slot.accepted).allMatch(Objects::isNull));
        for(RebuildWorkSet.Slot slot:session.work.slots)assertFalse(slot.cacheChecked);assertTrue(trace.contains("cache:2:0"));
    }
    @Test public void generationIsCapturedAfterBuildAndOnlyLandingAndNextAreRead() throws Exception {
        seed();session(false);seekDuringBuild=true;load().get(3,TimeUnit.SECONDS);
        assertTrue(session.generation>0);assertEquals(1,reads.get());assertNotNull(session.work.slots[2].accepted);assertNull(session.work.slots[0].accepted);assertNull(session.work.slots[1].accepted);
        assertFalse(session.work.slots[0].cacheChecked);assertFalse(session.work.slots[1].cacheChecked);assertTrue(session.work.slots[2].cacheChecked);assertTrue(trace.contains("cache:1:1"));
    }
    @Test public void warmHitsUseTheOriginalKeyAndOnlyTwoReads() throws Exception {
        seed();session(false);load().get(3,TimeUnit.SECONDS);assertEquals(2,reads.get());
        assertNotNull(session.work.slots[0].accepted);assertNotNull(session.work.slots[1].accepted);assertNull(session.work.slots[2].accepted);assertFalse(session.work.slots[2].cacheChecked);assertTrue(trace.contains("cache:2:2"));
    }
    @Test public void ownershipIsRecheckedBetweenTheTwoWarmReads() throws Exception {
        seed();session(false);stopDuringCache=true;load().get(3,TimeUnit.SECONDS);assertEquals(1,reads.get());assertNull(session.source);assertNull(session.blocks);
    }
    @Test public void dynamicUrlIsReadAtFetchClassificationAndReferenceStages() throws Exception {
        session(false);changeUrl=true;load().get(3,TimeUnit.SECONDS);
        assertEquals(url,fetchedUrl);assertEquals(url+"&stage=classification",classifiedUrl);assertEquals(url+"&stage=reference",referenceUrl);assertEquals(1,references.get());assertNotNull(session.source);
    }
    @Test public void sourceOnlyShowsRawFirstAndSkipsReferenceAndModel() throws Exception {
        session(true);load().get(3,TimeUnit.SECONDS);assertEquals(0,references.get());assertEquals(0,reads.get());assertNotNull(session.source);
        assertTrue(trace.indexOf("show:Hello world.")<trace.indexOf("classify"));
    }
    @Test public void authoredAndFullyNativeTracksSkipReferenceAndKeepTheirBlockKinds() throws Exception {
        session(false);manual=true;load().get(3,TimeUnit.SECONDS);assertEquals(0,references.get());assertTrue(session.authored);
        assertTrue(session.blocks.stream().allMatch(b->b.authored));String authoredKey=session.cacheKey;
        RebuildController.stop();manual=false;nativeWords=true;session(false);load().get(3,TimeUnit.SECONDS);
        assertEquals(0,references.get());assertFalse(session.authored);assertTrue(session.blocks.stream().noneMatch(b->b.authored));assertNotEquals(authoredKey,session.cacheKey);
        assertTrue(trace.stream().anyMatch(s->s.contains("reason=all_words_native")));
    }
    @Test public void referenceFailureKeepsPrimaryWhileCancellationCannotInstall() throws Exception {
        session(false);failReference=true;load().get(3,TimeUnit.SECONDS);assertNotNull(session.source);
        assertTrue(trace.stream().anyMatch(s->s.startsWith("ASR_REFERENCE_FETCH_FAILED:")));
        RebuildController.stop();trace.clear();failReference=false;cancelReference=true;session(false);load().get(3,TimeUnit.SECONDS);
        assertNull(session.source);assertNull(session.blocks);assertTrue(trace.stream().noneMatch(s->s.startsWith("ASR_REFERENCE_FETCH_FAILED:")));
    }
    @Test public void sourceErrorsKeepOriginalClassificationTerminalAndRetryStatus() throws Exception {
        session(false);sourceFailure=new java.net.SocketTimeoutException("fixture");load().get(3,TimeUnit.SECONDS);
        assertFalse(session.terminal);assertEquals("source_retry",session.status);assertEquals(1,session.sourceFailures);assertTrue(session.sourceRetry>0);
        assertTrue(trace.contains("REBUILD_SOURCE_ERROR:timeout;attempt=1"));
        RebuildController.stop();sourceFailure=SourceRecoveryPolicy.http(403,"");session(false);load().get(3,TimeUnit.SECONDS);
        assertTrue(session.terminal);assertEquals("source_unavailable",session.status);assertTrue(trace.contains("REBUILD_SOURCE_ERROR:http_403;attempt=1"));assertNull(session.raw);
    }
}
