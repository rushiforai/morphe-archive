package dev.jason.gboardpatches.extension.sharedmodel;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.FutureTask;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk=34,manifest=Config.NONE)
public class SharedOcrRuntimeTest {
    @Test public void cancelledOcrDoesNotConnectWhenTheMainQueueResumes() {
        AtomicInteger connects=new AtomicInteger();
        CountDownLatch failed=new CountDownLatch(1);
        FutureTask<Void> binding=SharedOcrRuntime.connectionTask(connects::incrementAndGet,failed::countDown);
        Handler main=new Handler(Looper.getMainLooper());
        assertTrue(main.post(binding));
        assertTrue(binding.cancel(false));
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(0,connects.get());
        assertEquals(1L,failed.getCount());
    }

    @Test public void failedMainThreadConnectSignalsTheWorker() {
        CountDownLatch failed=new CountDownLatch(1);
        FutureTask<Void> binding=SharedOcrRuntime.connectionTask(()->{
            throw new IllegalStateException("Client closed");
        },failed::countDown);
        assertTrue(new Handler(Looper.getMainLooper()).post(binding));
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(0L,failed.getCount());
        assertTrue(binding.isDone());
    }
}
