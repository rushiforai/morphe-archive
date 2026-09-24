package app.yydarlinker.deepseekcaptions;

import android.app.Activity;import android.content.Context;import android.os.SystemClock;
import java.io.*;import java.net.*;import java.lang.reflect.*;import java.nio.charset.StandardCharsets;
import java.util.*;import java.util.concurrent.*;import org.json.*;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;
import static org.junit.Assert.*;

/** Runs the real scheduler/parser/cache with a controllable model adapter, not a paid API. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={DemandedCaption133Test.Keys.class,DemandedCaption133Test.Model.class})
public class DemandedCaption133Test {
    Activity activity;Object previousTransport;
    static final List<Integer> requested=Collections.synchronizedList(new ArrayList<>());
    static volatile CountDownLatch entered,release;static volatile boolean filter;
    @Implements(SecureApiKey.class) public static class Keys {
        @Implementation public static String load(Context c){return "fixture-only-key";}
    }
    @Implements(ContextualBatchApiClient.class) public static class Model {
        @Implementation public static ContextualBatchApiClient.Result translate(List<TranslationUnitTimeline.Unit> targets,
                List<SourceAtomTimeline.Atom> atoms,List<String> before,List<String> after,DeepSeekConfig.Snapshot config,
                TargetLanguage language,DeepSeekApiClient.RequestControl control,boolean priority,Map<String,String> repair)throws Exception {
            for(TranslationUnitTimeline.Unit u:targets)requested.add(u.index);
            control.onRequestBodySent();
            CountDownLatch gate=release;if(gate!=null){entered.countDown();gate.await(5,TimeUnit.SECONDS);}
            if(filter)throw new ContextualBatchApiClient.PermanentException("content_filter","fixture filter","");
            JSONArray rows=new JSONArray();
            for(TranslationUnitTimeline.Unit u:targets)rows.put(new JSONObject().put("id",u.id).put("segments",
                    new JSONArray().put(new JSONArray().put(u.sourceText).put("这是字幕测试。"))));
            return ContextualBatchApiClient.parseAnchored(new JSONObject().put("translations",rows).toString(),targets,atoms);
        }
    }
    public static class Engine {
        public HttpURLConnection openConnection(URL url)throws Exception{
            assertEquals("No startup cookie or ASR detour for native-word source","/api/timedtext",url.getPath());
            JSONArray events=new JSONArray();for(int i=0;i<8;i++)events.put(new JSONObject().put("tStartMs",i*8000).put("dDurationMs",8000)
                    .put("segs",new JSONArray().put(new JSONObject().put("utf8","Example"+i+" ").put("tOffsetMs",0))
                            .put(new JSONObject().put("utf8","sentence.").put("tOffsetMs",4000))));
            byte[] bytes=new JSONObject().put("events",events).toString().getBytes(StandardCharsets.UTF_8);
            return new HttpURLConnection(url){public void connect(){}public void disconnect(){}public boolean usingProxy(){return false;}
                public int getResponseCode(){return 200;}public String getContentType(){return "application/json";}
                public InputStream getInputStream(){return new ByteArrayInputStream(bytes);}};
        }
    }
    static Object get(Object o,String n)throws Exception{return PlaybackRecovery133Test.get(o,n);}
    static Object active()throws Exception{return PlaybackRecovery133Test.session();}
    static void position(long ms){MediaPlaybackClock.raw();ContextualUnitCaptionController.onVideoTime(ms);}
    static void ready(Object s,int index)throws Exception {
        long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(5);
        while(System.nanoTime()<end){int[] states=(int[])get(s,"states");if(states.length>index&&states[index]==2)return;Thread.sleep(5);}
        fail("Expected READY unit "+index+";states="+Arrays.toString((int[])get(s,"states")));
    }
    @Before public void setup()throws Exception {
        ContextualUnitCaptionController.deactivateForCoreSwitch();requested.clear();entered=new CountDownLatch(1);release=null;filter=false;
        activity=Robolectric.buildActivity(Activity.class).setup().get();SourceCaptionCache.clear(activity);DiskCaptionCache.clear(activity);
        Field f=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");f.setAccessible(true);previousTransport=f.get(null);f.set(null,new Engine());
        MediaPlaybackClock.activity(activity);MediaPlaybackClock.video("demand133aa");MediaPlaybackClock.seek(0);ContextualUnitCaptionController.onVideoId("demand133aa");
        ((PlaybackClockEstimator)get(null,"PLAYBACK_CLOCK")).reset(0,SystemClock.elapsedRealtime()-1000,1);
        DeepSeekConfig.saveEnabled(activity,true);DeepSeekConfig.saveModel(activity,"fixture");CaptionChoice.select("zh-Hans",true,false);
    }
    @After public void cleanup()throws Exception {
        if(release!=null)release.countDown();ContextualUnitCaptionController.deactivateForCoreSwitch();
        Field f=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");f.setAccessible(true);f.set(null,previousTransport);activity.finish();
    }
    Object start(long time)throws Exception {
        position(time);ContextualUnitCaptionController.activate(activity,"https://www.youtube.com/api/timedtext?v=demand133aa&lang=en&kind=asr&tlang=zh-Hans");
        Object s=active();assertNotNull(s);((Future<?>)get(s,"sourceTask")).get(5,TimeUnit.SECONDS);return s;
    }
    @Test public void missedOpeningIsTranslatedOnShortRewindAndReadyReplayIsFree()throws Exception {
        Object s=start(9000);ready(s,1);assertEquals(0,((int[])get(s,"states"))[0]);
        position(7800);ready(s,0);assertEquals(7800,(long)get(s,"currentTimeMs"));
        assertEquals(1,Collections.frequency(requested,0));
        position(9000);position(1000);ready(s,0);assertEquals(1,Collections.frequency(requested,0));
        assertEquals(false,get(s,"terminalError"));
    }
    @Test public void seekWithinCurrentInFlightBatchReusesItInsteadOfPayingAgain()throws Exception {
        release=new CountDownLatch(1);Object s=start(2000);assertTrue(entered.await(5,TimeUnit.SECONDS));
        Object request=get(s,"realtimeRequest");assertNotNull(request);
        position(1000);assertSame(request,get(s,"realtimeRequest"));assertEquals(false,get(request,"cancelled"));
        release.countDown();ready(s,0);assertEquals(1,Collections.frequency(requested,0));
    }
    @Test public void contentFilteredBatchDoesNotPermanentlyDisableTheVideo()throws Exception {
        filter=true;Object s=start(1000);
        long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(5);
        while(get(s,"realtimeRequest")!=null&&System.nanoTime()<end)Thread.sleep(5);
        assertEquals(false,get(s,"terminalError"));assertEquals(5,((int[])get(s,"states"))[0]);
        filter=false;position(18000);ready(s,2);assertEquals(false,get(s,"terminalError"));
    }
}
