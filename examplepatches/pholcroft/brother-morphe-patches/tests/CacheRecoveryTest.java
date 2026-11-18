import app.template.extension.extension.VerifiedCache;
import java.util.*;
import java.util.concurrent.Executor;
public class CacheRecoveryTest {
 static class Q implements Executor {ArrayDeque<Runnable> q=new ArrayDeque<>();public void execute(Runnable r){q.add(r);}void drain(){while(!q.isEmpty())q.remove().run();}}
 static class S implements VerifiedCache.Store {boolean unavailable=true;Map<String,String> values=new HashMap<>();public String identify(String ip,String mac){if(unavailable)throw new IllegalStateException();return "id";}public String context(int v,String c){return c;}public Map<String,String> load(String i,String c){return new HashMap<>(values);}public void write(String i,String c,String o,String v){values.put(o,v);}}
 public static void main(String[] a){Q q=new Q();S s=new S();VerifiedCache c=new VerifiedCache(s,q);c.verify("ip","mac");c.learn("ip",1,"public","oid","answer");q.drain();s.unavailable=false;c.lookup("ip",1,"public","oid");q.drain();c.lookup("ip",1,"public","oid");q.drain();if(!"answer".equals(s.values.get("oid")))throw new AssertionError("response learned during failure must persist after recovery");}
}
