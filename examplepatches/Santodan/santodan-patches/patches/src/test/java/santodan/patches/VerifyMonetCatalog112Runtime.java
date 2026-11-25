package santodan.patches;

import java.nio.file.*;
import java.net.URLClassLoader;
import java.util.*;
import javax.tools.ToolProvider;

/** Host execution of the production adapter/subscription against the reviewed 1.1.2 ABI. */
public final class VerifyMonetCatalog112Runtime {
    public static void main(String[] args)throws Exception {
        Path root=Path.of(args[1]);Files.createDirectories(root);Path directory=Files.createTempDirectory(root,"catalog-112-");
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
        files.put("a/i86.java","package a;import java.util.*;public class i86 {public String b,g;public long c;public List f=List.of();public i86(String owner,long channel,String key){b=owner;c=channel;g=key;} }");
        files.put("a/iv0.java","package a;import java.util.*;public class iv0 {public String b,o,l;public long k;public iv0(String owner,String key,long channel,String name){b=owner;o=key;k=channel;l=name;}public boolean equals(Object other){if(!(other instanceof iv0))return false;iv0 v=(iv0)other;return Objects.equals(b,v.b)&&Objects.equals(o,v.o)&&k==v.k&&Objects.equals(l,v.l);}public int hashCode(){return Objects.hash(b,o,k,l);} }");
        files.put("a/sk4.java","package a;public class sk4 {public sk4(android.content.Context c){} }");
        files.put("a/e16.java","package a;import java.util.*;public class e16 {public final ArrayList a;public e16(List values){a=new ArrayList(values);} }");
        files.put("a/n86.java","package a;import java.util.*;public class n86 {public static final Map<Long,List<i86>> channels=new HashMap<>();public static boolean fail;public static int reads,lastLimit;public static e16 m(android.content.Context c,android.net.Uri u,int limit,Long id){reads++;lastLimit=limit;return fail?null:new e16(channels.getOrDefault(id,List.of()));}public static iv0 n(i86 raw,sk4 labels,List artwork,long offset,Map metadata){if(!metadata.containsKey(raw.c))throw new AssertionError(\"Missing native channel metadata\");return new iv0(raw.b,raw.g,raw.c,(String)metadata.get(raw.c));} }");
        files.put("a/h35.java","package a;public class h35 {public final String a,b;public final int c;public final boolean d;public h35(int count,String owner,String title,boolean enabled){a=owner;b=title;c=count;d=enabled;} }");
        files.put("a/gf4.java","package a;import java.util.*;public class gf4 {public static List z(List items,LinkedHashMap apps,Set disabled,Locale locale){Map<String,Integer> counts=new LinkedHashMap<>();for(Object o:items){iv0 v=(iv0)o;counts.merge(v.b,1,Integer::sum);}List<h35> result=new ArrayList<>();counts.forEach((owner,count)->result.add(new h35(count,owner,owner,!disabled.contains(owner))));return result;} }");
        files.put("a/sx0.java","package a;import java.util.*;public class sx0 {public List<String> g,D=List.of();public rx0 v=rx0.RECOMMENDATIONS;public sx0(String source){g=List.of(source);} }");
        files.put("a/ap1.java","package a;public interface ap1 {} ");
        files.put("a/xx1.java","package a;public interface xx1 {Object o(Object a,Object b,Object c,Object continuation);} ");
        files.put("a/jl7.java","package a;import java.util.*;public class jl7 implements ap1 {public Object value=List.of();public int writes;public final List<Runnable> listeners=new ArrayList<>();public Object getValue(){return value;}public void j(Object value){if(Objects.equals(this.value,value))return;this.value=value;writes++;for(Runnable r:List.copyOf(listeners))r.run();} }");
        files.put("a/td5.java","package a;public class td5 {public static jl7 a(Object value){jl7 state=new jl7();state.value=value;return state;} }");
        files.put("a/aq.java","package a;public class aq extends jl7 {public aq(jl7 a,jl7 b,jl7 c,xx1 f){Runnable update=()->j(f.o(a.getValue(),b.getValue(),c.getValue(),null));a.listeners.add(update);b.listeners.add(update);c.listeners.add(update);value=f.o(a.getValue(),b.getValue(),c.getValue(),null);} }");
        files.put("a/s39.java","package a;public class s39 {public static aq z(ap1 a,ap1 b,ap1 c,xx1 f){return new aq((jl7)a,(jl7)b,(jl7)c,f);} }");
        files.put("a/bf4.java","package a;public class bf4 {public final jl7 A=new jl7();} ");
        files.put("a/wx1.java","package a;public interface wx1 {Object e(Object value,Object composer,Object flags);} ");
        files.put("a/hx1.java","package a;public interface hx1 {Object a(Object value);} ");
        files.put("a/vx1.java","package a;public interface vx1 {Object f(Object a,Object b);} ");
        files.put("a/fx1.java","package a;public interface fx1 {Object b();} ");
        files.put("a/yx1.java","package a;public interface yx1 {Object i(Object a,Object b,Object c,Object d,Object e);} ");
        files.put("a/ty1.java","package a;public class ty1 {} ");
        files.put("a/rx0.java","package a;public enum rx0 {CONTINUE_WATCHING,RECOMMENDATIONS,BOTH,SEERR} ");
        files.put("a/s15.java","package a;public interface s15 {Object a();} ");
        files.put("a/r15.java","package a;public class r15 implements s15 {public final rx0 a;public r15(rx0 mode){a=mode;}public Object a(){return a;}public boolean equals(Object v){return v instanceof r15&&((r15)v).a==a;}public int hashCode(){return a.hashCode();} }");
        files.put("a/zy4.java","package a;public class zy4 {public String a,b;public long c;public zy4(String key,String title,long id){a=key;b=title;c=id;} }");
        files.put("a/q15.java","package a;public class q15 implements s15 {public final zy4 a;public q15(zy4 channel){a=channel;}public Object a(){return a.a;} }");
        files.put("a/l53.java","package a;public class l53 {public Object lastPackages,lastChannel=new Object();public String lastRow;public final vx1 P=(row,value)->{lastRow=(String)row;lastPackages=value;return null;};public final vx1 H=(row,value)->{lastRow=(String)row;lastChannel=value;return null;};} ");
        files.put("a/jf3.java","package a;public class jf3 implements hx1 {public final l53 l=new l53();public String m=\"row\";public Object selected;public Object a(Object choice){if(!(choice instanceof s15))throw new AssertionError(\"Synthetic ID reached native callback\");selected=choice;if(choice instanceof q15)l.H.f(m,((q15)choice).a);return this;} }");
        files.put("a/ea4.java","package a;import java.util.*;public class ea4 {public static List choices;public static Object selected;public static wx1 label,secondary;public static hx1 first,second,callback;public static Set checked,disabled;public static int defaults;public static void H1(String title,String subtitle,List o,Object s,wx1 l,boolean enabled,wx1 sec,hx1 a,hx1 b,Set c,Set d,hx1 select,fx1 dismiss,ty1 composer,int f,int f1,int def){choices=o;selected=s;label=l;secondary=sec;first=a;second=b;checked=c;disabled=d;callback=select;defaults=def;} }");
        files.put("a/ke3.java","package a;public class ke3 {public static String owner;public static Object filter;public static boolean D(iv0 item,String selected,zy4 spec){owner=selected;filter=spec;return java.util.Objects.equals(item.b,selected)&&(spec==null||item.k==spec.c);} }");
        files.put("Fixture.java",Files.readString(Path.of(args[2])));
        List<String> inputs=new ArrayList<>();
        for(var e:files.entrySet()) {Path file=directory.resolve(e.getKey());Files.createDirectories(file.getParent());Files.writeString(file,e.getValue());inputs.add(file.toString());}
        try(var paths=Files.walk(Path.of(args[0]).getParent())) {paths.filter(p->p.toString().endsWith(".java")).forEach(p->inputs.add(p.toString()));}
        inputs.addAll(List.of("--release","11","-d",directory.toString()));
        if(ToolProvider.getSystemJavaCompiler().run(null,null,null,inputs.toArray(new String[0]))!=0)throw new AssertionError("Catalog 1.1.2 fixture compilation failed");
        try(var loader=new URLClassLoader(new java.net.URL[]{directory.toUri().toURL()},null)) {loader.loadClass("Fixture").getMethod("run").invoke(null);}
        System.out.println("PASS: 1.1.2 production catalog runtime; Seerr rows keep native selection; native channel-choice deduplication/filtering; saved-ID/callback persistence; revision refresh with empty Recommendations; provider failure/recovery; lifecycle cancellation");
    }
}
