package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.os.*;
import java.io.*;
import java.net.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={RebuildIntegrationTest.Keys.class,SchedulerLifecycleRegressionTest.CacheBoundary.class,
 SchedulerLifecycleRegressionTest.CommitBoundary.class,SchedulerLifecycleRegressionTest.OverlayBoundary.class,MainLooperLifecycleTest.Addon.class})
@LooperMode(LooperMode.Mode.INSTRUMENTATION_TEST)
public class MainLooperLifecycleTest {
 @Implements(CaptionAddonSupport.class) public static class Addon {
  @Implementation protected static boolean aiInstalled(){return true;}
 }
 SchedulerLifecycleRegressionTest h;
 interface Work {void run() throws Exception;}
 static void main(Work r) throws Exception {
  FutureTask<Void> task=new FutureTask<>(()->{assertSame(Looper.getMainLooper(),Looper.myLooper());r.run();return null;});
  // N36: the main entry must return promptly, but a shared test JVM may still be draining the previous
  // fixture. The per-test 30 s guard remains the real deadline; this is only the hand-off wait.
  new Handler(Looper.getMainLooper()).post(task);task.get(10,TimeUnit.SECONDS);
 }
 @Before public void setup() throws Exception {CaptionPlayerTransitionGuard.resetForTests();CaptionPlayerAuthority.resetForTests();h=new SchedulerLifecycleRegressionTest();main(()->h.setup());}
 @After public void cleanup() throws Exception {h.cleanup();}
 RebuildController.Session held() throws Exception {
  RebuildController.Session s=h.fixture();SchedulerLifecycleRegressionTest.install(s);
  SchedulerLifecycleRegressionTest.CommitBoundary.key=s.cacheKey;
  SchedulerLifecycleRegressionTest.CommitBoundary.observed=s;
  SchedulerLifecycleRegressionTest.CommitBoundary.arrived=new CountDownLatch(1);
  SchedulerLifecycleRegressionTest.CommitBoundary.release=h.release();
  SchedulerLifecycleRegressionTest.invoke("schedule",s);SchedulerLifecycleRegressionTest.await(SchedulerLifecycleRegressionTest.CommitBoundary.arrived);return s;
 }
 void responsive(Work request,RebuildController.Session old) throws Exception {
  main(request);CountDownLatch next=new CountDownLatch(1);new Handler(Looper.getMainLooper()).post(next::countDown);
  assertTrue("next actual main message must run while commit is held",next.await(500,TimeUnit.MILLISECONDS));
  assertEquals(1,SchedulerLifecycleRegressionTest.CommitBoundary.release.getCount());
  assertFalse(old.publication.isOpen());assertFalse(RebuildController.current(old));assertTrue(old.cancelled);
  assertNull(old.publication.reserve());assertNull(old.plans[0]);assertNull(old.pendingFocus);
  String dir=System.getenv("N28C_EVIDENCE_DIR");
  if(dir!=null) {
   StringBuilder dump=new StringBuilder();
   for(Map.Entry<Thread,StackTraceElement[]> entry:Thread.getAllStackTraces().entrySet()) {dump.append(entry.getKey()).append('\n');for(StackTraceElement frame:entry.getValue())dump.append("  ").append(frame).append('\n');}
   java.nio.file.Files.write(new File(dir,"main-held-permit-"+old.id+"-threads.txt").toPath(),dump.toString().getBytes(java.nio.charset.StandardCharsets.UTF_8));
  }
  N28CGeometryTest.export("main-lifecycle-"+old.id+".json",new org.json.JSONObject().put("main_returned_before_permit_release",true).put("next_message_before_permit_release",true).put("generation",old.generation).put("old_publishable",false));
 }
 void release(RebuildController.Session old) throws Exception {
  SchedulerLifecycleRegressionTest.CommitBoundary.release.countDown();old.awaitRetirement();
 }
 void ready(RebuildController.Session s) {
  long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(5);
  while((s.plans==null || s.plans[0]==null || s.states[0]!=RebuildController.READY) && System.nanoTime()<deadline)Thread.yield();
  assertNotNull(s.plans);assertNotNull(s.plans[0]);assertEquals(RebuildController.READY,s.states[0]);
 }
 @Test(timeout=30000) public void mainStopAndNextMessageDoNotWaitOnAdmittedActualCommit() throws Exception {
  RebuildController.Session old=held();responsive(RebuildController::stop,old);release(old);assertNull(old.plans[0]);
 }
 @Test(timeout=30000) public void mainVideoChangeReturnsBeforeOldFileFinishes() throws Exception {
  RebuildController.Session old=held();responsive(()->RebuildController.video("rebuild0002"),old);release(old);
 }
 @Test(timeout=30000) public void mainNativeCloseReturnsAndNeverReshowsRevokedSession() throws Exception {
  RebuildController.Session old=held();responsive(()->{NativeCaptionBridge.initialize(h.h.a);NativeCaptionBridge.onSelection(null);},old);release(old);assertFalse(RebuildController.visible());
 }
 @Test(timeout=30000) public void mainUserToggleOffUsesRealConfigurationChainWithoutBarrier() throws Exception {
  RebuildController.Session old=held();responsive(()->assertTrue(CaptionQuickToggle.setEngine(h.h.a,false)),old);assertFalse(DeepSeekConfig.enabled(h.h.a));release(old);
 }
 @Test(timeout=30000) public void mainTargetReplacementPublishesNewWhileOldCommitIsStillHeld() throws Exception {
  RebuildController.Session old=held();responsive(()->RebuildController.activate(h.h.a,h.url("fr"),false,true),old);
  RebuildController.Session next=h.h.session();assertNotSame(old,next);ready(next);
  main(()->RebuildController.time(0));String shown=(String)RebuildIntegrationTest.field(null,CaptionOverlay.class,"pendingText");assertFalse(shown.isEmpty());
  assertTrue(old.retired);assertNotEquals(old.cacheKey,next.cacheKey);assertEquals(1,SchedulerLifecycleRegressionTest.CommitBoundary.release.getCount());
  // N36: the applied identity must belong to the live session after the retired render is invoked.
  release(old);main(()->SchedulerLifecycleRegressionTest.invoke("render",old));
  assertSame(next,h.h.session());
  String applied=String.valueOf(RebuildIntegrationTest.field(null,CaptionOverlay.class,"pendingIdentity"));
  assertTrue("the applied identity must belong to the live session: "+applied,applied.startsWith(next.id+":"));
  assertFalse(((String)RebuildIntegrationTest.field(null,CaptionOverlay.class,"pendingText")).isEmpty());
 }
 @Test(timeout=30000) public void backgroundTimeoutKeepsRevocationAndCanAwaitAgainAfterRelease() throws Exception {
  RebuildController.Session old=h.fixture();SchedulerLifecycleRegressionTest.install(old);RebuildCache.Permit permit=old.publication.reserve();
  main(RebuildController::stop);
  try {old.awaitRetirement();fail("admitted permit must not be marked completed");}catch(IllegalStateException failure){assertEquals("publication_commit_timeout",failure.getMessage());}
  assertEquals("publication_commit_timeout",old.retirementFailure);assertFalse(RebuildController.current(old));assertNull(old.publication.reserve());assertTrue(old.cancelled);
  permit.close();old.awaitRetirement();assertEquals("",old.retirementFailure);
 }
 @Test(timeout=30000) public void interruptedBackgroundBarrierPreservesInterruptAndCleanupEligibility() throws Exception {
  RebuildController.Session old=h.fixture();SchedulerLifecycleRegressionTest.install(old);RebuildCache.Permit permit=old.publication.reserve();main(RebuildController::stop);
  Thread.currentThread().interrupt();
  try {old.awaitRetirement();fail();}catch(IllegalStateException failure){assertEquals("publication_commit_interrupted",failure.getMessage());assertTrue(Thread.currentThread().isInterrupted());}finally{Thread.interrupted();}
  assertFalse(old.publication.isOpen());assertTrue(old.cancelled);permit.close();old.awaitRetirement();assertEquals("",old.retirementFailure);
 }
 @Test(timeout=30000) public void newerSuccessfulSameKeyCommitCannotBeOverwrittenByOlderAdmittedWrite() throws Exception {
  RebuildController.Session old=h.fixture();SchedulerLifecycleRegressionTest.install(old);
  try(RebuildCache.Prepared first=RebuildCache.prepare(h.h.a,old.cacheKey,old.source,old.blocks.get(0),h.plan(old,"旧的完整字幕。"),old.languageContext)) {
   assertNotNull(first);RebuildCache.Permit permission=old.publication.reserve();assertNotNull(permission);
   main(RebuildController::stop);assertNull(old.publication.reserve());
   RebuildController.Session newer=h.fixture();assertEquals(old.cacheKey,newer.cacheKey);
   try(RebuildCache.Prepared second=RebuildCache.prepare(h.h.a,newer.cacheKey,newer.source,newer.blocks.get(0),h.plan(newer,"新的完整字幕。"),newer.languageContext)) {assertNotNull(second);assertTrue(second.commit());}
   assertFalse("stale physical write must fail, not return false as success",first.commit());permission.close();old.awaitRetirement();
   assertEquals("新的完整字幕。",RebuildCache.read(h.h.a,newer.cacheKey,newer.source,newer.blocks.get(0),newer.languageContext).events.get(0).text);assertNull(old.plans[0]);
  }
 }
 @Test(timeout=30000) public void cleanupPathIsBoundedDeduplicatedAndCapacityFailureRemainsAwaitable() throws Exception {
  RebuildController.Session held=h.fixture();CountDownLatch entered=new CountDownLatch(1),done=h.release();
  held.connections.add(new HttpURLConnection(new URL("http://localhost/bounded")) {
   public void connect(){}public boolean usingProxy(){return false;}public void disconnect(){entered.countDown();SchedulerLifecycleRegressionTest.await(done);}
  });
  main(held::cancel);SchedulerLifecycleRegressionTest.await(entered);
  java.lang.reflect.Field f=RebuildController.class.getDeclaredField("CLEANUP");f.setAccessible(true);
  ThreadPoolExecutor executor=(ThreadPoolExecutor)f.get(null);List<RebuildController.Session> requests=new ArrayList<>();
  for(int i=0;i<40;i++){RebuildController.Session old=h.fixture();requests.add(old);main(()->{old.cancel();old.cancel();});}
  assertEquals(1,executor.getMaximumPoolSize());assertTrue(executor.getQueue().size()<=16);
  assertTrue(requests.stream().anyMatch(old->old.retirementFailure.equals("retirement_cleanup_capacity")));
  for(RebuildController.Session old:requests){assertTrue(old.cancelled);assertNull(old.publication.reserve());assertEquals(1,old.generation);}
  done.countDown();held.awaitRetirement();for(RebuildController.Session old:requests)old.awaitRetirement();
  for(RebuildController.Session old:requests)assertEquals("",old.retirementFailure);
 }
 @Test(timeout=30000) public void completedRetireCanStillEscalateToStopWithoutLosingCleanup() throws Exception {
  RebuildController.Session old=h.fixture();SchedulerLifecycleRegressionTest.install(old);
  AtomicInteger disconnects=new AtomicInteger();
  old.connections.add(new HttpURLConnection(new URL("http://localhost/sent")) {
   public void connect(){}public boolean usingProxy(){return false;}public void disconnect(){disconnects.incrementAndGet();}
  });
  main(old::retire);old.awaitRetirement();assertEquals(0,disconnects.get());assertTrue(old.retired);
  main(old::cancel);old.awaitRetirement();assertEquals(1,disconnects.get());assertFalse(old.retired);assertTrue(old.connections.isEmpty());assertEquals(1,old.generation);
 }
 @Test(timeout=30000) public void delayedBackgroundDisconnectCannotHoldMainOrClearNewSubtitle() throws Exception {
  RebuildController.Session old=h.fixture();SchedulerLifecycleRegressionTest.install(old);CountDownLatch entered=new CountDownLatch(1),done=h.release();
  old.connections.add(new HttpURLConnection(new URL("http://localhost/old")) {
   public void connect(){}public boolean usingProxy(){return false;}
   public void disconnect(){assertFalse(Thread.holdsLock(old));assertFalse(Thread.holdsLock(old.connections));assertFalse(Thread.holdsLock(RebuildController.class));assertNotSame(Looper.getMainLooper(),Looper.myLooper());entered.countDown();SchedulerLifecycleRegressionTest.await(done);}
  });
  main(RebuildController::stop);SchedulerLifecycleRegressionTest.await(entered);
  main(()->RebuildController.activate(h.h.a,h.url("fr"),false,true));RebuildController.Session next=h.h.session();ready(next);main(()->RebuildController.time(0));
  String shown=(String)RebuildIntegrationTest.field(null,CaptionOverlay.class,"pendingText");assertFalse(shown.isEmpty());done.countDown();old.awaitRetirement();
  // N36: the retired session must not own what is applied. The live session may legitimately advance
  // to its next page while the retirement barrier drains, so ownership of the applied identity and a
  // non-empty applied text are asserted instead of one frozen string.
  main(()->SchedulerLifecycleRegressionTest.invoke("render",old));
  String applied=String.valueOf(RebuildIntegrationTest.field(null,CaptionOverlay.class,"pendingIdentity"));
  assertTrue("the applied identity must belong to the live session: "+applied,applied.startsWith(next.id+":"));
  assertFalse(((String)RebuildIntegrationTest.field(null,CaptionOverlay.class,"pendingText")).isEmpty());
 }
}
