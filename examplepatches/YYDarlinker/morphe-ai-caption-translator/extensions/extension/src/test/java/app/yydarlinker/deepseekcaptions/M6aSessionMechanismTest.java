package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.*;
import android.os.Looper;
import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.time.Duration;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import okhttp3.mockwebserver.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Real strict settings and source IO through six source-only sessions; owned queues only. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,manifest=Config.NONE,shadows={ConfigCredentialFailureTest.Models.class,
        ConfigCredentialFailureTest.Actions.class,ConfigCredentialFailureTest.Catalog.class,M6aSessionMechanismTest.Route.class})
@LooperMode(LooperMode.Mode.PAUSED)
public class M6aSessionMechanismTest {
    static MockWebServer fixture;
    static final String VIDEO="m6afixture1";
    static final String BODY="{\"events\":[{\"tStartMs\":0,\"dDurationMs\":3000,\"segs\":[{\"utf8\":\"Hello world.\",\"tOffsetMs\":0}]}]}";
    final ConfigCredentialFailureTest f=new ConfigCredentialFailureTest();
    final Set<String> reads=ConcurrentHashMap.newKeySet(),writes=ConcurrentHashMap.newKeySet();
    final AtomicInteger mainCache=new AtomicInteger(),mainPreferences=new AtomicInteger(),batches=new AtomicInteger(),attempts=new AtomicInteger();
    final AtomicReference<CountDownLatch> ready=new AtomicReference<>();
    final List<RebuildController.Session> sessions=new ArrayList<>();
    final List<String> trace=new CopyOnWriteArrayList<>();
    Object host,audit,output;String previousVideo;Context context;ExecutorService barrier;
    @Rule public org.junit.rules.TemporaryFolder owned=new org.junit.rules.TemporaryFolder(new File(System.getProperty("n39.root"),"work/temp"));
    @Implements(DeepSeekCaptionHook.class) public static class Route {
        @Implementation public static HttpURLConnection openWithYouTubeCronet(URL u) throws Exception {
            if(fixture==null||!u.getProtocol().equals("https")||!u.getHost().equals("www.youtube.com")||!u.getPath().equals("/api/timedtext"))throw new AssertionError("unmapped source: "+u);
            return (HttpURLConnection)fixture.url(u.getFile()).url().openConnection();
        }
    }
    Object field(Class<?> c,String n) throws Exception {Field p=c.getDeclaredField(n);p.setAccessible(true);return p.get(null);}
    void set(Class<?> c,String n,Object value) throws Exception {Field p=c.getDeclaredField(n);p.setAccessible(true);p.set(null,value);}
    @Before public void before() throws Exception {
        f.before();RebuildController.stop();host=field(TranslationRuntime.class,"host");audit=field(TranslationAudit.class,"sink");output=field(TranslationOutput.class,"sink");previousVideo=(String)field(RebuildController.class,"video");
        fixture=new MockWebServer();fixture.setDispatcher(new Dispatcher(){public MockResponse dispatch(RecordedRequest r){
            if(!"GET".equals(r.getMethod())||!r.getPath().startsWith("/api/timedtext?"))throw new AssertionError("unmapped fixture: "+r);
            return new MockResponse().setHeader("Content-Type","application/json").setBody(BODY);
        }});fixture.start();
        ProxySelector.setDefault(new ProxySelector(){
            public List<java.net.Proxy> select(URI uri){if(!uri.getHost().equals(fixture.getHostName()))throw new AssertionError("unknown connection: "+uri);return Collections.singletonList(java.net.Proxy.NO_PROXY);}
            public void connectFailed(URI uri,SocketAddress address,IOException e){throw new AssertionError(e);}
        });
        File cache=owned.newFolder("cache"),files=owned.newFolder("files");Object commit=field(SourceCaptionCache.class,"COMMIT_LOCK");
        context=new ContextWrapper(f.c){
            public Context getApplicationContext(){return this;}
            public File getFilesDir(){return files;}
            public File getCacheDir(){
                if(Looper.myLooper()==Looper.getMainLooper())mainCache.incrementAndGet();
                if(Thread.holdsLock(commit)) {
                    String stack=Arrays.toString(Thread.currentThread().getStackTrace());
                    if(stack.contains("SourceCaptionCache.write"))writes.add(Thread.currentThread().getName());
                    else if(stack.contains("getLocked"))reads.add(Thread.currentThread().getName());
                }
                return cache;
            }
            public SharedPreferences getSharedPreferences(String name,int mode){
                SharedPreferences real=super.getSharedPreferences(name,mode);
                return (SharedPreferences)java.lang.reflect.Proxy.newProxyInstance(SharedPreferences.class.getClassLoader(),new Class<?>[]{SharedPreferences.class},(p,m,a)->{
                    if(Looper.myLooper()==Looper.getMainLooper()&&(m.getName().startsWith("get")||m.getName().equals("contains")))mainPreferences.incrementAndGet();
                    try{return m.invoke(real,a);}catch(InvocationTargetException e){throw e.getCause();}
                });
            }
        };
        CaptionApplication app=(CaptionApplication)field(CaptionApplication.class,"INSTANCE");
        TranslationRuntime.install(new TranslationRuntime.Host(){
            TranslationSettings settings(Context c){return app.settings(c);}
            TranslationSourceAccess.Source load(Context c,String url,boolean translate,DeepSeekApiClient.RequestControl ctl) throws Exception{return app.load(c,url,translate,ctl);}
            String target(){return "en";}
            boolean translates(){return false;}
            void mark(Context c,String stage,String detail,CaptionCredentialRef credential){
                CaptionDiagnostics.mark(c,stage,detail,credential);
                if(stage.equals("REBUILD_SOURCE_READY")){trace.add("ready:"+Thread.currentThread().getName());ready.get().countDown();}
            }
        });
        TranslationOutput.install(new TranslationOutput.Sink(){});
        TranslationAudit.install(new TranslationAudit.Sink(){
            public TranslationAudit.Request begin(TranslationSettings c,boolean p,int t,int n,int tc,int nc,String b){batches.incrementAndGet();return new TranslationAudit.Request(null);}
            public int attempt(TranslationAudit.Request r,int bytes){return attempts.incrementAndGet();}
        });
        barrier=Executors.newSingleThreadExecutor(r->new Thread(r,"m6a-owned-barrier"));RebuildController.video(VIDEO);
        CaptionDiagnostics.clear(context);CaptionDiagnosticsWriter.drainNow(context);CaptionDiagnosticArchive.read(context,"history");mainCache.set(0);mainPreferences.set(0);
    }
    void drain(Class<?> c,String name) throws Exception {((ExecutorService)field(c,name)).submit(()->{}).get(3,TimeUnit.SECONDS);}
    void retired(RebuildController.Session s) throws Exception {
        barrier.submit(s::awaitRetirement).get(5,TimeUnit.SECONDS);assertNull(s.publication.reserve());assertNull(s.sourceJob);
        if(s.jobs!=null)for(RebuildController.Job j:s.jobs)assertNull(j);
    }
    @After public void after() throws Exception {
        try {
            RebuildController.stop();for(RebuildController.Session s:sessions)retired(s);
            drain(RebuildController.class,"SOURCE_IO");drain(SourceCaptionCache.class,"WRITES");CaptionDiagnosticsWriter.drainNow(context);CaptionDiagnosticArchive.read(context,"history");
            barrier.shutdownNow();assertTrue(barrier.awaitTermination(3,TimeUnit.SECONDS));fixture.shutdown();fixture=null;
        } finally {
            set(TranslationRuntime.class,"host",host);set(TranslationAudit.class,"sink",audit);set(TranslationOutput.class,"sink",output);set(RebuildController.class,"video",previousVideo);f.after();
        }
    }
    @Test public void sixSessionSwitchStopCyclesDrainOwnedWorkAndReentryUsesTheRealCache() throws Exception {
        int hotKeys=0,hotPrefs=0;
        for(int i=0;i<6;i++) {
            ready.set(new CountDownLatch(1));String url="https://www.youtube.com/api/timedtext?v="+VIDEO+"&lang=en&fmt=json3&name=track"+(i%2);
            RebuildController.activate(context,url,true,true);RebuildController.Session s=(RebuildController.Session)field(RebuildController.class,"active");assertNotNull(s);sessions.add(s);
            assertTrue("real source parse ready",ready.get().await(3,TimeUnit.SECONDS));drain(RebuildController.class,"SOURCE_IO");drain(SourceCaptionCache.class,"WRITES");
            int keys=ConfigCredentialFailureTest.reads,prefs=mainPreferences.get();
            for(int tick=0;tick<20;tick++)RebuildController.time(500);
            hotKeys+=ConfigCredentialFailureTest.reads-keys;hotPrefs+=mainPreferences.get()-prefs;
            if(i%2==1){RebuildController.stop();retired(s);Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(100));assertNull(field(RebuildController.class,"active"));assertFalse((Boolean)field(RebuildController.class,"tickPosted"));}
            else if(i>0)retired(sessions.get(i-1));
        }
        RebuildController.stop();for(RebuildController.Session s:sessions)retired(s);
        drain(SourceCaptionCache.class,"WRITES");CaptionDiagnosticsWriter.drainNow(context);CaptionDiagnosticArchive.read(context,"history");
        assertEquals(2,fixture.getRequestCount());assertEquals(0,batches.get());assertEquals(0,attempts.get());assertEquals(0,SourceLoadFlights.activeFlights());
        assertEquals(0,hotKeys);assertEquals(0,hotPrefs);assertEquals(0,mainCache.get());assertTrue(mainPreferences.get()>0);
        assertEquals(Collections.singleton("CaptionSharedSourceIO"),reads);assertEquals(Collections.singleton("DeepSeekCaptionSourceCache"),writes);
        for(String n:new String[]{"SOURCE_IO","CLEANUP"})assertEquals(0,((ThreadPoolExecutor)field(RebuildController.class,n)).getQueue().size());
        assertTrue(((Deque<?>)field(CaptionDiagnosticsWriter.class,"QUEUE")).isEmpty());assertTrue(((Deque<?>)field(CaptionDiagnosticsWriter.class,"DECISIONS_QUEUE")).isEmpty());
        System.out.println("M6A_SESSION loops=6;ticks=120;source_get=2;model_batches=0;attempts=0;hot_key_reads="+hotKeys+";hot_pref_reads="+hotPrefs+";main_cache_dir=0;strict_main_pref_reads="+mainPreferences.get()+";cache_read_lock_threads="+reads+";cache_commit_threads="+writes+";flights=0;all_owned_publications_closed=true;trace="+trace);
    }
}
