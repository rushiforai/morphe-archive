package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.*;
import java.io.*;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.*;
import java.util.concurrent.*;
import okhttp3.mockwebserver.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Actual per-block files, read/review, restoration/scheduling and lifecycle, on owned fixture IO. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28, manifest=Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class M5iRebuildCacheTest {
    @Rule public org.junit.rules.TemporaryFolder owned=new org.junit.rules.TemporaryFolder(
            new File(System.getProperty("caption.workspace"),"work/temp"));
    @Rule public org.junit.rules.TestName name=new org.junit.rules.TestName();
    Context context;
    File directory;
    MockWebServer server;
    final CaptionLanguageContext language=CaptionLanguageContext.explicit("en","zh-Hans");
    RebuildSource source;
    RebuildPlanner.Block block;
    RebuildProtocol.Plan plan;
    int attempts;
    Object host,output,audit;
    final CountDownLatch accepted=new CountDownLatch(1);
    final CountDownLatch rejected=new CountDownLatch(1);
    final List<String> results=new CopyOnWriteArrayList<>(),trace=new CopyOnWriteArrayList<>();

    Object field(Class<?> c,String n,Object target) throws Exception {Field f=c.getDeclaredField(n);f.setAccessible(true);return f.get(target);}
    void set(Class<?> c,String n,Object target,Object value) throws Exception {Field f=c.getDeclaredField(n);f.setAccessible(true);f.set(target,value);}
    @Before public void before() throws Exception {
        RebuildController.stop();RebuildApi.reset();
        File cache=owned.newFolder("cache");context=new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public File getCacheDir(){return cache;}
            @Override public Context getApplicationContext(){return this;}
        };
        directory=new File(cache,"caption-events-r2.12");assertTrue(directory.mkdirs());
        server=new MockWebServer();server.start();source=RebuildContractTest.source("Hello world.",500);block=RebuildContractTest.block(source);
        plan=parse("你好，世界。");
        host=field(TranslationRuntime.class,"host",null);output=field(TranslationOutput.class,"sink",null);audit=field(TranslationAudit.class,"sink",null);
        TranslationRuntime.install(new TranslationRuntime.Host(){
            TranslationSettings settings(Context c){return config("fixture-key");}
            TranslationSourceAccess.Source load(Context c,String u,boolean translate,DeepSeekApiClient.RequestControl ctl){throw new AssertionError("unmapped source");}
            void mark(Context c,String stage,String detail,CaptionCredentialRef credential){if(stage.equals("REBUILD_EVENTS_ACCEPTED"))accepted.countDown();if(stage.equals("REBUILD_EVENTS_REJECTED"))rejected.countDown();}
        });
        TranslationOutput.install(new TranslationOutput.Sink(){
            public void showEvent(String text,TranslationOutput.RenderGuard g,String id,long start,long end,long at,CaptionRenderSpec spec){if(g.isValid())results.add(text);}
        });
        TranslationAudit.install(new TranslationAudit.Sink(){public int attempt(TranslationAudit.Request request,int bytes){return ++attempts;}});
    }
    @After public void after() throws Exception {
        try {
            System.out.println("M5I_REBUILD "+new JSONObject().put("test",name.getMethodName()).put("source_get",0)
                    .put("provider_post",server.getRequestCount()).put("attempts",attempts).put("text",new JSONArray(results)).put("trace",new JSONArray(trace)));
            RebuildController.stop();RebuildApi.reset();server.shutdown();RebuildCache.clear(context);
        } finally {
            set(TranslationRuntime.class,"host",null,host);set(TranslationOutput.class,"sink",null,output);set(TranslationAudit.class,"sink",null,audit);
        }
    }
    TranslationSettings config(String key){return new TranslationSettings(true,server.url("/v1").toString(),"fixture-model","faithful",key,"stored_custom");}
    String key(){return RebuildCache.identity(source,config("fixture-key"),"zh-Hans",language);}
    File entry(String key){return new File(directory,key+"-"+block.id()+".json");}
    RebuildProtocol.Plan parse(String text) throws Exception {
        return RebuildProtocol.parseBound(RebuildContractTest.reply(block,new JSONArray().put(RebuildContractTest.event(0,source.words.size()-1,text)
                .put("source",source.text(0,source.words.size()-1)))),source,block,language);
    }
    void seed(String key,String raw) throws Exception {Files.write(entry(key).toPath(),raw.getBytes(StandardCharsets.UTF_8));}
    void save(String key,RebuildProtocol.Plan value) throws Exception {
        try(RebuildCache.Prepared p=RebuildCache.prepare(context,key,source,block,value,language)){assertNotNull(p);assertTrue(p.commit());}
    }
    @Test public void malformedOversizedAndMismatchedEntriesMissWhileAnotherLanguageSurvives() throws Exception {
        String other="fixture-other-language";save(other,plan);byte[] otherBytes=Files.readAllBytes(entry(other).toPath());
        JSONObject wrongBlock=new JSONObject(plan.json).put("block","unrelated");
        JSONObject wrongQuote=new JSONObject(plan.json);wrongQuote.getJSONArray("events").getJSONObject(0).put("source","Wrong quotation");
        String[] bad={"","{", "{\"events\":[]}",plan.json.substring(0,plan.json.length()/2),wrongBlock.toString(),wrongQuote.toString()};
        for(String raw:bad){seed(key(),raw);assertNull(RebuildCache.read(context,key(),source,block,language));assertFalse(entry(key()).exists());}
        try(RandomAccessFile f=new RandomAccessFile(entry(key()),"rw")){f.setLength(256001);}
        assertNull(RebuildCache.read(context,key(),source,block,language));assertNotNull(RebuildCache.read(context,other,source,block,language));
        assertArrayEquals(otherBytes,Files.readAllBytes(entry(other).toPath()));save(key(),plan);assertNotNull(RebuildCache.read(context,key(),source,block,language));
    }
    @Test public void reviewRiskIsRecomputedOnReadAndNotPreparedAsAValidPlan() throws Exception {
        source=RebuildContractTest.source("We cannot accept the claim that every single person in this entire country will always have enough money to buy all of these expensive things.",300);
        block=RebuildContractTest.block(source);RebuildProtocol.Plan risky=parse("大家有钱。");
        assertTrue("fixture must really exercise actionable review",RebuildReview.score(risky.issues)>0);
        seed(key(),risky.json);assertNull(RebuildCache.read(context,key(),source,block,language));
        assertNull(RebuildCache.prepare(context,key(),source,block,risky,language));
    }
    @Test public void wrongSourceAndBlockCannotBeRestoredButCredentialOnlyChangeCanReuse() throws Exception {
        save(key(),plan);String same=RebuildCache.identity(source,config("replacement-fixture-key"),"zh-Hans",language);assertEquals(key(),same);
        assertNotNull(RebuildCache.read(context,same,source,block,language));
        RebuildSource changed=RebuildContractTest.source("Completely different words.",500);
        assertNull(RebuildCache.read(context,key(),changed,RebuildContractTest.block(changed),language));
        assertNotEquals(key(),RebuildCache.identity(changed,config("fixture-key"),"zh-Hans",language));
    }
    @Test public void realPrepareAndMoveFailuresPreserveAnOldEntryAndPermitLaterRecovery() throws Exception {
        save(key(),plan);byte[] old=Files.readAllBytes(entry(key()).toPath());
        File obstruction=owned.newFile("cache-path-is-file");Context failing=new ContextWrapper(context){@Override public File getCacheDir(){return obstruction;}};
        assertNull(RebuildCache.prepare(failing,key(),source,block,plan,language));assertArrayEquals(old,Files.readAllBytes(entry(key()).toPath()));
        try(RebuildCache.Prepared p=RebuildCache.prepare(context,key(),source,block,parse("世界，你好。"),language)){
            assertNotNull(p);File temp=(File)field(RebuildCache.Prepared.class,"temporary",p);Files.delete(temp.toPath());
            assertFalse("interrupted/missing staging move must fail harmlessly",p.commit());
            assertArrayEquals(old,Files.readAllBytes(entry(key()).toPath()));
        }
        save(key(),parse("世界，你好。"));assertEquals("世界，你好。",RebuildCache.read(context,key(),source,block,language).events.get(0).text);
    }
    RebuildController.Session session() throws Exception {
        String owner=(String)field(RebuildController.class,"video",null);
        RebuildController.Session s=new RebuildController.Session(context,"fixture",owner,"fixture-scope","zh-Hans",config("fixture-key"),false,true,language);
        s.source=source;s.blocks=Collections.singletonList(block);s.cacheKey=key();s.work.initialize(1);
        s.presentation.configure(s.source, s.blocks, s.languageContext);
        set(RebuildController.class,"active",null,s);return s;
    }
    void invoke(String name,RebuildController.Session s) throws Exception {
        Method m=RebuildController.class.getDeclaredMethod(name,RebuildController.Session.class);m.setAccessible(true);m.invoke(null,s);
    }
    void response(int status) throws Exception {
        server.enqueue(status==200?new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject()
                .put("finish_reason","stop").put("message",new JSONObject().put("content",plan.json)))).toString()):new MockResponse().setResponseCode(status).setBody("fixture refusal"));
    }
    @Test public void d3PromptChangeMissesOldFixtureKeyWithoutDeletingOldBytes() throws Exception {
        Path snapshot=Paths.get(System.getProperty("caption.workspace"),"translation-core","upstream","RebuildProtocol.java.txt");
        String oldSource=new String(Files.readAllBytes(snapshot),StandardCharsets.UTF_8);
        String section=oldSource.substring(oldSource.indexOf("static final String FIDELITY_PROMPT ="),oldSource.indexOf("static final class Event"));
        java.util.regex.Matcher parts=java.util.regex.Pattern.compile("\"([^\"]*)\"").matcher(section);
        StringBuilder oldFidelity=new StringBuilder();while(parts.find())oldFidelity.append(parts.group(1));
        assertEquals("67bcd4e94c65d47c51abf1dcecf45f46e80bbd0bfce90e4d4893f5628b64fdaa",RebuildCache.hash(oldFidelity.toString()));
        TranslationSettings cfg=config("fixture-key");String prompt=RebuildApi.prompt(cfg,"zh-Hans",language);
        assertTrue(prompt.contains(RebuildProtocol.FIDELITY_PROMPT));
        String priorPrompt=prompt.replace(RebuildProtocol.FIDELITY_PROMPT,oldFidelity.toString());
        assertNotEquals(RebuildCache.hash(priorPrompt),RebuildCache.hash(prompt));
        // Reconstruct the D2 identity from its fixed old prompt for this isolated fixture.
        StringBuilder prior=new StringBuilder(RebuildProtocol.VERSION).append('|').append(language.fingerprint(cfg))
                .append('|').append("zh-Hans").append('|').append(RebuildCache.hash(priorPrompt))
                .append('|').append(language.renderSpec.presentationPolicy);
        for(RebuildSource.Word w:source.words)prior.append('\n').append(w.start).append(':').append(w.end)
                .append(':').append(w.precision).append(':').append(w.text);
        String oldKey=RebuildCache.hash(prior.toString()),newKey=RebuildCache.identity(source,cfg,"zh-Hans",language);
        assertNotEquals(oldKey,newKey);seed(oldKey,plan.json);byte[] oldBytes=Files.readAllBytes(entry(oldKey).toPath());
        assertNull("current identity does not force-read the old entry",RebuildCache.read(context,newKey,source,block,language));
        assertArrayEquals(oldBytes,Files.readAllBytes(entry(oldKey).toPath()));save(newKey,plan);
        assertNotNull(RebuildCache.read(context,newKey,source,block,language));assertArrayEquals(oldBytes,Files.readAllBytes(entry(oldKey).toPath()));
        CaptionLanguageContext french=CaptionLanguageContext.explicit("en","fr");
        String neutral=RebuildApi.prompt(cfg,"fr",french);
        assertFalse(neutral.contains(RebuildProtocol.FIDELITY_PROMPT));assertFalse(neutral.contains(oldFidelity.toString()));
        System.out.println("D3_PROMPT_HASH old="+RebuildCache.hash(priorPrompt)+" new="+RebuildCache.hash(prompt)+";fixture_old_key="+oldKey+";fixture_new_key="+newKey);
    }
    @Test public void d3RetiredTankCaseFlowsThroughSchedulerReplyCacheAndDisplay() throws Exception {
        source=RebuildContractTest.source("the size of a country's tank fleet",500);block=RebuildContractTest.block(source);
        plan=parse("一个国家坦克舰队的规模"); // historical wording; acceptance does not certify translation accuracy
        assertEquals(0,RebuildReview.score(plan.issues));
        assertFalse(RebuildReview.shouldRepair(plan,1,0,0,block.end));
        RebuildController.Session s=session();response(200);invoke("schedule",s);
        assertTrue("actual scheduler and reply must finish",accepted.await(3,TimeUnit.SECONDS));
        synchronized(s) {
            assertNotNull(s.work.slots[0].accepted);assertEquals(RebuildController.READY,s.work.slots[0].state);
            assertEquals(1,s.work.slots[0].attempts);assertEquals(0,s.work.repairCount);
            assertFalse(s.work.slots[0].reason.contains("possible_equipment_term"));
        }
        assertTrue(entry(key()).isFile());assertEquals("一个国家坦克舰队的规模",RebuildCache.read(context,key(),source,block,language).events.get(0).text);
        invoke("render",s);assertTrue(results.contains("一个国家坦克舰队的规模"));
        invoke("schedule",s);invoke("schedule",s);
        assertEquals(1,server.getRequestCount());assertEquals(1,attempts);
        assertFalse(server.takeRequest(1,TimeUnit.SECONDS).getBody().readUtf8().contains("possible_equipment_term"));
    }
    @Test public void d3RetiredSamplesArePreparedAndOldBytesAreReparsedUnderCurrentRules() throws Exception {
        String[][] cases={{"licensed or unlicensed vehicles","合法或非法的车辆"},
                          {"about 50 20 aircraft","大约50至20架飞机"}};
        for(String[] sample:cases) {
            source=RebuildContractTest.source(sample[0],500);block=RebuildContractTest.block(source);plan=parse(sample[1]);
            assertEquals(0,RebuildReview.score(plan.issues));assertFalse(RebuildReview.shouldRepair(plan,1,0,0,block.end));
            RebuildReplyPreparation.Evaluation evaluation=RebuildReplyPreparation.evaluate(context,key(),source,block,language,null,plan,null);
            assertSame(plan,evaluation.accepted);assertTrue(evaluation.cacheable);assertNotNull(evaluation.prepared);
            try(RebuildCache.Prepared prepared=evaluation.prepared){assertTrue(prepared.commit());}
            assertEquals(sample[1],RebuildCache.read(context,key(),source,block,language).events.get(0).text);
            seed(key(),plan.json); // original JSON is re-parsed; no old Issue object is trusted
            assertEquals(sample[1],RebuildCache.read(context,key(),source,block,language).events.get(0).text);
        }
        assertEquals(0,server.getRequestCount());
    }
    @Test public void hitAvoidsProviderAndBadEntryRecoversViaActualSchedulerWithOnePost() throws Exception {
        save(key(),plan);RebuildController.Session hit=session();invoke("schedule",hit);assertNotNull(hit.work.slots[0].accepted);assertEquals(0,server.getRequestCount());
        RebuildController.stop();seed(key(),"{broken");RebuildController.Session miss=session();response(200);invoke("schedule",miss);
        assertTrue(accepted.await(3,TimeUnit.SECONDS));synchronized(miss){assertNotNull(miss.work.slots[0].accepted);assertEquals(1,miss.work.slots[0].attempts);}
        invoke("render",miss);assertTrue(results.contains("你好，世界。"));assertEquals(1,server.getRequestCount());assertEquals(1,attempts);
        RebuildController.stop();RebuildController.Session again=session();invoke("schedule",again);assertNotNull(again.work.slots[0].accepted);assertEquals(1,server.getRequestCount());
    }
    @Test public void cacheMissFailureKeepsOriginalTerminalBudgetAndNeverDisplaysSource() throws Exception {
        seed(key(),"{broken");RebuildController.Session s=session();response(401);invoke("schedule",s);
        // Await the actual worker, not a wall-clock retry loop.
        assertTrue(rejected.await(3,TimeUnit.SECONDS));
        assertTrue(s.terminal);assertNull(s.work.slots[0].accepted);invoke("render",s);invoke("schedule",s);
        assertTrue(results.isEmpty());assertEquals(1,server.getRequestCount());assertEquals(1,attempts);
    }
    @Test public void cacheLookupReservedByAnOldSessionCannotPublishIntoReplacement() throws Exception {
        save(key(),plan);RebuildController.Session old=session();
        Class<?> lookup=Class.forName(RebuildController.class.getName()+"$CacheLookup");Constructor<?> ctor=lookup.getDeclaredConstructor(RebuildController.Session.class,RebuildPlanner.Block.class,boolean.class);ctor.setAccessible(true);
        Object reserved=ctor.newInstance(old,block,false);old.work.slots[0].cacheReading=true;
        RebuildController.stop();RebuildController.Session replacement=session();
        Method restore=RebuildController.class.getDeclaredMethod("restoreCandidate",RebuildController.Session.class,lookup);restore.setAccessible(true);restore.invoke(null,old,reserved);
        assertNull(old.work.slots[0].accepted);assertNull(replacement.work.slots[0].accepted);assertTrue(results.isEmpty());assertFalse(old.publication.isOpen());
        invoke("schedule",replacement);assertNotNull(replacement.work.slots[0].accepted);assertEquals(0,server.getRequestCount());
    }
    @Test public void clearWaitsForAdmittedCommitAndUnadmittedCandidateCannotResurrect() throws Exception {
        save(key(),plan);RebuildController.Session old=session();RebuildCache.Permit permit=old.publication.reserve();assertNotNull(permit);
        RebuildCache.Prepared admitted=RebuildCache.prepare(context,key(),source,block,plan,language);
        RebuildCache.Prepared unadmitted=RebuildCache.prepare(context,key(),source,block,plan,language);
        CountDownLatch cleared=new CountDownLatch(1);
        TranslationRuntime.install(new TranslationRuntime.Host(){
            TranslationSettings settings(Context c){return config("fixture-key");}
            TranslationSourceAccess.Source load(Context c,String u,boolean translate,DeepSeekApiClient.RequestControl ctl){throw new AssertionError("unmapped restart source");}
            void clearSourceCache(Context c){trace.add("clear-source-after-drain");cleared.countDown();}
        });
        try {
            RebuildController.clearCache(context);trace.add("clear-requested");assertNull(old.publication.reserve());
            assertTrue("pre-revoke admitted old scope commit is allowed",admitted.commit());trace.add("admitted-commit");
            assertEquals(1,cleared.getCount());permit.close();assertTrue(cleared.await(3,TimeUnit.SECONDS));
            assertNull(RebuildCache.read(context,key(),source,block,language));assertFalse(unadmitted.commit());
            assertFalse(RebuildController.current(old));RebuildController.stop(); // invalidate the queued restart before the paused main looper runs
            Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();assertFalse(RebuildController.visible());
            save(key(),plan);assertNotNull(RebuildCache.read(context,key(),source,block,language));trace.add("new-write-hit");
        } finally {permit.close();admitted.close();unadmitted.close();}
    }
    Context gatedCache(CountDownLatch reached,CountDownLatch release,java.util.concurrent.atomic.AtomicInteger calls){
        Context base=context;
        return new ContextWrapper(base){
            @Override public File getCacheDir(){
                if(calls.incrementAndGet()==1){
                    reached.countDown();
                    try {if(!release.await(5,TimeUnit.SECONDS))throw new AssertionError("prepare gate timeout");}
                    catch(InterruptedException e){throw new AssertionError(e);}
                }
                return base.getCacheDir();
            }
            @Override public Context getApplicationContext(){return this;}
        };
    }
    Future<?> translateAsync(RebuildController.Session s,ExecutorService worker) throws Exception {
        s.visible=false;RebuildController.Job job=new RebuildController.Job(s,0,true);
        s.work.slots[0].attempt=job.attempt;s.work.slots[0].state=RebuildController.RUNNING;
        s.work.slots[0].attempts=1;s.work.slots[0].cacheChecked=true;
        Method translate=RebuildController.class.getDeclaredMethod("translate",RebuildController.Job.class);translate.setAccessible(true);
        return worker.submit(()->{try{translate.invoke(null,job);}catch(ReflectiveOperationException e){throw new AssertionError(e);}});
    }
    @Test public void changedOldPlanAndGenerationDuringPrepareReevaluatesWithoutAnotherPost() throws Exception {
        Context original=context;CountDownLatch reached=new CountDownLatch(1),release=new CountDownLatch(1);
        java.util.concurrent.atomic.AtomicInteger calls=new java.util.concurrent.atomic.AtomicInteger();
        context=gatedCache(reached,release,calls);RebuildController.Session s=session();context=original;
        RebuildProtocol.Plan old=parse("世界，你好。");ExecutorService worker=Executors.newSingleThreadExecutor();
        try {
            response(200);Future<?> done=translateAsync(s,worker);assertTrue(reached.await(3,TimeUnit.SECONDS));
            synchronized(s){s.generation++;s.work.slots[0].accepted=old;}
            release.countDown();done.get(6,TimeUnit.SECONDS);
            RebuildProtocol.Plan expected=RebuildReview.accept(old,plan,block);
            assertEquals(expected.events.get(0).text,s.work.slots[0].accepted.events.get(0).text);
            assertTrue("changed snapshot must prepare the same reply again",calls.get()>=4);
            assertEquals(1,server.getRequestCount());assertEquals(1,attempts);
        } finally {release.countDown();worker.shutdownNow();}
    }
    @Test public void cachePrepareFailureStillAcceptsTheRealReplyInMemory() throws Exception {
        Context original=context;File obstruction=owned.newFile("prepare-failure");
        context=new ContextWrapper(original){@Override public File getCacheDir(){return obstruction;}};
        RebuildController.Session s=session();context=original;ExecutorService worker=Executors.newSingleThreadExecutor();
        try {response(200);translateAsync(s,worker).get(6,TimeUnit.SECONDS);
            assertNotNull(s.work.slots[0].accepted);assertEquals("你好，世界。",s.work.slots[0].accepted.events.get(0).text);
            assertEquals(1,server.getRequestCount());assertEquals(1,attempts);
        } finally {worker.shutdownNow();}
    }
    @Test public void revokedBeforeReserveRejectsPreparedReply() throws Exception {
        Context original=context;CountDownLatch reached=new CountDownLatch(1),release=new CountDownLatch(1);
        context=gatedCache(reached,release,new java.util.concurrent.atomic.AtomicInteger());
        RebuildController.Session s=session();context=original;ExecutorService worker=Executors.newSingleThreadExecutor();
        try {response(200);Future<?> done=translateAsync(s,worker);assertTrue(reached.await(3,TimeUnit.SECONDS));
            s.publication.revoke(true);release.countDown();done.get(6,TimeUnit.SECONDS);
            assertNull(s.work.slots[0].accepted);assertNull(s.publication.reserve());assertFalse(entry(key()).exists());
            assertEquals(1,server.getRequestCount());assertTrue(results.isEmpty());
        } finally {release.countDown();worker.shutdownNow();}
    }
    void admittedMoveDuringChange(boolean changePlan) throws Exception {
        Context original=context;CountDownLatch reached=new CountDownLatch(1),release=new CountDownLatch(1);
        CountDownLatch publicationHeld=new CountDownLatch(1),releasePublication=new CountDownLatch(1);
        java.util.concurrent.atomic.AtomicInteger calls=new java.util.concurrent.atomic.AtomicInteger();
        context=gatedCache(reached,release,calls);
        RebuildController.Session s=session();context=original;ExecutorService worker=Executors.newSingleThreadExecutor();
        RebuildProtocol.Plan competing=parse("世界，你好。");
        Thread holder=new Thread(()->{synchronized(s.publication){publicationHeld.countDown();try{
            if(!releasePublication.await(5,TimeUnit.SECONDS))throw new AssertionError("publication gate timeout");
        }catch(InterruptedException e){throw new AssertionError(e);}}},"D2-publication-gate");
        try {
            response(200);Future<?> done=translateAsync(s,worker);assertTrue(reached.await(3,TimeUnit.SECONDS));
            holder.start();assertTrue(publicationHeld.await(3,TimeUnit.SECONDS));release.countDown();
            Field writes=RebuildCache.class.getDeclaredField("WRITES");writes.setAccessible(true);
            Field outstanding=RebuildCache.Publication.class.getDeclaredField("outstanding");outstanding.setAccessible(true);
            long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(4);boolean staged=false;
            while(System.nanoTime()<deadline && !staged){
                synchronized(RebuildCache.class){
                    Map<?,?> entries=(Map<?,?>)writes.get(null);
                    if(entries.containsKey(entry(key()).getAbsolutePath())){
                        staged=true;releasePublication.countDown();
                        boolean reserved=false;
                        while(System.nanoTime()<deadline && !reserved){
                            synchronized(s.publication){reserved=outstanding.getInt(s.publication)>0;}
                            if(!reserved)java.util.concurrent.locks.LockSupport.parkNanos(TimeUnit.MILLISECONDS.toNanos(1));
                        }
                        assertTrue("the real worker must reserve before the move",reserved);
                        synchronized(s){if(changePlan)s.work.slots[0].accepted=competing;else s.generation++;}
                    }
                }
                if(!staged)java.util.concurrent.locks.LockSupport.parkNanos(TimeUnit.MILLISECONDS.toNanos(1));
            }
            assertTrue("candidate must be staged",staged);done.get(6,TimeUnit.SECONDS);holder.join(3000);
            assertTrue("an admitted physical move may complete",entry(key()).isFile());
            if(changePlan){
                RebuildProtocol.Plan expected=RebuildReview.accept(competing,plan,block);
                assertEquals(expected.events.get(0).text,s.work.slots[0].accepted.events.get(0).text);
                assertTrue("a newer plan requires reevaluation after the admitted move",calls.get()>=4);
                assertEquals(expected.events.get(0).text,RebuildCache.read(context,key(),source,block,language).events.get(0).text);
            }else assertNull("a later generation must not accept the old output",s.work.slots[0].accepted);
            assertEquals(1,server.getRequestCount());assertTrue(results.isEmpty());
        } finally {release.countDown();releasePublication.countDown();worker.shutdownNow();holder.join(3000);}
    }

    @Test public void admittedMoveCanFinishButNewGenerationRejectsItsOutput() throws Exception {admittedMoveDuringChange(false);}
    @Test public void changedPlanAfterReserveIsReevaluatedWithoutAnotherPost() throws Exception {admittedMoveDuringChange(true);}

}
