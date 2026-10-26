package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.Context;
import java.lang.reflect.Field;
import java.net.*;
import java.util.*;
import java.util.concurrent.*;
import okhttp3.mockwebserver.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Real source fetch, cookie refresh and format fallback, all explicitly routed to loopback. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,manifest=Config.NONE,shadows=SourceHttpFailureContractTest.Route.class)
@LooperMode(LooperMode.Mode.PAUSED)
public class SourceHttpFailureContractTest {
    static MockWebServer fixture;
    static final List<String> routed=new CopyOnWriteArrayList<>();
    static final String BODY="{\"events\":[{\"tStartMs\":0,\"dDurationMs\":1000,\"segs\":[{\"utf8\":\"fixture source\"}]}]}";
    Context context;
    android.app.Activity activity;
    final Map<Field,Object> cookieState=new HashMap<>();
    @Rule public org.junit.rules.TestName testName=new org.junit.rules.TestName();
    @Implements(DeepSeekCaptionHook.class)
    public static class Route {
        @Implementation public static HttpURLConnection openWithYouTubeCronet(URL url) throws Exception {
            // Throw Error rather than returning null: neither production URL fallback nor cookie
            // fetch's catch(Exception) may hide an unmapped connection.
            if(fixture==null||!"https".equals(url.getProtocol())||!"www.youtube.com".equals(url.getHost())
                    ||!("/api/timedtext".equals(url.getPath())||"/sw.js".equals(url.getPath())))
                throw new AssertionError("unmapped fixture connection: "+url);
            routed.add(url.getFile());return (HttpURLConnection)fixture.url(url.getFile()).url().openConnection();
        }
    }
    @Before public void before() throws Exception {
        activity=Robolectric.buildActivity(android.app.Activity.class).setup().get();context=activity;CaptionAddonSupport.initialize(activity);
        SourceCatalog.clear();SourceCaptionCache.clear(context);RawCaptionSource.installFetcherForTests(null);routed.clear();
        for(String name:new String[]{"cached","fetchedAt","refreshing","lastAttempt"}){
            Field f=FreshYouTubeCookies.class.getDeclaredField(name);f.setAccessible(true);cookieState.put(f,f.get(null));
            if(name.equals("cached"))f.set(null,"");else if(name.equals("refreshing"))f.setBoolean(null,false);else f.setLong(null,0);
        }
        fixture=new MockWebServer();fixture.start();
    }
    @After public void after() throws Exception {
        System.out.println("M5A_SOURCE "+new org.json.JSONObject().put("test",testName.getMethodName()).put("http",fixture.getRequestCount()).put("routes",new org.json.JSONArray(routed)));
        try{fixture.shutdown();}finally{
            fixture=null;for(Map.Entry<Field,Object> e:cookieState.entrySet())e.getKey().set(null,e.getValue());
            RawCaptionSource.installFetcherForTests(null);SourceCatalog.clear();SourceCaptionCache.clear(context);routed.clear();activity.finish();
        }
    }
    String url(String video){return "https://www.youtube.com/api/timedtext?v="+video+"&lang=en&name=manual";}
    MockResponse ok(){return new MockResponse().setHeader("Content-Type","application/json").setBody(BODY);}
    RecordedRequest take() throws Exception {RecordedRequest r=fixture.takeRequest(2,TimeUnit.SECONDS);assertNotNull(r);return r;}

    @Test public void source401RefreshesCookiesOnceThenReissuesSameTrack() throws Exception {
        fixture.enqueue(new MockResponse().setResponseCode(401));
        fixture.enqueue(new MockResponse().setHeader("Set-Cookie","YSC=fixture-cookie; Path=/").setBody("fixture cookie"));fixture.enqueue(ok());
        RawCaptionSource.Source s=RawCaptionSource.load(context,url("m5aauth0001"),true,null);
        assertEquals("fixture source",s.document.cues().get(0).text);assertEquals(3,fixture.getRequestCount());assertEquals(3,routed.size());
        RecordedRequest first=take(),cookie=take(),retry=take();assertTrue(first.getPath().contains("fmt=json3"));
        assertEquals("/sw.js",cookie.getPath());assertEquals(first.getPath(),retry.getPath());assertEquals("YSC=fixture-cookie",retry.getHeader("Cookie"));
        assertEquals(0,SourceLoadFlights.activeFlights());
    }
    @Test public void persistent403UsesAuthAndFormatFallbackButNoProviderBlock() throws Exception {
        fixture.enqueue(new MockResponse().setResponseCode(403));fixture.enqueue(new MockResponse().setBody("no cookies"));
        fixture.enqueue(new MockResponse().setResponseCode(403));fixture.enqueue(new MockResponse().setResponseCode(403));fixture.enqueue(new MockResponse().setResponseCode(403));
        try{RawCaptionSource.load(context,url("m5aforb0001"),true,null);fail("403 accepted");}
        catch(SourceRecoveryPolicy.Failure f){assertEquals("http_403",f.category);assertFalse(f.retryable);}
        assertEquals("four track HTTP plus one cookie HTTP",5,fixture.getRequestCount());assertEquals(5,routed.size());
        assertTrue(take().getPath().contains("fmt=json3"));assertEquals("/sw.js",take().getPath());assertTrue(take().getPath().contains("fmt=json3"));
        assertFalse(take().getPath().contains("fmt="));assertFalse(take().getPath().contains("fmt="));assertEquals(0,SourceLoadFlights.activeFlights());
    }
    @Test public void source429PreservesDateAndServerDelayWithoutCookieOrFormatReplay() throws Exception {
        String date="Wed, 01 Jan 2031 00:00:00 GMT";
        fixture.enqueue(new MockResponse().setResponseCode(429).setHeader("Retry-After",date));
        try{RawCaptionSource.load(context,url("m5arate0001"),true,null);fail("429 accepted");}
        catch(SourceRecoveryPolicy.Failure f){assertEquals("http_429",f.category);assertTrue(f.retryable);assertTrue(f.retryAfterMs>120000);assertEquals(f.retryAfterMs,SourceRecoveryPolicy.delay(1,f.retryAfterMs));}
        assertEquals(1,fixture.getRequestCount());assertEquals(1,routed.size());assertFalse(take().getPath().equals("/sw.js"));
    }
}
