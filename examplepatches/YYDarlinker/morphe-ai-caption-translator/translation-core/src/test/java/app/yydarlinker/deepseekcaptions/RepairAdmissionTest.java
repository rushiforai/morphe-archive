package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.os.SystemClock;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import okhttp3.mockwebserver.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Real controller entry points and local HTTP; no production provider or source fallback. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28, manifest=Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class RepairAdmissionTest {
    MockWebServer server;
    RebuildSource source;
    RebuildPlanner.Block block;
    final CaptionLanguageContext language=CaptionLanguageContext.explicit("en","zh-Hans");
    final List<String> timeline=new CopyOnWriteArrayList<>();
    final BlockingQueue<MockResponse> responses=new LinkedBlockingQueue<>();
    final AtomicInteger batches=new AtomicInteger(), attempts=new AtomicInteger();
    Field hostField,auditField; Object previousHost,previousAudit;
    final List<Future<?>> submitted=new ArrayList<>();
    final List<CountDownLatch> releases=new ArrayList<>();
    volatile CountDownLatch httpEntered,httpRelease;
    volatile Runnable afterBatch;
    @Rule public org.junit.rules.TestName name=new org.junit.rules.TestName();

    @Before public void before() throws Exception {
        RebuildController.stop();RebuildApi.reset();RebuildStream.fixtureHost="";
        RebuildCache.clear(RuntimeEnvironment.getApplication());
        server=new MockWebServer();server.start();
        server.setDispatcher(new Dispatcher(){public MockResponse dispatch(RecordedRequest r){
            timeline.add("HTTP "+r.getMethod()+" "+r.getPath()+" "+r.getBody().clone().readUtf8());
            if(!"POST".equals(r.getMethod()) || !"/v1/chat/completions".equals(r.getPath()))
                return new MockResponse().setResponseCode(599).setBody("unmapped fixture route");
            MockResponse response=responses.poll();
            if(response==null)throw new AssertionError("unmapped model response");
            CountDownLatch entered=httpEntered,release=httpRelease;
            if(entered!=null){httpEntered=null;entered.countDown();try{assertTrue(release.await(8,TimeUnit.SECONDS));}catch(InterruptedException e){throw new AssertionError(e);}}
            return response;
        }});
        hostField=TranslationRuntime.class.getDeclaredField("host");hostField.setAccessible(true);previousHost=hostField.get(null);
        auditField=TranslationAudit.class.getDeclaredField("sink");auditField.setAccessible(true);previousAudit=auditField.get(null);
        TranslationRuntime.install(new TranslationRuntime.Host(){
            TranslationSettings settings(android.content.Context c){return config();}
            TranslationSourceAccess.Source load(android.content.Context c,String u,boolean t,DeepSeekApiClient.RequestControl control){throw new AssertionError("unmapped source route");}
            void mark(android.content.Context c,String stage,String detail,CaptionCredentialRef ref){timeline.add(stage+" "+detail);}
        });
        TranslationAudit.install(new TranslationAudit.Sink(){
            public TranslationAudit.Request begin(TranslationSettings c,boolean p,int t,int n,int tc,int nc,String bucket){batches.incrementAndGet();if(afterBatch!=null)afterBatch.run();return new TranslationAudit.Request(c);}
            public int attempt(TranslationAudit.Request r,int bytes){return attempts.incrementAndGet();}
            public void failure(TranslationAudit.Request r,int a,TranslationAudit.FailureCategory c,String why){timeline.add("FAIL "+c+" "+why);}
        });
        source=RebuildContractTest.source("Hello world this is first sentence and this is second sentence today.",500);
        block=RebuildContractTest.block(source);
    }
    @After public void after() throws Exception {
        for(CountDownLatch l:releases)l.countDown();
        try {for(Future<?> f:submitted)f.get(6,TimeUnit.SECONDS);}
        finally {
            RebuildController.stop();RebuildApi.reset();RebuildStream.fixtureHost="";
            try {drain();} finally {
                hostField.set(null,previousHost);auditField.set(null,previousAudit);
                System.out.println("M5D_HTTP "+new JSONObject().put("test",name.getMethodName()).put("http",server.getRequestCount())
                    .put("attempts",attempts.get()).put("batches",batches.get()).put("timeline",new JSONArray(timeline)));
                server.shutdown();RebuildCache.clear(RuntimeEnvironment.getApplication());
            }
        }
    }
    TranslationSettings config(){return new TranslationSettings(true,server.url("/v1").toString(),"fixture-model","faithful","fixture-key","stored_custom");}
    RebuildController.Session session() throws Exception {
        return session(false);
    }
    RebuildController.Session session(boolean sourceOnly) throws Exception {
        Field owner=RebuildController.class.getDeclaredField("video");owner.setAccessible(true);
        RebuildController.Session s=new RebuildController.Session(RuntimeEnvironment.getApplication(),"fixture",(String)owner.get(null),"scope","zh-Hans",config(),sourceOnly,true,language);
        s.visible=false; // Drive scheduling explicitly; render's page grace must not mask admission.
        s.source=source;s.blocks=Collections.singletonList(block);s.cacheKey=RebuildCache.identity(source,s.config,"zh-Hans",language);
        s.states=new int[]{RebuildController.WAITING};s.attempts=new int[1];s.retryAt=new long[1];s.reasons=new String[1];
        s.plans=new RebuildProtocol.Plan[1];s.pendingPlans=new RebuildProtocol.Plan[1];s.provisional=new RebuildProtocol.Plan[1];
        Field layouts=RebuildController.Session.class.getDeclaredField("displayLayouts");layouts.setAccessible(true);layouts.set(s,Array.newInstance(layouts.getType().getComponentType(),1));
        s.jobs=new RebuildController.Job[1];s.cacheChecked=new boolean[]{true};s.slowRetries=new int[1];s.pageRepairCount=new int[1];s.uncoveredSince=new long[1];
        Field active=RebuildController.class.getDeclaredField("active");active.setAccessible(true);active.set(null,s);return s;
    }
    Object invoke(String n,Class<?>[] types,Object... args) throws Exception {
        Method m=RebuildController.class.getDeclaredMethod(n,types);m.setAccessible(true);
        try{return m.invoke(null,args);}catch(InvocationTargetException e){throw new AssertionError(n,e.getCause());}
    }
    void one(String n,RebuildController.Session s) throws Exception {invoke(n,new Class<?>[]{RebuildController.Session.class},s);}
    void page(RebuildController.Session s,long at) throws Exception {
        invoke("requestPageRepair",new Class<?>[]{RebuildController.Session.class,int.class,long.class},s,0,at);
        drain();
        counts(s,"page");
    }
    // Two barriers ensure neither lane worker is still executing the preceding repair.
    ExecutorService lane() throws Exception {Field f=RebuildController.class.getDeclaredField("PRIORITY_IO");f.setAccessible(true);return (ExecutorService)f.get(null);}
    void drain() throws Exception {
        CountDownLatch both=new CountDownLatch(2);List<Future<?>> fs=new ArrayList<>();
        for(int i=0;i<2;i++)fs.add(lane().submit(()->{both.countDown();try{assertTrue(both.await(6,TimeUnit.SECONDS));}catch(InterruptedException e){throw new AssertionError(e);}}));
        for(Future<?> f:fs)f.get(7,TimeUnit.SECONDS);
    }
    void ordinary(RebuildController.Session s) throws Exception {
        RebuildController.Job j=new RebuildController.Job(s,0,true);s.jobs[0]=j;s.states[0]=RebuildController.RUNNING;s.attempts[0]++;
        invoke("translate",new Class<?>[]{RebuildController.Job.class},j);
        counts(s,"ordinary");
    }
    void hole(RebuildController.Session s) throws Exception {
        invoke("fillHoles",new Class<?>[]{RebuildController.Session.class,RebuildController.Job.class,RebuildPlanner.Block.class,RebuildProtocol.Plan.class},
                s,new RebuildController.Job(s,0,true),block,s.plans[0]);
        counts(s,"hole");
    }
    RebuildProtocol.Plan retained(RebuildController.Session s){
        RebuildSource.Word w=source.words.get(0);
        RebuildProtocol.Plan p=new RebuildProtocol.Plan(Collections.singletonList(new RebuildProtocol.Event(0,0,w.start,w.end,"已有有效译文")),"",Collections.emptyList(),0,true,
                Collections.singletonList(new int[]{6,11}));s.plans[0]=p;s.states[0]=RebuildController.READY;return p;
    }
    void advance(long ms){org.robolectric.shadows.ShadowSystemClock.advanceBy(java.time.Duration.ofMillis(ms));timeline.add("CLOCK "+SystemClock.elapsedRealtime());}
    void respond(MockResponse r){responses.add(r);}
    MockResponse error(int status,String body,String delay){timeline.add("FIXTURE_RESPONSE "+status+" "+body+" Retry-After="+delay);MockResponse r=new MockResponse().setResponseCode(status).setBody(body);if(delay!=null)r.setHeader("Retry-After",delay);return r;}
    MockResponse success(int from,int to) throws Exception {
        RebuildPlanner.Block b=new RebuildPlanner.Block(0,from,to,source);
        String text=RebuildContractTest.reply(b,new JSONArray().put(RebuildContractTest.event(from,to,"这是完整有效的译文。").put("source",source.text(from,to))));
        return new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject().put("finish_reason","stop")
                .put("message",new JSONObject().put("content",text)))).toString());
    }
    @Test public void ordinary429MustBlockPageWithoutSpendingItsQuota() throws Exception {
        RebuildController.Session s=session();respond(error(429,"fixture rate limit","300"));ordinary(s);
        assertEquals(1,server.getRequestCount());assertEquals(SystemClock.elapsedRealtime()+300000,s.providerRetry);
        respond(success(0,5));page(s,500);
        assertEquals("provider wait must forbid page POST",1,server.getRequestCount());assertEquals(0,s.pageRepairCount[0]);assertTrue(s.pageRepairs.isEmpty());
    }
    @Test public void ordinaryFilterMustBlockSameParentPage() throws Exception {
        RebuildController.Session s=session();respond(error(400,"data_inspection_failed",null));ordinary(s);
        assertEquals(RebuildController.FAILED,s.states[0]);assertFalse(s.terminal);
        respond(success(0,5));page(s,500);
        assertEquals("content_filter must forbid another page POST",1,server.getRequestCount());assertEquals(0,s.pageRepairCount[0]);
    }

    void counts(RebuildController.Session s,String stage){timeline.add("COUNTS "+stage+" parent="+s.attempts[0]+" page="+s.pageRepairCount[0]+" slow="+s.slowRetries[0]
            +" repairs="+s.repairCount+" state="+s.states[0]+" retryAt="+s.retryAt[0]+" provider="+s.providerRetry+" terminal="+s.terminal
            +" batches="+batches+" attempts="+attempts+" received="+server.getRequestCount());}
    void noNewRequests(RebuildController.Session s,int expected) throws Exception {
        int a=attempts.get(),b=batches.get(),p=s.pageRepairCount[0],h=s.slowRetries[0];
        page(s,3500);hole(s);int state=s.states[0];s.states[0]=RebuildController.WAITING;one("schedule",s);drain();s.states[0]=state;
        assertEquals(expected,server.getRequestCount());assertEquals(a,attempts.get());assertEquals(b,batches.get());
        assertEquals(p,s.pageRepairCount[0]);assertEquals(h,s.slowRetries[0]);assertNull(s.jobs[0]);
    }
    @Test public void providerAndLocalWaitEachGatePageAndHoleThenRecoverAtDeadline() throws Exception {
        for(boolean provider:new boolean[]{true,false}){
            RebuildController.Session s=session();respond(error(provider?429:408,"fixture wait","300"));ordinary(s);
            RebuildProtocol.Plan old=retained(s);long gate=s.retryAt[0];
            if(provider)s.retryAt[0]=0;else assertEquals(0,s.providerRetry);
            int count=server.getRequestCount();noNewRequests(s,count);advance(gate-SystemClock.elapsedRealtime()-1);noNewRequests(s,count);
            assertSame(old,s.plans[0]);assertEquals(0,s.pageRepairCount[0]);assertEquals(0,s.slowRetries[0]);
            advance(1);respond(success(6,11));page(s,3500);
            assertEquals(count+1,server.getRequestCount());assertEquals(1,s.pageRepairCount[0]);assertTrue(s.plans[0].events.stream().anyMatch(e->e.from==6));
            assertSame("old event identity retained",old.events.get(0),s.plans[0].events.get(0));
        }
    }
    @Test public void blockedHoleSpendsNothingAndOriginalSingleHoleCanRecover() throws Exception {
        RebuildController.Session s=session();respond(error(408,"local wait","300"));ordinary(s);RebuildProtocol.Plan old=retained(s);
        hole(s);assertEquals(0,s.slowRetries[0]);assertSame(old,s.plans[0]);assertEquals(1,server.getRequestCount());
        advance(299999);hole(s);assertEquals(1,server.getRequestCount());advance(1);
        respond(success(6,11));s.visible=true;try{one("kick",s);drain();}finally{s.visible=false;}
        assertEquals("normal kick resumes the unspent hole",2,server.getRequestCount());assertEquals(1,s.slowRetries[0]);
        assertSame(old.events.get(0),s.plans[0].events.get(0));hole(s);assertEquals("one admitted hole only",2,server.getRequestCount());
    }
    @Test public void page503EstablishesGatesPreservesPlanAndDifferentPageRecovers() throws Exception {
        RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);
        respond(error(503,"page unavailable","300"));page(s,3500);
        long gate=SystemClock.elapsedRealtime()+300000;assertEquals(gate,s.retryAt[0]);assertEquals(gate,s.providerRetry);
        assertSame(old,s.plans[0]);assertEquals(RebuildController.READY,s.states[0]);assertEquals(1,s.pageRepairCount[0]);
        noNewRequests(s,1);advance(299999);noNewRequests(s,1);advance(1);
        // The failed same page remains deduplicated; the other uncovered page keeps its old right.
        page(s,3500);assertEquals(1,server.getRequestCount());respond(success(0,5));page(s,500);
        assertEquals(2,server.getRequestCount());assertEquals(2,s.pageRepairCount[0]);assertEquals(0,s.attempts[0]);
    }
    @Test public void hole429EstablishesGatesForOrdinaryAndPageWithPlanRetained() throws Exception {
        RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);
        respond(error(429,"hole rate limit","300"));hole(s);
        assertSame(old,s.plans[0]);assertEquals(RebuildController.READY,s.states[0]);assertEquals(1,s.slowRetries[0]);
        assertEquals(SystemClock.elapsedRealtime()+300000,s.providerRetry);noNewRequests(s,1);
        // Explicit WAITING represents a pending ordinary repair; the provider gate still wins.
        s.states[0]=RebuildController.WAITING;one("schedule",s);assertNull(s.jobs[0]);assertEquals(0,s.attempts[0]);
        advance(300000);respond(success(6,11));page(s,3500);assertEquals(2,server.getRequestCount());
        assertSame(old.events.get(0),s.plans[0].events.get(0));assertEquals(1,s.pageRepairCount[0]);
    }
    @Test public void hugeChildDelaySaturatesBothGatesAndNeverWraps() throws Exception {
        for(boolean page:new boolean[]{true,false}){
            RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);
            respond(error(429,"huge child wait","99999999999999999999999999999999"));
            if(page)page(s,3500);else hole(s);
            assertEquals(Long.MAX_VALUE,s.providerRetry);assertEquals(Long.MAX_VALUE,s.retryAt[0]);advance(300000);
            noNewRequests(s,page?1:2);s.providerRetry=0;noNewRequests(s,page?1:2);assertSame(old,s.plans[0]);
        }
    }
    void filteredChild(boolean page,boolean finishReason) throws Exception {
        RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);
        respond(finishReason?new MockResponse().setBody("{\"choices\":[{\"finish_reason\":\"content_filter\",\"message\":{\"content\":\"\"}}]}")
                :error(422,"data_inspection_failed",null));
        if(page)page(s,3500);else hole(s);
        assertSame(old,s.plans[0]);assertEquals(RebuildController.READY,s.states[0]);assertFalse(s.terminal);
        advance(300000);noNewRequests(s,1);one("resetDisplay",s);noNewRequests(s,1);
        // READY is retained content, not authorization for an ordinary retry after a seek.
        s.states[0]=RebuildController.WAITING;one("schedule",s);drain();assertNull(s.jobs[0]);assertEquals(1,server.getRequestCount());
        // A different parent in this very Session remains eligible.
        RebuildPlanner.Block other=new RebuildPlanner.Block(1,0,source.words.size()-1,source);
        s.blocks=Arrays.asList(block,other);s.states=new int[]{RebuildController.READY,RebuildController.WAITING};
        s.attempts=new int[2];s.retryAt=new long[2];s.reasons=new String[2];s.plans=new RebuildProtocol.Plan[]{old,null};
        s.pendingPlans=new RebuildProtocol.Plan[2];s.provisional=new RebuildProtocol.Plan[2];s.jobs=new RebuildController.Job[2];s.cacheChecked=new boolean[]{true,true};
        s.slowRetries=new int[2];s.pageRepairCount=new int[2];s.uncoveredSince=new long[2];
        RebuildController.Job j=new RebuildController.Job(s,1,true);s.jobs[1]=j;s.attempts[1]=1;
        String text=RebuildContractTest.reply(other,new JSONArray().put(RebuildContractTest.event(0,11,"另一块的有效译文。").put("source",source.text(0,11))));
        respond(new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject().put("message",new JSONObject().put("content",text)))).toString()));
        invoke("translate",new Class<?>[]{RebuildController.Job.class},j);assertEquals(2,server.getRequestCount());assertNotNull(s.plans[1]);assertFalse(s.terminal);
        RebuildController.Session fresh=session();respond(success(0,5));page(fresh,500);assertEquals(3,server.getRequestCount());
    }
    @Test public void inspectedPageStopsOnlyParentAcrossSeekAndFreshSessionWorks() throws Exception {filteredChild(true,false);}
    @Test public void finishFilteredHoleStopsOnlyParentAcrossSeekAndFreshSessionWorks() throws Exception {filteredChild(false,true);}
    @Test public void childConfigurationStopsEveryNewLogicalRequestButRetainsContent() throws Exception {
        for(boolean page:new boolean[]{true,false}){
            RebuildApi.reset();RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);
            respond(error(401,"fixture invalid configuration",null));if(page)page(s,3500);else hole(s);
            assertTrue(s.terminal);assertSame(old,s.plans[0]);assertEquals(RebuildController.READY,s.states[0]);
            advance(300000);noNewRequests(s,page?1:2);one("resetDisplay",s);noNewRequests(s,page?1:2);
            s.states[0]=RebuildController.WAITING;one("schedule",s);drain();assertNull(s.jobs[0]);
        }
    }
    CountDownLatch holdLane() throws Exception {
        CountDownLatch entered=new CountDownLatch(2),release=new CountDownLatch(1);releases.add(release);
        for(int i=0;i<2;i++)submitted.add(lane().submit(()->{entered.countDown();try{assertTrue(release.await(8,TimeUnit.SECONDS));}catch(InterruptedException e){throw new AssertionError(e);}}));
        assertTrue(entered.await(3,TimeUnit.SECONDS));return release;
    }
    @Test public void queuedPageRechecksWaitReturnsReservationAndRecoversAtDeadline() throws Exception {
        RebuildController.Session s=session();CountDownLatch release=holdLane();
        try {
            invoke("requestPageRepair",new Class<?>[]{RebuildController.Session.class,int.class,long.class},s,0,500L);
            assertEquals(1,s.pageRepairCount[0]);assertEquals(1,s.pageRepairs.size());
            respond(error(429,"wait established while page queued","300"));ordinary(s);
        }finally{release.countDown();}
        drain();assertEquals(1,server.getRequestCount());assertEquals(0,s.pageRepairCount[0]);assertTrue(s.pageRepairs.isEmpty());
        advance(299999);page(s,500);assertEquals(1,server.getRequestCount());advance(1);respond(success(0,5));page(s,500);
        assertEquals(2,server.getRequestCount());assertEquals(1,s.pageRepairCount[0]);
    }
    @Test public void queuedPagesRecheckFilterAndTerminalWithoutSpendingQuota() throws Exception {
        int sent=0;
        for(int status:new int[]{400,401}){
            RebuildApi.reset();RebuildController.Session s=session();CountDownLatch release=holdLane();
            try {
                invoke("requestPageRepair",new Class<?>[]{RebuildController.Session.class,int.class,long.class},s,0,500L);
                respond(error(status,status==400?"data_inspection_failed":"fixture bad key",null));ordinary(s);sent++;
            }finally{release.countDown();}
            drain();assertEquals(sent,server.getRequestCount());assertEquals(0,s.pageRepairCount[0]);assertTrue(s.pageRepairs.isEmpty());
        }
    }
    @Test public void queuedOrdinaryRechecksChildGateAndReturnsAttemptAndRepairQuota() throws Exception {
        RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);s.attempts[0]=1;s.states[0]=RebuildController.WAITING;
        CountDownLatch release=holdLane();RebuildController.Job queued;
        try {
            one("schedule",s);queued=s.jobs[0];assertNotNull(queued);assertEquals(2,s.attempts[0]);assertEquals(1,s.repairCount);
            respond(error(503,"hole failed while ordinary queued","300"));hole(s);
            assertSame("child failure must not clear another job",queued,s.jobs[0]);
        }finally{release.countDown();}
        drain();assertEquals(1,server.getRequestCount());assertNull(s.jobs[0]);assertEquals(1,s.attempts[0]);assertEquals(0,s.repairCount);
        assertEquals(1,s.slowRetries[0]);assertSame(old,s.plans[0]);assertEquals(1,batches.get());
        assertEquals(RebuildController.WAITING,s.states[0]);
        advance(300000);respond(success(0,11));one("schedule",s);drain();assertEquals(2,server.getRequestCount());
        assertEquals(2,s.attempts[0]);assertEquals(1,s.repairCount);assertNotNull(s.plans[0]);
    }
    @Test public void sourceOnlyHasZeroModelsAtAllThreeEntries() throws Exception {
        RebuildController.Session s=session(true);
        retained(s);noNewRequests(s,0);assertEquals(0,batches.get());
    }
    @Test public void queuedOrdinaryRechecksFilterAndConfigurationWithRetainedReadyPlan() throws Exception {
        int sent=0;
        for(int status:new int[]{400,401}){
            RebuildApi.reset();RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);s.states[0]=RebuildController.WAITING;
            CountDownLatch release=holdLane();
            try {
                one("schedule",s);assertNotNull(s.jobs[0]);respond(error(status,status==400?"data_inspection_failed":"fixture bad key",null));hole(s);sent++;
            }finally{release.countDown();}
            drain();assertEquals(sent,server.getRequestCount());assertNull(s.jobs[0]);assertEquals(0,s.attempts[0]);assertSame(old,s.plans[0]);
            assertEquals(RebuildController.READY,s.states[0]);
        }
    }
    void expand(RebuildController.Session s,int n){
        List<RebuildPlanner.Block> blocks=new ArrayList<>();for(int i=0;i<n;i++)blocks.add(new RebuildPlanner.Block(i,i==0?0:6,11,source));s.blocks=blocks;
        s.states=new int[n];s.attempts=new int[n];s.retryAt=new long[n];s.reasons=new String[n];s.plans=new RebuildProtocol.Plan[n];
        s.pendingPlans=new RebuildProtocol.Plan[n];s.provisional=new RebuildProtocol.Plan[n];s.jobs=new RebuildController.Job[n];s.cacheChecked=new boolean[n];Arrays.fill(s.cacheChecked,true);
        s.slowRetries=new int[n];s.pageRepairCount=new int[n];s.uncoveredSince=new long[n];
    }
    @Test public void pendingSlowRetryDeniedByNewWaitReturnsReservationAndCanResume() throws Exception {
        RebuildController.Session s=session();expand(s,3);s.attempts[0]=2;
        for(int i=1;i<3;i++){s.jobs[i]=new RebuildController.Job(s,i,true);s.jobs[i].dispatched=true;s.states[i]=RebuildController.RUNNING;s.attempts[i]=1;}
        one("schedule",s);assertNotNull(s.pendingFocus);assertEquals(1,s.slowRetries[0]);assertFalse(s.pendingFocus.dispatched);
        respond(error(503,"another parent establishes wait","300"));invoke("translate",new Class<?>[]{RebuildController.Job.class},s.jobs[1]);
        one("schedule",s);assertNull(s.pendingFocus);assertNull(s.jobs[0]);assertEquals(2,s.attempts[0]);assertEquals(0,s.slowRetries[0]);assertEquals(1,server.getRequestCount());
        advance(300000);respond(success(0,11));one("schedule",s);drain();assertEquals(2,server.getRequestCount());assertEquals(1,s.slowRetries[0]);assertNotNull(s.plans[0]);
    }
    Future<?> holdHole(RebuildController.Session s,MockResponse response) throws Exception {
        CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);httpEntered=entered;httpRelease=release;releases.add(release);respond(response);
        FutureTask<Void> f=new FutureTask<>(()->{hole(s);return null;});Thread t=new Thread(f,"M5d-fixture-child");t.setDaemon(true);submitted.add(f);t.start();
        assertTrue(entered.await(3,TimeUnit.SECONDS));return f;
    }
    @Test public void overlappingShortChildFailureCannotShortenEstablishedGates() throws Exception {
        RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);
        Future<?> pending=holdHole(s,error(429,"short admitted child failure","1"));
        try {
            // This logical hole was legally admitted before the later, longer page failure.
            respond(error(503,"long page wait","300"));page(s,3500);long gate=s.providerRetry;
            assertEquals(SystemClock.elapsedRealtime()+300000,gate);httpRelease.countDown();pending.get(4,TimeUnit.SECONDS);
            assertEquals(gate,s.providerRetry);assertEquals(gate,s.retryAt[0]);assertSame(old,s.plans[0]);assertEquals(2,server.getRequestCount());
            noNewRequests(s,2);
        }finally{httpRelease.countDown();}
    }
    Future<?> holdOrdinary(RebuildController.Session s,MockResponse response) throws Exception {
        CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);
        httpEntered=entered;httpRelease=release;releases.add(release);respond(response);
        FutureTask<Void> f=new FutureTask<>(()->{ordinary(s);return null;});
        Thread t=new Thread(f,"M5d-R1-fixture-ordinary");t.setDaemon(true);submitted.add(f);t.start();
        assertTrue(entered.await(3,TimeUnit.SECONDS));return f;
    }
    @Test public void laterOrdinaryFailureMustRespectEarlierLongChildDeadline() throws Exception {
        RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);
        Future<?> pending=holdOrdinary(s,error(408,"older ordinary response withheld",null));
        try {
            respond(error(408,"child long parent wait","300"));hole(s);
            long gate=s.retryAt[0];assertEquals(SystemClock.elapsedRealtime()+300000,gate);assertEquals(0,s.providerRetry);
            httpRelease.countDown();pending.get(4,TimeUnit.SECONDS);
            long afterOrdinary=s.retryAt[0];advance(1200);respond(success(6,11));
            // This same assertion reproduces the coordinator's third POST on unmodified m5d.
            page(s,3500);assertEquals("earlier 300s child deadline must still forbid a new page POST",2,server.getRequestCount());
            noNewRequests(s,2);
            timeline.add("R1_WAIT established="+gate+" afterOrdinary="+afterOrdinary+" now="+SystemClock.elapsedRealtime());
            assertEquals("late ordinary failure must retain the parent gate",gate,afterOrdinary);
            assertSame(old,s.plans[0]);assertEquals(1,s.attempts[0]);assertEquals(1,s.slowRetries[0]);assertEquals(0,s.repairCount);
            advance(gate-SystemClock.elapsedRealtime()-1);noNewRequests(s,2);advance(1);page(s,3500);
            assertEquals(3,server.getRequestCount());assertEquals(3,attempts.get());assertEquals(3,batches.get());
            assertEquals(1,s.pageRepairCount[0]);assertEquals(1,s.slowRetries[0]);assertEquals(1,s.attempts[0]);
            assertSame(old.events.get(0),s.plans[0].events.get(0));assertTrue(s.plans[0].events.stream().anyMatch(e->e.from==6));
        }finally{httpRelease.countDown();pending.get(5,TimeUnit.SECONDS);}
    }
    @Test public void laterShortChildFailureRetainsOrdinaryParentOnlyWaitAndRecovers() throws Exception {
        RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);
        Future<?> pending=holdHole(s,error(408,"earlier short hole withheld",null));
        try {
            respond(error(408,"ordinary establishes parent only wait","300"));ordinary(s);
            long gate=s.retryAt[0];assertEquals(SystemClock.elapsedRealtime()+300000,gate);assertEquals(0,s.providerRetry);
            httpRelease.countDown();pending.get(4,TimeUnit.SECONDS);assertEquals(gate,s.retryAt[0]);noNewRequests(s,2);
            advance(299999);noNewRequests(s,2);assertSame(old,s.plans[0]);advance(1);respond(success(6,11));page(s,3500);
            assertEquals(3,server.getRequestCount());assertEquals(1,s.pageRepairCount[0]);assertEquals(1,s.slowRetries[0]);
            assertSame(old.events.get(0),s.plans[0].events.get(0));
        }finally{httpRelease.countDown();pending.get(5,TimeUnit.SECONDS);}
    }
    @Test public void lateOrdinaryFailureRetainsSaturatedChildAndProviderGates() throws Exception {
        RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);
        Future<?> pending=holdOrdinary(s,error(408,"short ordinary withheld",null));
        try {
            respond(error(429,"huge child wait","99999999999999999999999999999999"));hole(s);
            httpRelease.countDown();pending.get(4,TimeUnit.SECONDS);
            assertEquals(Long.MAX_VALUE,s.retryAt[0]);assertEquals(Long.MAX_VALUE,s.providerRetry);
            advance(300000);noNewRequests(s,2);s.providerRetry=0;noNewRequests(s,2);assertSame(old,s.plans[0]);
        }finally{httpRelease.countDown();pending.get(5,TimeUnit.SECONDS);}
    }
    @Test public void seekCancelledUnsentOrdinaryReturnsQuotaWithoutErasingChildWait() throws Exception {
        RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);RebuildController.time(0);
        CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);releases.add(release);
        afterBatch=()->{if(batches.get()==1){entered.countDown();try{assertTrue(release.await(6,TimeUnit.SECONDS));}catch(InterruptedException e){throw new AssertionError(e);}}};
        FutureTask<Void> pending=new FutureTask<>(()->{ordinary(s);return null;});submitted.add(pending);
        Thread worker=new Thread(pending,"M5d-R1-unsent");worker.setDaemon(true);worker.start();
        try {
            assertTrue(entered.await(3,TimeUnit.SECONDS));RebuildController.Job j=s.jobs[0];assertFalse(j.sent);
            respond(error(408,"hole wait before seek cancellation","300"));hole(s);long gate=s.retryAt[0];
            RebuildController.time(20000);assertTrue("real seek cancels offscreen unsent job",j.cancelled);
            release.countDown();pending.get(4,TimeUnit.SECONDS);s.position=0;
            assertEquals(gate,s.retryAt[0]);assertEquals(0,s.providerRetry);assertEquals(0,s.attempts[0]);assertEquals(0,s.repairCount);
            assertSame(old,s.plans[0]);assertNull(s.jobs[0]);noNewRequests(s,1);
            advance(gate-SystemClock.elapsedRealtime()-1);noNewRequests(s,1);advance(1);respond(success(6,11));page(s,3500);
            assertEquals(2,server.getRequestCount());assertEquals(2,attempts.get());assertEquals(3,batches.get());
        }finally{release.countDown();pending.get(5,TimeUnit.SECONDS);worker.join(1000);assertFalse(worker.isAlive());}
    }
    @Test public void lateSuccessfulOrdinaryReviewCannotEraseChildWait() throws Exception {
        source=RebuildContractTest.source("They aren't always happy with this first sentence and this second sentence today.",500);
        block=RebuildContractTest.block(source);int last=source.words.size()-1;
        RebuildController.Session s=session();retained(s);
        String content=RebuildContractTest.reply(block,new JSONArray().put(RebuildContractTest.event(0,last,"他们通常不喜欢这两个完整的句子。")
                .put("source",source.text(0,last))));
        MockResponse review=new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject()
                .put("finish_reason","stop").put("message",new JSONObject().put("content",content)))).toString());
        Future<?> pending=holdOrdinary(s,review);
        try {
            respond(error(408,"hole wait before successful review","300"));hole(s);long gate=s.retryAt[0];
            httpRelease.countDown();pending.get(4,TimeUnit.SECONDS);
            assertEquals(RebuildController.WAITING,s.states[0]);assertTrue(s.reasons[0].contains("possible_polarity_change"));
            assertNotNull(s.plans[0]);assertFalse(s.plans[0].partial);assertEquals(gate,s.retryAt[0]);assertEquals(0,s.providerRetry);
            RebuildProtocol.Plan accepted=s.plans[0];noNewRequests(s,2);advance(299999);noNewRequests(s,2);assertSame(accepted,s.plans[0]);
            advance(1);respond(success(0,last));one("schedule",s);drain();
            assertEquals(3,server.getRequestCount());assertEquals(2,s.attempts[0]);assertEquals(1,s.repairCount);assertEquals(RebuildController.READY,s.states[0]);
        }finally{httpRelease.countDown();pending.get(5,TimeUnit.SECONDS);}
    }
    @Test public void pendingFocusSlotReleasePreservesSameParentOnlyWait() throws Exception {
        RebuildController.Session s=session();expand(s,3);s.attempts[0]=1;
        for(int i=1;i<3;i++){s.jobs[i]=new RebuildController.Job(s,i,true);s.jobs[i].dispatched=true;s.states[i]=RebuildController.RUNNING;}
        one("schedule",s);assertNotNull(s.pendingFocus);assertFalse(s.pendingFocus.dispatched);assertEquals(1,s.attempts[0]);
        RebuildProtocol.Plan old=retained(s);respond(error(408,"same parent pending slot wait","300"));hole(s);long gate=s.retryAt[0];
        one("schedule",s);assertNull(s.pendingFocus);assertNull(s.jobs[0]);assertEquals(gate,s.retryAt[0]);assertEquals(0,s.providerRetry);
        assertEquals(1,s.attempts[0]);assertEquals(0,s.repairCount);assertSame(old,s.plans[0]);noNewRequests(s,1);
        advance(299999);noNewRequests(s,1);advance(1);respond(success(6,11));page(s,3500);assertEquals(2,server.getRequestCount());
    }
    @Test public void admittedSuccessfulHoleKeepsLaterOrdinaryWaitAndOriginalEvents() throws Exception {
        RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);
        Future<?> pending=holdHole(s,success(6,11));
        try {
            respond(error(408,"ordinary wait while successful hole is held","300"));ordinary(s);long gate=s.retryAt[0];
            httpRelease.countDown();pending.get(4,TimeUnit.SECONDS);
            assertEquals(gate,s.retryAt[0]);assertEquals(0,s.providerRetry);assertEquals(RebuildController.READY,s.states[0]);
            assertSame(old.events.get(0),s.plans[0].events.get(0));assertTrue(s.plans[0].events.stream().anyMatch(e->e.from==6));
            noNewRequests(s,2);advance(299999);noNewRequests(s,2);advance(1);respond(success(0,5));page(s,500);
            assertEquals(3,server.getRequestCount());assertEquals(1,s.pageRepairCount[0]);assertEquals(1,s.slowRetries[0]);
            assertSame(old.events.get(0),s.plans[0].events.get(0));
        }finally{httpRelease.countDown();pending.get(5,TimeUnit.SECONDS);}
    }
    @Test public void oldGenerationHoleCannotPublishButItsFilterStillStopsSameSessionParent() throws Exception {
        RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);
        Future<?> pending=holdHole(s,error(400,"data_inspection_failed",null));
        try {one("resetDisplay",s);httpRelease.countDown();pending.get(4,TimeUnit.SECONDS);assertSame(old,s.plans[0]);advance(300000);noNewRequests(s,1);}
        finally{httpRelease.countDown();}
    }
    @Test public void oldGenerationSuccessfulHoleCannotMergeIntoNewDisplayGeneration() throws Exception {
        RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);Future<?> pending=holdHole(s,success(6,11));
        try {one("resetDisplay",s);httpRelease.countDown();pending.get(4,TimeUnit.SECONDS);assertSame(old,s.plans[0]);assertEquals(1,server.getRequestCount());}
        finally{httpRelease.countDown();}
    }
    @Test public void childConfigurationFailureKeepsAlreadyDisplayedTranslationAndGuardValid() throws Exception {
        RebuildController.Session s=session();RebuildProtocol.Plan old=retained(s);
        Field output=TranslationOutput.class.getDeclaredField("sink");output.setAccessible(true);Object previous=output.get(null);
        List<String> shown=new ArrayList<>(),statuses=new ArrayList<>();List<TranslationOutput.RenderGuard> guards=new ArrayList<>();
        TranslationOutput.install(new TranslationOutput.Sink(){
            public void showEvent(String text,TranslationOutput.RenderGuard guard,String id,long start,long end,long at,CaptionRenderSpec spec){
                if(guard.isValid()){shown.add(text);guards.add(guard);guard.onApplied();}}
            public void showStatus(String text,TranslationOutput.RenderGuard guard){if(guard.isValid())statuses.add(text);}
        });
        try {
            s.visible=true;s.position=0;one("render",s);assertTrue(shown.contains("已有有效译文"));
            respond(error(401,"fixture bad key",null));page(s,3500);
            assertTrue(s.terminal);assertSame(old,s.plans[0]);assertTrue(guards.get(0).isValid());
            s.lastShown="";s.visible=true;one("render",s);assertEquals(Arrays.asList("已有有效译文","已有有效译文"),shown);
            assertTrue(statuses.isEmpty());assertEquals(1,server.getRequestCount());
        }finally{s.visible=false;output.set(null,previous);}
    }
    @Test public void deferredQueuedHoleRechecksChangedGateAndNormalKickRecovers() throws Exception {
        RebuildController.Session s=session();respond(error(408,"first local wait","300"));ordinary(s);RebuildProtocol.Plan old=retained(s);hole(s);
        assertEquals(0,s.slowRetries[0]);assertTrue(s.pendingHoles.contains(0));advance(300000);
        CountDownLatch release=holdLane();
        try {
            s.visible=true;one("kick",s);s.visible=false;assertTrue(s.queuedHoles.contains(0));
            respond(error(429,"second wait while deferred hole queued","300"));ordinary(s);
        }finally{s.visible=false;release.countDown();}
        drain();assertSame(old,s.plans[0]);assertEquals(0,s.slowRetries[0]);assertTrue(s.pendingHoles.contains(0));assertTrue(s.queuedHoles.isEmpty());assertEquals(2,server.getRequestCount());
        advance(299999);s.visible=true;try{one("kick",s);drain();assertEquals(2,server.getRequestCount());advance(1);respond(success(6,11));one("kick",s);drain();}
        finally{s.visible=false;}
        assertEquals(3,server.getRequestCount());assertEquals(1,s.slowRetries[0]);assertTrue(s.pendingHoles.isEmpty());
        assertSame(old.events.get(0),s.plans[0].events.get(0));
    }
    @Test public void pageCapAndAdmittedFailureDedupRemainFourWithoutSamePageRetry() throws Exception {
        source=RebuildContractTest.source(String.join(" ",Collections.nCopies(30,"word")),500);block=RebuildContractTest.block(source);
        RebuildController.Session s=session();
        for(int i=0;i<4;i++){
            respond(error(408,"fixture retryable page failure",null));page(s,500+i*3000);assertEquals(i+1,server.getRequestCount());advance(1200);
        }
        page(s,500);page(s,12500);assertEquals(4,server.getRequestCount());assertEquals(4,s.pageRepairCount[0]);assertEquals(4,s.pageRepairs.size());
        assertEquals(0,s.attempts[0]);assertEquals(0,s.slowRetries[0]);
    }
    @Test public void legallyAdmittedPageCancelledBeforeFirstAttemptKeepsItsReservation() throws Exception {
        RebuildController.Session s=session();afterBatch=()->s.cancel();page(s,500);
        assertEquals(1,batches.get());assertEquals(0,attempts.get());assertEquals(0,server.getRequestCount());
        assertEquals(1,s.pageRepairCount[0]);assertEquals(1,s.pageRepairs.size());
    }
    @Test public void boundedHistoryClearCannotLoseOwnershipOfDeniedQueuedPageQuota() throws Exception {
        RebuildController.Session s=session();CountDownLatch release=holdLane();
        try {
            invoke("requestPageRepair",new Class<?>[]{RebuildController.Session.class,int.class,long.class},s,0,500L);
            // The existing bounded history may clear while earlier reservations are still queued.
            for(int i=0;i<129;i++)s.pageRepairs.add("fixture-history-"+i);
            invoke("requestPageRepair",new Class<?>[]{RebuildController.Session.class,int.class,long.class},s,0,3500L);
            assertEquals(2,s.pageRepairCount[0]);assertEquals(2,s.queuedPages.size());
            respond(error(429,"queued pages now gated","300"));ordinary(s);
        }finally{release.countDown();}
        drain();assertEquals(1,server.getRequestCount());assertEquals(0,s.pageRepairCount[0]);assertTrue(s.pageRepairs.isEmpty());assertTrue(s.queuedPages.isEmpty());
        advance(300000);respond(success(0,5));page(s,500);assertEquals(2,server.getRequestCount());assertEquals(1,s.pageRepairCount[0]);
    }
}
