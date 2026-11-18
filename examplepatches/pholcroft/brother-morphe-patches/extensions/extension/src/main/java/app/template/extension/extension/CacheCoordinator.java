package app.template.extension.extension;

import java.util.ArrayDeque;
import java.util.Map;
import java.util.concurrent.Executor;

/** Orders durable cache work while keeping request lookups in memory. */
public final class CacheCoordinator {
    public interface Storage {
        Map<String,String> load(String printerId,String context);
        boolean write(String printerId,String context,String oid,String value,long generation);
        void clear(String printerId);
    }
    private final Storage storage; private final Executor worker; private final CacheIndex index=new CacheIndex();
    private final ArrayDeque<Runnable> work=new ArrayDeque<>(); private boolean running;private volatile RuntimeException lastFailure;
    public CacheCoordinator(Storage storage,Executor worker){if(storage==null||worker==null)throw new IllegalArgumentException();this.storage=storage;this.worker=worker;}
    private synchronized void enqueue(Runnable job){work.add(job);if(!running){running=true;worker.execute(this::drain);}}
    private void drain(){for(;;){Runnable next;synchronized(this){next=work.poll();if(next==null){running=false;return;}}try{next.run();}catch(RuntimeException e){lastFailure=e;}}}
    public RuntimeException lastFailure(){return lastFailure;}
    public void load(String printerId,String context){long generation=index.generation(printerId);enqueue(()->{Map<String,String> data=storage.load(printerId,context);index.install(printerId,context,generation,data);});}
    public void learn(String printerId,String context,String oid,String value,long storeGeneration){
        long generation=index.generation(printerId);if(!index.put(printerId,context,oid,value,generation))return;
        enqueue(()->{if(index.generation(printerId)==generation)storage.write(printerId,context,oid,value,storeGeneration);});
    }
    public String get(String printerId,String context,String oid){return index.get(printerId,context,oid);}
    public void clear(String printerId){index.clear(printerId);enqueue(()->storage.clear(printerId));}
}
