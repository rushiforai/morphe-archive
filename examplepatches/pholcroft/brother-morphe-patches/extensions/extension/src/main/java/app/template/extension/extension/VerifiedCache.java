package app.template.extension.extension;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.Executor;

/** Verified endpoint sessions backed by asynchronous, printer-scoped storage. */
public final class VerifiedCache {
    public interface Store {
        String identify(String ip,String mac) throws Exception;
        String context(int version,String community) throws Exception;
        Map<String,String> load(String printerId,String contextId) throws Exception;
        void write(String printerId,String contextId,String oid,String value) throws Exception;
    }
    private static final class Key {
        final int version;final String community;
        Key(int version,String community){this.version=version;this.community=community;}
        @Override public boolean equals(Object value){if(!(value instanceof Key))return false;Key k=(Key)value;return version==k.version&&community.equals(k.community);}
        @Override public int hashCode(){return 31*version+community.hashCode();}
    }
    private static final class Binding {String id;boolean loading;final Map<String,String> values=new HashMap<>(),dirty=new HashMap<>();}
    private static final class Session {final String ip,mac;String printerId;boolean identifying;final LinkedHashMap<Key,Binding> contexts=new LinkedHashMap<>();Session(String ip,String mac){this.ip=ip;this.mac=mac;}}
    private final Store store;private final Executor worker;private final LinkedHashMap<String,Session> sessions=new LinkedHashMap<>();private volatile Exception failure;
    public VerifiedCache(Store store,Executor worker){if(store==null||worker==null)throw new IllegalArgumentException();this.store=store;this.worker=worker;}
    public synchronized void verify(String ip,String mac){
        if(ip==null||mac==null)throw new IllegalArgumentException();Session current=sessions.get(ip);
        if(current!=null&&current.mac.equalsIgnoreCase(mac)){identify(current);return;}
        Iterator<Session> iterator=sessions.values().iterator();while(iterator.hasNext()){Session s=iterator.next();if(s.ip.equals(ip)||s.mac.equalsIgnoreCase(mac))iterator.remove();}
        while(sessions.size()>=32){Iterator<String> it=sessions.keySet().iterator();it.next();it.remove();}
        Session session=new Session(ip,mac);sessions.put(ip,session);identify(session);
    }
    private void identify(Session session){
        if(session.printerId!=null||session.identifying)return;session.identifying=true;
        worker.execute(()->{try{String id=store.identify(session.ip,session.mac);synchronized(VerifiedCache.this){if(sessions.get(session.ip)==session)session.printerId=id;}}catch(Exception e){failure=e;}finally{synchronized(VerifiedCache.this){session.identifying=false;}}});
    }
    private Binding binding(Session session,int version,String community){
        identify(session);Key key=new Key(version,community);Binding b=session.contexts.get(key);
        if(b==null){while(session.contexts.size()>=16){Iterator<Key> it=session.contexts.keySet().iterator();it.next();it.remove();}b=new Binding();session.contexts.put(key,b);}
        final Binding binding=b;
        if(!b.loading&&(b.id==null||!b.dirty.isEmpty())){b.loading=true;worker.execute(()->{
            try{String id,context;synchronized(VerifiedCache.this){if(sessions.get(session.ip)!=session||session.contexts.get(key)!=binding)return;id=session.printerId;context=binding.id;}
                if(id==null)return;
                if(context==null){context=store.context(version,community);Map<String,String> loaded=store.load(id,context);synchronized(VerifiedCache.this){if(sessions.get(session.ip)!=session||session.contexts.get(key)!=binding)return;binding.id=context;for(Map.Entry<String,String> e:loaded.entrySet())if(binding.values.size()<4096&&!binding.values.containsKey(e.getKey()))binding.values.put(e.getKey(),e.getValue());}}
                Map<String,String> dirty;synchronized(VerifiedCache.this){dirty=new HashMap<>(binding.dirty);}
                for(Map.Entry<String,String> entry:dirty.entrySet()){
                    synchronized(VerifiedCache.this){if(sessions.get(session.ip)!=session||session.contexts.get(key)!=binding)return;}
                    store.write(id,context,entry.getKey(),entry.getValue());
                    synchronized(VerifiedCache.this){if(entry.getValue().equals(binding.dirty.get(entry.getKey())))binding.dirty.remove(entry.getKey());}
                }
                failure=null;
            }catch(Exception e){failure=e;}finally{synchronized(VerifiedCache.this){binding.loading=false;}}
        });}
        return b;
    }
    public synchronized String lookup(String ip,int version,String community,String oid){
        if(ip==null||community==null||oid==null)return null;Session s=sessions.get(ip);if(s==null)return null;return binding(s,version,community).values.get(oid);
    }
    public synchronized void learn(String ip,int version,String community,String oid,String value){
        if(ip==null||community==null||oid==null||value==null)return;Session s=sessions.get(ip);if(s==null)return;
        Binding b=binding(s,version,community);if(b.values.size()<4096||b.values.containsKey(oid)){b.values.put(oid,value);b.dirty.put(oid,value);}else return;
        // The worker may already be loading; a later access schedules any remaining dirty values.
        worker.execute(()->{synchronized(VerifiedCache.this){if(sessions.get(ip)==s)binding(s,version,community);}});
    }
    public synchronized void invalidate(String ip){sessions.remove(ip);}
    public synchronized void invalidatePrinter(String mac){if(mac==null)return;Iterator<Session> it=sessions.values().iterator();while(it.hasNext())if(it.next().mac.equalsIgnoreCase(mac))it.remove();}
    public synchronized void clearAll(){sessions.clear();}
    public Exception failure(){return failure;}
}
