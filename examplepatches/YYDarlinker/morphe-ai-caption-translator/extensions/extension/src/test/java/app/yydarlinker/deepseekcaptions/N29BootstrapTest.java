package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.content.Context;
import android.media.session.*;
import android.os.*;
import java.lang.reflect.*;
import java.time.Duration;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import okhttp3.mockwebserver.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import org.robolectric.shadows.ShadowSystemClock;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.util.ReflectionHelpers.ClassParameter;
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={RebuildIntegrationTest.Keys.class,N29BootstrapTest.Cache.class})
@LooperMode(LooperMode.Mode.PAUSED)
public class N29BootstrapTest {
 static final boolean BEFORE="true".equals(System.getenv("N29_STARTUP_BEFORE"));
 static RebuildController.Session observed;
 static CountDownLatch cacheEntered,cacheRelease;
 static final AtomicInteger cacheReads=new AtomicInteger();
 @Implements(RebuildCache.class) public static class Cache {
  @Implementation public static RebuildProtocol.Plan read(Context c,String key,RebuildSource source,RebuildPlanner.Block block,CaptionLanguageContext language) {
   if(observed!=null && source==observed.source && block.index==1) {
    assertFalse(Thread.holdsLock(observed));assertFalse(Thread.holdsLock(RebuildController.class));
    cacheReads.incrementAndGet();
    if(cacheEntered!=null) {assertEquals("CaptionSourceIO",Thread.currentThread().getName());cacheEntered.countDown();await(cacheRelease);}
   }
   return Shadow.directlyOn(RebuildCache.class,"read",ClassParameter.from(Context.class,c),ClassParameter.from(String.class,key),
    ClassParameter.from(RebuildSource.class,source),ClassParameter.from(RebuildPlanner.Block.class,block),ClassParameter.from(CaptionLanguageContext.class,language));
  }
 }
 RebuildIntegrationTest h;long origin;
 final CountDownLatch firstSeen=new CountDownLatch(1),secondSeen=new CountDownLatch(1),firstRelease=new CountDownLatch(1),secondRelease=new CountDownLatch(1);
 final ConcurrentHashMap<Integer,AtomicInteger> blockCalls=new ConcurrentHashMap<>();
 @Before public void setup()throws Exception {
  observed=null;cacheEntered=cacheRelease=null;cacheReads.set(0);h=new RebuildIntegrationTest();h.setup();origin=SystemClock.elapsedRealtime();
  h.server.setDispatcher(new Dispatcher(){public MockResponse dispatch(RecordedRequest r){
   try {
    h.calls.incrementAndGet();JSONObject payload=new JSONObject(new JSONObject(r.getBody().readUtf8()).getJSONArray("messages").getJSONObject(1).getString("content"));
    int index=Integer.parseInt(payload.getString("block").split("_")[0].substring(1));blockCalls.computeIfAbsent(index,k->new AtomicInteger()).incrementAndGet();
    if(index==0){firstSeen.countDown();await(firstRelease);}else if(index==1){secondSeen.countDown();await(secondRelease);}
    JSONArray tokens=payload.getJSONArray("owned_tokens");JSONObject event=new JSONObject().put("from",tokens.getJSONArray(0).getInt(0)).put("to",tokens.getJSONArray(tokens.length()-1).getInt(0))
      .put("source",payload.getString("source_text")).put("text","这是一条完整的测试字幕。");
    String reply=new JSONObject().put("block",payload.getString("block")).put("events",new JSONArray().put(event)).toString();
    return new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject().put("finish_reason","stop").put("message",new JSONObject().put("content",reply)))).toString());
   }catch(Exception e){return new MockResponse().setResponseCode(500).setBody(e.toString());}
  }});
 }
 @After public void cleanup()throws Exception {firstRelease.countDown();secondRelease.countDown();if(cacheRelease!=null)cacheRelease.countDown();observed=null;h.cleanup();}
 static void await(CountDownLatch l){try{assertTrue("real boundary timeout",l.await(5,TimeUnit.SECONDS));}catch(InterruptedException e){throw new AssertionError(e);}}
 static void until(java.util.function.BooleanSupplier condition) {
  long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(5);while(!condition.getAsBoolean() && System.nanoTime()<end)Thread.yield();assertTrue("actual publication deadline",condition.getAsBoolean());
 }
 RebuildController.Session fixture(int count)throws Exception {
  RebuildController.Session s=new RebuildController.Session(h.a,"https://www.youtube.com/api/timedtext?v=rebuild0001&lang=en&tlang=zh-Hans","rebuild0001","n29-bootstrap","zh-Hans",h.config(),false,true);
  s.source=RebuildContractTest.json("{\"events\":[{\"tStartMs\":0,\"dDurationMs\":7040,\"segs\":[{\"utf8\":\"First complete source sentence here.\"}]},{\"tStartMs\":7040,\"dDurationMs\":21880,\"segs\":[{\"utf8\":\"Second complete source sentence here.\"}]},{\"tStartMs\":28920,\"dDurationMs\":8000,\"segs\":[{\"utf8\":\"Third complete source sentence here.\"}]}]}");
  List<RebuildPlanner.Block> blocks=new ArrayList<>();for(int i=0;i<count;i++)blocks.add(new RebuildPlanner.Block(i,i*5,i*5+4,s.source));s.blocks=Collections.unmodifiableList(blocks);
  s.plans=new RebuildProtocol.Plan[count];s.pendingPlans=new RebuildProtocol.Plan[count];s.states=new int[count];s.attempts=new int[count];s.retryAt=new long[count];s.reasons=new String[count];Arrays.fill(s.reasons,"");
  s.jobs=new RebuildController.Job[count];s.cacheChecked=new boolean[count];Arrays.fill(s.cacheChecked,true);s.cacheChecked[1]=false;
  s.cacheKey=RebuildCache.identity(s.source,s.config,s.target,s.languageContext);SchedulerLifecycleRegressionTest.install(s);observed=s;return s;
 }
 void wall(long ms,RebuildController.Session s,long video)throws Exception {
  long target=origin+ms;long now=SystemClock.elapsedRealtime();assertTrue(target>=now);ShadowSystemClock.advanceBy(Duration.ofMillis(target-now));
  s.position=video;((RebuildClock)RebuildIntegrationTest.field(null,RebuildController.class,"CLOCK")).update(video,SystemClock.elapsedRealtime());
 }
 void schedule(RebuildController.Session s){SchedulerLifecycleRegressionTest.invoke("schedule",s);}
 RebuildProtocol.Plan plan(RebuildController.Session s,int index)throws Exception {
  RebuildPlanner.Block b=s.blocks.get(index);return RebuildProtocol.parseBound(new JSONObject().put("block",b.id()).put("events",new JSONArray().put(new JSONObject()
    .put("from",b.from).put("to",b.to).put("source",s.source.text(b.from,b.to)).put("text","这是一条完整的测试字幕。"))).toString(),s.source,b,s.languageContext);
 }
@Test public void originalSessionSevenFixedWallTimesUseRealSentAndPublicationBarriers()throws Exception {
   RebuildController.Session s=fixture(2);wall(815,s,815);schedule(s);await(firstSeen);until(()->s.jobs[0].sent);schedule(s);
   assertNull("N30 suppresses speculative remote bootstrap",s.jobs[1]);assertEquals(1,secondSeen.getCount());
   wall(3350,s,3350);firstRelease.countDown();until(()->s.plans[0]!=null && s.states[0]==RebuildController.READY);
   wall(3448,s,3448);schedule(s);await(secondSeen);
   long neighborSent=3448,neighborReady=neighborSent+5621;
   wall(7040,s,7040);RebuildController.time(7040);assertNull(s.plans[1]);
   wall(neighborReady,s,neighborReady);secondRelease.countDown();until(()->s.plans[1]!=null);
   assertEquals(2,h.calls.get());assertEquals(1,blockCalls.get(0).get());assertEquals(1,blockCalls.get(1).get());assertEquals(1,s.attempts[0]);assertEquals(1,s.attempts[1]);
   N28CGeometryTest.export("n30-startup-fixed-after.json",new JSONObject().put("first_sent_wall_ms",815).put("first_network_ms",2535)
     .put("neighbor_sent_wall_ms",neighborSent).put("neighbor_network_ms",5621).put("neighbor_ready_wall_ms",neighborReady).put("video_boundary_ms",7040)
     .put("boundary_wait_ms",Math.max(0,neighborReady-7040)).put("provider_calls",h.calls.get()).put("bootstrap_remote_requests",0));
  }
  @Test public void validPrewarmSessionDoesNotNeedAnAlreadyVisibleCaption()throws Exception {
   RebuildController.Session s=fixture(3);s.visible=false;wall(815,s,815);schedule(s);await(firstSeen);schedule(s);
   assertNull(s.plans[0]);assertNull(s.jobs[1]);assertNull(s.jobs[2]);assertEquals(1,h.calls.get());
  }
  @Test public void onlyAdjacentUsesOneCacheReservationThenExistingJobIsReused()throws Exception {
   RebuildController.Session s=fixture(3);wall(815,s,815);schedule(s);await(firstSeen);schedule(s);until(()->cacheReads.get()==1);
   for(int i=0;i<10;i++)schedule(s);assertNull(s.jobs[1]);assertNull(s.jobs[2]);assertEquals(0,s.attempts[1]);assertFalse(s.everReady);assertEquals(1,h.calls.get());
  }
 @Test public void adjacentCacheHitHasNoNeighborApiCallWhileFocusIsInFlight()throws Exception {
  RebuildController.Session s=fixture(2);assertTrue(RebuildCache.write(h.a,s.cacheKey,s.source,s.blocks.get(1),plan(s,1),s.languageContext));
  wall(815,s,815);schedule(s);await(firstSeen);schedule(s);until(()->s.plans[1]!=null);assertEquals(1,h.calls.get());assertEquals(0,s.attempts[1]);assertFalse(s.everReady);
 }
 @Test public void acceptedAdjacentCacheBecomingCurrentRestoresNormalAheadEligibility()throws Exception {
  RebuildController.Session s=fixture(3);assertTrue(RebuildCache.write(h.a,s.cacheKey,s.source,s.blocks.get(1),plan(s,1),s.languageContext));
  wall(815,s,815);schedule(s);await(firstSeen);schedule(s);until(()->s.plans[1]!=null);assertFalse(s.everReady);assertNull(s.jobs[2]);
  wall(7040,s,7040);schedule(s);until(()->s.jobs[2]!=null && s.jobs[2].sent);assertTrue(s.everReady);assertEquals(1,s.attempts[2]);
 }
 @Test public void pausedStormAndUnsentFocusCannotBootstrap()throws Exception {
  RebuildController.Session s=fixture(2);wall(815,s,815);schedule(s);await(firstSeen);until(()->s.jobs[0].sent);
  s.prefetchPausedUntil=SystemClock.elapsedRealtime()+5000;schedule(s);assertNull(s.jobs[1]);assertEquals(0,cacheReads.get());
  s.prefetchPausedUntil=0;h.mediaSession=new MediaSession(h.a,"n29");MediaController c=new MediaController(h.a,h.mediaSession.getSessionToken());
  Shadows.shadowOf(c).setPackageName(h.a.getPackageName()); // same-owner MediaSession, as on Android
  Shadows.shadowOf(c).setPlaybackState(new PlaybackState.Builder().setState(PlaybackState.STATE_PAUSED,815,0).build());h.a.setMediaController(c);
  schedule(s);assertNull(s.jobs[1]);assertEquals(0,cacheReads.get());h.a.setMediaController(null);
  s.jobs[0].sent=false;schedule(s);assertNull(s.jobs[1]);assertEquals(1,h.calls.get());s.jobs[0].sent=true;
 }
 @Test public void adjacentDiskReadUsesSourceLaneAndMainStopDoesNotAwaitIt()throws Exception {
  RebuildController.Session s=fixture(2);cacheEntered=new CountDownLatch(1);cacheRelease=new CountDownLatch(1);
  wall(815,s,815);schedule(s);await(firstSeen);schedule(s);await(cacheEntered);assertTrue(s.cacheReading[1]);
  for(int i=0;i<10;i++)schedule(s);assertEquals(1,cacheReads.get());assertEquals(1,h.calls.get());
  RebuildController.stop();assertTrue(s.cancelled);assertNull(h.session());cacheRelease.countDown();
  until(()->!s.cacheReading[1]);assertNull(s.plans[1]);assertNull(s.jobs[1]);assertEquals(1,h.calls.get());
 }
 @Test public void deliberatelySlowNeighborStillHasHonestPendingBoundary()throws Exception {
  RebuildController.Session s=fixture(2);wall(815,s,815);schedule(s);await(firstSeen);schedule(s);assertNull(s.jobs[1]);
  wall(3350,s,3350);firstRelease.countDown();until(()->s.plans[0]!=null);schedule(s);await(secondSeen);wall(7040,s,7040);RebuildController.time(7040);
  assertNull(s.plans[1]);assertEquals(RebuildController.RUNNING,s.states[1]);assertTrue(CaptionDiagnostics.fullText(h.a).contains("pending_translation"));assertEquals(2,h.calls.get());
 }
}
