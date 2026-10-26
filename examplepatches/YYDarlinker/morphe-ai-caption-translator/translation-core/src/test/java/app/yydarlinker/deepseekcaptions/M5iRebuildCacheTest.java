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
        s.source=source;s.blocks=Collections.singletonList(block);s.cacheKey=key();s.states=new int[]{RebuildController.WAITING};s.attempts=new int[1];s.retryAt=new long[1];s.reasons=new String[1];
        s.plans=new RebuildProtocol.Plan[1];s.pendingPlans=new RebuildProtocol.Plan[1];s.provisional=new RebuildProtocol.Plan[1];s.jobs=new RebuildController.Job[1];
        s.cacheChecked=new boolean[1];s.cacheReading=new boolean[1];s.slowRetries=new int[1];s.pageRepairCount=new int[1];s.uncoveredSince=new long[1];
        set(RebuildController.Session.class,"displayLayouts",s,java.lang.reflect.Array.newInstance(Class.forName(RebuildController.class.getName()+"$DisplayLayout"),1));
        set(RebuildController.class,"active",null,s);return s;
    }
    void invoke(String name,RebuildController.Session s) throws Exception {
        Method m=RebuildController.class.getDeclaredMethod(name,RebuildController.Session.class);m.setAccessible(true);m.invoke(null,s);
    }
    void response(int status) throws Exception {
        server.enqueue(status==200?new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject()
                .put("finish_reason","stop").put("message",new JSONObject().put("content",plan.json)))).toString()):new MockResponse().setResponseCode(status).setBody("fixture refusal"));
    }
    @Test public void hitAvoidsProviderAndBadEntryRecoversViaActualSchedulerWithOnePost() throws Exception {
        save(key(),plan);RebuildController.Session hit=session();invoke("schedule",hit);assertNotNull(hit.plans[0]);assertEquals(0,server.getRequestCount());
        RebuildController.stop();seed(key(),"{broken");RebuildController.Session miss=session();response(200);invoke("schedule",miss);
        assertTrue(accepted.await(3,TimeUnit.SECONDS));synchronized(miss){assertNotNull(miss.plans[0]);assertEquals(1,miss.attempts[0]);}
        invoke("render",miss);assertTrue(results.contains("你好，世界。"));assertEquals(1,server.getRequestCount());assertEquals(1,attempts);
        RebuildController.stop();RebuildController.Session again=session();invoke("schedule",again);assertNotNull(again.plans[0]);assertEquals(1,server.getRequestCount());
    }
    @Test public void cacheMissFailureKeepsOriginalTerminalBudgetAndNeverDisplaysSource() throws Exception {
        seed(key(),"{broken");RebuildController.Session s=session();response(401);invoke("schedule",s);
        // Await the actual worker, not a wall-clock retry loop.
        assertTrue(rejected.await(3,TimeUnit.SECONDS));
        assertTrue(s.terminal);assertNull(s.plans[0]);invoke("render",s);invoke("schedule",s);
        assertTrue(results.isEmpty());assertEquals(1,server.getRequestCount());assertEquals(1,attempts);
    }
    @Test public void cacheLookupReservedByAnOldSessionCannotPublishIntoReplacement() throws Exception {
        save(key(),plan);RebuildController.Session old=session();
        Class<?> lookup=Class.forName(RebuildController.class.getName()+"$CacheLookup");Constructor<?> ctor=lookup.getDeclaredConstructor(RebuildController.Session.class,RebuildPlanner.Block.class,boolean.class);ctor.setAccessible(true);
        Object reserved=ctor.newInstance(old,block,false);old.cacheReading[0]=true;
        RebuildController.stop();RebuildController.Session replacement=session();
        Method restore=RebuildController.class.getDeclaredMethod("restoreCandidate",RebuildController.Session.class,lookup);restore.setAccessible(true);restore.invoke(null,old,reserved);
        assertNull(old.plans[0]);assertNull(replacement.plans[0]);assertTrue(results.isEmpty());assertFalse(old.publication.isOpen());
        invoke("schedule",replacement);assertNotNull(replacement.plans[0]);assertEquals(0,server.getRequestCount());
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
}
