package santodan.patches;

import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.*;
import java.lang.reflect.*;
import java.util.*;
import javax.tools.ToolProvider;

/** Compiles the real runtime against Android/host fixtures to exercise scope and settings. */
public final class VerifyNuvioMovieReleaseRuntime {
    public static void main(String[] args) throws Exception {
        Locale.setDefault(Locale.ENGLISH);
        Path root = Path.of(args[1]); Files.createDirectories(root);
        Path dir = Files.createTempDirectory(root, "movie-runtime-");
        Map<String,String> sources = new LinkedHashMap<>();
        sources.put("android.content.Context", "package android.content; public class Context { public static final int MODE_PRIVATE=0; }");
        sources.put("android.content.SharedPreferences", "package android.content; public class SharedPreferences { public final java.util.Map<String,Object> values=new java.util.HashMap<>(); public boolean getBoolean(String k,boolean d){return (Boolean)values.getOrDefault(k,d);} public long getLong(String k,long d){return (Long)values.getOrDefault(k,d);} public String getString(String k,String d){return (String)values.getOrDefault(k,d);} public Editor edit(){return new Editor();} public class Editor { public Editor putBoolean(String k,boolean v){values.put(k,v);return this;} public Editor putLong(String k,long v){values.put(k,v);return this;} public Editor putString(String k,String v){if(v==null)values.remove(k);else values.put(k,v);return this;} public void apply(){} } }");
        sources.put("android.app.Application", "package android.app; public class Application extends android.content.Context { public final android.content.SharedPreferences prefs=new android.content.SharedPreferences(); public static String version; public android.content.SharedPreferences getSharedPreferences(String n,int m){if(!n.equals(\"santodan_nuvio_movie_release_dates\"))throw new AssertionError(n);return prefs;} public String getPackageName(){return \"com.nuvio.tv\";} public Manager getPackageManager(){return new Manager();} public static class Manager { public Info getPackageInfo(String n,int flags){return new Info();} } public static class Info { public String versionName=version; } }");
        sources.put("android.app.ActivityThread", "package android.app; public class ActivityThread { public static final Application APP=new Application(); public static Application currentApplication(){return APP;} }");
        sources.put("android.os.Looper", "package android.os; public class Looper { public static Looper getMainLooper(){return new Looper();} }");
        sources.put("android.os.Handler", "package android.os; public class Handler { public Handler(Looper l){} public boolean postDelayed(Runnable r,long delay){r.run();return true;} }");
        sources.put("android.util.Log", "package android.util; public class Log { public static int d(String t,String m){return 0;} public static int e(String t,String m,Throwable e){throw new AssertionError(m,e);} }");
        sources.put("org.json.JSONObject", "package org.json; public class JSONObject { public JSONObject(String s){} public JSONObject optJSONObject(String s){return null;} public String optString(String k,String d){return d;} }");
        sources.put("kotlin.Unit", "package kotlin; public class Unit { public static final Unit INSTANCE=new Unit(); }");
        sources.put("kotlin.jvm.functions.Function0", "package kotlin.jvm.functions; public interface Function0 { Object invoke(); }");
        sources.put("g1.j", "package g1; public class j { public static class State { private Object v; public State(Object v){this.v=v;} public Object getValue(){return v;} public void setValue(Object v){this.v=v;} } public static State r(Object v){return new State(v);} }");
        sources.put("fixture.Meta", "package fixture; public class Meta { public String type=\"movie\",released=\"2099-10-09\",info,id=\"custom:id\"; public String getApiType(){return type;} public String getReleased(){return released;} public String getReleaseInfo(){return info;} public String getImdbId(){return null;} public String getId(){return id;} }");
        for(String name: List.of("ba.n3","ba.o3","ba.q1")) sources.put(name,"package ba; public class "+name.substring(3)+" { public Object "+(name.equals("ba.q1")?"o":"m")+"; public "+name.substring(3)+"(Object item){"+(name.equals("ba.q1")?"o":"m")+"=item;} }");
        String row=" { public static java.util.List<String> titles=new java.util.ArrayList<>(); public static java.util.List<Boolean> values=new java.util.ArrayList<>(); public static java.util.List<kotlin.jvm.functions.Function0> toggles=new java.util.ArrayList<>(); public static void m(String title,String desc,boolean enabled,kotlin.jvm.functions.Function0 toggle,Object a,kotlin.jvm.functions.Function0 noop,boolean b,Object c,long d,boolean e,Object composer,int f,int g){titles.add(title);values.add(enabled);toggles.add(toggle);} }";
        sources.put("sa.eb","package sa; public class eb"+row);sources.put("sa.db","package sa; public class db"+row);
        List<String> compile=new ArrayList<>(List.of("-d",dir.toString()));
        for(var entry:sources.entrySet()) { Path file=dir.resolve(entry.getKey().replace('.','/')+".java");Files.createDirectories(file.getParent());Files.writeString(file,entry.getValue());compile.add(file.toString()); }
        try(var files=Files.list(Path.of(args[0]))) { files.filter(f->f.toString().endsWith(".java")).forEach(f->compile.add(f.toString())); }
        if(ToolProvider.getSystemJavaCompiler().run(null,null,null,compile.toArray(String[]::new))!=0)throw new AssertionError("Fixture compile failed");
        for(String version:List.of("1.1.0-beta.4","1.1.0-beta.5")) try(URLClassLoader loader=new URLClassLoader(new URL[]{dir.toUri().toURL()},ClassLoader.getPlatformClassLoader())) {
            Class<?> appType=loader.loadClass("android.app.Application");appType.getField("version").set(null,version);
            Object app=loader.loadClass("android.app.ActivityThread").getField("APP").get(null);
            Map<String,Object> prefs=(Map<String,Object>)appType.getField("prefs").get(app).getClass().getField("values").get(appType.getField("prefs").get(app));
            Class<?> bridge=loader.loadClass("software.santodan.extension.nuviomovierelease.NuvioMovieReleaseDates");
            Class<?> metaType=loader.loadClass("fixture.Meta");Object item=metaType.getConstructor().newInstance();
            Class<?> cardType=loader.loadClass(version.endsWith("5")?"ba.o3":"ba.n3");Object library=cardType.getConstructor(Object.class).newInstance(item);
            Object collection=loader.loadClass("ba.q1").getConstructor(Object.class).newInstance(item);
            call(bridge,"libraryItem",item);call(bridge,"captureContext",library);call(bridge,"collectionItem",item);call(bridge,"captureContext",collection);bridge.getMethod("exitContext").invoke(null);bridge.getMethod("exitContext").invoke(null);
            check(null,badge(bridge,library));check(null,badge(bridge,collection));
            prefs.put("library",true);check("09-Oct-99",badge(bridge,library));check(null,badge(bridge,collection));
            prefs.put("library",false);prefs.put("collections",true);check(null,badge(bridge,library));check("09-Oct-99",badge(bridge,collection));
            Object other=cardType.getConstructor(Object.class).newInstance(item);check(null,badge(bridge,other));
            // Restart scope remains valid after the original item call exits.
            call(bridge,"enterContext",collection);Object recomposed=loader.loadClass("ba.q1").getConstructor(Object.class).newInstance(item);call(bridge,"captureContext",recomposed);bridge.getMethod("exitContext").invoke(null);check("09-Oct-99",badge(bridge,recomposed));
            metaType.getField("type").set(item,"series");check(null,badge(bridge,collection));metaType.getField("type").set(item,"movie");
            metaType.getField("released").set(item,"2000-10-09");check(null,badge(bridge,collection));
            metaType.getField("released").set(item,"2099");check(null,badge(bridge,collection));
            metaType.getField("info").set(item,"2099-10-09");check("09-Oct-99",badge(bridge,collection));
            metaType.getField("info").set(item,null);metaType.getField("id").set(item,"tt1234567");prefs.put("release_v1_tt1234567","2099-10-09");prefs.put("release_checked_v1_tt1234567",System.currentTimeMillis());check("09-Oct-99",badge(bridge,collection));
            metaType.getField("released").set(item,"2025");check(null,badge(bridge,collection)); // A past preview year skips even a cached future date.
            metaType.getField("released").set(item,null);metaType.getField("info").set(item,"2025");check(null,badge(bridge,collection));
            metaType.getField("info").set(item,String.valueOf(java.time.Year.now().getValue()));check("09-Oct-99",badge(bridge,collection));
            metaType.getField("released").set(item,"2000-10-09");check(null,badge(bridge,collection)); // Cached future value cannot override authoritative released metadata.
            prefs.clear();Object composer=loader.loadClass("g1.j").getConstructor().newInstance();call(bridge,"renderSettings",composer);
            Class<?> rows=loader.loadClass(version.endsWith("5")?"sa.db":"sa.eb");check(List.of(false,false),rows.getField("values").get(null));check(List.of("Show upcoming movie dates in library","Show upcoming movie dates in collections"),rows.getField("titles").get(null));
            List<?> toggles=(List<?>)rows.getField("toggles").get(null);Class<?> function=loader.loadClass("kotlin.jvm.functions.Function0");function.getMethod("invoke").invoke(toggles.get(0));check(true,prefs.get("library"));check(null,prefs.get("collections"));function.getMethod("invoke").invoke(toggles.get(1));check(true,prefs.get("collections"));function.getMethod("invoke").invoke(toggles.get(0));check(false,prefs.get("library"));
            System.out.println("PASS: movie runtime "+version+" independent settings, nested and restart scopes, type filtering, cached dates, and metadata precedence");
        }
    }
    private static void call(Class<?> bridge,String method,Object value)throws Exception {bridge.getMethod(method,Object.class).invoke(null,value);}
    private static Object badge(Class<?> bridge,Object card)throws Exception {call(bridge,"prepareBadge",card);Field f=bridge.getDeclaredField("PREPARED_BADGE");f.setAccessible(true);return ((ThreadLocal<?>)f.get(null)).get();}
    private static void check(Object expected,Object actual) {if(!Objects.equals(expected,actual))throw new AssertionError("Expected "+expected+", got "+actual);}
}
