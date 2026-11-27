package dev.jason.gboardpatches.extension.sharedmodel;
import android.os.ParcelFileDescriptor;
import app.johninnl.modelhost.api.HostException;
import app.johninnl.modelhost.api.ISpeechSession;
import app.johninnl.modelhost.api.ITextResultCallback;
import app.johninnl.modelhost.api.SpeechSession;
import java.io.File;
import java.lang.reflect.Constructor;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Consumer;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=34,manifest=Config.NONE)
public class SharedSpeechControllerTest {
    @Test public void speechReadinessDoesNotDependOnGemmaReadiness()throws Exception{JSONObject host=new JSONObject("{\"state\":\"MEMORY_PAUSED\",\"enabled\":true,\"speech\":{\"enabled\":true,\"engineLoaded\":true,\"state\":\"READY\"}}");assertTrue(SharedSpeechController.readyStatus(host.getJSONObject("speech")));}
    @Test public void transientReadySnapshotDuringReconfigurationCannotBeSelected()throws Exception{assertFalse(SharedSpeechController.readyStatus(new JSONObject("{\"enabled\":true,\"engineLoaded\":true,\"state\":\"READY\",\"reconfiguring\":true}")));}
    @Test public void stoppedOrUnloadedSpeechCannotBecomeSelectable()throws Exception{assertFalse(SharedSpeechController.readyStatus(null));assertFalse(SharedSpeechController.readyStatus(new JSONObject("{\"enabled\":false,\"engineLoaded\":true,\"state\":\"READY\"}")));assertFalse(SharedSpeechController.readyStatus(new JSONObject("{\"enabled\":true,\"engineLoaded\":false,\"state\":\"READY\"}")));assertFalse(SharedSpeechController.readyStatus(new JSONObject("{\"enabled\":true,\"engineLoaded\":true,\"state\":\"MEMORY_PAUSED\"}")));}

    @Test public void contactHintsRequireAnExactCurrentUltraCapability() throws Exception {
        assertTrue(contactCapability("parakeet-ultra", "true"));
        assertFalse(contactCapability("parakeet-ultra", "false"));
        assertFalse(contactCapability("parakeet-ultra", "\"true\""));
        assertFalse(contactCapability("parakeet-tdt-v3", "true"));
    }

    @Test public void boundedContactNamesKeepSpellingAndExcludeOtherContactFields() {
        SharedSpeechContactNames.Phrases phrases = new SharedSpeechContactNames.Phrases();
        for (String value : new String[]{"  Rene\u0301e   Jansen  ", "Renée Jansen", "Łukasz", "João", "O’Neill", "mail@example.org", "+3112345678", "Name\nHidden", "X".repeat(65)}) {
            phrases.offer(value);
        }
        assertEquals(java.util.List.of("Renée Jansen", "Łukasz", "João", "O’Neill"), phrases.values());
        for (int i = 0; i < 64; i++) phrases.offer("Contact " + i);
        assertEquals(32, phrases.values().size());
    }

    private static boolean contactCapability(String model, String contextBias) {
        return new app.johninnl.modelhost.api.HostCapabilities("{\"protocolMajor\":1,\"speech\":{\"modelId\":\""
            + model + "\",\"contextBias\":" + contextBias + "}}").supportsSpeechContactHints();
    }

    @Test public void stoppingWhileDecoderOpensClosesTheLateStreamWithoutFeedingIt()throws Exception {
        ExecutorService workers=Executors.newFixedThreadPool(2);
        CountDownLatch opening=new CountDownLatch(1);
        CountDownLatch finishOpen=new CountDownLatch(1);
        SpeechPeer vad=new SpeechPeer();
        SpeechPeer decoder=new SpeechPeer();
        SpeechSession late=newSession(decoder,workers);
        SharedSpeechController.CaptureSession capture=new SharedSpeechController.CaptureSession(()->{
            opening.countDown();
            try{
                if(!finishOpen.await(10,TimeUnit.SECONDS))throw new HostException("OPEN_TIMEOUT");
            }catch(InterruptedException failure){
                Thread.currentThread().interrupt();
                throw new HostException("OPEN_INTERRUPTED",failure);
            }
            return late;
        },newSession(vad,workers));
        try{
            Future<String> decoding=workers.submit(()->capture.transcribe(new float[]{0.1f},1,false));
            assertTrue(opening.await(3,TimeUnit.SECONDS));
            workers.submit(capture::close).get(3,TimeUnit.SECONDS);
            assertEquals(1,vad.closes.get());
            finishOpen.countDown();
            ExecutionException failure=assertThrows(ExecutionException.class,()->decoding.get(3,TimeUnit.SECONDS));
            assertTrue(failure.getCause() instanceof HostException);
            assertEquals("SPEECH_SESSION_CLOSED",((HostException)failure.getCause()).code);
            assertEquals(1,decoder.closes.get());
            assertEquals(0,decoder.feeds.get());
        }finally{
            finishOpen.countDown();
            capture.close();
            workers.shutdownNow();
        }
    }

    private static SpeechSession newSession(ISpeechSession remote,ExecutorService worker)throws Exception {
        Constructor<SpeechSession> constructor=SpeechSession.class.getDeclaredConstructor(
            ISpeechSession.class,ExecutorService.class,Executor.class,Executor.class,File.class,Consumer.class);
        constructor.setAccessible(true);
        Executor direct=Runnable::run;
        Consumer<SpeechSession> onClose=session->{};
        return constructor.newInstance(remote,worker,direct,direct,RuntimeEnvironment.getApplication().getCacheDir(),onClose);
    }

    private static final class SpeechPeer extends ISpeechSession.Stub {
        final AtomicInteger feeds=new AtomicInteger();
        final AtomicInteger closes=new AtomicInteger();
        public long feed(String request,ParcelFileDescriptor pcm,ITextResultCallback callback){feeds.incrementAndGet();return 1;}
        public void cancel(long id){}
        public void close(){closes.incrementAndGet();}
        public float voiceProbability(float[] window){return 0;}
    }
}
