package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import static org.junit.Assert.*;

/** Real source-only controller/session lifecycle; source I/O is a fixture and paid I/O is forbidden. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={SourceMode124Test.Flags.class,SourceMode124Test.Keys.class,
        SourceMode124Test.Access.class,SourceMode124Test.NoPaidApi.class})
public class SourceMode124Test {
    enum Origin {PREFERRED_TRACK,DEFAULT}
    static final AtomicInteger paidCalls=new AtomicInteger();
    @Implements(CaptionAddonSupport.class) public static class Flags {
        @Implementation public static boolean aiInstalled(){return true;}
        @Implementation public static boolean memoryInstalled(){return false;}
    }
    @Implements(SecureApiKey.class) public static class Keys {
        @Implementation public static String load(Context c){return "test-only-not-a-real-key";}
    }
    @Implements(NativeCaptionBridge.class) public static class Access {
        @Implementation public static String language(Object t){return "en";}
        @Implementation public static String vss(Object t){return ".en";}
        @Implementation public static String url(Object t){return (String)t;}
        @Implementation public static void selectNative(Object m,Object t,Object o,int reason){}
    }
    public static class Engine {
        final AtomicInteger fetches=new AtomicInteger();
        public java.net.HttpURLConnection openConnection(java.net.URL url){
            assertFalse("Original mode must not probe ASR",url.toString().contains("kind=asr"));
            assertEquals("/api/timedtext",url.getPath());fetches.incrementAndGet();
            byte[] body="{\"events\":[{\"tStartMs\":0,\"dDurationMs\":5000,\"segs\":[{\"utf8\":\"Hello world.\"}]}]}".getBytes(StandardCharsets.UTF_8);
            return new java.net.HttpURLConnection(url){
                public void connect(){} public void disconnect(){} public boolean usingProxy(){return false;}
                public int getResponseCode(){return 200;} public String getContentType(){return "application/json";}
                public java.io.InputStream getInputStream(){return new java.io.ByteArrayInputStream(body);}
            };
        }
    }
    @Implements(ContextualBatchApiClient.class) public static class NoPaidApi {
        @Implementation public static ContextualBatchApiClient.Result translate(List targets,List atoms,List before,List after,
                DeepSeekConfig.Snapshot config,TargetLanguage language,DeepSeekApiClient.RequestControl control,boolean priority,Map repair){
            paidCalls.incrementAndGet();throw new AssertionError("Source mode may not call translation API");
        }
    }
    static Object field(Object o,Class<?> c,String name)throws Exception{Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(o);}
    static Object active()throws Exception{return field(null,ContextualUnitCaptionController.class,"active");}
    static void ready(String video)throws Exception{
        Object session=active();assertNotNull(session);
        ((Future<?>)field(session,session.getClass(),"sourceTask")).get(5,TimeUnit.SECONDS);
        assertEquals(video,field(session,session.getClass(),"videoId"));
        assertEquals(true,field(session,session.getClass(),"sourceOnly"));
        assertEquals(CaptionDiagnostics.uiText((Context)field(session,session.getClass(),"context")),true,field(session,session.getClass(),"timelineReady"));
        assertTrue(((List<?>)field(session,session.getClass(),"units")).size()>0);
        for(int state:(int[])field(session,session.getClass(),"states"))assertEquals(2,state);
    }
    @Test public void originalTrackTakeoverAndPrefetchedShortUseRealSourceSessionsWithoutApi()throws Exception{
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();DeepSeekCaptionHook.setMainActivity(a);CaptionAddonSupport.initialize(a);
        paidCalls.set(0);SourceCaptionCache.clear(a);
        Field transport=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");transport.setAccessible(true);Object oldTransport=transport.get(null);Engine engine=new Engine();transport.set(null,engine);
        DeepSeekConfig.saveEnabled(a,false);PageCaptionController.onVideoId("aaaaaaaaaaa");
        String first="https://www.youtube.com/api/timedtext?v=aaaaaaaaaaa&lang=en",next="https://www.youtube.com/api/timedtext?v=bbbbbbbbbbb&lang=en";
        Object ma=new Object(),mb=new Object();
        try{
            NativeCaptionBridge.onNativeSelection(ma,first,Origin.PREFERRED_TRACK);
            assertTrue(CaptionQuickToggle.setEngine(a,true));ready("aaaaaaaaaaa");assertTrue(DynamicCaptionController.isVisibleActive());
            Object previous=active();NativeCaptionBridge.onNativeSelection(mb,next,Origin.DEFAULT);assertSame(previous,active());
            PageCaptionController.onVideoId("bbbbbbbbbbb");ready("bbbbbbbbbbb");assertNotSame(previous,active());
            assertEquals(true,field(previous,previous.getClass(),"cancelled"));
            assertTrue(CaptionQuickToggle.setEngine(a,false));assertFalse(DynamicCaptionController.isVisibleActive());assertEquals(0,paidCalls.get());assertEquals(2,engine.fetches.get());
        }finally{ContextualUnitCaptionController.deactivateForCoreSwitch();transport.set(null,oldTransport);a.finish();}
    }
    @Test public void videoChangeWhileActivationWaitsForLockCannotLeaveHalfStartedOldSession()throws Exception{
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();DeepSeekCaptionHook.setMainActivity(a);
        DeepSeekConfig.saveEnabled(a,true);PageCaptionController.onVideoId("aaaaaaaaaaa");CaptionChoice.select("en",false,false);
        Object lock=field(null,ContextualUnitCaptionController.class,"ACTIVE_LOCK");
        java.util.concurrent.atomic.AtomicReference<Throwable> failed=new java.util.concurrent.atomic.AtomicReference<>();
        Thread pending=new Thread(()->{try{ContextualUnitCaptionController.activateSource(a,"https://www.youtube.com/api/timedtext?v=aaaaaaaaaaa&lang=en");}catch(Throwable t){failed.set(t);}});
        try{
            synchronized(lock){
                pending.start();long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(5);
                while(pending.getState()!=Thread.State.BLOCKED && System.nanoTime()<deadline)Thread.sleep(5);
                assertEquals(Thread.State.BLOCKED,pending.getState());PageCaptionController.onVideoId("bbbbbbbbbbb");
            }
            pending.join(5000);assertFalse(pending.isAlive());assertNull(failed.get());
            assertFalse("Old-video activation must not take ownership after the swipe",DynamicCaptionController.isVisibleActive());
            assertTrue(CaptionDiagnostics.uiText(a).contains("BACKGROUND_ACTIVATION_IGNORED"));
        }finally{ContextualUnitCaptionController.deactivateForCoreSwitch();a.finish();}
    }

}
