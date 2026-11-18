import app.template.extension.extension.VerifiedCache;
import java.util.*;
import java.util.concurrent.Executor;

public class VerifiedCacheTest {
    static final class Queue implements Executor {final ArrayDeque<Runnable> tasks=new ArrayDeque<>();public void execute(Runnable r){tasks.add(r);}void drain(){while(!tasks.isEmpty())tasks.remove().run();}}
    static final class Store implements VerifiedCache.Store {
        final Map<String,String> ids=new HashMap<>(),values=new HashMap<>();
        public String identify(String ip,String mac){return ids.computeIfAbsent(mac,k->"id"+ids.size());}
        public String context(int version,String community){return version+":"+community;}
        public Map<String,String> load(String id,String context){Map<String,String> result=new HashMap<>();String prefix=id+"|"+context+"|";for(Map.Entry<String,String> e:values.entrySet())if(e.getKey().startsWith(prefix))result.put(e.getKey().substring(prefix.length()),e.getValue());return result;}
        public void write(String id,String context,String oid,String value){values.put(id+"|"+context+"|"+oid,value);}
    }
    public static void main(String[] args){
        Queue queue=new Queue();Store store=new Store();VerifiedCache cache=new VerifiedCache(store,queue);
        cache.verify("ip1","mac1");
        if(cache.lookup("ip1",1,"one","1.2.3")!=null)throw new AssertionError("unloaded cache cannot guess");
        cache.learn("ip1",1,"one","1.2.3","integer:7");queue.drain();
        if(!"integer:7".equals(cache.lookup("ip1",1,"one","1.2.3")))throw new AssertionError("verified response must be learned");
        VerifiedCache restarted=new VerifiedCache(store,queue);restarted.verify("ip1","mac1");restarted.lookup("ip1",1,"one","1.2.3");queue.drain();
        if(!"integer:7".equals(restarted.lookup("ip1",1,"one","1.2.3")))throw new AssertionError("a new process session must reload persisted values after verification");
        if(cache.lookup("ip1",1,"other","1.2.3")!=null)throw new AssertionError("credential contexts must remain isolated");
        cache.verify("ip2","mac1");queue.drain();
        if(cache.lookup("ip1",1,"one","1.2.3")!=null)throw new AssertionError("the former address must no longer own a moved printer");
        cache.lookup("ip2",1,"one","1.2.3");queue.drain();
        if(!"integer:7".equals(cache.lookup("ip2",1,"one","1.2.3")))throw new AssertionError("a moved printer must reuse its own stored response");
        cache.verify("ip2","mac2");queue.drain();cache.lookup("ip2",1,"one","1.2.3");queue.drain();
        if(cache.lookup("ip2",1,"one","1.2.3")!=null)throw new AssertionError("a different printer must not inherit responses at a reused IP");
        cache.learn("ip2",1,"one","1.2.3","stale");cache.invalidate("ip2");queue.drain();
        if(cache.lookup("ip2",1,"one","1.2.3")!=null)throw new AssertionError("clearing must invalidate queued learning");
        cache.verify("ip3","mac3");cache.lookup("ip3",1,"one","1.2.3");cache.invalidate("ip3");queue.drain();
        if(cache.lookup("ip3",1,"one","1.2.3")!=null)throw new AssertionError("a delayed load cannot restore an invalidated session");
    }
}
