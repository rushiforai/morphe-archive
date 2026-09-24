package app.yydarlinker.deepseekcaptions;

import java.net.HttpURLConnection;
import java.util.concurrent.*;

/** A total I/O deadline, not a new retry. Stops header waits and slow-drip response bodies. */
final class NetworkDeadline implements AutoCloseable {
    private static final ScheduledThreadPoolExecutor TIMER=new ScheduledThreadPoolExecutor(2,r->{
        Thread t=new Thread(r,"CaptionHttpDeadline");t.setDaemon(true);return t;
    });
    static { TIMER.setRemoveOnCancelPolicy(true); }
    private final ScheduledFuture<?> task;
    NetworkDeadline(HttpURLConnection connection,long deadlineNanos) {
        task=TIMER.schedule(()->{try{connection.disconnect();}catch(Exception ignored){}},
                Math.max(0,deadlineNanos-System.nanoTime()),TimeUnit.NANOSECONDS);
    }
    public void close(){task.cancel(false);}
}
