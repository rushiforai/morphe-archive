package santodan.patches;

import java.nio.file.*;
import java.net.URLClassLoader;
import java.util.*;
import javax.tools.ToolProvider;

/** Host execution of the production adapter/subscription against the reviewed 1.1.0 ABI. */
public final class VerifyMonetCatalog110Runtime {
    public static void main(String[] args)throws Exception {
        Path root=Path.of(args[1]);Files.createDirectories(root);Path directory=Files.createTempDirectory(root,"catalog-110-");
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
        files.put("a/pt5.java","package a;import java.util.*;public class pt5 {public String b,g;public long c;public List f=List.of();public pt5(String owner,long channel,String key){b=owner;c=channel;g=key;} }");
        files.put("a/vs0.java","package a;import java.util.*;public class vs0 {public String b,n,l;public long k;public vs0(String owner,String key,long channel,String name){b=owner;n=key;k=channel;l=name;}public boolean equals(Object o){if(!(o instanceof vs0))return false;vs0 v=(vs0)o;return Objects.equals(b,v.b)&&Objects.equals(n,v.n)&&k==v.k&&Objects.equals(l,v.l);}public int hashCode(){return Objects.hash(b,n,k,l);} }");
        files.put("a/do4.java","package a;public class do4 {public do4(android.content.Context c){} }");
        files.put("a/dn5.java","package a;import java.util.*;public class dn5 {public final ArrayList a;public dn5(List values){a=new ArrayList(values);} }");
        files.put("a/vt5.java","package a;import java.util.*;public class vt5 {public static final Map<Long,List<pt5>> channels=new HashMap<>();public static boolean fail;public static int reads,lastLimit;public static dn5 l(android.content.Context c,android.net.Uri u,int limit,Long id){reads++;lastLimit=limit;return fail?null:new dn5(channels.getOrDefault(id,List.of()));}public static vs0 m(pt5 raw,do4 labels,List artwork,long offset,Map metadata){if(!metadata.containsKey(raw.c))throw new AssertionError(\"Missing native channel metadata\");return new vs0(raw.b,raw.g,raw.c,(String)metadata.get(raw.c));} }");
        files.put("a/gt4.java","package a;public class gt4 {public final String a,b;public final int c;public final boolean d;public gt4(int count,String owner,String title,boolean enabled){a=owner;b=title;c=count;d=enabled;} }");
        files.put("a/c32.java","package a;import java.util.*;public class c32 {public static List q(List items,LinkedHashMap apps,Set disabled,Locale locale){Map<String,Integer> counts=new LinkedHashMap<>();for(Object o:items){vs0 v=(vs0)o;counts.merge(v.b,1,Integer::sum);}List<gt4> result=new ArrayList<>();counts.forEach((owner,count)->result.add(new gt4(count,owner,owner,!disabled.contains(owner))));return result;} }");
        files.put("a/wv0.java","package a;import java.util.*;public class wv0 {public List<String> g,A=List.of();public wv0(String source){g=List.of(source);} }");
        files.put("a/in1.java","package a;public interface in1 {} ");
        files.put("a/mv1.java","package a;public interface mv1 {Object o(Object a,Object b,Object c,Object continuation);} ");
        files.put("a/ct6.java","package a;import java.util.*;public class ct6 implements in1 {public Object value=List.of();public int writes;public final List<Runnable> listeners=new ArrayList<>();public Object getValue(){return value;}public void k(Object value){if(Objects.equals(this.value,value))return;this.value=value;writes++;for(Runnable r:List.copyOf(listeners))r.run();} }");
        files.put("a/k88.java","package a;public class k88 {public static ct6 g(Object value){ct6 state=new ct6();state.value=value;return state;} }");
        files.put("a/bo.java","package a;public class bo extends ct6 {public bo(ct6 a,ct6 b,ct6 c,mv1 f){Runnable update=()->k(f.o(a.getValue(),b.getValue(),c.getValue(),null));a.listeners.add(update);b.listeners.add(update);c.listeners.add(update);value=f.o(a.getValue(),b.getValue(),c.getValue(),null);} }");
        files.put("a/p35.java","package a;public class p35 {public static bo s(in1 a,in1 b,in1 c,mv1 f){return new bo((ct6)a,(ct6)b,(ct6)c,f);} }");
        files.put("a/u64.java","package a;public class u64 {public final ct6 A=new ct6();} ");
        files.put("a/lv1.java","package a;public interface lv1 {Object e(Object value,Object composer,Object flags);} ");
        files.put("a/wu1.java","package a;public interface wu1 {Object a(Object value);} ");
        files.put("a/kv1.java","package a;public interface kv1 {Object f(Object a,Object b);} ");
        files.put("a/uu1.java","package a;public interface uu1 {Object b();} ");
        files.put("a/nv1.java","package a;public interface nv1 {Object i(Object a,Object b,Object c,Object d,Object e);} ");
        files.put("a/jw1.java","package a;public class jw1 {} ");
        files.put("a/vv0.java","package a;public enum vv0 {CONTINUE_WATCHING,RECOMMENDATIONS,BOTH} ");
        files.put("a/xr4.java","package a;public interface xr4 {Object a();} ");
        files.put("a/wr4.java","package a;public class wr4 implements xr4 {public final vv0 a;public wr4(vv0 mode){a=mode;}public Object a(){return a;}public boolean equals(Object v){return v instanceof wr4&&((wr4)v).a==a;}public int hashCode(){return a.hashCode();} }");
        files.put("a/ip4.java","package a;public class ip4 {public String a,b;public long c;public ip4(String key,String title,long id){a=key;b=title;c=id;} }");
        files.put("a/vr4.java","package a;public class vr4 implements xr4 {public final ip4 a;public vr4(ip4 channel){a=channel;}public Object a(){return a.a;} }");
        files.put("a/ez2.java","package a;public class ez2 {public Object lastPackages,lastChannel=new Object();public String lastRow;public final kv1 M=(row,value)->{lastRow=(String)row;lastPackages=value;return null;};public final kv1 F=(row,value)->{lastRow=(String)row;lastChannel=value;return null;};} ");
        files.put("a/j83.java","package a;public class j83 implements wu1 {public final ez2 l=new ez2();public String m=\"row\";public Object selected;public Object a(Object choice){if(!(choice instanceof xr4))throw new AssertionError(\"Synthetic ID reached native callback\");selected=choice;if(choice instanceof vr4)l.F.f(m,((vr4)choice).a);return this;} }");
        files.put("a/f24.java","package a;import java.util.*;public class f24 {public static List choices;public static Object selected;public static lv1 label,secondary;public static wu1 first,second,callback;public static Set checked,disabled;public static nv1 predicate;public static int defaults;public static void D1(String title,String subtitle,List o,Object s,lv1 l,boolean enabled,lv1 sec,wu1 a,wu1 b,Set c,Set d,nv1 p,wu1 select,uu1 dismiss,jw1 composer,int f,int f1,int def){choices=o;selected=s;label=l;secondary=sec;first=a;second=b;checked=c;disabled=d;predicate=p;callback=select;defaults=def;} }");
        files.put("a/yp7.java","package a;public class yp7 {public static String owner;public static Object filter;public static boolean M(vs0 item,String selected,ip4 spec){owner=selected;filter=spec;return java.util.Objects.equals(item.b,selected)&&(spec==null||item.k==spec.c);} }");
        files.put("Fixture.java",Files.readString(Path.of(args[2])));
        List<String> inputs=new ArrayList<>();
        for(var e:files.entrySet()) {Path file=directory.resolve(e.getKey());Files.createDirectories(file.getParent());Files.writeString(file,e.getValue());inputs.add(file.toString());}
        try(var paths=Files.walk(Path.of(args[0]).getParent())) {paths.filter(p->p.toString().endsWith(".java")).forEach(p->inputs.add(p.toString()));}
        inputs.addAll(List.of("--release","11","-d",directory.toString()));
        if(ToolProvider.getSystemJavaCompiler().run(null,null,null,inputs.toArray(new String[0]))!=0)throw new AssertionError("Catalog 1.1.0 fixture compilation failed");
        try(var loader=new URLClassLoader(new java.net.URL[]{directory.toUri().toURL()},null)) {loader.loadClass("Fixture").getMethod("run").invoke(null);}
        System.out.println("PASS: 1.1.0 production catalog runtime; native channel-choice deduplication/filtering; saved-ID/callback persistence; revision refresh with empty Recommendations; provider failure/recovery; lifecycle cancellation");
    }
}
