package app.morphe.extension.chmate;

import android.content.SharedPreferences;
import java.lang.reflect.Proxy;
import java.util.*;
import java.util.concurrent.*;

/** No Android runtime: fail if history-sized read bursts create preference snapshots. */
public final class ReporterMetadataWritesTest {
    private static int checks;
    private static void ok(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private static final class Store {
        final Map<String,String> saved=new ConcurrentHashMap<>();
        final ArrayDeque<Runnable> jobs=new ArrayDeque<>();
        int edits,commits,applies; boolean fail; Runnable duringCommit;
        final SharedPreferences prefs=(SharedPreferences)Proxy.newProxyInstance(getClass().getClassLoader(),new Class[]{SharedPreferences.class},(p,m,a)->{
            if(m.getName().equals("getString"))return saved.getOrDefault(a[0],(String)a[1]);
            if(m.getName().equals("edit")){
                edits++;Map<String,String> changes=new HashMap<>();
                return Proxy.newProxyInstance(getClass().getClassLoader(),new Class[]{SharedPreferences.Editor.class},(e,method,args)->{
                    if(method.getName().equals("putString")){changes.put((String)args[0],(String)args[1]);return e;}
                    if(method.getName().equals("apply")){applies++;throw new AssertionError("apply may overlap map copies");}
                    if(method.getName().equals("commit")){commits++;if(fail)throw new OutOfMemoryError("simulated optional metadata write failure");if(duringCommit!=null){Runnable job=duringCommit;duringCommit=null;job.run();}saved.putAll(changes);return true;}
                    throw new AssertionError(method);
                });
            }throw new AssertionError(m);
        });
        final ReporterMetadataWrites writes=new ReporterMetadataWrites(prefs,jobs::add);
        void drain(){while(!jobs.isEmpty())jobs.remove().run();}
    }
    public static void main(String[] args)throws Exception{
        Store s=new Store();s.saved.put("legacy","[old★]");
        for(int n=0;n<10000;n++){s.writes.put("thread","[id★]");s.writes.put("title:abc","[id★]");}
        ok(s.edits==0,"history read burst never edits preferences inline");
        ok(s.jobs.size()==1,"read burst coalesces into one scheduled write");
        ok("[id★]".equals(s.writes.get("thread")),"metadata remains available before persistence");
        s.drain();ok(s.commits==1&&s.applies==0,"one non-overlapping commit replaces repeated apply");
        for(int n=0;n<10000;n++)s.writes.put("thread","[id★]");
        ok(s.jobs.isEmpty()&&s.edits==1,"unchanged persisted values never schedule writes");
        ok("[old★]".equals(s.writes.get("legacy")),"legacy metadata survives");
        s.writes.put("thread","[new★]");s.duringCommit=()->{ok("[new★]".equals(s.writes.get("thread")),"in-flight batch is readable");s.writes.put("thread","[new★]");s.writes.put("thread","[latest★]");};
        s.drain();ok("[latest★]".equals(s.saved.get("thread")),"update arriving during commit is not lost");
        ok(s.commits==3,"concurrent latest value is persisted in a subsequent batch");
        Store concurrent=new Store();ExecutorService readers=Executors.newFixedThreadPool(8);List<Future<?>> work=new ArrayList<>();
        for(int t=0;t<8;t++)work.add(readers.submit(()->{for(int n=0;n<5000;n++){concurrent.writes.put("row:"+(n%100),"[same★]");concurrent.writes.get("row:"+(n%100));}}));
        for(Future<?> job:work)job.get();readers.shutdown();concurrent.drain();
        ok(concurrent.saved.size()==100&&concurrent.commits==1,"parallel history readers create one bounded batch");
        Store bounded=new Store();for(int n=0;n<20000;n++)bounded.writes.put("row:"+n,"[id★]");bounded.drain();
        ok(bounded.saved.size()<=ReporterMetadataWrites.MAX_PENDING,"pending metadata cannot grow without limit");
        ok("[id★]".equals(bounded.saved.get("row:19999")),"new metadata survives pending overflow");
        Store failing=new Store();failing.saved.put("legacy","[old★]");failing.fail=true;failing.writes.put("new","[new★]");failing.drain();
        failing.writes.put("another","[new★]");failing.drain();
        ok(failing.edits==1&&failing.jobs.isEmpty(),"OOM in optional persistence stops retries and does not escape");
        ok("[old★]".equals(failing.writes.get("legacy")),"OOM does not clear stored metadata");
        System.out.println("PASS "+checks+" reporter metadata coalescing/concurrency/memory-failure checks");
    }
}
