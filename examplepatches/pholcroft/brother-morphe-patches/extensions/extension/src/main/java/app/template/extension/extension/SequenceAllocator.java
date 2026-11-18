package app.template.extension.extension;

import java.util.concurrent.Executor;

/** Serves pre-reserved durable sequence numbers without waiting for storage. */
public final class SequenceAllocator {
    public interface Reservation {long reserve(int count);}
    private final Reservation storage;private final Executor worker;private final int blockSize;
    private long next,limit;private boolean scheduled;private volatile RuntimeException lastFailure;
    public SequenceAllocator(Reservation storage,Executor worker,int blockSize){
        if(storage==null||worker==null||blockSize<1)throw new IllegalArgumentException();
        this.storage=storage;this.worker=worker;this.blockSize=blockSize;schedule();
    }
    private synchronized void schedule(){
        if(scheduled)return;scheduled=true;
        try{worker.execute(()->{
            try{long start=storage.reserve(blockSize);if(start<1||start>Long.MAX_VALUE-blockSize)throw new IllegalStateException("Invalid reserved sequence block");
                synchronized(SequenceAllocator.this){next=start;limit=start+blockSize;scheduled=false;}
            }catch(RuntimeException e){lastFailure=e;synchronized(SequenceAllocator.this){scheduled=false;}}
        });}catch(RuntimeException e){scheduled=false;lastFailure=e;}
    }
    /** Returns -1 if the next block is not ready; never waits for storage. */
    public synchronized long take(){if(next>=limit){schedule();return -1;}long value=next++;if(next>=limit)schedule();return value;}
    public RuntimeException lastFailure(){return lastFailure;}
}
