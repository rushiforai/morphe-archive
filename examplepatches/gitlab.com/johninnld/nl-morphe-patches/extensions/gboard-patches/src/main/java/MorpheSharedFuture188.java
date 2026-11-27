import java.util.concurrent.*;
/** The APK's actual avvx listener ABI, rather than a cast from an unrelated Future. */
public final class MorpheSharedFuture188 implements avvx {
    private final CompletableFuture<Object> delegate;
    public MorpheSharedFuture188(CompletableFuture<Object> delegate){this.delegate=delegate;}
    public void b(Runnable listener,Executor executor){delegate.whenComplete((value,error)->executor.execute(listener));}
    public boolean cancel(boolean interrupt){return delegate.cancel(false);}
    public boolean isCancelled(){return delegate.isCancelled();}
    public boolean isDone(){return delegate.isDone();}
    public Object get()throws InterruptedException,ExecutionException{return delegate.get();}
    public Object get(long timeout,TimeUnit unit)throws InterruptedException,ExecutionException,TimeoutException{return delegate.get(timeout,unit);}
}
