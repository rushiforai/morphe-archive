package app.morphe.fixture;
import java.util.concurrent.*;
/** Holds only the synthetic scan executor; release always runs in the harness finally. */
public final class HissiCatalogQueueFixture implements Runnable {
 public static final CountDownLatch RELEASE=new CountDownLatch(1);
 public void run(){try{RELEASE.await(60,TimeUnit.SECONDS);}catch(InterruptedException expected){Thread.currentThread().interrupt();}}
}
