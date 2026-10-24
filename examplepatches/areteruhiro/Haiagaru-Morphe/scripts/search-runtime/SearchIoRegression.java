package app.morphe.extension.chmate;
import android.content.ContextWrapper;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicReference;

/** Real Android file and clock tests, no public requests and no application data. */
public final class SearchIoRegression {
    static int checks;
    static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;System.out.println("PASS "+label);}
    public static void main(String[] args)throws Exception{
        File root=new File(args[0]);if(!root.isDirectory())throw new IllegalArgumentException("Fixture directory required");
        ContextWrapper context=new ContextWrapper(null){
            public File getFilesDir(){return root;}
            public File getCacheDir(){return new File(root,"legacy-cache");}
        };
        File cache=WacchoiPageCache.file(context,"concurrent.html");
        check(WacchoiPageCache.read(context,cache)==null,"missing page is a cache miss");
        AtomicReference<Throwable> failure=new AtomicReference<>();
        ExecutorService pool=Executors.newFixedThreadPool(4);
        List<Future<?>> writes=new ArrayList<>();
        for(int t=0;t<4;t++){final byte marker=(byte)('A'+t);writes.add(pool.submit(()->{
            try{byte[] page=new byte[16384];Arrays.fill(page,marker);
                for(int n=0;n<80;n++){
                    WacchoiPageCache.write(context,cache,page);
                    byte[] read=WacchoiPageCache.read(context,cache);
                    if(read==null||read.length!=page.length)throw new AssertionError("partial response length");
                    for(byte value:read)if(value!=read[0])throw new AssertionError("mixed response");
                }
            }catch(Throwable error){failure.set(error);}
        }));}
        for(Future<?> task:writes)task.get();pool.shutdown();
        check(failure.get()==null,"four parallel cache readers/writers never expose partial pages: "+failure.get());
        check(cache.lastModified()>System.currentTimeMillis()-60000,"response receives current timestamp");
        WacchoiStorageLimits.limit=4;
        File a=WacchoiPageCache.file(context,"a.html"),b=WacchoiPageCache.file(context,"b.html");
        WacchoiPageCache.write(context,a,"aaaa".getBytes(StandardCharsets.UTF_8));a.setLastModified(1);
        WacchoiPageCache.write(context,b,"bbbb".getBytes(StandardCharsets.UTF_8));
        check(!a.exists()&&b.exists(),"trim preserves the newest response and subtracts deleted lengths");
        List<Long> starts=Collections.synchronizedList(new ArrayList<>());
        ExecutorService scans=Executors.newFixedThreadPool(3);List<Future<?>> tasks=new ArrayList<>();
        for(int i=0;i<3;i++)tasks.add(scans.submit(()->{try{SearchRequestPacing.await("http://FIXTURE.invalid/page");starts.add(android.os.SystemClock.elapsedRealtime());}catch(InterruptedException error){throw new RuntimeException(error);}}));
        for(Future<?> task:tasks)task.get();scans.shutdown();Collections.sort(starts);
        check(starts.get(1)-starts.get(0)>=9950&&starts.get(2)-starts.get(1)>=9950,"parallel scans share the 10-second host interval");
        long before=android.os.SystemClock.elapsedRealtime();SearchRequestPacing.await("http://other.invalid/page");
        check(android.os.SystemClock.elapsedRealtime()-before<1000,"different hosts have independent intervals");
        Thread cancelled=new Thread(()->{try{SearchRequestPacing.await("http://fixture.invalid/next");failure.set(new AssertionError("cancelled waiter proceeded"));}catch(InterruptedException expected){}});
        cancelled.start();Thread.sleep(100);cancelled.interrupt();cancelled.join(1000);
        check(!cancelled.isAlive()&&failure.get()==null,"waiting scan cancels promptly without a network request");
        System.out.println("PASS "+checks+" Android search cache/pacing checks");
    }
}
