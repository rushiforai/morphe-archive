package santodan.patches;

import java.nio.file.*;
import java.net.URLClassLoader;
import java.util.*;
import javax.tools.ToolProvider;

/** Host execution of the production adapter/subscription against the reviewed 1.1.1 ABI. */
public final class VerifyMonetCatalog111Runtime {
    public static void main(String[] args)throws Exception {
        Path root=Path.of(args[1]);Files.createDirectories(root);Path directory=Files.createTempDirectory(root,"catalog-111-");
        Map<String,String> files=new LinkedHashMap<>();
        files.put("android/net/Uri.java","package android.net; public class Uri {public final String value; public Uri(String s){value=s;} public static Uri parse(String s){return new Uri(s);} }");
        files.put("android/util/Log.java","package android.util; public class Log {public static int w(String t,String m,Throwable e){return 0;} public static int i(String t,String m){return 0;} }");
        files.put("android/database/Cursor.java","package android.database; public interface Cursor extends AutoCloseable {boolean moveToNext();String getString(int i);long getLong(int i);void close();}");
        files.put("android/database/ContentObserver.java","package android.database; public class ContentObserver {public ContentObserver(android.os.Handler h){} public void onChange(boolean s){} public void onChange(boolean s,android.net.Uri u){onChange(s);} }");
        files.put("android/os/Looper.java","package android.os; public class Looper {public static Looper getMainLooper(){return new Looper();} }");
        files.put("android/os/HandlerThread.java","package android.os; public class HandlerThread {public HandlerThread(String n){} public void start(){} public Looper getLooper(){return new Looper();} public boolean quitSafely(){return true;} }");
        files.put("android/os/Handler.java","package android.os; import java.util.*; public class Handler {public static final List<Runnable> pending=new ArrayList<>();final List<Runnable> own=new ArrayList<>();public Handler(Looper l){} public boolean post(Runnable r){own.add(r);pending.add(r);return true;} public boolean postDelayed(Runnable r,long d){return post(r);}public void removeCallbacks(Runnable r){pending.removeIf(x->x==r);own.removeIf(x->x==r);}public void removeCallbacksAndMessages(Object t){pending.removeAll(own);own.clear();}public static void drain(){int n=0;while(!pending.isEmpty()){if(++n>50)throw new AssertionError(\"Unbounded worker\");pending.remove(0).run();}}}");
        files.put("android/content/Context.java","package android.content; public class Context {public final ContentResolver resolver=new ContentResolver();public ContentResolver getContentResolver(){return resolver;}public Context getApplicationContext(){return this;} }");
        files.put("android/content/ContentResolver.java","package android.content; import java.util.*;import android.database.*;import android.net.Uri; public class ContentResolver {public List<String[]> rows=new ArrayList<>();public boolean fail,nullRead;public int queries;public List<ContentObserver> observers=new ArrayList<>();public void registerContentObserver(Uri u,boolean d,ContentObserver o){observers.add(o);}public void unregisterContentObserver(ContentObserver o){observers.removeIf(x->x==o);}public void change(){for(ContentObserver o:List.copyOf(observers))o.onChange(false);}public Cursor query(Uri u,String[] c,String s,String[] a,String o){queries++;if(fail)throw new SecurityException(\"fixture\");if(nullRead)return null;return new Cursor(){int index=-1;public boolean moveToNext(){return ++index<rows.size();}public String getString(int i){return rows.get(index)[i];}public long getLong(int i){return Long.parseLong(getString(i));}public void close(){}};}}");
        files.put("a/n46.java","package a;import java.util.*;public class n46 {public String b,g;public long c;public List f=List.of();public n46(String owner,long channel,String key){b=owner;c=channel;g=key;} }");
        files.put("a/mu0.java","package a;import java.util.*;public class mu0 {public String b,n,l;public long k;public mu0(String owner,String key,long channel,String name){b=owner;n=key;k=channel;l=name;}public boolean equals(Object o){if(!(o instanceof mu0))return false;mu0 v=(mu0)o;return Objects.equals(b,v.b)&&Objects.equals(n,v.n)&&k==v.k&&Objects.equals(l,v.l);}public int hashCode(){return Objects.hash(b,n,k,l);} }");
        files.put("a/ss4.java","package a;public class ss4 {public ss4(android.content.Context c){} }");
        files.put("a/rx5.java","package a;import java.util.*;public class rx5 {public final ArrayList a;public rx5(List values){a=new ArrayList(values);} }");
        files.put("a/s46.java","package a;import java.util.*;public class s46 {public static final Map<Long,List<n46>> channels=new HashMap<>();public static boolean fail;public static int reads,lastLimit;public static rx5 l(android.content.Context c,android.net.Uri u,int limit,Long id){reads++;lastLimit=limit;return fail?null:new rx5(channels.getOrDefault(id,List.of()));}public static mu0 m(n46 raw,ss4 labels,List artwork,long offset,Map metadata){if(!metadata.containsKey(raw.c))throw new AssertionError(\"Missing native channel metadata\");return new mu0(raw.b,raw.g,raw.c,(String)metadata.get(raw.c));} }");
        files.put("a/lz4.java","package a;public class lz4 {public final String a,b;public final int c;public final boolean d;public lz4(int count,String owner,String title,boolean enabled){a=owner;b=title;c=count;d=enabled;} }");
        files.put("a/b42.java","package a;import java.util.*;public class b42 {public static List n(List items,LinkedHashMap apps,Set disabled,Locale locale){Map<String,Integer> counts=new LinkedHashMap<>();for(Object o:items){mu0 v=(mu0)o;counts.merge(v.b,1,Integer::sum);}List<lz4> result=new ArrayList<>();counts.forEach((owner,count)->result.add(new lz4(count,owner,owner,!disabled.contains(owner))));return result;} }");
        files.put("a/nx0.java","package a;import java.util.*;public class nx0 {public List<String> g,A=List.of();public nx0(String source){g=List.of(source);} }");
        files.put("a/ap1.java","package a;public interface ap1 {} ");
        files.put("a/lx1.java","package a;public interface lx1 {Object o(Object a,Object b,Object c,Object continuation);} ");
        files.put("a/w47.java","package a;import java.util.*;public class w47 implements ap1 {public Object value=List.of();public int writes;public final List<Runnable> listeners=new ArrayList<>();public Object getValue(){return value;}public void j(Object value){if(Objects.equals(this.value,value))return;this.value=value;writes++;for(Runnable r:List.copyOf(listeners))r.run();} }");
        files.put("a/lz7.java","package a;public class lz7 {public static w47 g(Object value){w47 state=new w47();state.value=value;return state;} }");
        files.put("a/np.java","package a;public class np extends w47 {public np(w47 a,w47 b,w47 c,lx1 f){Runnable update=()->j(f.o(a.getValue(),b.getValue(),c.getValue(),null));a.listeners.add(update);b.listeners.add(update);c.listeners.add(update);value=f.o(a.getValue(),b.getValue(),c.getValue(),null);} }");
        files.put("a/zl0.java","package a;public class zl0 {public static np q(ap1 a,ap1 b,ap1 c,lx1 f){return new np((w47)a,(w47)b,(w47)c,f);} }");
        files.put("a/qc4.java","package a;public class qc4 {public final w47 A=new w47();} ");
        files.put("a/kx1.java","package a;public interface kx1 {Object e(Object value,Object composer,Object flags);} ");
        files.put("a/vw1.java","package a;public interface vw1 {Object a(Object value);} ");
        files.put("a/jx1.java","package a;public interface jx1 {Object f(Object a,Object b);} ");
        files.put("a/tw1.java","package a;public interface tw1 {Object b();} ");
        files.put("a/mx1.java","package a;public interface mx1 {Object i(Object a,Object b,Object c,Object d,Object e);} ");
        files.put("a/iy1.java","package a;public class iy1 {} ");
        files.put("a/mx0.java","package a;public enum mx0 {CONTINUE_WATCHING,RECOMMENDATIONS,BOTH} ");
        files.put("a/xr4.java","package a;public interface xr4 {Object a();} ");
        files.put("a/by4.java","package a;public class by4 implements xr4 {public final mx0 a;public by4(mx0 mode){a=mode;}public Object a(){return a;}public boolean equals(Object v){return v instanceof by4&&((by4)v).a==a;}public int hashCode(){return a.hashCode();} }");
        files.put("a/ov4.java","package a;public class ov4 {public String a,b;public long c;public ov4(String key,String title,long id){a=key;b=title;c=id;} }");
        files.put("a/ay4.java","package a;public class ay4 implements xr4 {public final ov4 a;public ay4(ov4 channel){a=channel;}public Object a(){return a.a;} }");
        files.put("a/o43.java","package a;public class o43 {public Object lastPackages,lastChannel=new Object();public String lastRow;public final jx1 M=(row,value)->{lastRow=(String)row;lastPackages=value;return null;};public final jx1 F=(row,value)->{lastRow=(String)row;lastChannel=value;return null;};} ");
        files.put("a/nd3.java","package a;public class nd3 implements vw1 {public final o43 l=new o43();public String m=\"row\";public Object selected;public Object a(Object choice){if(!(choice instanceof xr4))throw new AssertionError(\"Synthetic ID reached native callback\");selected=choice;if(choice instanceof ay4)l.F.f(m,((ay4)choice).a);return this;} }");
        files.put("a/b84.java","package a;import java.util.*;public class b84 {public static List choices;public static Object selected;public static kx1 label,secondary;public static vw1 first,second,callback;public static Set checked,disabled;public static mx1 predicate;public static int defaults;public static void E1(String title,String subtitle,List o,Object s,kx1 l,boolean enabled,kx1 sec,vw1 a,vw1 b,Set c,Set d,mx1 p,vw1 select,tw1 dismiss,iy1 composer,int f,int f1,int def){choices=o;selected=s;label=l;secondary=sec;first=a;second=b;checked=c;disabled=d;predicate=p;callback=select;defaults=def;} }");
        files.put("a/m42.java","package a;public class m42 {public static String owner;public static Object filter;public static boolean d0(mu0 item,String selected,ov4 spec){owner=selected;filter=spec;return java.util.Objects.equals(item.b,selected)&&(spec==null||item.k==spec.c);} }");
        files.put("Fixture.java",Files.readString(Path.of(args[2])));
        List<String> inputs=new ArrayList<>();
        for(var e:files.entrySet()) {Path file=directory.resolve(e.getKey());Files.createDirectories(file.getParent());Files.writeString(file,e.getValue());inputs.add(file.toString());}
        try(var paths=Files.walk(Path.of(args[0]).getParent())) {paths.filter(p->p.toString().endsWith(".java")).forEach(p->inputs.add(p.toString()));}
        inputs.addAll(List.of("--release","11","-d",directory.toString()));
        if(ToolProvider.getSystemJavaCompiler().run(null,null,null,inputs.toArray(new String[0]))!=0)throw new AssertionError("Catalog 1.1.1 fixture compilation failed");
        try(var loader=new URLClassLoader(new java.net.URL[]{directory.toUri().toURL()},null)) {loader.loadClass("Fixture").getMethod("run").invoke(null);}
        System.out.println("PASS: 1.1.1 production catalog runtime; native channel-choice deduplication/filtering; saved-ID/callback persistence; revision refresh with empty Recommendations; provider failure/recovery; lifecycle cancellation");
    }
}
