package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.content.Context;
import android.os.Looper;
import android.os.SystemClock;
import java.lang.reflect.Field;
import java.time.Duration;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicLong;
import java.util.function.BooleanSupplier;
import java.util.function.Supplier;
import okhttp3.mockwebserver.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/**
 * Through the real engine: a page stays up across the 700 ms pause before the next sentence (a
 * hard source break, so the two are never joined), instead of blanking the box between them.
 */
@RunWith(RobolectricTestRunner.class) @Config(sdk=28,manifest=Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class ContinuousDisplayTest {
  final Context context=RuntimeEnvironment.getApplication();
  final String url="https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en&tlang=zh-Hans";
  final AtomicLong position=new AtomicLong(500);
  final List<String> shown=new CopyOnWriteArrayList<>();
  final List<String> waiting=new CopyOnWriteArrayList<>();
  final List<String> hidden=new CopyOnWriteArrayList<>();
  final List<String> blank=new CopyOnWriteArrayList<>();
  volatile boolean truncated,inspected;volatile int malformedReplies;
  /** The provider refuses the reply with finish_reason=content_filter: a terminal block failure. */
  volatile boolean filtered;
  /** Reply with an English echo for this sentence number: one unusable event in a good block. */
  volatile int echoSentence=-1;
  /** Echo the reply of a hole sub-request too, so the hole cannot be filled in this fixture. */
  volatile boolean holeEcho;
  MockWebServer server;
  final List<String> events=new ArrayList<>();
  final BlockingQueue<Boolean> changed=new ArrayBlockingQueue<>(1);
  volatile CountDownLatch holeEntered=new CountDownLatch(1), releaseHole=new CountDownLatch(0);
  volatile TranslationOutput.RenderGuard lastGuard;
  Object previousHost,previousOutput,previousAudit;
  String previousFixtureHost;
  @Rule public org.junit.rules.TestName testName=new org.junit.rules.TestName();

  static Field field(Class<?> type,String name) throws Exception {
    Field f=type.getDeclaredField(name);f.setAccessible(true);return f;
  }
  RebuildController.Session session() throws Exception {
    return (RebuildController.Session)field(RebuildController.class,"active").get(null);
  }
  String state() {
    try {
      RebuildController.Session s=session();
      if(s==null)return "active=null;fixturePosition="+position.get();
      synchronized(s){return "session="+s.id+";generation="+s.generation+";position="+s.position
          +";fixturePosition="+position.get()+";state="+Arrays.toString(s.states)
          +";shown="+shown+";hidden="+hidden+";http="+(server==null?0:server.getRequestCount());}
    }catch(Exception e){return "state_error="+e.getClass().getSimpleName();}
  }
  void event(String value) {
    if(value.length()>1200)value=value.substring(0,1200)+" [bounded]";
    synchronized(events){if(events.size()==160)events.remove(80);events.add(SystemClock.elapsedRealtime()+" "+value);}
    changed.offer(true);
  }
  String diagnostic(String expected) {
    List<String> snapshot; synchronized(events){snapshot=new ArrayList<>(events);}
    return "waiting_for="+expected+";last="+state()+";events="+snapshot;
  }

  /** Joins the fixture tokens of one event range, the same way the source text does. */
  static String join(JSONArray tokens,int from,int to) throws JSONException {
    StringBuilder out=new StringBuilder();
    for(int i=from;i<=to;i++){if(out.length()>0)out.append(' ');out.append(tokens.getJSONArray(i).getString(1));}
    return out.toString();
  }

  @Before public void setup() throws Exception {
    previousHost=field(TranslationRuntime.class,"host").get(null);
    previousOutput=field(TranslationOutput.class,"sink").get(null);
    previousAudit=field(TranslationAudit.class,"sink").get(null);
    previousFixtureHost=RebuildStream.fixtureHost;
    RebuildController.stop();RebuildApi.reset();RebuildCache.clear(context);
    RebuildStream.fixtureHost="";
    server=new MockWebServer();
    server.setDispatcher(new Dispatcher(){public MockResponse dispatch(RecordedRequest request){
      try {
        if(!"POST".equals(request.getMethod())||!"/v1/chat/completions".equals(request.getPath()))
          return new MockResponse().setResponseCode(599).setBody("unmapped fixture route");
        if(filtered)return new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject()
          .put("finish_reason","content_filter").put("message",new JSONObject().put("content","")))).toString());
        if(malformedReplies>0){malformedReplies--;return new MockResponse().setResponseCode(502).setBody("bad gateway");}
        if(truncated)return new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject()
          .put("message",new JSONObject().put("content","{\"block\":\"b0_0_9\",\"events\":[{\"from\":0,\"to\":3,\"source\":\"sentence 0")))).toString());
        JSONObject input=new JSONObject(new JSONObject(request.getBody().readUtf8()).getJSONArray("messages").getJSONObject(1).getString("content"));
        JSONArray tokens=input.getJSONArray("owned_tokens"),events=new JSONArray();
        String block=input.getString("block");
        boolean holeRequest=tokens.length()>0&&!tokens.getJSONArray(0).getString(1).equals("sentence");
        event("HTTP "+block+";hole="+holeRequest+";range="+tokens.getJSONArray(0).getInt(0)+"-"
            +tokens.getJSONArray(tokens.length()-1).getInt(0)+";"+state());
        if(holeRequest){holeEntered.countDown();assertTrue(diagnostic("release fixture hole"),releaseHole.await(8,TimeUnit.SECONDS));}
        if(inspected&&block.startsWith("b0_"))return new MockResponse().setResponseCode(400)
            .setBody("{\"error\":{\"code\":\"data_inspection_failed\",\"message\":\"Input data may contain inappropriate content.\"}}");
        // One event per fixture sentence ("sentence N says ... over time").
        for(int start=0;start<tokens.length();){
          int end=start;StringBuilder source=new StringBuilder(tokens.getJSONArray(start).getString(1));
          while(end+1<tokens.length()&&!tokens.getJSONArray(end+1).getString(1).equals("sentence"))source.append(' ').append(tokens.getJSONArray(++end).getString(1));
          String number=tokens.getJSONArray(start).getString(1).equals("sentence")&&start+1<tokens.length()?tokens.getJSONArray(start+1).getString(1):"x";
          String text="第"+number+"句说预算每年都在增长而军队变化缓慢。";
          if(holeEcho&&holeRequest)text=source.toString();
          if(number.equals(String.valueOf(echoSentence))){
            // Two events in one block: the first half is a good translation, the second half is an
            // English echo (unusable for zh-Hans) and must become an explicit hole.
            int mid=start+(end-start)/2;
            events.put(new JSONObject().put("from",tokens.getJSONArray(start).getInt(0)).put("to",tokens.getJSONArray(mid).getInt(0))
                .put("source",join(tokens,start,mid)).put("text","第"+number+"句的前半句。"));
            events.put(new JSONObject().put("from",tokens.getJSONArray(mid+1).getInt(0)).put("to",tokens.getJSONArray(end).getInt(0))
                .put("source",join(tokens,mid+1,end)).put("text",join(tokens,mid+1,end)));
            start=end+1;continue;
          }
          events.put(new JSONObject().put("from",tokens.getJSONArray(start).getInt(0)).put("to",tokens.getJSONArray(end).getInt(0))
              .put("source",source.toString()).put("text",text));
          start=end+1;
        }
        String reply=new JSONObject().put("block",block).put("events",events).toString();
        event("RESPONSE "+block+";hole="+holeRequest);
        return new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject()
            .put("message",new JSONObject().put("content",reply)))).toString());
      }catch(Exception e){event("FIXTURE_ERROR "+e.getClass().getSimpleName());return new MockResponse().setResponseCode(500).setBody("fixture error");}
    }});
    server.start();
    TranslationRuntime.install(new TranslationRuntime.Host(){
      TranslationSettings settings(Context c){return new TranslationSettings(true,server.url("/v1").toString(),"fixture-model","faithful","fixture-key","stored_custom");}
      TranslationSourceAccess.Source load(Context c,String u,boolean translate,DeepSeekApiClient.RequestControl control) throws Exception {
        byte[] body=StartupSchedulingTest.source();
        return new TranslationSourceAccess.Source(body,CaptionDocument.parse(body,"application/json"),"",0,null);
      }
      String target(){return "zh-Hans";}
      TranslationRuntime.ClockSample clock(String owner){
        return new TranslationRuntime.ClockSample(true,"abcdefghijk",position.get(),SystemClock.elapsedRealtime(),3,1f);
      }
      void mark(Context c,String stage,String detail,CaptionCredentialRef credential){
        if(Arrays.asList("REBUILD_REQUEST","REBUILD_EVENTS_ACCEPTED","REBUILD_EVENTS_REJECTED",
            "REBUILD_PARTIAL_ACCEPTED","REBUILD_COVERAGE","REBUILD_HOLE_FILLED","REBUILD_HOLE_FAILED",
            "REBUILD_SEEK","REBUILD_CLOCK_SEEK","REBUILD_PAGE_REPAIRED").contains(stage))event(stage+" "+detail);
      }
    });
    TranslationOutput.install(new TranslationOutput.Sink(){
      public void showEvent(String text,TranslationOutput.RenderGuard g,String id,long start,long end,long at,CaptionRenderSpec spec){
        event("SHOW valid="+g.isValid()+";id="+id+";range="+start+"-"+end+";at="+at+";text="+text);
        lastGuard=g;
        if(g.isValid()){if(text.trim().isEmpty())blank.add(id);shown.add(text);g.onApplied();}
      }
      public void showWaitingEvent(String text,TranslationOutput.RenderGuard g,String id,long start,long end,long at){
        if(g.isValid()){waiting.add(text);g.onApplied();}
      }
      public void hide(TranslationOutput.RenderGuard g){if(g.isValid()){hidden.add(g.blankReason());g.onApplied();}}
    });
    TranslationAudit.install(new TranslationAudit.Sink(){});
    RebuildController.activity(context);RebuildController.video("abcdefghijk");RebuildController.time(0);
  }

  @After public void teardown() throws Exception {
    releaseHole.countDown();
    event("STOP "+state());
    RebuildController.Session owned=session();RebuildController.stop();
    ExecutorService cleanup=Executors.newSingleThreadExecutor();
    try {
      if(owned!=null)cleanup.submit(owned::awaitRetirement).get(6,TimeUnit.SECONDS);
      // One barrier per worker holds the entire lane until every earlier task has returned.
      for(String name:Arrays.asList("SOURCE_IO","PRIORITY_IO","PREFETCH_IO"))drainLane(name);
      Shadows.shadowOf(Looper.getMainLooper()).idle();
      event("CLEANUP drained;"+state());
    } finally {
      cleanup.shutdownNow();
      try {if(server!=null)server.shutdown();}
      finally {
        RebuildApi.reset();RebuildStream.fixtureHost=previousFixtureHost;
        field(TranslationRuntime.class,"host").set(null,previousHost);
        field(TranslationOutput.class,"sink").set(null,previousOutput);
        field(TranslationAudit.class,"sink").set(null,previousAudit);
        event("PORTS_RESTORED host="+(field(TranslationRuntime.class,"host").get(null)==previousHost)
            +";output="+(field(TranslationOutput.class,"sink").get(null)==previousOutput)
            +";audit="+(field(TranslationAudit.class,"sink").get(null)==previousAudit)
            +";stream="+Objects.equals(previousFixtureHost,RebuildStream.fixtureHost));
        System.out.println("M5E "+testName.getMethodName()+" "+diagnostic("test complete / cleanup"));
      }
    }
  }

  void drainLane(String name) throws Exception {
    ExecutorService lane=(ExecutorService)field(RebuildController.class,name).get(null);
    int size=name.equals("SOURCE_IO")?1:2;
    CountDownLatch arrived=new CountDownLatch(size);List<Future<?>> barriers=new ArrayList<>();
    for(int i=0;i<size;i++)barriers.add(lane.submit(()->{
      arrived.countDown();try{assertTrue("lane drain "+name,arrived.await(5,TimeUnit.SECONDS));}
      catch(InterruptedException e){Thread.currentThread().interrupt();throw new AssertionError(e);}
    }));
    for(Future<?> f:barriers)f.get(6,TimeUnit.SECONDS);
  }

  // Pump only ready main work while waiting for HTTP/events. Waiting does not move media time.
  void awaitState(String label,BooleanSupplier done) throws Exception {awaitState(label,done,10000);}
  void awaitState(String label,BooleanSupplier done,long budgetMs) throws Exception {
    long deadline=System.nanoTime()+TimeUnit.MILLISECONDS.toNanos(budgetMs);
    while(!done.getAsBoolean()&&System.nanoTime()<deadline){
      Shadows.shadowOf(Looper.getMainLooper()).idle();
      changed.poll(Math.min(10,budgetMs),TimeUnit.MILLISECONDS);
    }
    assertTrue(diagnostic(label),done.getAsBoolean());
  }
  boolean marked(String stage) {synchronized(events){return events.stream().anyMatch(e->e.contains(stage));}}
  boolean missingHalfShown(){return shown.stream().anyMatch(x->x.startsWith("第x句"));}
  void assertMissingHalf(long budgetMs) throws Exception {
    awaitState("valid showEvent for translated missing half 第x句",this::missingHalfShown,budgetMs);
    assertTrue(diagnostic("nonblank event"),blank.isEmpty());
    assertFalse("the echo reached the caption box: "+shown,shown.stream().anyMatch(x->x.startsWith("sentence")));
    assertFalse("hole source echo reached the caption box: "+shown,shown.stream().anyMatch(x->x.contains("over time")));
  }
  void continuousTo(long to) throws Exception {
    while(position.get()<to){
      long next=Math.min(to,position.get()+500),delta=next-position.get();
      // Advance elapsed time and the native sample together; <=500 ms is normal playback.
      org.robolectric.shadows.ShadowSystemClock.advanceBy(Duration.ofMillis(delta));
      position.set(next);RebuildController.time(next);
      Shadows.shadowOf(Looper.getMainLooper()).idle();
    }
    event("CONTINUOUS_TO "+to+";"+state());
  }
  RebuildController.Session startHeldHole() throws Exception {
    echoSentence=1;holeEcho=false;releaseHole=new CountDownLatch(1);
    RebuildController.activate(context,url,false,true);
    awaitState("first sentence displayed",()->shown.stream().anyMatch(x->x.startsWith("第0句")));
    awaitState("fixture received missing-range HTTP",()->holeEntered.getCount()==0);
    RebuildController.Session s=session();
    synchronized(s){assertTrue(diagnostic("published partial Plan"),s.plans[1].partial);assertFalse(s.plans[1].holes.isEmpty());}
    return s;
  }

  void await(BooleanSupplier done) throws Exception {
    long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(10);
    while(!done.getAsBoolean()&&System.nanoTime()<deadline){
      Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(40));Thread.sleep(10);
    }
    assertTrue(diagnostic("legacy observable state"),done.getAsBoolean());
  }

  void play(long to) throws Exception {
    position.set(to);RebuildController.time(to);
    for(int i=0;i<6;i++){Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(40));Thread.sleep(5);}
  }

  @Test public void aPageStaysUpThroughTheShortPauseBeforeTheNextSentence() throws Exception {
    RebuildController.activate(context,url,false,true);
    await(()->shown.contains("第0句说预算每年都在增长而军队变化缓慢。"));
    // Sentence 0 ends at 6750 ms; sentence 1 starts at 7450 ms.
    play(6000);hidden.clear();play(7000);play(7200);
    assertTrue("box blanked in a 700 ms pause: "+hidden,hidden.isEmpty());
    assertEquals("第0句说预算每年都在增长而军队变化缓慢。",shown.get(shown.size()-1));
    await(()->{try{play(7600);}catch(Exception e){throw new AssertionError(e);}return shown.contains("第1句说预算每年都在增长而军队变化缓慢。");});
    assertTrue(hidden.isEmpty());
  }

  /**
   * A block whose reply never parses has no translation. The video's own line is never a
   * substitute for one: only the neutral waiting placeholder may stand in while a reply can still
   * arrive.
   */
  @Test public void aBlockThatFailedToTranslateNeverShowsItsSourceLine() throws Exception {
    truncated=true;
    RebuildController.activate(context,url,false,true);
    await(()->!waiting.isEmpty()||!hidden.isEmpty());
    assertEquals("the video's own line reached the caption box: "+shown,Collections.emptyList(),shown);
    for(String text:waiting) assertFalse("source text reached the caption box: "+text,text.startsWith("sentence"));
    assertTrue("empty text reached the overlay as an event: "+blank,blank.isEmpty());
  }

  @Test public void anAbandonedBlockShowsANeutralMarkerNotItsSourceLine() throws Exception {
    filtered=true;
    RebuildController.activate(context,url,false,true);
    await(()->shown.stream().anyMatch(x->x.equals("\u2026")));
    assertFalse("the source line reached the caption box: "+shown,shown.stream().anyMatch(x->x.startsWith("sentence")));
  }

  /** Bailian refuses one block's text with HTTP 400; later blocks must still be translated. */
  @Test public void aProviderInspectionRefusalOfOneBlockDoesNotStopLaterBlocks() throws Exception {
    inspected=true;
    RebuildController.activate(context,url,false,true);
    await(()->!waiting.isEmpty()||!hidden.isEmpty());
    assertFalse("the refused block showed its source line: "+shown,shown.stream().anyMatch(x->x.startsWith("sentence")));
    position.set(60000);RebuildController.time(60000);
    await(()->{try{play(60100);}catch(Exception e){throw new AssertionError(e);}
      return shown.stream().anyMatch(x->x.startsWith("第"));});
  }

  @Test public void aTransientlyFailingBlockRetriesInsteadOfDisappearingForGood() throws Exception {
    malformedReplies=1;
    RebuildController.activate(context,url,false,true);
    await(()->shown.stream().anyMatch(x->x.startsWith("第0句")));
  }

  /**
   * One unusable event (an English echo in a Chinese target) must not hide the good events of the
   * same block: the good half is published, the bad range becomes a neutral marker, and the next
   * sentence still arrives.
   */
  @Test public void oneUnusableEventDoesNotHideTheRestOfItsBlock() throws Exception {
    echoSentence=1;
    holeEcho=true;
    RebuildController.activate(context,url,false,true);
    await(()->shown.stream().anyMatch(x->x.startsWith("第0句")));
    await(()->{try{play(8000);}catch(Exception e){throw new AssertionError(e);}
      return shown.stream().anyMatch(x->x.equals("第1句的前半句。"));});
    await(()->{try{play(12000);}catch(Exception e){throw new AssertionError(e);}
      return shown.stream().anyMatch(x->x.equals("\u2026"));});
    assertFalse("the echo reached the caption box: "+shown,shown.stream().anyMatch(x->x.startsWith("sentence")));
    await(()->{try{play(15000);}catch(Exception e){throw new AssertionError(e);}
      return shown.stream().anyMatch(x->x.startsWith("第2句"));});
  }

  /**
   * The bounded hole sub-request asks only for the missing token range; its reply is merged into
   * the published plan and the previously missing half becomes readable.
   */
  @Test public void aHoleSubRequestFillsTheMissingHalf() throws Exception {
    RebuildController.Session s=startHeldHole();int generation=s.generation;
    RebuildProtocol.Plan partial=s.plans[1];
    continuousTo(8000);
    awaitState("good half displayed while hole response held",()->shown.contains("第1句的前半句。"));
    assertFalse(missingHalfShown());assertSame(partial,s.plans[1]);
    releaseHole.countDown();
    awaitState("REBUILD_HOLE_FILLED",()->marked("REBUILD_HOLE_FILLED"));
    assertNotSame(partial,s.plans[1]);assertTrue(s.plans[1].holes.isEmpty());
    assertSame("merge must retain the original good event",partial.events.get(0),s.plans[1].events.get(0));
    continuousTo(12000);assertMissingHalf(10000);
    assertEquals(diagnostic("continuous playback retains generation"),generation,s.generation);
    assertFalse(marked("REBUILD_SEEK"));
  }

  /** Same held HTTP, but an actual jump invalidates its display generation before it returns. */
  @Test public void aSeekBeforeHoleResponseRejectsTheOldGeneration() throws Exception {
    RebuildController.Session s=startHeldHole();int generation=s.generation;
    RebuildProtocol.Plan partial=s.plans[1];TranslationOutput.RenderGuard oldGuard=lastGuard;
    // The old test's two jumps deliberately model seek here, not continuous playback.
    position.set(8000);RebuildController.time(8000);Shadows.shadowOf(Looper.getMainLooper()).idle();
    awaitState("good half after seek",()->shown.contains("第1句的前半句。"));
    position.set(12000);RebuildController.time(12000);Shadows.shadowOf(Looper.getMainLooper()).idle();
    assertTrue(diagnostic("seek advances generation"),s.generation>generation);
    assertTrue(marked("REBUILD_SEEK"));assertFalse(oldGuard.isValid());
    releaseHole.countDown();drainLane("PREFETCH_IO");drainLane("PRIORITY_IO");
    Shadows.shadowOf(Looper.getMainLooper()).idle();
    assertSame(diagnostic("old generation must not merge"),partial,s.plans[1]);
    assertFalse(marked("REBUILD_HOLE_FILLED"));assertFalse(missingHalfShown());
    AssertionError failure=assertThrows(AssertionError.class,()->assertMissingHalf(100));
    event("EXPECTED_OLD_POSITIVE_FAILURE "+failure.getMessage());
    assertFalse(shown.stream().anyMatch(x->x.contains("over time")||x.startsWith("sentence")));
    event("OLD_GENERATION_REJECTED captured="+generation+";current="+s.generation+";samePlan=true;oldGuard=false");
  }

  /** A withheld response must still fail the exact positive display assertion, then recover. */
  @Test public void aHeldHoleFailsTheDisplayAssertionWithFiniteEvidence() throws Exception {
    RebuildController.Session s=startHeldHole();int generation=s.generation;
    continuousTo(8000);
    awaitState("good half before missing half",()->shown.contains("第1句的前半句。"));
    continuousTo(12000);
    AssertionError failure=assertThrows(AssertionError.class,()->assertMissingHalf(100));
    assertTrue(failure.getMessage().contains("waiting_for=valid showEvent"));
    assertTrue(failure.getMessage().contains("generation="));
    event("EXPECTED_DISPLAY_FAILURE "+failure.getMessage());
    releaseHole.countDown();awaitState("REBUILD_HOLE_FILLED",()->marked("REBUILD_HOLE_FILLED"));
    assertMissingHalf(10000);assertEquals(generation,s.generation);
  }
}
