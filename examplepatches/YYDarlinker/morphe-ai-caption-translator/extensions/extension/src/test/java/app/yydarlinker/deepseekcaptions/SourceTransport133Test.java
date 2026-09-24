package app.yydarlinker.deepseekcaptions;
import android.app.Activity;import java.net.*;import java.io.*;import java.lang.reflect.*;import java.nio.charset.StandardCharsets;
import java.util.*;import java.util.concurrent.*;import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=28)
public class SourceTransport133Test {
    Activity a;Object old;Transport transport;
    static final String URL="https://www.youtube.com/api/timedtext?v=transport33&lang=en";
    public static class Transport {
        final List<String> paths=new CopyOnWriteArrayList<>();boolean requireCookie,block;
        volatile String cookie="";volatile int disconnects;
        final CountDownLatch entered=new CountDownLatch(1),closed=new CountDownLatch(1);
        public HttpURLConnection openConnection(java.net.URL url){
            paths.add(url.getPath());boolean bootstrap=url.getPath().equals("/sw.js");
            return new HttpURLConnection(url){
                public void connect(){}public boolean usingProxy(){return false;}
                public void disconnect(){disconnects++;closed.countDown();}
                public void setRequestProperty(String key,String value){if(key.equals("Cookie"))cookie=value;super.setRequestProperty(key,value);}
                public int getResponseCode()throws IOException {
                    if(block){entered.countDown();try{closed.await(5,TimeUnit.SECONDS);}catch(InterruptedException e){Thread.currentThread().interrupt();throw new InterruptedIOException();}throw new IOException("closed");}
                    return !bootstrap&&requireCookie&&cookie.isEmpty()?401:200;
                }
                public Map<String,List<String>> getHeaderFields(){return bootstrap?Collections.singletonMap("Set-Cookie",Arrays.asList("YSC=fixture; Path=/","NotAccepted=ignored; Path=/")):Collections.emptyMap();}
                public String getContentType(){return "application/json";}
                public InputStream getInputStream(){return new ByteArrayInputStream("{\"events\":[{\"tStartMs\":0,\"dDurationMs\":5000,\"segs\":[{\"utf8\":\"Hello world.\"}]}]}".getBytes(StandardCharsets.UTF_8));}
            };
        }
    }
    @Before public void setup()throws Exception {
        ContextualUnitCaptionController.deactivateForCoreSwitch();a=Robolectric.buildActivity(Activity.class).setup().get();SourceCaptionCache.clear(a);
        for(String name:Arrays.asList("cached","fetchedAt","lastRefreshAttempt","refreshing")){
            Field f=FreshYouTubeCookies.class.getDeclaredField(name);f.setAccessible(true);if(f.getType()==String.class)f.set(null,"");else if(f.getType()==boolean.class)f.set(null,false);else f.set(null,0L);
        }
        Field f=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");f.setAccessible(true);old=f.get(null);transport=new Transport();f.set(null,transport);
    }
    @After public void cleanup()throws Exception {ContextualUnitCaptionController.deactivateForCoreSwitch();Field f=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");f.setAccessible(true);f.set(null,old);a.finish();}
    @Test public void coldSourceDoesNotWaitForCookieBootstrap()throws Exception {
        RawCaptionSource.load(a,URL,false,false);assertEquals(Arrays.asList("/api/timedtext"),transport.paths);assertEquals(1,transport.disconnects);
    }
    @Test public void authenticationRejectionRefreshesCookiesOnceWithinSameSourceAttempt()throws Exception {
        transport.requireCookie=true;RawCaptionSource.load(a,URL,false,false);
        assertEquals(Arrays.asList("/api/timedtext","/sw.js","/api/timedtext"),transport.paths);
        assertEquals("YSC=fixture",transport.cookie);assertEquals(3,transport.disconnects);
    }
    @Test public void switchingVideoDisconnectsBlockedSourceReadAndPreventsOldPublication()throws Exception {
        transport.block=true;DeepSeekConfig.saveEnabled(a,true);CaptionChoice.select("en",false,false);
        ContextualUnitCaptionController.onVideoId("transport33");ContextualUnitCaptionController.activateSource(a,URL);
        Object session=PlaybackRecovery133Test.session();assertTrue(transport.entered.await(5,TimeUnit.SECONDS));
        ContextualUnitCaptionController.onVideoId("another133a");assertTrue(transport.closed.await(2,TimeUnit.SECONDS));
        assertEquals(true,PlaybackRecovery133Test.get(session,"cancelled"));assertFalse((boolean)PlaybackRecovery133Test.get(session,"timelineReady"));
        assertNull(PlaybackRecovery133Test.session());assertEquals(1,transport.paths.size());
    }
    @Test public void originalModeDoesNotBootstrapCookiesProbeAsrOrTranslate()throws Exception {
        RawCaptionSource.Source result=RawCaptionSource.load(a,URL,false,false);
        assertEquals(0,result.document.cues().get(0).startMs);assertEquals(5000,result.document.cues().get(0).endMs);
        assertEquals("Hello world.",result.document.cues().get(0).text);assertEquals(1,transport.paths.size());
    }
}
