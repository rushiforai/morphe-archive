package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.*;
import android.os.Looper;
import java.io.File;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Finite queue and thread observations on the real writer/archive, with controlled backlogs. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,manifest=Config.NONE,shadows=M6aDiagnosticsMechanismTest.Keys.class)
@LooperMode(LooperMode.Mode.PAUSED)
public class M6aDiagnosticsMechanismTest {
    static final AtomicInteger mainKeys=new AtomicInteger(),decrypts=new AtomicInteger();
    static final Set<String> keyThreads=ConcurrentHashMap.newKeySet();
    static final String SECRET="opaque-m6a-fixture-credential";
    @Implements(SecureApiKey.class) public static class Keys {
        @Implementation public static String load(Context c){observe();return SECRET;}
        @Implementation public static String decryptStored(String cipher){observe();decrypts.incrementAndGet();return SECRET;}
        static void observe(){keyThreads.add(Thread.currentThread().getName());if(Looper.myLooper()==Looper.getMainLooper())mainKeys.incrementAndGet();}
    }
    Context context;
    final AtomicInteger mainFiles=new AtomicInteger();
    final List<CountDownLatch> releases=new ArrayList<>();
    final Set<String> fileThreads=ConcurrentHashMap.newKeySet();
    @Rule public org.junit.rules.TemporaryFolder owned=new org.junit.rules.TemporaryFolder(new File(System.getProperty("n39.root"),"work/temp"));
    Object field(Class<?> c,String n) throws Exception {Field f=c.getDeclaredField(n);f.setAccessible(true);return f.get(null);}
    @Before public void before() throws Exception {
        File files=owned.newFolder("files");context=new ContextWrapper(RuntimeEnvironment.getApplication()){
            @Override public Context getApplicationContext(){return this;}
            @Override public File getFilesDir(){fileThreads.add(Thread.currentThread().getName());if(Looper.myLooper()==Looper.getMainLooper())mainFiles.incrementAndGet();return files;}
        };
        CaptionDiagnostics.clear(context);CaptionDiagnosticsWriter.drainNow(context);CaptionDiagnosticArchive.read(context,"history");
        context.getSharedPreferences("deepseek_caption_secret",0).edit().putString("api_key_ciphertext","fixture-cipher").apply();
        mainKeys.set(0);decrypts.set(0);mainFiles.set(0);keyThreads.clear();fileThreads.clear();
    }
    @After public void after() throws Exception {
        for(CountDownLatch release:releases)release.countDown();CaptionDiagnosticsWriter.drainNow(context);CaptionDiagnosticArchive.read(context,"history");
        CaptionDiagnostics.clear(context);CaptionDiagnosticsWriter.drainNow(context);CaptionDiagnosticArchive.read(context,"history");
    }
    CountDownLatch block(ExecutorService lane) throws Exception {
        CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);releases.add(release);
        lane.execute(()->{entered.countDown();try{assertTrue("bounded fixture barrier",release.await(5,TimeUnit.SECONDS));}catch(InterruptedException e){Thread.currentThread().interrupt();throw new AssertionError(e);}});
        assertTrue(entered.await(2,TimeUnit.SECONDS));return release;
    }
    @Test public void finiteBurstBoundsBothLanesAndReportsDecisionBacklogAndLoss() throws Exception {
        ExecutorService writer=(ExecutorService)field(CaptionDiagnosticsWriter.class,"WRITER");CountDownLatch release=block(writer);
        long drops=CaptionDiagnosticsWriter.droppedCount(),merges=CaptionDiagnosticsWriter.mergedCount();
        for(int i=0;i<20;i++)CaptionDiagnostics.mark(context,"DISPLAY_OBSERVATION",SECRET,CaptionCredentialRef.of(SECRET),"same");
        for(int i=0;i<600;i++)CaptionDiagnostics.mark(context,"DISPLAY_NOISE",i+":"+"x".repeat(1600));
        for(int i=0;i<600;i++)CaptionDiagnostics.mark(context,"REBUILD_FAILURE_FIXTURE","decision="+i+";"+"y".repeat(1600));
        assertEquals(512,((Deque<?>)field(CaptionDiagnosticsWriter.class,"QUEUE")).size());
        assertEquals(512,((Deque<?>)field(CaptionDiagnosticsWriter.class,"DECISIONS_QUEUE")).size());
        assertEquals(177,CaptionDiagnosticsWriter.droppedCount()-drops);assertEquals(19,CaptionDiagnosticsWriter.mergedCount()-merges);
        assertEquals(1,((ThreadPoolExecutor)writer).getQueue().size());
        assertEquals(0,mainKeys.get());assertEquals(0,mainFiles.get());assertEquals(1,release.getCount());
        String stats=CaptionDiagnosticsWriter.stats("fixture");
        assertTrue("decision-only backlog must be observable: "+stats,stats.contains("pending_decisions=512"));
        assertTrue(stats,stats.contains("pending_total=1024"));release.countDown();
        CaptionDiagnosticsWriter.drainNow(context);String report=CaptionDiagnostics.fullText(context);
        assertTrue(report,report.contains("record truncated at 60000 chars"));assertTrue(report.contains("REBUILD_FAILURE_FIXTURE"));assertFalse(report.contains(SECRET));
        assertTrue(report.contains("dropped_records="+CaptionDiagnosticsWriter.droppedCount()));assertTrue(report.contains("completeness=bounded_not_guaranteed"));
        assertEquals(0,((Deque<?>)field(CaptionDiagnosticsWriter.class,"QUEUE")).size());assertEquals(0,((Deque<?>)field(CaptionDiagnosticsWriter.class,"DECISIONS_QUEUE")).size());
        System.out.println("M6A_QUEUE input=1220;normal=512;decisions=512;merged=19;dropped=177;caller_key_reads=0;caller_files=0;writer_tasks=1;truncation_observed=true");
    }
    @Test public void twentyCredentialRecordsResolveOnceOffCallerAndClearDiscardsQueuedOldEpoch() throws Exception {
        for(int i=0;i<20;i++)CaptionDiagnostics.mark(context,"PLAYER_TRANSITION_STABLE","secret="+SECRET+";i="+i);
        assertEquals(0,mainKeys.get());assertEquals(0,mainFiles.get());String history=CaptionDiagnostics.history(context);
        assertFalse(history.contains(SECRET));assertEquals(1,decrypts.get());assertEquals(Collections.singleton("caption-diagnostics-writer"),keyThreads);
        CountDownLatch release=block((ExecutorService)field(CaptionDiagnosticsWriter.class,"WRITER"));
        CaptionDiagnostics.mark(context,"REBUILD_OLD_EPOCH","discard-before-clear");long old=CaptionDiagnosticsWriter.epoch();
        CaptionDiagnostics.clear(context);CaptionDiagnostics.mark(context,"REBUILD_NEW_EPOCH","keep-after-clear");release.countDown();
        history=CaptionDiagnostics.history(context);assertFalse(history.contains("discard-before-clear"));assertTrue(history.contains("keep-after-clear"));assertTrue(CaptionDiagnosticsWriter.epoch()>old);
        System.out.println("M6A_HOT records=20;caller_key_reads=0;writer_decrypts=1;key_threads="+keyThreads+";clear_old_revival=false");
    }
    @Test public void archiveAdmissionHasBoundedBacklogAndObservableDropsAndUtf8RecordCap() throws Exception {
        ThreadPoolExecutor io=(ThreadPoolExecutor)field(CaptionDiagnosticArchive.class,"IO");CountDownLatch release=block(io);
        long before=((AtomicLong)field(CaptionDiagnosticArchive.class,"dropped")).get();
        CaptionDiagnosticArchive.append(context,"history","admitted-before-saturation");
        // Owned no-op tasks make a reproducible saturated backend without thousands of disk writes.
        for(int i=0;i<4094;i++)io.execute(()->{});
        CountDownLatch tail=new CountDownLatch(1);io.execute(tail::countDown);assertEquals(4096,io.getQueue().size());
        CaptionDiagnosticArchive.append(context,"history","overflow-one");CaptionDiagnosticArchive.append(context,"history","overflow-two");
        assertEquals(before+2,((AtomicLong)field(CaptionDiagnosticArchive.class,"dropped")).get());
        release.countDown();assertTrue(tail.await(3,TimeUnit.SECONDS));String history=CaptionDiagnosticArchive.read(context,"history");
        assertTrue(history.contains("admitted-before-saturation"));assertFalse(history.contains("overflow-one"));assertTrue(history.contains("archive dropped records: "+(before+2)));
        CaptionDiagnosticArchive.append(context,"timing","中".repeat(60010));String timing=CaptionDiagnosticArchive.read(context,"timing");
        assertTrue(timing.contains("record truncated at 60000 chars"));
        File[] segments=new File(context.getFilesDir(),"caption-diagnostics-r25/timing").listFiles();assertNotNull(segments);
        assertEquals(1,segments.length);assertTrue(segments[0].length()<=CaptionDiagnosticArchive.SEGMENT_BYTES);
        System.out.println("M6A_ARCHIVE backlog=4096;overflow_drops=2;record_chars=60000;utf8_segment_bytes="+segments[0].length()+";remaining="+io.getQueue().size());
    }
}
