package app.yydarlinker.deepseekcaptions;
import android.app.Activity;import android.content.Context;import android.os.Looper;
import java.util.concurrent.*;import java.util.concurrent.atomic.AtomicInteger;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,manifest=Config.NONE,shadows=AnimationDiagnosticsTest.Keys.class)
public class AnimationDiagnosticsTest {
    static final String A="fixture-opaque-alpha", B="fixture-opaque-beta";
    static AtomicInteger mainReads=new AtomicInteger(),decrypts=new AtomicInteger();
    @Implements(SecureApiKey.class) public static class Keys {
        @Implementation public static String load(Context c){if(Looper.myLooper()==Looper.getMainLooper())mainReads.incrementAndGet();return key(c.getSharedPreferences("deepseek_caption_secret",0).getString("api_key_ciphertext",""));}
        @Implementation public static String decryptStored(String encrypted){if(Looper.myLooper()==Looper.getMainLooper())mainReads.incrementAndGet();decrypts.incrementAndGet();return key(encrypted);}
        static String key(String value){return value.equals("cipher-a")?A:value.equals("cipher-b")?B:"";}
    }
    Activity a;
    @Before public void before(){a=Robolectric.buildActivity(Activity.class).setup().get();CaptionDiagnosticsWriter.clear(a);mainReads.set(0);decrypts.set(0);set("cipher-a");}
    @After public void after(){CaptionDiagnosticsWriter.drainNow(a);CaptionDiagnosticsWriter.clear(a);a.finish();}
    void set(String ciphertext){a.getSharedPreferences("deepseek_caption_secret",0).edit().putString("api_key_ciphertext",ciphertext).apply();}
    @Test public void animationDiagnosticsNeverDecryptOnTheMainThread(){
        for(int i=0;i<20;i++)CaptionDiagnostics.mark(a,"PLAYER_TRANSITION_STABLE","frame="+i+";secret="+A);
        assertEquals("animation logging must not touch Android Keystore",0,mainReads.get());
        String history=CaptionDiagnostics.history(a);assertFalse(history.contains(A));assertTrue(history.contains("[redacted]"));
        assertEquals("one bounded writer snapshot for this credential",1,decrypts.get());
        System.out.println("DIAGNOSTICS_BURST records=20;caller_key_reads="+mainReads.get()+";writer_decrypts="+decrypts.get());
    }
    @Test public void anAiOffAnimationDoesNotDecryptOnItsCaller(){
        DeepSeekConfig.saveEnabled(a,false);CaptionDiagnostics.mark(a,"PLAYER_TRANSITION_STABLE","off;"+A);
        assertEquals(0,mainReads.get());assertFalse(CaptionDiagnostics.history(a).contains(A));
    }
    @Test public void queuedRecordsKeepTheirOwnCredentialWhenTheKeyChanges() throws Exception {
        CountDownLatch blocked=new CountDownLatch(1),release=new CountDownLatch(1);
        CaptionDiagnosticsWriter.background(()->{blocked.countDown();try{release.await(3,TimeUnit.SECONDS);}catch(InterruptedException e){Thread.currentThread().interrupt();}});
        assertTrue(blocked.await(1,TimeUnit.SECONDS));
        try{CaptionDiagnostics.mark(a,"OLD_PROFILE",A);set("cipher-b");CaptionDiagnostics.mark(a,"NEW_PROFILE",B);assertEquals(0,mainReads.get());}
        finally{release.countDown();}
        String history=CaptionDiagnostics.history(a);assertFalse(history.contains(A));assertFalse(history.contains(B));
    }
    @Test public void diagnosticCaptureDoesNotWaitForTheApiProfileDecryptionLock() throws Exception {
        CountDownLatch held=new CountDownLatch(1),release=new CountDownLatch(1);
        Thread locker=new Thread(()->{synchronized(ApiProfiles.LOCK){held.countDown();try{release.await(3,TimeUnit.SECONDS);}catch(InterruptedException e){Thread.currentThread().interrupt();}}});locker.start();
        assertTrue(held.await(1,TimeUnit.SECONDS));ExecutorService caller=Executors.newSingleThreadExecutor();
        try{caller.submit(()->CaptionDiagnostics.mark(a,"ANIMATION_LOCK_TEST",A)).get(500,TimeUnit.MILLISECONDS);}
        finally{release.countDown();locker.join(1000);caller.shutdownNow();}
        assertFalse(CaptionDiagnostics.history(a).contains(A));
    }
}
