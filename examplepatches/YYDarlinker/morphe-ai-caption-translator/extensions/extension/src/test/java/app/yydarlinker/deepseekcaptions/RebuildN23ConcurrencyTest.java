package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk=28)
public class RebuildN23ConcurrencyTest {
  @Test public void twoPrefetchSlotsCannotOccupyThePriorityLane() throws Exception {
    CountDownLatch release=new CountDownLatch(1),entered=new CountDownLatch(2),focus=new CountDownLatch(1),done=new CountDownLatch(5);
    AtomicInteger running=new AtomicInteger(),maximum=new AtomicInteger();
    try {
      for(int i=0;i<4;i++) RebuildController.dispatch(false,()->{
        int count=running.incrementAndGet();maximum.accumulateAndGet(count,Math::max);entered.countDown();
        try {release.await(5,TimeUnit.SECONDS);}catch(InterruptedException e){Thread.currentThread().interrupt();}
        finally {running.decrementAndGet();done.countDown();}
      });
      assertTrue(entered.await(2,TimeUnit.SECONDS));assertEquals(2,running.get());
      RebuildController.dispatch(true,()->{focus.countDown();done.countDown();});
      assertTrue("priority dispatch must not wait for prefetch",focus.await(1,TimeUnit.SECONDS));
      assertEquals(2,maximum.get());
    } finally {release.countDown();assertTrue(done.await(5,TimeUnit.SECONDS));}
  }
}
