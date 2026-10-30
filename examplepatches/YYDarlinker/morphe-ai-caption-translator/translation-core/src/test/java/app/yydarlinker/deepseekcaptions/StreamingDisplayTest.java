package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.content.Context;
import android.os.Looper;
import android.os.SystemClock;
import java.time.Duration;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.BooleanSupplier;
import java.util.function.Supplier;
import okhttp3.mockwebserver.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Streamed replies through the real engine and HTTP stack; the first event is shown early. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=28,manifest=Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class StreamingDisplayTest {
  final Context context=RuntimeEnvironment.getApplication();
  final String url="https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en&tlang=zh-Hans";
  MockWebServer server;
  final List<String> shown=new CopyOnWriteArrayList<>(),statuses=new CopyOnWriteArrayList<>();
  final AtomicInteger streamedRequests=new AtomicInteger(),plainRequests=new AtomicInteger();
  volatile long landingRequestedAt,firstShownAt;
  volatile boolean refuseStream,cutStream;
  static final String[] TEXTS={"第零句说，","预算每年都在增长，","而军队变化缓慢。"};

  /**
   * The landing sentence "sentence 0 says the budget | grows every year | while the army ..." as
   * three clause events in the pinned reply shape; later blocks as one event.
   */
  static String reply(JSONObject input) throws Exception {
    JSONArray tokens=input.getJSONArray("owned_tokens"),events=new JSONArray();
    int n=tokens.length();
    int[][] ranges=input.getString("block").startsWith("b0_") ? new int[][]{{0,4},{5,7},{8,n-1}} : new int[][]{{0,n-1}};
    for(int e=0;e<ranges.length;e++){
      StringBuilder source=new StringBuilder();
      for(int t=ranges[e][0];t<=ranges[e][1];t++)source.append(t==ranges[e][0]?"":" ").append(tokens.getJSONArray(t).getString(1));
      events.put(new JSONObject().put("source",source.toString()).put("text",TEXTS[e]));
    }
    return new JSONObject().put("block",input.getString("block")).put("events",events).toString();
  }

  @Before public void setup() throws Exception {
    RebuildController.stop();RebuildApi.reset();RebuildCache.clear(context);
    server=new MockWebServer();
    server.setDispatcher(new Dispatcher(){public MockResponse dispatch(RecordedRequest request){
      try {
        JSONObject body=new JSONObject(request.getBody().readUtf8());
        JSONObject input=new JSONObject(body.getJSONArray("messages").getJSONObject(1).getString("content"));
        boolean landing=input.getString("block").startsWith("b0_");
        if(body.optBoolean("stream")){
          streamedRequests.incrementAndGet();
          if(refuseStream)return new MockResponse().setResponseCode(400).setBody("{\"error\":{\"message\":\"stream unsupported\"}}");
          if(cutStream){
            // Bailian output inspection: part of the reply, then an error event on a 200 stream.
            String partial=reply(input);partial=partial.substring(0,partial.length()/2);
            StringBuilder cut=new StringBuilder();
            cut.append("data: ").append(new JSONObject().put("choices",new JSONArray().put(new JSONObject().put("index",0)
                .put("delta",new JSONObject().put("content",partial)).put("finish_reason",JSONObject.NULL)))).append("\n\n");
            cut.append("data: {\"error\":{\"code\":\"data_inspection_failed\",\"message\":\"Output data may contain inappropriate content.\"}}\n\n");
            return new MockResponse().setHeader("Content-Type","text/event-stream").setBody(cut.toString());
          }
          if(landing)landingRequestedAt=System.nanoTime();
          String sse=RebuildStreamTest.sse(reply(input),12,"stop",new JSONObject().put("prompt_tokens",10).put("completion_tokens",5));
          MockResponse response=new MockResponse().setHeader("Content-Type","text/event-stream").setBody(sse);
          // The landing reply trickles in over about four seconds, like a slow provider.
          return landing ? response.throttleBody(sse.length()/16+1,250,TimeUnit.MILLISECONDS) : response;
        }
        plainRequests.incrementAndGet();
        return new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject()
            .put("message",new JSONObject().put("content",reply(input))))).toString());
      }catch(Exception e){return new MockResponse().setResponseCode(500).setBody("fixture error");}
    }});
    server.start();
    RebuildStream.fixtureHost=server.url("/v1").host();
    TranslationRuntime.install(new TranslationRuntime.Host(){
      TranslationSettings settings(Context c){return new TranslationSettings(true,server.url("/v1").toString(),"fixture-model","faithful","fixture-key","stored_custom");}
      TranslationSourceAccess.Source load(Context c,String u,boolean translate,DeepSeekApiClient.RequestControl control) throws Exception {
        byte[] body=StartupSchedulingTest.source();
        return new TranslationSourceAccess.Source(body,CaptionDocument.parse(body,"application/json"),"",0,null);
      }
      String target(){return "zh-Hans";}
      TranslationRuntime.ClockSample clock(String owner){
        long now=SystemClock.elapsedRealtime();
        return new TranslationRuntime.ClockSample(true,"abcdefghijk",500,now,3,1f);
      }
    });
    TranslationOutput.install(new TranslationOutput.Sink(){
      public void showEvent(String text,TranslationOutput.RenderGuard g,String id,long start,long end,long at,CaptionRenderSpec spec){
        if(!g.isValid())return;
        if(shown.isEmpty())firstShownAt=System.nanoTime();
        shown.add(text);g.onApplied();
      }
      public void showStatus(String text,TranslationOutput.RenderGuard g){if(g.isValid())statuses.add(text);}
    });
    TranslationAudit.install(new TranslationAudit.Sink(){});
    RebuildController.activity(context);RebuildController.video("abcdefghijk");RebuildController.time(0);
  }

  @After public void teardown() throws Exception {
    RebuildStream.fixtureHost="";RebuildController.stop();server.shutdown();
    TranslationOutput.install(new TranslationOutput.Sink(){});
  }

  void await(BooleanSupplier done,int seconds) throws Exception {
    long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(seconds);
    while(!done.getAsBoolean()&&System.nanoTime()<deadline){
      Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(40));Thread.sleep(10);
    }
    assertTrue("engine did not reach the expected observable state",done.getAsBoolean());
  }

  @Test public void firstCoherentClauseIsShownWhileTheReplyIsStillStreaming() throws Exception {
    RebuildController.activate(context,url,false,true);
    await(()->!shown.isEmpty(),10);
    assertEquals(TEXTS[0]+TEXTS[1],shown.get(0));
    long early=TimeUnit.NANOSECONDS.toMillis(firstShownAt-landingRequestedAt);
    assertTrue("first event took "+early+" ms of a ~4 s stream",early<2500);
    // The accepted plan equals the shown prefix: the caption is not re-shown or replaced.
    long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(8);
    while(System.nanoTime()<deadline){Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(40));Thread.sleep(10);}
    assertEquals(Collections.singletonList(TEXTS[0]+TEXTS[1]),new ArrayList<>(new LinkedHashSet<>(shown)));
    assertEquals(1,Collections.frequency(shown,TEXTS[0]+TEXTS[1]));
    // Only the ordinary loading status; no configuration or failure message.
    assertTrue("status shown: "+statuses,statuses.stream().allMatch("caption_translating"::equals));
  }

  @Test public void aRefusedStreamFallsBackToThePlainRequestWithoutAConfigurationError() throws Exception {
    refuseStream=true;
    RebuildController.activate(context,url,false,true);
    await(()->!shown.isEmpty(),10);
    // The complete plain reply is one readable page: all three short clause events fit two lines
    // and the recommended page wall time, so nothing is split from its continuation.
    assertEquals(TEXTS[0]+TEXTS[1]+TEXTS[2],shown.get(0));
    // Only requests already in flight when the refusal arrived were sent in the streamed form.
    assertTrue("streamed attempts "+streamedRequests.get(),streamedRequests.get()<=2);
    assertTrue(plainRequests.get()>=1);
    // Only the ordinary loading status; no configuration or failure message.
    assertTrue("status shown: "+statuses,statuses.stream().allMatch("caption_translating"::equals));
  }

  @Test public void aStreamCutByAnErrorEventIsRequestedAgainWithoutStreaming() throws Exception {
    cutStream=true;
    RebuildController.activate(context,url,false,true);
    // A cut after an introductory fragment must not publish that fragment. The same request
    // falls back to a complete plain response and displays the readable clause.
    await(()->plainRequests.get()>=1&&!shown.isEmpty(),10);
    assertEquals(TEXTS[0]+TEXTS[1]+TEXTS[2],shown.get(0));
    assertTrue("status shown: "+statuses,statuses.stream().allMatch("caption_translating"::equals));
    // Each request tried the stream first; the cut did not switch streaming off for later ones.
    assertTrue(streamedRequests.get()>=1);
  }
}
