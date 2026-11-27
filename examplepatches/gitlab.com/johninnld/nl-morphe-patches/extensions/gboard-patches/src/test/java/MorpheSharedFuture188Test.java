import org.junit.Test;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import static org.junit.Assert.*;
public class MorpheSharedFuture188Test {
 @Test public void listenerReceivesCompletedNativeFuture()throws Exception{CompletableFuture<Object> value=new CompletableFuture<>();MorpheSharedFuture188 future=new MorpheSharedFuture188(value);AtomicInteger calls=new AtomicInteger();future.b(calls::incrementAndGet,Runnable::run);value.complete("native result");assertEquals(1,calls.get());assertEquals("native result",future.get());}
 @Test public void cancellationReachesDelegateAndListeners(){CompletableFuture<Object> value=new CompletableFuture<>();MorpheSharedFuture188 future=new MorpheSharedFuture188(value);AtomicInteger calls=new AtomicInteger();future.b(calls::incrementAndGet,Runnable::run);assertTrue(future.cancel(false));assertTrue(value.isCancelled());assertEquals(1,calls.get());assertFalse(value.complete("late text"));}
 @Test public void listenerAddedAfterCompletionStillRuns(){CompletableFuture<Object> value=CompletableFuture.completedFuture("ready");AtomicInteger calls=new AtomicInteger();new MorpheSharedFuture188(value).b(calls::incrementAndGet,Runnable::run);assertEquals(1,calls.get());}
}
