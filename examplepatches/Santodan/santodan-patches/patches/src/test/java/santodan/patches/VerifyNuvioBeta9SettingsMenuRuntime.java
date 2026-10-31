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
public final class VerifyNuvioBeta9SettingsMenuRuntime {
    public static void main(String[] args) throws Exception {
        String[] bridges = {
            "software.santodan.extension.nuviomerged.NuvioMergedProgress",
            "software.santodan.extension.nuvioremaining.NuvioRemainingEpisodes",
            "software.santodan.extension.nuvioairing.NuvioAiringSeries",
            "software.santodan.extension.nuviofinale.NuvioFinaleDates",
        "software.santodan.extension.nuviomovierelease.NuvioMovieReleaseDates",
            "software.santodan.extension.nuviocwstreams.NuvioContinueWatchingStreams",
            "software.santodan.extension.nuviodetailstreams.NuvioDetailStreams",
            "software.santodan.extension.nuvionextstreams.NuvioNextEpisodeStreams",
            "software.santodan.extension.nuviocurrentstream.NuvioCurrentStream",
            "software.santodan.extension.nuviopreferred.NuvioPreferredAddon",
            "software.santodan.extension.nuviolauncher.NuvioLauncherChannels",
            "software.santodan.extension.nuviobuttons.NuvioPlaybackButtons",
            "software.santodan.extension.nuviointro.NuvioIntroDb"
        };
        for (int selection : new int[]{0,1,2,4,8,16,32,64,128,256,3,7,24,96,384,271,511,512,768,1023,1024,1536,2047,2048,2560,3072,4095,4096,4608,6144,8191}) {
            int installed = Integer.bitCount(selection);
            Path root = Path.of(args[2]);
            Files.createDirectories(root);
            Path directory = Files.createTempDirectory(root, "selection-" + selection + "-");
            Map<String, String> sources = new LinkedHashMap<>();
            sources.put("software.santodan.extension.nuviomenu.NuvioDateLabelStyle", "package software.santodan.extension.nuviomenu; public class NuvioDateLabelStyle { public static void renderSettings(Object composer,String scope,String title){gb.ke.events.add(title);} }");
            sources.put("android.util.Log", "package android.util; public class Log { public static int e(String tag,String message,Throwable cause) { throw new AssertionError(message,cause); } }");
            sources.put("r1.s", "package r1; public class s { public final Object content; public s(int key,Object content,boolean tracked) { this.content=content; } }");
            sources.put("h1.n", "package h1; public interface n {}");
            sources.put("h1.r1", "package h1; public class r1 { private Object value; public r1(Object v){value=v;} public Object getValue(){return value;} public void setValue(Object v){value=v;} }");
            sources.put("h1.p1", "package h1; public class p1 {}");
            sources.put("h1.h", "package h1; public class h { public static class Composer implements h1.n {} public static h1.r1 s(Object value){return new h1.r1(value);} public static h1.p1 r(long value){throw new AssertionError(\"Incompatible long factory was invoked\");} }");
            sources.put("x1.q", "package x1; public interface q {}");
            sources.put("k2.e", "package k2; public class e {}");
            sources.put("c2.z", "package c2; public class z {}");
            sources.put("x1.n", "package x1; public class n implements q { public static final n b=new n(); }");
            sources.put("g0.i", "package g0; import kotlin.jvm.functions.*; public class i { public int count; public Object key; public r1.s content; public void q(int n,Function1 key,Function1 type,r1.s body){count+=n;this.key=key.invoke(0);content=body;} public void render(){((Function4)content.content).invoke(null,0,new h1.h.Composer(),0);} }");
            sources.put("gb.ke", "package gb; import kotlin.jvm.functions.*; public class ke { public static boolean expanded; public static Function0 toggle; public static int rendered; public static void a(String title,String description,boolean open,Function0 onToggle,x1.q modifier,k2.e icon,c2.z focus,Function0 noop,r1.s body,h1.n composer,int flags) { if(!title.equals(\"Santodan-Patches\"))throw new AssertionError(title); expanded=open;toggle=onToggle;if(open)((Function3)body.content).invoke(null,composer,0); } }");
            sources.put("gb.ke", sources.get("gb.ke").replace("public static boolean expanded;",
                "public static java.util.List<String> events=new java.util.ArrayList<>(); public static void e(int flags,int defaults,h1.n composer,String text,String description,x1.q modifier){if(defaults!=4)throw new AssertionError();events.add(text);} public static boolean expanded;"));
            List<String> expected = new ArrayList<>();
            boolean continueWatching = false;
            boolean streams = false;
            boolean ui = false;
            boolean playback = false;
            for (int index = 0; index < bridges.length; index++) {
                if ((selection & (1 << index)) == 0) continue;
                if (index < 3 && !continueWatching) {
                    expected.add("Continue Watching");
                    continueWatching = true;
                }
                if (index >= 3 && index < 5 && !ui) { expected.add("UI"); ui = true; }
                if (index >= 5 && index < 10 && !streams) {
                    expected.add("Streams");
                    streams = true;
                }
                String bridge = bridges[index];
                if (index == 10) expected.add("Android TV launcher");
                if (index >= 11 && !playback) { expected.add("Playback"); playback = true; }
                expected.add(bridge);
                int dot = bridge.lastIndexOf('.');
                sources.put(bridge, "package " + bridge.substring(0, dot) + "; public class " + bridge.substring(dot + 1)
                    + " { public static void renderSettings(Object composer){gb.ke.rendered++;gb.ke.events.add(\"" + bridge + "\");} }");
            }
            if ((selection & 28) != 0) {
                int streamsIndex = expected.indexOf("Streams");
                int launcherIndex = expected.indexOf("Android TV launcher");
                expected.add(streamsIndex >= 0 ? streamsIndex : launcherIndex >= 0 ? launcherIndex : expected.size(), "Date label appearance");
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
            try (URLClassLoader loader = new URLClassLoader(new URL[]{directory.toUri().toURL()}, VerifyNuvioBeta9SettingsMenuRuntime.class.getClassLoader())) {
                Class<?> menu = loader.loadClass("software.santodan.extension.nuviomenu.NuvioSettingsMenu");
                Class<?> scope = loader.loadClass("g0.i");
                Class<?> section = loader.loadClass("gb.ke");
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
            System.out.println("PASS: beta9 menu with exact native signatures and incompatible factory present, selection=" + selection + ", and native coroutine completion");
        }
    }
}
