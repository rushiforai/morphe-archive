package app.yydarlinker.deepseekcaptions;
import android.app.Activity;import android.content.*;import android.os.SystemClock;
import java.net.*;import java.io.*;import java.nio.charset.StandardCharsets;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;
import org.json.*;import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={QualityPipeline134Test.Keys.class,QualityPipeline134Test.Model.class})
public class QualityPipeline134Test {
    static final String FIRST="this pace of modernisation probably cannot last forever as history shows";
    static final String SECOND="while continuing to examine its progress";
    static volatile int calls;static volatile boolean alwaysBad;
    Activity activity;Object transport;
    @Implements(SecureApiKey.class)public static class Keys{@Implementation public static String load(Context c){return "test-local-key";}}
    @Implements(ContextualBatchApiClient.class)public static class Model {
        @Implementation public static ContextualBatchApiClient.Result translate(List<TranslationUnitTimeline.Unit> targets,List<SourceAtomTimeline.Atom> atoms,
                List<String> before,List<String> after,DeepSeekConfig.Snapshot config,TargetLanguage language,DeepSeekApiClient.RequestControl control,boolean priority,Map<String,String> repair)throws Exception{
            calls++;control.onRequestBodySent();JSONArray rows=new JSONArray();
            for(TranslationUnitTimeline.Unit u:targets){JSONArray segments=new JSONArray();
                if(alwaysBad||calls==1)segments.put(SemanticQuality134Test.pair(u.sourceText,"这种现代化速度恐怕无法永远持续下去。首先我要说明的是，我不会详细探讨平台和能力问题，这也不是一个关于武器威力的视频。我也无意讨论假想冲突。"));
                else {
                    assertTrue("retry must carry quality feedback",repair.containsKey(u.id));
                    segments.put(SemanticQuality134Test.pair(FIRST,"历史表明，这种现代化速度恐怕难以一直维持。"));
                    segments.put(SemanticQuality134Test.pair(SECOND,"同时继续考察其进展。"));
                }
                rows.put(new JSONObject().put("id",u.id).put("segments",segments));
            }
            return ContextualBatchApiClient.parseAnchored(new JSONObject().put("translations",rows).toString(),targets,atoms,repair);
        }
    }
    public static class Engine {
        public HttpURLConnection openConnection(URL u)throws Exception{
            String[] words=(FIRST+" "+SECOND).split(" ");JSONArray segs=new JSONArray();
            for(int i=0;i<words.length;i++)segs.put(new JSONObject().put("utf8",words[i]+" ").put("tOffsetMs",i*800));
            byte[] bytes=new JSONObject().put("events",new JSONArray().put(new JSONObject().put("tStartMs",0).put("dDurationMs",words.length*800).put("segs",segs))).toString().getBytes(StandardCharsets.UTF_8);
            return new HttpURLConnection(u){public void connect(){}public boolean usingProxy(){return false;}public void disconnect(){}public int getResponseCode(){return 200;}public String getContentType(){return "application/json";}public InputStream getInputStream(){return new ByteArrayInputStream(bytes);}};
        }
    }
    static Object get(Object o,String f)throws Exception{return PlaybackRecovery133Test.get(o,f);}
    @Before public void setup()throws Exception{
        ContextualUnitCaptionController.deactivateForCoreSwitch();calls=0;alwaysBad=false;activity=Robolectric.buildActivity(Activity.class).setup().get();
        SourceCaptionCache.clear(activity);DiskCaptionCache.clear(activity);
        Field f=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");f.setAccessible(true);transport=f.get(null);f.set(null,new Engine());
        MediaPlaybackClock.activity(activity);MediaPlaybackClock.video("quality134a");MediaPlaybackClock.seek(0);ContextualUnitCaptionController.onVideoId("quality134a");
        ((PlaybackClockEstimator)get(null,"PLAYBACK_CLOCK")).reset(0,SystemClock.elapsedRealtime()-1000,1);
        DeepSeekConfig.saveEnabled(activity,true);DeepSeekConfig.saveModel(activity,"fixture");CaptionChoice.select("zh-Hans",true,false);
    }
    @After public void cleanup()throws Exception{
        ContextualUnitCaptionController.deactivateForCoreSwitch();Field f=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");f.setAccessible(true);f.set(null,transport);activity.finish();
    }
    Object start()throws Exception{
        MediaPlaybackClock.raw();ContextualUnitCaptionController.onVideoTime(1000);
        ContextualUnitCaptionController.activate(activity,"https://www.youtube.com/api/timedtext?v=quality134a&lang=en&kind=asr&tlang=zh-Hans");
        Object s=PlaybackRecovery133Test.session();((Future<?>)get(s,"sourceTask")).get(5,TimeUnit.SECONDS);return s;
    }
    void state(Object s,int expected)throws Exception{
        long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(6);
        while(System.nanoTime()<end){int[] a=(int[])get(s,"states");if(a.length>0&&a[0]==expected)return;Thread.sleep(10);}
        fail("Expected state "+expected+" actual="+Arrays.toString((int[])get(s,"states"))+" calls="+calls);
    }
    @Test public void realControllerRejectsParagraphAndReusesCorrectedPlan()throws Exception{
        Object s=start();state(s,2);assertEquals(2,calls);assertEquals(1,get(s,"qualityRepairCount"));
        AnchoredCaptionPlan plan=((AnchoredCaptionPlan[])get(s,"anchoredPlans"))[0];assertEquals(2,plan.segments.size());
        assertTrue(plan.canonical.contains("历史表明"));assertFalse(plan.canonical.contains("假想冲突"));
        MediaPlaybackClock.raw();ContextualUnitCaptionController.onVideoTime(9000);MediaPlaybackClock.raw();ContextualUnitCaptionController.onVideoTime(1000);
        assertEquals(2,calls);assertFalse((boolean)get(s,"terminalError"));
    }
    @Test public void recurringParagraphStopsAfterOneRepairAndLeavesVideoAlive()throws Exception{
        alwaysBad=true;Object s=start();state(s,5);assertEquals(2,calls);assertFalse((boolean)get(s,"terminalError"));
        assertNull(((AnchoredCaptionPlan[])get(s,"anchoredPlans"))[0]);
    }
    @Test public void traceIsOffByDefaultRedactedBoundedAndCleared()throws Exception{
        CaptionQualityTrace.clear(activity);DeepSeekConfig.saveDisplayTextDebugEnabled(activity,false);
        CaptionQualityTrace.record(activity,"test-local-key",1,new JSONObject().put("source","private"),"private", "fixture");
        assertEquals("",CaptionQualityTrace.text(activity));DeepSeekConfig.saveDisplayTextDebugEnabled(activity,true);
        for(int i=0;i<20;i++)CaptionQualityTrace.record(activity,"test-local-key",i,new JSONObject().put("source","test-local-key https://secret.example/token"),"response", "fixture");
        String trace=CaptionQualityTrace.text(activity);assertTrue(trace.contains("redacted"));assertFalse("Key must be redacted",trace.contains("test-local-key"));assertFalse("JSON-escaped URLs must be redacted",trace.contains("secret.example"));
        JSONArray data=new JSONArray(activity.getSharedPreferences("caption_quality_evidence",Context.MODE_PRIVATE).getString("records","[]"));assertEquals(6,data.length());
        DeepSeekConfig.saveDisplayTextDebugEnabled(activity,false);DeepSeekConfig.saveDisplayTextDebugEnabled(activity,true);assertEquals("",CaptionQualityTrace.text(activity));
    }

    @Test public void expiredTraceIsRemovedOnRead()throws Exception{
        DeepSeekConfig.saveDisplayTextDebugEnabled(activity,true);
        JSONObject row=new JSONObject().put("at",System.currentTimeMillis()-25*60*60*1000L).put("source","old private text");
        activity.getSharedPreferences("caption_quality_evidence",Context.MODE_PRIVATE).edit().putString("records",new JSONArray().put(row).toString()).commit();
        assertEquals("",CaptionQualityTrace.text(activity));
        assertEquals("[]",activity.getSharedPreferences("caption_quality_evidence",Context.MODE_PRIVATE).getString("records","[]"));
    }

    @Test public void escapedDebugTextCannotExceedStorageBudget()throws Exception{
        DeepSeekConfig.saveDisplayTextDebugEnabled(activity,true);
        String noisy=String.join("",Collections.nCopies(12000,"\""));
        CaptionQualityTrace.record(activity,"test-local-key",1,new JSONObject().put("source",noisy),noisy,"fixture");
        String saved=activity.getSharedPreferences("caption_quality_evidence",Context.MODE_PRIVATE).getString("records","[]");
        assertTrue(saved.length()<=36000);assertTrue(saved.contains("truncated"));
    }
}
