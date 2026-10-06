package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.Context;
import android.os.Looper;
import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicReference;
import okhttp3.mockwebserver.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.util.ReflectionHelpers.ClassParameter;

/** Real production lifecycle/HTTP/cache entries, with latches at the actual competing boundaries. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28, shadows={RebuildIntegrationTest.Keys.class, SchedulerLifecycleRegressionTest.CacheBoundary.class,
    SchedulerLifecycleRegressionTest.CommitBoundary.class, SchedulerLifecycleRegressionTest.OverlayBoundary.class})
@LooperMode(LooperMode.Mode.PAUSED)
public class SchedulerLifecycleRegressionTest {
  private static final long ROUND_SECONDS = 5;
  RebuildIntegrationTest h;
  final AtomicReference<Throwable> error = new AtomicReference<>();
  final List<Thread> threads = new ArrayList<>();
  final List<CountDownLatch> releases = new ArrayList<>();

  @Implements(RebuildCache.class)
  public static class CacheBoundary {
    static volatile String readKey, prepareKey;
    static volatile CountDownLatch arrived, release;
    static volatile RebuildController.Session observed;
    static void barrier(String key, boolean preparation) {
      if (!key.equals(preparation ? prepareKey : readKey)) return;
      assertFalse("cache work must be outside Controller", Thread.holdsLock(RebuildController.class));
      assertFalse("cache work must be outside Session", Thread.holdsLock(observed));
      arrived.countDown();
      await(release);
    }
    @Implementation protected static RebuildProtocol.Plan read(Context c, String key,
        RebuildSource source, RebuildPlanner.Block block, CaptionLanguageContext language) {
      RebuildProtocol.Plan plan = Shadow.directlyOn(RebuildCache.class, "read",
          ClassParameter.from(Context.class,c), ClassParameter.from(String.class,key),
          ClassParameter.from(RebuildSource.class,source), ClassParameter.from(RebuildPlanner.Block.class,block),
          ClassParameter.from(CaptionLanguageContext.class,language));
      barrier(key,false);
      return plan;
    }
    @Implementation protected static RebuildCache.Prepared prepare(Context c, String key,
        RebuildSource source, RebuildPlanner.Block block, RebuildProtocol.Plan plan,
        CaptionLanguageContext language) {
      RebuildCache.Prepared prepared = Shadow.directlyOn(RebuildCache.class, "prepare",
          ClassParameter.from(Context.class,c), ClassParameter.from(String.class,key),
          ClassParameter.from(RebuildSource.class,source), ClassParameter.from(RebuildPlanner.Block.class,block),
          ClassParameter.from(RebuildProtocol.Plan.class,plan), ClassParameter.from(CaptionLanguageContext.class,language));
      barrier(key,true);
      return prepared;
    }
  }

  @Implements(RebuildCache.Prepared.class)
  public static class CommitBoundary {
    @RealObject RebuildCache.Prepared prepared;
    static volatile String key;
    static volatile CountDownLatch arrived, release;
    static volatile RebuildController.Session observed;
    @Implementation protected boolean commit() {
      if (key != null && prepared.destination.getName().startsWith(key)) {
        assertFalse(Thread.holdsLock(observed));assertFalse(Thread.holdsLock(RebuildController.class));
        arrived.countDown();await(release);
      }
      return Shadow.directlyOn(prepared, RebuildCache.Prepared.class, "commit");
    }
  }

  @Implements(CaptionOverlay.class)
  public static class OverlayBoundary {
    static volatile String status;
    static volatile CountDownLatch arrived, release;
    static final java.util.concurrent.atomic.AtomicInteger entries=new java.util.concurrent.atomic.AtomicInteger();
    @Implementation protected static void showStatus(String text, CaptionOverlay.RenderGuard guard) {
      if(text.equals(status) && entries.incrementAndGet()==1){arrived.countDown();await(release);}
      Shadow.directlyOn(CaptionOverlay.class,"showStatus",ClassParameter.from(String.class,text),
          ClassParameter.from(CaptionOverlay.RenderGuard.class,guard));
    }
  }

  @Before public void setup() throws Exception {
    CacheBoundary.readKey = CacheBoundary.prepareKey = null;
    CommitBoundary.key = null;
    OverlayBoundary.status=null;OverlayBoundary.entries.set(0);
    h = new RebuildIntegrationTest(); h.setup();
  }
  @After public void cleanup() throws Exception {
    for (CountDownLatch latch : releases) latch.countDown();
    CacheBoundary.readKey = CacheBoundary.prepareKey = null;
    CommitBoundary.key = null;
    OverlayBoundary.status=null;
    for (Thread thread : threads) join(thread);
    h.cleanup();
    if (error.get()!=null) throw new AssertionError("worker failed",error.get());
  }
  static void await(CountDownLatch latch) {
    try { assertTrue("barrier hard timeout",latch.await(ROUND_SECONDS,TimeUnit.SECONDS)); }
    catch (InterruptedException e) { Thread.currentThread().interrupt(); throw new AssertionError(e); }
  }
  static void await(CountDownLatch latch, long deadline) {
    try { assertTrue("round hard timeout",latch.await(Math.max(0,deadline-System.nanoTime()),TimeUnit.NANOSECONDS)); }
    catch(InterruptedException e){Thread.currentThread().interrupt();throw new AssertionError(e);}
  }
  CountDownLatch release() { CountDownLatch latch=new CountDownLatch(1);releases.add(latch);return latch; }
  Thread start(String name, Runnable work) {
    Thread thread=new Thread(()->{try{work.run();}catch(Throwable t){error.compareAndSet(null,t);}},name);
    thread.setDaemon(true);threads.add(thread);thread.start();return thread;
  }
  static void join(Thread thread) throws InterruptedException {
    thread.join(TimeUnit.SECONDS.toMillis(ROUND_SECONDS));
    assertFalse("round hard timeout: "+thread.getName(),thread.isAlive());
  }
  static void blocked(Thread thread) {
    long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(ROUND_SECONDS);
    while(thread.isAlive() && thread.getState()!=Thread.State.BLOCKED && System.nanoTime()<deadline) Thread.yield();
    assertEquals("must enter the real competing monitor",Thread.State.BLOCKED,thread.getState());
  }
  static void blocked(Thread thread, long deadline) {
    while(thread.isAlive() && thread.getState()!=Thread.State.BLOCKED && System.nanoTime()<deadline)Thread.yield();
    assertEquals("must enter competing monitor before round deadline",Thread.State.BLOCKED,thread.getState());
  }
  static void join(Thread thread, long deadline) throws InterruptedException {
    long left=deadline-System.nanoTime();assertTrue("round hard timeout",left>0);
    thread.join(Math.max(1,TimeUnit.NANOSECONDS.toMillis(left)));
    assertFalse("round hard timeout: "+thread.getName(),thread.isAlive());
    assertTrue("round hard timeout",System.nanoTime()<=deadline);
  }
  static void invoke(String method, RebuildController.Session session) {
    try {
      Method entry=RebuildController.class.getDeclaredMethod(method,RebuildController.Session.class);
      entry.setAccessible(true);entry.invoke(null,session);
    } catch (Exception e) { throw new AssertionError(method,e); }
  }
  static void install(RebuildController.Session session) throws Exception {
    Field active=RebuildController.class.getDeclaredField("active");active.setAccessible(true);active.set(null,session);
  }
  String url(String target) { return "https://www.youtube.com/api/timedtext?v=rebuild0001&lang=en&kind=asr&tlang="+target; }
  RebuildController.Session fixture() throws Exception {
    RebuildController.Session s=new RebuildController.Session(h.a,url("zh-Hans"),"rebuild0001",
        "scheduler-fixture","zh-Hans",h.config(),false,true);
    s.source=RebuildContractTest.json("{\"events\":[{\"tStartMs\":0,\"dDurationMs\":2400,\"segs\":[{\"utf8\":\"This is one complete sentence.\"}]}]}");
    s.blocks=RebuildPlanner.plan(s.source,s.languageContext);
    int n=s.blocks.size();s.plans=new RebuildProtocol.Plan[n];s.pendingPlans=new RebuildProtocol.Plan[n];
    s.states=new int[n];s.attempts=new int[n];s.retryAt=new long[n];s.reasons=new String[n];Arrays.fill(s.reasons,"");
    s.jobs=new RebuildController.Job[n];s.cacheChecked=new boolean[n];Arrays.fill(s.cacheChecked,true);
    s.cacheKey=RebuildCache.identity(s.source,s.config,s.target,s.languageContext);return s;
  }
  RebuildProtocol.Plan plan(RebuildController.Session s, String text) throws Exception {
    RebuildPlanner.Block b=s.blocks.get(0);
    String json=new JSONObject().put("block",b.id()).put("events",new JSONArray().put(new JSONObject()
        .put("from",b.from).put("to",b.to).put("source",s.source.text(b.from,b.to)).put("text",text))).toString();
    return RebuildProtocol.parseBound(json,s.source,b,s.languageContext);
  }
  void ready(RebuildController.Session s) throws Exception {
    h.await(()->s.plans!=null && s.plans[0]!=null && s.states[0]==RebuildController.READY);
  }
  void released(RebuildController.Job job) throws Exception {
    h.await(()->CaptionDiagnostics.fullText(h.a).contains("REBUILD_LANE_RELEASED | session="+job.session.id+";request="+job.traceId+";"));
  }
  void armCache(RebuildController.Session s, boolean prepare) {
    CacheBoundary.observed=s;CacheBoundary.arrived=new CountDownLatch(1);CacheBoundary.release=release();
    if(prepare)CacheBoundary.prepareKey=s.cacheKey;else CacheBoundary.readKey=s.cacheKey;
  }

  @Test(timeout=30000) public void stopScheduleCurrentCompeteForTwoHundredRealWindows() throws Exception {
    for(int round=0;round<200;round++) {
      long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(ROUND_SECONDS);
      RebuildController.Session s=fixture();install(s);
      CountDownLatch held=new CountDownLatch(1),go=release();
      Thread scheduler=start("Scheduler-SessionOwner-"+round,()->{synchronized(s){held.countDown();await(go,deadline);invoke("schedule",s);}});
      await(held,deadline);Thread stopper=start("Scheduler-Stop-"+round,RebuildController::stop);blocked(stopper,deadline);
      assertFalse(RebuildController.current(s));assertFalse(s.publication.isOpen());
      // The production stop is waiting for S after it has already released C.
      synchronized(RebuildController.class) { assertFalse(RebuildController.current(s)); }
      go.countDown();join(scheduler,deadline);join(stopper,deadline);
      assertTrue(s.cancelled);assertFalse(s.retired);assertNull(s.pendingFocus);
      assertEquals(1,s.generation);assertEquals(0,s.attempts[0]);assertEquals(0,s.repairCount);
      assertNull(s.jobs[0]);assertNull(s.plans[0]);assertEquals(0,h.calls.get());
    }
    assertNull(error.get());
  }

  @Test(timeout=30000) public void scopeReplacementHasImmediateSentPolicyBeforeRetireFinishes() throws Exception {
    RebuildController.Session old=fixture();install(old);
    RebuildController.Job sent=new RebuildController.Job(old,0,true);sent.sent=true;sent.dispatched=true;
    old.jobs[0]=sent;old.attempts[0]=1;old.states[0]=RebuildController.RUNNING;
    CountDownLatch held=new CountDownLatch(1),go=release();
    Thread scheduler=start("Scheduler-OldScope",()->{synchronized(old){held.countDown();await(go);invoke("schedule",old);}});
    await(held);
    Thread replacing=start("Scheduler-ReplaceScope",()->RebuildController.activate(h.a,url("fr"),false,true));
    blocked(replacing);RebuildController.Session next=h.session();
    assertNotSame(old,next);assertTrue(RebuildController.current(next));assertFalse(RebuildController.current(old));
    assertFalse("sent HTTP remains allowed before retire has acquired Session",sent.isCancelled());
    go.countDown();join(scheduler);join(replacing);ready(next);
    assertTrue(old.retired);assertTrue(old.cancelled);assertNull(old.plans[0]);assertNull(old.pendingFocus);
    assertEquals(1,old.attempts[0]);assertEquals(1,next.attempts[0]);assertEquals(0,next.repairCount);
    assertNotEquals(old.cacheKey,next.cacheKey);assertEquals(1,h.calls.get());
    assertNotNull(RebuildCache.read(h.a,next.cacheKey,next.source,next.blocks.get(0),next.languageContext));
  }

  @Test(timeout=30000) public void realLateHttpCannotPublishOrWriteEitherScope() throws Exception {
    CountDownLatch arrived=new CountDownLatch(1),response=release();
    h.server.setDispatcher(new Dispatcher(){public MockResponse dispatch(RecordedRequest r){
      try {
        h.calls.incrementAndGet();JSONObject p=new JSONObject(new JSONObject(r.getBody().readUtf8()).getJSONArray("messages").getJSONObject(1).getString("content"));
        String text="NEW_SCOPE_ONLY";
        if(p.getString("language").equals("ar")){arrived.countDown();await(response);text="OLD_SCOPE_ONLY";}
        JSONArray words=p.getJSONArray("owned_tokens");
        String plan=new JSONObject().put("block",p.getString("block")).put("events",new JSONArray().put(new JSONObject()
            .put("from",words.getJSONArray(0).getInt(0)).put("to",words.getJSONArray(words.length()-1).getInt(0))
            .put("source",p.getString("source_text")).put("text",text))).toString();
        return new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject()
            .put("finish_reason","stop").put("message",new JSONObject().put("content",plan)))).toString());
      }catch(Exception e){return new MockResponse().setResponseCode(500);}
    }});
    RebuildController.activate(h.a,url("ar"),false,true);await(arrived);
    RebuildController.Session old=h.session();RebuildController.Job job=old.jobs[0];assertTrue(job.sent);
    RebuildController.activate(h.a,url("fr"),false,true);RebuildController.Session next=h.session();ready(next);
    assertFalse(job.isCancelled());response.countDown();released(job);
    assertNull(old.plans[0]);assertNull(RebuildCache.read(h.a,old.cacheKey,old.source,old.blocks.get(0),old.languageContext));
    assertEquals("NEW_SCOPE_ONLY",next.plans[0].events.get(0).text);
    assertEquals("NEW_SCOPE_ONLY",RebuildCache.read(h.a,next.cacheKey,next.source,next.blocks.get(0),next.languageContext).events.get(0).text);
    assertEquals(2,h.calls.get());assertEquals(1,old.attempts[0]);assertEquals(1,next.attempts[0]);
  }

  @Test(timeout=30000) public void explicitStopCancelsAlreadySentHttpAndClearsPendingAtomically() throws Exception {
    h.blockResponse=true;h.start(false);RebuildController.Session s=h.session();
    h.await(()->s.jobs!=null && s.jobs[0]!=null && s.jobs[0].sent);
    RebuildController.Job job=s.jobs[0];
    synchronized(s){s.pendingFocus=new RebuildController.Job(s,0,true);}
    join(start("Scheduler-ExplicitPhysicalStop",RebuildController::stop));assertTrue(job.isCancelled());assertFalse(s.retired);
    assertNull(s.pendingFocus);assertFalse(s.loading);assertNull(s.sourceJob);assertTrue(s.connections.isEmpty());
    h.release.countDown();released(job);assertNull(s.plans[0]);assertEquals(1,s.attempts[0]);
    assertNull(RebuildCache.read(h.a,s.cacheKey,s.source,s.blocks.get(0),s.languageContext));
    h.blockResponse=false;RebuildController.activate(h.a,url("fr"),false,true);ready(h.session());
    assertEquals(1,h.session().attempts[0]);assertEquals(0,h.session().repairCount);
  }

  @Test(timeout=30000) public void diskReadCandidateIsRejectedAfterRevocationAndAfterSeek() throws Exception {
    RebuildController.Session old=fixture();install(old);
    assertTrue(RebuildCache.write(h.a,old.cacheKey,old.source,old.blocks.get(0),plan(old,"这是一条完整的测试字幕。"),old.languageContext));
    old.cacheChecked[0]=false;armCache(old,false);
    Thread scheduler=start("Scheduler-LateDiskRead",()->invoke("schedule",old));await(CacheBoundary.arrived);
    RebuildController.stop();CacheBoundary.release.countDown();join(scheduler);
    assertNull(old.plans[0]);assertFalse(old.cacheChecked[0]);assertEquals(0,old.attempts[0]);assertEquals(0,h.calls.get());
    CacheBoundary.readKey=null;
    RebuildController.Session next=fixture();install(next);next.cacheChecked[0]=false;armCache(next,false);
    Thread seekRead=start("Scheduler-SeekDiskRead",()->invoke("schedule",next));await(CacheBoundary.arrived);
    synchronized(next){next.generation++;next.position=1000;}
    CacheBoundary.release.countDown();join(seekRead);
    assertNull(next.plans[0]);assertFalse(next.cacheChecked[0]);assertEquals(0,next.attempts[0]);
    CacheBoundary.readKey=null;invoke("schedule",next);
    assertNotNull(next.plans[0]);assertEquals(RebuildController.READY,next.states[0]);assertEquals(0,next.attempts[0]);
    assertEquals(0,h.calls.get());
  }

  @Test(timeout=30000) public void fsyncedCandidateCannotAcquireCommitAfterStop() throws Exception {
    RebuildController.Session old=fixture();install(old);armCache(old,true);
    invoke("schedule",old);await(CacheBoundary.arrived);RebuildController.Job job=old.jobs[0];assertTrue(job.sent);
    RebuildController.stop();assertNull(old.publication.reserve());
    RebuildController.activate(h.a,url("fr"),false,true);RebuildController.Session next=h.session();ready(next);
    CacheBoundary.release.countDown();released(job);
    assertNull(old.plans[0]);assertNull(RebuildCache.read(h.a,old.cacheKey,old.source,old.blocks.get(0),old.languageContext));
    assertNotNull(next.plans[0]);assertNotNull(RebuildCache.read(h.a,next.cacheKey,next.source,next.blocks.get(0),next.languageContext));
    assertEquals(1,next.attempts[0]);assertEquals(0,next.repairCount);
    assertFalse(CaptionDiagnostics.fullText(h.a).contains("REBUILD_EVENTS_ACCEPTED | block=0;events=1;session="+old.id+";"));
    File[] temps=RebuildCache.directory(h.a).listFiles((d,n)->n.endsWith(".tmp"));assertNotNull(temps);assertEquals(0,temps.length);
  }

  @Test(timeout=30000) public void sourceFailureCannotReenterAfterStopAndVideoChange() throws Exception {
    CountDownLatch arrived=new CountDownLatch(1),failure=release();
    Field engine=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");engine.setAccessible(true);
    engine.set(null,new RebuildIntegrationTest.Engine(){
      @Override public HttpURLConnection openConnection(URL url) {
        return new HttpURLConnection(url){
          public void connect(){} public boolean usingProxy(){return false;}public void disconnect(){}
          public int getResponseCode() throws IOException {arrived.countDown();await(failure);throw new IOException("controlled old source failure");}
        };
      }
    });
    h.start(false);RebuildController.Session old=h.session();await(arrived);
    RebuildController.stop();RebuildController.video("rebuild0002");engine.set(null,h.engine);
    RebuildController.activate(h.a,url("fr").replace("rebuild0001","rebuild0002"),false,true);
    RebuildController.Session next=h.session();failure.countDown();ready(next);
    assertEquals(0,old.sourceFailures);assertFalse(old.loading);assertNull(old.sourceJob);
    assertEquals(0,next.sourceFailures);assertFalse(next.terminal);assertEquals("rebuild0002",next.owner);
    assertEquals(1,next.attempts[0]);assertEquals(1,h.calls.get());
    assertFalse(CaptionDiagnostics.fullText(h.a).contains("REBUILD_SOURCE_ERROR |"));
  }

  @Test(timeout=30000) public void reservedCommitDrainsOutsideMonitorsBeforeStopReturns() throws Exception {
    RebuildController.Session old=fixture();install(old);
    CommitBoundary.key=old.cacheKey;CommitBoundary.observed=old;
    CommitBoundary.arrived=new CountDownLatch(1);CommitBoundary.release=release();
    invoke("schedule",old);await(CommitBoundary.arrived);RebuildController.Job job=old.jobs[0];
    Thread stopper=start("Scheduler-DrainAdmittedCommit",RebuildController::stop);
    long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(ROUND_SECONDS);
    while(old.publication.isOpen() && System.nanoTime()<deadline)Thread.yield();
    assertFalse(old.publication.isOpen());assertTrue(stopper.isAlive());
    synchronized(old){assertNull(old.plans[0]);}
    synchronized(RebuildController.class){assertFalse(RebuildController.current(old));}
    CommitBoundary.release.countDown();join(stopper);released(job);
    assertTrue(old.cancelled);assertNull(old.plans[0]);assertNull(old.publication.reserve());
    // This write was admitted before revoke, matching the former commit-before-stop order.
    assertNotNull(RebuildCache.read(h.a,old.cacheKey,old.source,old.blocks.get(0),old.languageContext));
    assertFalse(CaptionDiagnostics.fullText(h.a).contains("REBUILD_EVENTS_ACCEPTED | block=0;events=1;session="+old.id+";"));
    RebuildController.activate(h.a,url("fr"),false,true);ready(h.session());
    assertNotEquals(old.cacheKey,h.session().cacheKey);assertEquals(1,h.session().attempts[0]);
  }

  @Test(timeout=30000) public void delayedStopCleanupCannotClearNewSessionOrReshowOldCaption() throws Exception {
    RebuildController.Session old=fixture();install(old);
    CountDownLatch disconnecting=new CountDownLatch(1),disconnected=release();
    old.connections.add(new HttpURLConnection(new URL("http://localhost/old")){
      public void connect(){}public boolean usingProxy(){return false;}
      public void disconnect(){
        assertFalse(Thread.holdsLock(old));assertFalse(Thread.holdsLock(old.connections));
        assertFalse(Thread.holdsLock(RebuildController.class));disconnecting.countDown();await(disconnected);
      }
    });
    Thread stopper=start("Scheduler-DelayedUiCleanup",RebuildController::stop);await(disconnecting);
    RebuildController.activate(h.a,url("fr"),false,true);RebuildController.Session next=h.session();ready(next);
    RebuildController.time(0);Shadows.shadowOf(Looper.getMainLooper()).idle();
    String shown=(String)RebuildIntegrationTest.field(null,CaptionOverlay.class,"pendingText");assertFalse(shown.isEmpty());
    disconnected.countDown();join(stopper);invoke("render",old);Shadows.shadowOf(Looper.getMainLooper()).idle();
    assertSame(next,h.session());assertTrue(RebuildController.current(next));
    assertEquals(shown,RebuildIntegrationTest.field(null,CaptionOverlay.class,"pendingText"));
    assertNull(old.pendingFocus);assertFalse(old.loading);assertTrue(old.cancelled);
    assertEquals(1,next.attempts[0]);assertEquals(0,next.repairCount);
  }

  @Test(timeout=30000) public void staleUiSubmissionCannotInvalidateNewerValidCommand() throws Exception {
    CountDownLatch checked=new CountDownLatch(1),submit=release();
    java.util.concurrent.atomic.AtomicInteger validations=new java.util.concurrent.atomic.AtomicInteger();
    CaptionOverlay.RenderGuard obsolete=()->{
      if(validations.incrementAndGet()==1){checked.countDown();await(submit);return true;}
      return false;
    };
    Thread old=start("Scheduler-StaleRenderSubmit",()->CaptionOverlay.showStatus("OLD_SESSION",obsolete));
    await(checked);CaptionOverlay.showStatus("NEW_SESSION",()->true);
    submit.countDown();join(old);Shadows.shadowOf(Looper.getMainLooper()).idle();
    assertEquals("NEW_SESSION",RebuildIntegrationTest.field(null,CaptionOverlay.class,"pendingText"));
    assertEquals(0,h.calls.get());
  }

  @Test(timeout=30000) public void selectedButUnsubmittedRenderDoesNotSuppressMainThreadRepair() throws Exception {
    RebuildController.Session s=fixture();install(s);s.terminal=true;s.status="NEW_SESSION_STATUS";
    OverlayBoundary.status=s.status;OverlayBoundary.arrived=new CountDownLatch(1);OverlayBoundary.release=release();
    Thread selecting=start("Scheduler-SelectedBeforeUiSubmit",()->invoke("render",s));await(OverlayBoundary.arrived);
    assertEquals(1,s.renderRevision);assertEquals(0,s.appliedRenderRevision);
    invoke("render",s);Shadows.shadowOf(Looper.getMainLooper()).idle();
    assertEquals(s.status,RebuildIntegrationTest.field(null,CaptionOverlay.class,"pendingText"));
    assertEquals(1,s.renderRevision);assertEquals(2,s.renderSubmission);assertEquals(s.renderRevision,s.appliedRenderRevision);
    OverlayBoundary.release.countDown();join(selecting);Shadows.shadowOf(Looper.getMainLooper()).idle();
    invoke("render",s);assertEquals("applied signature still deduplicates",1,s.renderRevision);
    assertEquals(2,s.renderSubmission);
    assertEquals(s.status,RebuildIntegrationTest.field(null,CaptionOverlay.class,"pendingText"));assertEquals(0,h.calls.get());
  }

  @Test(timeout=30000) public void activateReuseRechecksPublicationAfterStopWins() throws Exception {
    RebuildController.activate(h.a,url("fr"),false,false);RebuildController.Session old=h.session();
    h.await(()->old.source!=null);assertFalse(old.visible);assertEquals(0,h.calls.get());
    CountDownLatch held=new CountDownLatch(1),go=release();
    Thread holding=start("Scheduler-ReuseSessionOwner",()->{synchronized(old){held.countDown();await(go);}});await(held);
    Thread reusing=start("Scheduler-ActivateReuse",()->RebuildController.activate(h.a,url("fr"),false,true));blocked(reusing);
    assertSame(old,h.session());Thread stopping=start("Scheduler-StopDuringReuse",RebuildController::stop);blocked(stopping);
    assertFalse(RebuildController.current(old));go.countDown();join(holding);join(reusing);join(stopping);
    assertFalse("stale reuse cannot restore visibility",old.visible);assertTrue(old.cancelled);assertNull(old.pendingFocus);
    assertEquals(0,old.attempts[0]);RebuildController.activate(h.a,url("ar"),false,true);ready(h.session());
    assertNotSame(old,h.session());assertEquals(1,h.calls.get());assertEquals(1,h.session().attempts[0]);
  }
}
