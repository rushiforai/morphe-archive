import app.template.extension.extension.CacheCoordinator;
import java.util.ArrayDeque;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Executor;

public class CacheCoordinatorTest {
    private static final class Queue implements Executor {
        final ArrayDeque<Runnable> jobs=new ArrayDeque<>();
        public void execute(Runnable r){jobs.add(r);} void drain(){while(!jobs.isEmpty())jobs.remove().run();}
    }
    private static final class Storage implements CacheCoordinator.Storage {
        final Map<String,String> data=new HashMap<>(); boolean cleared,failLoad;
        public Map<String,String> load(String id,String context){if(failLoad){failLoad=false;throw new IllegalStateException("test failure");}return new HashMap<>(data);}
        public boolean write(String id,String context,String oid,String value,long generation){if(cleared)return false;data.put(oid,value);return true;}
        public void clear(String id){data.clear();cleared=true;}
    }
    public static void main(String[] args){
        Queue queue=new Queue();Storage storage=new Storage();storage.data.put("1.2.3","old");
        CacheCoordinator cache=new CacheCoordinator(storage,queue);
        cache.load("printer","context");
        cache.learn("printer","context","1.2.3","new",0);
        queue.drain();
        if(!"new".equals(cache.get("printer","context","1.2.3")))throw new AssertionError("queued load must not overwrite newer learning");
        cache.load("printer","context");
        cache.learn("printer","context","1.2.4","old",0);
        cache.clear("printer");
        if(cache.get("printer","context","1.2.3")!=null)throw new AssertionError("clear must be immediate in memory");
        queue.drain();
        if(!storage.data.isEmpty()||cache.get("printer","context","1.2.4")!=null)throw new AssertionError("queued work must not revive cleared data");
        Storage failing=new Storage();Queue secondQueue=new Queue();CacheCoordinator second=new CacheCoordinator(failing,secondQueue);
        failing.failLoad=true;second.load("printer","context");second.clear("printer");secondQueue.drain();
        if(!failing.cleared || second.lastFailure()==null)throw new AssertionError("a failed job must not prevent the following clear and must remain visible");
    }
}
