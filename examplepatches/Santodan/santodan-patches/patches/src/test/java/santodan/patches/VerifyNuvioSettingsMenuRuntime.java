package santodan.patches;

import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.tools.ToolProvider;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;

/** Exercises real menu callbacks against small host fixtures, including partially selected bundles. */
public final class VerifyNuvioSettingsMenuRuntime {
    public static void main(String[] args) throws Exception {
        String[] bridges = {
            "software.santodan.extension.nuviomerged.NuvioMergedProgress",
            "software.santodan.extension.nuvioremaining.NuvioRemainingEpisodes",
            "software.santodan.extension.nuvioairing.NuvioAiringSeries",
            "software.santodan.extension.nuviofinale.NuvioFinaleDates",
        "software.santodan.extension.nuviomovierelease.NuvioMovieReleaseDates",
            "software.santodan.extension.nuviocwstreams.NuvioContinueWatchingStreams",
            "software.santodan.extension.nuviodetailstreams.NuvioDetailStreams"
        };
        for (int selection = 0; selection < 128; selection++) {
            int installed = Integer.bitCount(selection);
            Path root = Path.of(args[2]);
            Files.createDirectories(root);
            Path directory = Files.createTempDirectory(root, "selection-" + selection + "-");
            Map<String, String> sources = new LinkedHashMap<>();
            sources.put("android.util.Log", "package android.util; public class Log { public static int e(String tag,String message,Throwable cause) { throw new AssertionError(message,cause); } }");
            sources.put("q1.s", "package q1; public class s { public final Object content; public s(int key,Object content,boolean tracked) { this.content=content; } }");
            sources.put("g1.j", "package g1; public class j { public static class Composer {} public static class State { private Object value; public State(Object v){value=v;} public Object getValue(){return value;} public void setValue(Object v){value=v;} } public static State r(Object value){return new State(value);} }");
            sources.put("w1.n", "package w1; public class n { public static final n b=new n(); }");
            sources.put("g0.i", "package g0; import kotlin.jvm.functions.*; public class i { public int count; public Object key; public q1.s content; public void q(int n,Function1 key,Function1 type,q1.s body){count+=n;this.key=key.invoke(0);content=body;} public void render(){((Function4)content.content).invoke(null,0,new g1.j.Composer(),0);} }");
            sources.put("sa.kc", "package sa; import kotlin.jvm.functions.*; public class kc { public static boolean expanded; public static Function0 toggle; public static int rendered; public static void a(String title,String description,boolean open,Function0 onToggle,w1.n modifier,Object icon,Object focus,Function0 noop,q1.s body,Object composer,int flags) { if(!title.equals(\"Santodan-Patches\"))throw new AssertionError(title); expanded=open;toggle=onToggle;if(open)((Function3)body.content).invoke(null,composer,0); } }");
            sources.put("sa.kc", sources.get("sa.kc").replace("public static boolean expanded;",
                "public static java.util.List<String> events=new java.util.ArrayList<>(); public static void e(int flags,int defaults,Object composer,String text,String description,w1.n modifier){if(defaults!=4)throw new AssertionError();events.add(text);} public static boolean expanded;"));
            List<String> expected = new ArrayList<>();
            boolean continueWatching = false;
            boolean streams = false;
            boolean ui = false;
            for (int index = 0; index < bridges.length; index++) {
                if ((selection & (1 << index)) == 0) continue;
                if (index < 3 && !continueWatching) {
                    expected.add("Continue Watching");
                    continueWatching = true;
                }
                if (index >= 3 && index < 5 && !ui) { expected.add("UI"); ui = true; }
                if (index >= 5 && !streams) {
                    expected.add("Streams");
                    streams = true;
                }
                String bridge = bridges[index];
                expected.add(bridge);
                int dot = bridge.lastIndexOf('.');
                sources.put(bridge, "package " + bridge.substring(0, dot) + "; public class " + bridge.substring(dot + 1)
                    + " { public static void renderSettings(Object composer){sa.kc.rendered++;sa.kc.events.add(\"" + bridge + "\");} }");
            }
            List<String> compile = new ArrayList<>(List.of("-classpath", System.getProperty("java.class.path"), "-d", directory.toString()));
            for (Map.Entry<String, String> source : sources.entrySet()) {
                Path file = directory.resolve(source.getKey().replace('.', '/') + ".java");
                Files.createDirectories(file.getParent());
                Files.writeString(file, source.getValue());
                compile.add(file.toString());
            }
            compile.add(args[0]); // Compile the production menu, never a copy of its logic.
            compile.add(args[1]); // Compile the production coroutine adapter.
            if (ToolProvider.getSystemJavaCompiler().run(null, null, null, compile.toArray(String[]::new)) != 0)
                throw new AssertionError("Runtime fixture compilation failed");
            try (URLClassLoader loader = new URLClassLoader(new URL[]{directory.toUri().toURL()}, VerifyNuvioSettingsMenuRuntime.class.getClassLoader())) {
                Class<?> menu = loader.loadClass("software.santodan.extension.nuviomenu.NuvioSettingsMenu");
                Class<?> scope = loader.loadClass("g0.i");
                Class<?> section = loader.loadClass("sa.kc");
                Object list = scope.getConstructor().newInstance();
                menu.getMethod("addMenu", Object.class).invoke(null, list);
                if (scope.getField("count").getInt(list) != 1 || !"Santodan-Patches".equals(scope.getField("key").get(list)))
                    throw new AssertionError("Menu does not have one stable lazy item");
                scope.getMethod("render").invoke(list);
                if (section.getField("expanded").getBoolean(null) || section.getField("rendered").getInt(null) != 0)
                    throw new AssertionError("Menu must start collapsed");
                ((kotlin.jvm.functions.Function0<?>) section.getField("toggle").get(null)).invoke();
                scope.getMethod("render").invoke(list);
                if (!section.getField("expanded").getBoolean(null) || section.getField("rendered").getInt(null) != installed)
                    throw new AssertionError("Expanded menu failed to discover exactly the installed patches");
                if (!expected.equals(section.getField("events").get(null)))
                    throw new AssertionError("Incorrect section labels or setting order: " + section.getField("events").get(null));
                ((kotlin.jvm.functions.Function0<?>) section.getField("toggle").get(null)).invoke();
                scope.getMethod("render").invoke(list);
                if (section.getField("expanded").getBoolean(null) || section.getField("rendered").getInt(null) != installed)
                    throw new AssertionError("Collapsed menu still renders patch settings");
                final Object[] result = {null};
                Continuation<Object> completion = new Continuation<>() {
                    public CoroutineContext getContext() { return EmptyCoroutineContext.INSTANCE; }
                    public void resumeWith(Object value) { result[0] = value; }
                };
                Object adapter = loader.loadClass("software.santodan.extension.nuviomerged.NuvioSourceContinuation")
                    .getConstructor(Continuation.class).newInstance(completion);
                ((Continuation<Object>) adapter).resumeWith("saved");
                if (!"saved".equals(result[0])) throw new AssertionError("Native coroutine completion was not forwarded");
            }
            System.out.println("PASS: menu labels, expansion, collapse, selection=" + selection + ", and native coroutine completion");
        }
    }
}
