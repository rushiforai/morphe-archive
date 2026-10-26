package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.content.Context;
import android.content.ContextWrapper;
import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.*;
import java.util.concurrent.*;
import okhttp3.mockwebserver.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Real cache IO and RawCaptionSource parsing/HTTP; only the YouTube route is mapped to loopback. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28, manifest=Config.NONE, shadows=M5iSourceCacheFailureTest.Route.class)
@LooperMode(LooperMode.Mode.PAUSED)
public class M5iSourceCacheFailureTest {
    static MockWebServer fixture;
    static final List<String> routes=new CopyOnWriteArrayList<>();
    static final String BODY="{\"events\":[{\"tStartMs\":0,\"dDurationMs\":1000,\"segs\":[{\"utf8\":\"fixture source\"}]}]}";
    static final String NEW=BODY.replace("fixture source","replacement source");
    @Rule public org.junit.rules.TemporaryFolder owned=new org.junit.rules.TemporaryFolder(
            new File(System.getProperty("n39.root"),"work/temp"));
    @Rule public org.junit.rules.TestName name=new org.junit.rules.TestName();
    Context context;
    File directory;
    ExecutorService writes;
    final List<String> trace=new CopyOnWriteArrayList<>();
    final Map<Field,Object> cookies=new HashMap<>();

    @Implements(DeepSeekCaptionHook.class)
    public static class Route {
        @Implementation public static HttpURLConnection openWithYouTubeCronet(URL url) throws Exception {
            if(fixture==null||!"https".equals(url.getProtocol())||!"www.youtube.com".equals(url.getHost())
                    ||!"/api/timedtext".equals(url.getPath())) throw new AssertionError("unmapped connection: "+url);
            routes.add(url.getFile());
            return (HttpURLConnection)fixture.url(url.getFile()).url().openConnection();
        }
    }
    @Before public void before() throws Exception {
        File cache=owned.newFolder("cache");
        context=new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public File getCacheDir(){return cache;}
            @Override public Context getApplicationContext(){return this;}
        };
        directory=new File(cache,"deepseek-source-captions");assertTrue(directory.mkdirs());
        Field worker=SourceCaptionCache.class.getDeclaredField("WRITES");worker.setAccessible(true);
        writes=(ExecutorService)worker.get(null);drain();
        RawCaptionSource.installFetcherForTests(null);SourceCatalog.clear();routes.clear();
        for(String n:new String[]{"cached","fetchedAt","refreshing","lastAttempt"}) {
            Field f=FreshYouTubeCookies.class.getDeclaredField(n);f.setAccessible(true);cookies.put(f,f.get(null));
            if(n.equals("cached"))f.set(null,"");else if(n.equals("refreshing"))f.setBoolean(null,false);else f.setLong(null,0);
        }
        fixture=new MockWebServer();fixture.setDispatcher(new Dispatcher(){
            @Override public MockResponse dispatch(RecordedRequest r) {
                if(!"GET".equals(r.getMethod())||!r.getPath().startsWith("/api/timedtext?"))
                    throw new AssertionError("unexpected fixture request: "+r);
                return new MockResponse().setHeader("Content-Type","application/json").setBody(BODY);
            }
        });fixture.start();
    }
    @After public void after() throws Exception {
        try {
            drain();
            System.out.println("M5I_SOURCE "+new org.json.JSONObject().put("test",name.getMethodName())
                    .put("source_get",fixture.getRequestCount()).put("provider_post",0)
                    .put("routes",new org.json.JSONArray(routes)).put("trace",new org.json.JSONArray(trace)));
            for(int i=0;i<fixture.getRequestCount();i++) {
                RecordedRequest r=fixture.takeRequest(2,TimeUnit.SECONDS);assertNotNull(r);assertEquals("GET",r.getMethod());
            }
        } finally {
            fixture.shutdown();fixture=null;RawCaptionSource.installFetcherForTests(null);SourceCatalog.clear();
            for(Map.Entry<Field,Object> e:cookies.entrySet())e.getKey().set(null,e.getValue());
            SourceCaptionCache.clear(context);
        }
    }
    void drain() throws Exception {writes.submit(()->{}).get(3,TimeUnit.SECONDS);}
    String url(String id){return "https://www.youtube.com/api/timedtext?v="+id+"&lang=en&fmt=json3&name=manual";}
    String key(String id){return SourceCaptionCache.key(url(id));}
    File body(String key){return new File(directory,key+".source");}
    File type(String key){return new File(directory,key+".type");}
    byte[] bytes(String text){return text.getBytes(StandardCharsets.UTF_8);}
    void seed(String k,String text,String mime) throws Exception {
        Files.write(body(k).toPath(),bytes(text));
        if(mime!=null)Files.write(type(k).toPath(),bytes(mime));
    }
    void put(String k,String text) throws Exception {SourceCaptionCache.put(context,k,bytes(text),"application/json");drain();}
    void loaded(String id) throws Exception {
        RawCaptionSource.Source s=RawCaptionSource.load(context,url(id),false,null);
        assertEquals("fixture source",s.document.cues().get(0).text);assertEquals(0,SourceLoadFlights.activeFlights());
    }
    void recovered(String id) throws Exception {
        int before=fixture.getRequestCount();loaded(id);drain();assertEquals(before+1,fixture.getRequestCount());
        loaded(id);assertEquals("reentry must hit the repaired cache",before+1,fixture.getRequestCount());
    }
    @Test public void badBodiesRecoverThroughRealParsingAndOneGetWithoutClearingAnotherTrack() throws Exception {
        String other=key("m5i-other");seed(other,BODY,"application/json");byte[] untouched=Files.readAllBytes(body(other).toPath());
        String[] bad={"","{\"events\":[", "<html>fixture refusal</html>","{\"events\":[]}"};
        for(int i=0;i<bad.length;i++){String id="m5i-bad"+i;seed(key(id),bad[i],"application/json");recovered(id);}
        assertArrayEquals(untouched,Files.readAllBytes(body(other).toPath()));loaded("m5i-other");assertEquals(4,fixture.getRequestCount());
    }
    @Test public void missingExpiredAndOversizedBodiesRecoverWithTheOriginalBudget() throws Exception {
        recovered("m5i-missing");
        seed(key("m5i-expired"),BODY,"application/json");
        assertTrue(body(key("m5i-expired")).setLastModified(System.currentTimeMillis()-TimeUnit.HOURS.toMillis(25)));
        recovered("m5i-expired");
        try(RandomAccessFile f=new RandomAccessFile(body(key("m5i-large")),"rw")){f.setLength(16L*1024*1024+1);}
        recovered("m5i-large");assertEquals(3,fixture.getRequestCount());
    }
    @Test public void missingAndWrongTypeUseBodySniffingAndNeverFetchAValidTrack() throws Exception {
        seed(key("m5i-no-type"),BODY,null);seed(key("m5i-wrong-type"),BODY,"text/html");
        loaded("m5i-no-type");loaded("m5i-wrong-type");assertEquals(0,fixture.getRequestCount());
        seed(key("m5i-wrong-bad"),"garbage","text/vtt");recovered("m5i-wrong-bad");
    }
    @Test public void typeReplacementFailurePreservesOldBodyAndLaterWriteRecovers() throws Exception {
        String k=key("m5i-type-fail");seed(k,BODY,null);
        assertTrue(type(k).mkdir());Files.write(new File(type(k),"obstruction").toPath(),bytes("owned"));
        put(k,NEW);
        assertArrayEquals("a failed metadata replacement must preserve the previous usable body",bytes(BODY),Files.readAllBytes(body(k).toPath()));
        loaded("m5i-type-fail");assertEquals(0,fixture.getRequestCount());
        Files.delete(new File(type(k),"obstruction").toPath());Files.delete(type(k).toPath());
        put(k,NEW);assertArrayEquals(bytes(NEW),SourceCaptionCache.get(context,k).body);
        assertEquals(0,directory.listFiles((d,n)->n.contains(".tmp-")).length);
    }
    @Test public void missingTemporaryCannotDeleteAnExistingValidReplacementTarget() throws Exception {
        File target=body(key("m5i-move"));Files.write(target.toPath(),bytes(BODY));
        Method replace=SourceCaptionCache.class.getDeclaredMethod("replace",File.class,File.class);replace.setAccessible(true);
        try{replace.invoke(null,new File(directory,"missing-owned-temp"),target);}
        catch(InvocationTargetException expected){assertTrue(expected.getCause() instanceof IOException);}
        assertTrue("failed move must not delete the old file",target.isFile());
        assertArrayEquals(bytes(BODY),Files.readAllBytes(target.toPath()));
    }
    @Test public void prepareFailureAndBodyFailureLeaveOtherEntriesAndRecover() throws Exception {
        String good=key("m5i-good");seed(good,BODY,"application/json");
        String blocked=key("m5i-prep");
        // Same real staging name as the single writer, discovered on that writer without a hook.
        long tid=writes.submit(()->Thread.currentThread().getId()).get(3,TimeUnit.SECONDS);
        File temp=new File(body(blocked)+".tmp-"+tid);assertTrue(temp.mkdir());
        Files.write(new File(temp,"obstruction").toPath(),bytes("owned"));put(blocked,NEW);
        assertNull(SourceCaptionCache.get(context,blocked));loaded("m5i-good");
        Files.delete(new File(temp,"obstruction").toPath());Files.delete(temp.toPath());put(blocked,BODY);loaded("m5i-prep");
        String fail=key("m5i-body-fail");assertTrue(body(fail).mkdir());Files.write(new File(body(fail),"obstruction").toPath(),bytes("owned"));
        Files.write(type(fail).toPath(),bytes("text/vtt"));put(fail,NEW);
        assertEquals("metadata must be restored when the body move fails","text/vtt",new String(Files.readAllBytes(type(fail).toPath()),StandardCharsets.UTF_8));
        Files.delete(new File(body(fail),"obstruction").toPath());Files.delete(body(fail).toPath());put(fail,BODY);loaded("m5i-body-fail");
        assertEquals(0,fixture.getRequestCount());
    }
    @Test public void queuedBeforeClearCannotResurrectAndNewEpochCanWrite() throws Exception {
        CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);
        Future<?> barrier=writes.submit(()->{trace.add("writer-held");entered.countDown();
            try{assertTrue(release.await(3,TimeUnit.SECONDS));}catch(InterruptedException e){throw new AssertionError(e);}});
        try {
            assertTrue(entered.await(3,TimeUnit.SECONDS));SourceCaptionCache.put(context,key("m5i-old"),bytes(BODY),"application/json");trace.add("old-queued");
            SourceCaptionCache.clear(context);trace.add("clear-returned");release.countDown();barrier.get(3,TimeUnit.SECONDS);drain();
            assertNull(SourceCaptionCache.get(context,key("m5i-old")));trace.add("old-absent");
            put(key("m5i-new"),BODY);loaded("m5i-new");trace.add("new-hit");assertEquals(0,fixture.getRequestCount());
        } finally {release.countDown();barrier.get(3,TimeUnit.SECONDS);}
    }
    @Test public void abandonedTemporaryAndPartialPairAreNeverMistakenForATrack() throws Exception {
        File abandoned=new File(directory,key("m5i-partial")+".source.tmp-abandoned");Files.write(abandoned.toPath(),bytes(BODY));
        Files.write(type(key("m5i-partial")).toPath(),bytes("application/json"));recovered("m5i-partial");
        assertArrayEquals(bytes(BODY),Files.readAllBytes(abandoned.toPath()));
        SourceCaptionCache.clear(context);assertEquals(0,directory.list().length);
    }
    @Test public void clearDuringAlreadyStartedWriteRejectsTheOldEpochAndCleansStaging() throws Exception {
        CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);
        Context held=new ContextWrapper(context){
            @Override public Context getApplicationContext(){return this;}
            @Override public File getCacheDir(){
                trace.add("old-write-started");entered.countDown();
                try{assertTrue(release.await(3,TimeUnit.SECONDS));}catch(InterruptedException e){throw new AssertionError(e);}
                return context.getCacheDir();
            }
        };
        try {
            SourceCaptionCache.put(held,key("m5i-inflight"),bytes(BODY),"application/json");assertTrue(entered.await(3,TimeUnit.SECONDS));
            SourceCaptionCache.clear(context);trace.add("clear-returned");release.countDown();drain();
            assertNull(SourceCaptionCache.get(context,key("m5i-inflight")));assertEquals(0,directory.list().length);
            trace.add("old-epoch-rejected");put(key("m5i-inflight"),BODY);loaded("m5i-inflight");trace.add("new-epoch-hit");
            assertEquals(0,fixture.getRequestCount());
        } finally {release.countDown();drain();}
    }
    @Test public void readerWaitsForAnInProgressPairCommitThenSeesTheCompleteNewTrack() throws Exception {
        String k=key("m5i-pair");seed(k,BODY,"text/vtt");
        CountDownLatch inCommit=new CountDownLatch(1),release=new CountDownLatch(1),readerStarted=new CountDownLatch(1);
        java.util.concurrent.atomic.AtomicInteger calls=new java.util.concurrent.atomic.AtomicInteger();
        Context held=new ContextWrapper(context){
            @Override public Context getApplicationContext(){return this;}
            @Override public File getCacheDir(){
                if(calls.incrementAndGet()==2){trace.add("writer-in-commit");inCommit.countDown();
                    try{assertTrue(release.await(3,TimeUnit.SECONDS));}catch(InterruptedException e){throw new AssertionError(e);}}
                return context.getCacheDir();
            }
        };
        ExecutorService reader=Executors.newSingleThreadExecutor();
        try {
            SourceCaptionCache.put(held,k,bytes(NEW),"application/json");assertTrue(inCommit.await(3,TimeUnit.SECONDS));
            Future<SourceCaptionCache.Entry> result=reader.submit(()->{readerStarted.countDown();return SourceCaptionCache.get(context,k);});
            assertTrue(readerStarted.await(3,TimeUnit.SECONDS));
            try{result.get(100,TimeUnit.MILLISECONDS);fail("a reader cannot cross the pair commit");}catch(TimeoutException expected){trace.add("reader-waits");}
            release.countDown();SourceCaptionCache.Entry found=result.get(3,TimeUnit.SECONDS);drain();
            assertArrayEquals(bytes(NEW),found.body);assertEquals("application/json",found.contentType);trace.add("complete-pair-visible");
        } finally {release.countDown();reader.shutdownNow();assertTrue(reader.awaitTermination(3,TimeUnit.SECONDS));drain();}
    }
}
