package santodan.patches;

import java.net.*;
import java.nio.file.*;
import java.util.*;
import javax.tools.ToolProvider;
import kotlin.jvm.functions.Function0;

/** Exercises production settings callbacks, persistence, disabled behavior and startup retry. */
public final class VerifyNuvioCurrentStreamRuntime {
    static void check(boolean value) { if (!value) throw new AssertionError(); }
    public static void main(String[] args) throws Exception {
        Path root = Files.createTempDirectory(Files.createDirectories(Path.of(args[1])), "current-stream-runtime-");
        Map<String, String> sources = Map.ofEntries(
            Map.entry("android.content.SharedPreferences", "package android.content; public class SharedPreferences {\n    public java.util.Map<String,Boolean> values=new java.util.HashMap<>();\n    public boolean getBoolean(String key,boolean fallback){return values.getOrDefault(key,fallback);}\n    public Editor edit(){return new Editor();}\n    public class Editor {public Editor putBoolean(String k,boolean v){values.put(k,v);return this;} public void apply(){} }\n}"),
            Map.entry("android.app.Application", "package android.app; public class Application {\n    public android.content.SharedPreferences prefs=new android.content.SharedPreferences();\n    public android.content.SharedPreferences getSharedPreferences(String name,int mode){\n        if(!name.equals(\"santodan_current_stream\")||mode!=0)throw new AssertionError(name); return prefs;\n    }\n}"),
            Map.entry("android.app.ActivityThread", "package android.app; public class ActivityThread {public static Application app; public static Application currentApplication(){return app;}}"),
            Map.entry("android.util.Log", "package android.util; public class Log {public static int errors; public static int e(String tag,String message,Throwable error){errors++;return 0;}}"),
            Map.entry("h1.n", "package h1; public interface n {}"),
            Map.entry("h1.k0", "package h1; public class k0 implements h1.n {}"),
            Map.entry("h1.r1", "package h1; public class r1 {private Object value; public r1(Object v){value=v;} public Object getValue(){return value;} public void setValue(Object v){value=v;}}"),
            Map.entry("h1.h", "package h1; public class h {public static h1.r1 s(Object v){return new h1.r1(v);} public static Object s(long v){throw new AssertionError(\"Wrong factory\");}}"),
            Map.entry("x1.q", "package x1; public interface q {}"),
            Map.entry("k2.e", "package k2; public class e {}"),
            Map.entry("gb.gd", "package gb; import kotlin.jvm.functions.Function0; public class gd {\n    public static boolean enabled; public static Function0 toggle,noop;\n    public static void m(String title,String description,boolean value,Function0 click,x1.q modifier,Function0 focus,boolean disabled,k2.e icon,long tint,boolean busy,h1.n composer,int flags,int defaults){\n        if(!title.equals(\"Indicate current stream\")||defaults!=1008||flags!=0)throw new AssertionError(title);\n        enabled=value;toggle=click;noop=focus;\n    }\n}")
        );
        List<String> compile = new ArrayList<>(List.of("-classpath", System.getProperty("java.class.path"), "-d", root.toString()));
        for (var entry : sources.entrySet()) {
            Path source = root.resolve(entry.getKey().replace('.', '/') + ".java");
            Files.createDirectories(source.getParent()); Files.writeString(source, entry.getValue()); compile.add(source.toString());
        }
        compile.add(args[0]);
        check(ToolProvider.getSystemJavaCompiler().run(null, null, null, compile.toArray(String[]::new)) == 0);
        try (URLClassLoader loader = new URLClassLoader(new URL[]{root.toUri().toURL()}, VerifyNuvioCurrentStreamRuntime.class.getClassLoader()) {
            @Override protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
                if (name.startsWith("android.") || name.startsWith("h1.") || name.startsWith("ab.") ||
                    name.startsWith("x1.") || name.startsWith("k2.") || name.startsWith("software.santodan.extension.nuviocurrentstream.")) {
                    synchronized (getClassLoadingLock(name)) {
                        Class<?> type = findLoadedClass(name);
                        if (type == null) type = findClass(name);
                        if (resolve) resolveClass(type);
                        return type;
                    }
                }
                return super.loadClass(name, resolve);
            }
        }) {
            Class<?> bridge = loader.loadClass("software.santodan.extension.nuviocurrentstream.NuvioCurrentStream");
            Class<?> thread = loader.loadClass("android.app.ActivityThread"), row = loader.loadClass("gb.gd");
            var label = bridge.getMethod("label", String.class, boolean.class);
            var render = bridge.getMethod("renderSettings", Object.class);
            // Unselected rows never read preferences, even before Application exists.
            check(label.invoke(null, "Other", false).equals("Other"));
            check(loader.loadClass("android.util.Log").getField("errors").getInt(null) == 0);
            check(label.invoke(null, "Movie", true).equals("[Playing] Movie"));
            check(loader.loadClass("android.util.Log").getField("errors").getInt(null) == 1);
            Object app = loader.loadClass("android.app.Application").getConstructor().newInstance();
            thread.getField("app").set(null, app);
            Object prefs = app.getClass().getField("prefs").get(app);
            @SuppressWarnings("unchecked") Map<String, Boolean> values = (Map<String, Boolean>)prefs.getClass().getField("values").get(prefs);
            values.put("enabled", false);
            check(label.invoke(null, "Movie", true).equals("Movie")); // Startup failure must not cache true.
            values.clear();
            var enabledCache = bridge.getDeclaredField("enabled"); enabledCache.setAccessible(true); enabledCache.set(null, null);
            Object composer = loader.loadClass("h1.k0").getConstructor().newInstance();
            render.invoke(null, composer);
            check(row.getField("enabled").getBoolean(null));
            ((Function0<?>)row.getField("noop").get(null)).invoke();
            check(label.invoke(null, "Movie", true).equals("[Playing] Movie"));
            ((Function0<?>)row.getField("toggle").get(null)).invoke();
            render.invoke(null, composer);
            check(!row.getField("enabled").getBoolean(null));
            check(label.invoke(null, "Movie", true).equals("Movie"));
            check(label.invoke(null, "Other", false).equals("Other"));
            // Reset process caches, retaining the preference store, to check restart persistence.
            for (String name : List.of("enabled", "menuState")) {
                var field = bridge.getDeclaredField(name); field.setAccessible(true); field.set(null, null);
            }
            check(label.invoke(null, "Episode", true).equals("Episode"));
            render.invoke(null, composer);
            check(!row.getField("enabled").getBoolean(null));
            ((Function0<?>)row.getField("toggle").get(null)).invoke();
            render.invoke(null, composer);
            check(row.getField("enabled").getBoolean(null));
            check(label.invoke(null, "New source", true).equals("[Playing] New source"));
            check(label.invoke(null, "Previous source", false).equals("Previous source"));
            check(label.invoke(null, "New source", true).equals("[Playing] New source"));
            check(loader.loadClass("android.util.Log").getField("errors").getInt(null) == 1);
        }
        System.out.println("PASS: enabled default, settings toggle, no-op focus, disabled labels, persistence, source changes and startup retry");
    }
}
