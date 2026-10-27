package santodan.patches;

import java.nio.file.*;
import java.net.URLClassLoader;
import java.util.*;
import javax.tools.ToolProvider;

/** Exercises the production adapter with a TvProvider and native-model fixture. */
public final class VerifyMonetCatalogRuntime {
    public static void main(String[] args) throws Exception {
        Path root = Path.of(args[1]); Files.createDirectories(root);
        Path directory = Files.createTempDirectory(root, "catalogs-");
        Map<String,String> files = new LinkedHashMap<>();
        files.put("android/net/Uri.java", "package android.net; public class Uri { public static Uri parse(String s){return new Uri();} }");
        files.put("android/util/Log.java", "package android.util; public class Log { public static int w(String t,String m,Throwable e){return 0;} public static int i(String t,String m){return 0;} }");
        files.put("android/database/Cursor.java", "package android.database; public interface Cursor extends AutoCloseable {boolean moveToNext(); String getString(int i); long getLong(int i); void close();}");
        files.put("android/content/Context.java", "package android.content; public class Context {public final ContentResolver resolver=new ContentResolver(); public ContentResolver getContentResolver(){return resolver;} public Context getApplicationContext(){return this;} }");
        files.put("android/content/ContentResolver.java", "            package android.content;\n            import java.util.*; import android.database.Cursor; import android.net.Uri;\n            public class ContentResolver {\n                public List<String[]> rows = new ArrayList<>(); public boolean fail;\n                public Cursor query(Uri u,String[] c,String s,String[] a,String o) {\n                    if(fail)throw new SecurityException(\"fixture\");\n                    return new Cursor(){int index=-1; public boolean moveToNext(){return ++index<rows.size();}\n                    public String getString(int i){return rows.get(index)[i];} public long getLong(int i){return Long.parseLong(getString(i));} public void close(){}};\n                }\n            }");
        files.put("a/ai5.java", "package a; import java.util.*; public class ai5 {public String b,g; public long c; public List f=List.of(); public ai5(String owner,long channel,String key){b=owner;c=channel;g=key;} }");
        files.put("a/zo0.java", "package a; public class zo0 {public String b,k; public zo0(String owner,String key){b=owner;k=key;} }");
        files.put("a/te4.java", "package a; public class te4 {public te4(android.content.Context c){} }");
        files.put("a/fi5.java", "package a; import java.util.*; public class fi5 {public static zo0 l(ai5 raw,te4 labels,List artwork,long offset){return new zo0(raw.b,raw.g);} }");
        files.put("a/sj4.java", "package a; public class sj4 {public final String a,b; public final int c; public final boolean d; public sj4(int count,String id,String title,boolean enabled){a=id;b=title;c=count;d=enabled;} }");
        files.put("a/rx3.java", "            package a; import java.util.*;\n            public class rx3 {public static List i(List items,LinkedHashMap apps,Set disabled,Locale locale){\n                Map<String,Integer> counts=new LinkedHashMap<>(); for(Object value:items){zo0 item=(zo0)value;counts.merge(item.b,1,Integer::sum);}\n                List<sj4> result=new ArrayList<>(); counts.forEach((owner,count)->result.add(new sj4(count,owner,owner,!disabled.contains(owner))));return result;\n            }}");
        files.put("android/net/Uri.java", "package android.net; public class Uri {public final String value; public Uri(String s){value=s;} public static Uri parse(String s){return new Uri(s);} }");
        files.put("android/database/ContentObserver.java", "package android.database; public class ContentObserver {public ContentObserver(android.os.Handler h){} public void onChange(boolean s){} public void onChange(boolean s,android.net.Uri u){onChange(s);} }");
        files.put("android/os/Looper.java", "package android.os; public class Looper {public static Looper getMainLooper(){return new Looper();} }");
        files.put("android/os/HandlerThread.java", "package android.os; public class HandlerThread {public HandlerThread(String n){} public void start(){} public Looper getLooper(){return new Looper();} public boolean quitSafely(){return true;} }");
        files.put("android/os/Handler.java", "package android.os; import java.util.*; public class Handler {public static final List<Runnable> pending=new ArrayList<>(); final List<Runnable> own=new ArrayList<>(); public Handler(Looper l){} public boolean post(Runnable r){own.add(r);pending.add(r);return true;} public boolean postDelayed(Runnable r,long d){return post(r);} public void removeCallbacks(Runnable r){pending.removeIf(x->x==r);own.removeIf(x->x==r);} public void removeCallbacksAndMessages(Object t){pending.removeAll(own);own.clear();} public static void drain(){int n=0;while(!pending.isEmpty()){if(++n>50)throw new AssertionError(\"runaway worker\"); pending.remove(0).run();}} }");
        files.put("android/content/ContentResolver.java", "package android.content; import java.util.*; import android.database.*; import android.net.Uri; public class ContentResolver {public List<String[]> rows=new ArrayList<>(); public boolean fail; public int queries; public List<ContentObserver> observers=new ArrayList<>(); public void registerContentObserver(Uri u,boolean d,ContentObserver o){observers.add(o);} public void unregisterContentObserver(ContentObserver o){observers.removeIf(x->x==o);} public void change(){for(ContentObserver o:List.copyOf(observers))o.onChange(false);} public Cursor query(Uri u,String[] c,String s,String[] a,String o){queries++;if(fail)throw new SecurityException(\"fixture\");return new Cursor(){int index=-1; public boolean moveToNext(){return ++index<rows.size();} public String getString(int i){return rows.get(index)[i];} public long getLong(int i){return Long.parseLong(getString(i));} public void close(){}};} }");
        files.put("a/ec5.java", "package a; import java.util.*; public class ec5 {public final ArrayList a; public ec5(List raw){a=new ArrayList(raw);} }");
        files.put("a/fi5.java", "package a; import java.util.*; public class fi5 {public static final Map<Long,List<ai5>> channels=new HashMap<>(); public static boolean fail; public static int reads; public static ec5 k(android.content.Context c,android.net.Uri u,int limit,Long id){reads++;return fail?null:new ec5(channels.getOrDefault(id,List.of()));} public static zo0 l(ai5 raw,te4 labels,List artwork,long offset){return new zo0(raw.b,raw.g);} }");
        files.put("a/nj1.java", "package a; public interface nj1 {} ");
        files.put("a/ar1.java", "package a; public interface ar1 {Object o(Object a,Object b,Object c,Object continuation);} ");
        files.put("a/ie6.java", "package a; public class ie6 implements nj1 {public Object value=java.util.List.of();public int writes;public final java.util.List<Runnable> listeners=new java.util.ArrayList<>();public Object getValue(){return value;} public void k(Object o){if(java.util.Objects.equals(value,o))return;value=o;writes++;for(Runnable r:java.util.List.copyOf(listeners))r.run();} }");
        files.put("a/sx.java", "package a; public class sx {public static ie6 a(Object value){ie6 state=new ie6();state.value=value;return state;} } ");
        files.put("a/lm.java", "package a; public class lm extends ie6 {public lm(ie6 a,ie6 b,ie6 c,ar1 f){Runnable update=()->k(f.o(a.getValue(),b.getValue(),c.getValue(),null));a.listeners.add(update);b.listeners.add(update);c.listeners.add(update);value=f.o(a.getValue(),b.getValue(),c.getValue(),null);} } ");
        files.put("a/yg2.java", "package a; public class yg2 {public static lm o(nj1 a,nj1 b,nj1 c,ar1 f){return new lm((ie6)a,(ie6)b,(ie6)c,f);} } ");
        files.put("a/mx3.java", "package a; public class mx3 {public final ie6 A=new ie6();} ");
        files.put("a/cs0.java", "package a; public class cs0 {public java.util.List<String> g;public java.util.List<String> A=java.util.List.of();public cs0(String source){g=java.util.List.of(source);} }");
        files.put("a/zq1.java", "package a; public interface zq1 {Object e(Object a,Object b,Object c);} ");
        files.put("a/kq1.java", "package a; public interface kq1 {Object a(Object a);} ");
        files.put("a/yq1.java", "package a; public interface yq1 {Object f(Object a,Object b);} ");
        files.put("a/iq1.java", "package a; public interface iq1 {Object b();} ");
        files.put("a/yr1.java", "package a; public class yr1 {} ");
        files.put("a/bs0.java", "package a; public enum bs0 {CONTINUE_WATCHING,RECOMMENDATIONS,BOTH} ");
        files.put("a/xr2.java", "package a; public class xr2 {public Object lastPackages;public final yq1 L=(row,value)->{lastPackages=value;return null;};} ");
        files.put("a/q03.java", "package a; public class q03 implements kq1 {public final xr2 k=new xr2();public String l=\"row\";public Object selected;public Object a(Object choice){if(!(choice instanceof bs0))throw new AssertionError(\"native callback received catalog ID\");selected=choice;return null;} } ");
        files.put("a/zs3.java", "package a; import java.util.*; public class zs3 {public static List choices;public static Object selected;public static zq1 label;public static kq1 callback;public static void L1(String t,String s,List o,Object sel,zq1 l,boolean e,zq1 sec,kq1 a,kq1 b,kq1 c,iq1 d,yr1 composer,int f,int f1,int defaults){choices=o;selected=sel;label=l;callback=c;} }");
        files.put("Fixture.java", Files.readString(Path.of(args[2])));
        List<String> inputs = new ArrayList<>();
        for (var entry : files.entrySet()) {
            Path file = directory.resolve(entry.getKey()); Files.createDirectories(file.getParent()); Files.writeString(file,entry.getValue()); inputs.add(file.toString());
        }
        inputs.add(args[0]); inputs.add(Path.of(args[0]).resolveSibling("CatalogRefresh.java").toString());
        inputs.addAll(List.of("--release", "11", "-d", directory.toString()));
        if (ToolProvider.getSystemJavaCompiler().run(null,null,null,inputs.toArray(new String[0])) != 0)
            throw new AssertionError("Catalog runtime fixture compilation failed");
        try (var loader = new URLClassLoader(new java.net.URL[]{directory.toUri().toURL()}, null)) {
            loader.loadClass("Fixture").getMethod("run").invoke(null);
        }
        System.out.println("PASS: independent catalog refresh/revisions, nested native content picker, real app ownership, disabled/empty Recommendations, transient failure/recovery, recreated/removed channels and lifecycle cancellation");
    }
}
