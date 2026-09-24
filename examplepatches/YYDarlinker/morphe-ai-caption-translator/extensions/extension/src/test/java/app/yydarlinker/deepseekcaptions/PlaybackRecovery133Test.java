package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.os.SystemClock;
import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import static org.junit.Assert.*;

/** Actual source session lifecycle with fixture Cronet I/O; no provider or external network. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28)
public class PlaybackRecovery133Test {
    Activity activity; Object previousTransport; Engine engine;
    static Object get(Object object,String name)throws Exception {
        Class<?> type=object==null?ContextualUnitCaptionController.class:object.getClass();
        Field f=type.getDeclaredField(name);f.setAccessible(true);return f.get(object);
    }
    static void set(Object object,String name,Object value)throws Exception {
        Field f=object.getClass().getDeclaredField(name);f.setAccessible(true);f.set(object,value);
    }
    static Object session()throws Exception{return get(null,"active");}
    static void tick()throws Exception {
        Method m=ContextualUnitCaptionController.class.getDeclaredMethod("displayTick");m.setAccessible(true);m.invoke(null);
    }
    public static class Engine {
        int attempts,disconnected;boolean fail=true,emptyJson;int status=200;String body="{\"events\":[{\"tStartMs\":0,\"dDurationMs\":5000,\"segs\":[{\"utf8\":\"Hello world.\"}]}]}";
        public HttpURLConnection openConnection(URL url) {
            assertEquals("No eager cookie bootstrap or unrelated GET", "/api/timedtext",url.getPath());
            attempts++;
            return new HttpURLConnection(url) {
                public void connect(){} public boolean usingProxy(){return false;}
                public void disconnect(){disconnected++;}
                public int getResponseCode()throws IOException {
                    if(fail)throw new IOException("Exception in CronetUrlRequest: net::ERR_CONNECTION_CLOSED, Retryable=true");
                    return status;
                }
                public String getHeaderField(String name){return "Retry-After".equals(name)?"60":null;}
                public String getContentType(){return "application/json";}
                public InputStream getInputStream(){return new ByteArrayInputStream((emptyJson&&url.toString().contains("fmt=json3")?"":body).getBytes(StandardCharsets.UTF_8));}
            };
        }
    }
    @Before public void setup()throws Exception {
        activity=Robolectric.buildActivity(Activity.class).setup().get();
        ContextualUnitCaptionController.deactivateForCoreSwitch();SourceCaptionCache.clear(activity);
        Field f=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");f.setAccessible(true);previousTransport=f.get(null);engine=new Engine();f.set(null,engine);
        DeepSeekConfig.saveEnabled(activity,true);CaptionChoice.select("en",false,false);
        ContextualUnitCaptionController.onVideoId("recover133a");
    }
    @After public void cleanup()throws Exception {
        ContextualUnitCaptionController.deactivateForCoreSwitch();
        Field f=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");f.setAccessible(true);f.set(null,previousTransport);activity.finish();
    }
    @Test public void connectionClosedDoesNotPermanentlyPoisonSourceSession()throws Exception {
        ContextualUnitCaptionController.activateSource(activity,"https://www.youtube.com/api/timedtext?v=recover133a&lang=en");
        Object s=session();((Future<?>)get(s,"sourceTask")).get(5,TimeUnit.SECONDS);
        assertEquals("Recoverable source GET failure must not permanently stop captions",false,get(s,"terminalError"));
        assertEquals(1,engine.attempts);assertEquals(1,engine.disconnected);
        tick();assertEquals("No tight retry loop",1,engine.attempts);
        engine.fail=false;set(s,"sourceRetryAtMs",0L);tick();
        ((Future<?>)get(s,"sourceTask")).get(5,TimeUnit.SECONDS);
        assertEquals(true,get(s,"timelineReady"));assertEquals("",get(s,"error"));assertSame(s,session());
        assertEquals(2,engine.attempts);assertEquals(2,engine.disconnected);
    }
    @Test public void smallBackwardSeekMustResetMonotonicPresentationClock() {
        PlaybackClockEstimator clock=new PlaybackClockEstimator();clock.reset(8000,1000,1f);
        clock.update(9000,2000,2900);
        assertTrue("1-second rewind must not be swallowed by the forward-jump threshold",clock.update(8000,2050,2900).seek);
        assertFalse("Small callback noise is not a seek",clock.update(7980,2300,2900).seek);
        assertTrue("Same-millisecond callback still detects rewind",clock.update(7000,2300,2900).seek);
    }
    @Test public void sourceRateLimitWaitsWithoutCookieOrFormatRetry()throws Exception {
        engine.fail=false;engine.status=429;
        ContextualUnitCaptionController.activateSource(activity,"https://www.youtube.com/api/timedtext?v=recover133a&lang=en");
        Object s=session();((Future<?>)get(s,"sourceTask")).get(5,TimeUnit.SECONDS);
        assertEquals(false,get(s,"terminalError"));assertEquals(1,engine.attempts);
        assertTrue((long)get(s,"sourceRetryAtMs")-SystemClock.elapsedRealtime()>59_000);
        for(int i=0;i<10;i++)tick();assertEquals(1,engine.attempts);
    }
    @Test public void videoChangeCancelsScheduledSourceRecovery()throws Exception {
        ContextualUnitCaptionController.activateSource(activity,"https://www.youtube.com/api/timedtext?v=recover133a&lang=en");
        Object s=session();((Future<?>)get(s,"sourceTask")).get(5,TimeUnit.SECONDS);
        ContextualUnitCaptionController.onVideoId("different33");set(s,"sourceRetryAtMs",0L);tick();
        assertEquals(true,get(s,"cancelled"));assertNull(session());assertEquals(1,engine.attempts);
    }
    @Test public void newSignedDescriptorCanRecoverUnavailableSourceWithoutWrongTrack()throws Exception {
        engine.fail=false;engine.status=404;
        String url="https://www.youtube.com/api/timedtext?v=recover133a&lang=en&sig=old";
        ContextualUnitCaptionController.activateSource(activity,url);
        Object s=session();((Future<?>)get(s,"sourceTask")).get(5,TimeUnit.SECONDS);
        assertEquals(true,get(s,"terminalError"));tick();assertEquals(1,engine.attempts);
        engine.status=200;ContextualUnitCaptionController.activateSource(activity,url.replace("sig=old","sig=new"));
        assertSame(s,session());((Future<?>)get(s,"sourceTask")).get(5,TimeUnit.SECONDS);
        assertEquals(true,get(s,"timelineReady"));assertEquals(false,get(s,"terminalError"));
    }
    @Test public void corruptedOldSourceCacheIsNotAStickyFailure()throws Exception {
        String url="https://www.youtube.com/api/timedtext?v=recover133a&lang=en";
        String key=SourceCaptionCache.key(url);
        File dir=new File(activity.getCacheDir(),"deepseek-source-captions");dir.mkdirs();
        java.nio.file.Files.write(new File(dir,key+".source").toPath(),"<html>temporary error</html>".getBytes(StandardCharsets.UTF_8));
        java.nio.file.Files.write(new File(dir,key+".type").toPath(),"text/html".getBytes(StandardCharsets.UTF_8));
        engine.fail=false;RawCaptionSource.Source source=RawCaptionSource.load(activity,url,false,false);
        assertEquals("Hello world.",source.document.cues().get(0).text);assertEquals(1,engine.attempts);
        assertTrue(CaptionDiagnostics.uiText(activity).contains("SOURCE_CACHE_REJECTED"));
    }
    @Test public void networkLossInPreferredJsonDoesNotSpendAFormatFallback()throws Exception {
        try{RawCaptionSource.load(activity,"https://www.youtube.com/api/timedtext?v=recover133a&lang=en",false,true);fail();}
        catch(IOException expected){assertTrue(SourceRecoveryPolicy.classify(expected).retryable);}
        assertEquals(1,engine.attempts);assertEquals(1,engine.disconnected);
    }
    @Test public void invalidSuccessBodyIsNeverCached()throws Exception {
        engine.fail=false;engine.body="<html>temporary error</html>";
        String url="https://www.youtube.com/api/timedtext?v=recover133a&lang=en";
        try{RawCaptionSource.load(activity,url,false,false);fail();}catch(IllegalArgumentException expected){}
        assertNull(SourceCaptionCache.get(activity,SourceCaptionCache.key(url)));
    }

    @Test public void normalDisplayTimerRecoversWithoutUserTogglingOrSeeking()throws Exception {
        ContextualUnitCaptionController.activateSource(activity,"https://www.youtube.com/api/timedtext?v=recover133a&lang=en");
        Object s=session();((Future<?>)get(s,"sourceTask")).get(5,TimeUnit.SECONDS);
        assertEquals(false,get(s,"terminalError"));engine.fail=false;
        Shadows.shadowOf(android.os.Looper.getMainLooper()).idleFor(1,TimeUnit.SECONDS);
        ((Future<?>)get(s,"sourceTask")).get(5,TimeUnit.SECONDS);
        assertEquals(2,engine.attempts);assertEquals(true,get(s,"timelineReady"));assertSame(s,session());
    }

    @Test public void emptyPreferredJsonStillFallsBackToUsableOriginalFormat()throws Exception {
        engine.fail=false;engine.emptyJson=true;
        engine.body="{\"events\":[{\"tStartMs\":0,\"dDurationMs\":5000,\"segs\":[{\"utf8\":\"Hello\",\"tOffsetMs\":0},{\"utf8\":\" world.\",\"tOffsetMs\":2500}]}]}";
        RawCaptionSource.Source result=RawCaptionSource.load(activity,"https://www.youtube.com/api/timedtext?v=recover133a&lang=en&kind=asr",false,true);
        assertEquals(2,engine.attempts);assertEquals("Hello world.",result.document.cues().get(0).text);
        assertTrue(result.alignedAtoms.preciseRatio()>=0.8);
    }

}
