package e.e.a;

import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

/** Socket cancellation and TLS close may perform I/O, even for an idle connection. */
final class NicoliveIo {
 private static final AtomicInteger ids=new AtomicInteger();
 private static final ExecutorService cleanup=Executors.newFixedThreadPool(2,new ThreadFactory(){
  public Thread newThread(Runnable task){Thread t=new Thread(task,"nicoid-live-close-"+ids.incrementAndGet());t.setDaemon(true);return t;}
 });
 static Future<?> execute(Runnable task){return cleanup.submit(task);}
 private NicoliveIo(){}
}
