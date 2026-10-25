package santodan.patches;

import java.io.*;
import java.net.*;
import java.nio.file.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import javax.tools.ToolProvider;

/** Reproduces an episode-8 metadata request completing after the card advances to episode 20. */
public final class VerifyNuvioRemainingSyncRuntime {
    public static void main(String[] args) throws Exception {
        Path dir = Files.createTempDirectory(Path.of(args[1]), "remaining-sync-");
        Map<String,String> sources = new LinkedHashMap<>();
        sources.put("android.content.Context", "package android.content; public class Context { public static final int MODE_PRIVATE=0; }");
        sources.put("android.content.SharedPreferences", "package android.content; public class SharedPreferences { public final java.util.Map<String,Object> values=new java.util.concurrent.ConcurrentHashMap<>(); public final java.util.List<Integer> writes=new java.util.concurrent.CopyOnWriteArrayList<>(); public boolean getBoolean(String k,boolean d){return (Boolean)values.getOrDefault(k,d);} public int getInt(String k,int d){return (Integer)values.getOrDefault(k,d);} public String getString(String k,String d){return (String)values.getOrDefault(k,d);} public Editor edit(){return new Editor();} public class Editor { public Editor putBoolean(String k,boolean v){values.put(k,v);return this;} public Editor putInt(String k,int v){values.put(k,v);writes.add(v);return this;} public Editor putString(String k,String v){values.put(k,v);return this;} public Editor remove(String k){values.remove(k);return this;} public void apply(){} } }");
        sources.put("android.app.Application", "package android.app; public class Application extends android.content.Context { public final android.content.SharedPreferences prefs=new android.content.SharedPreferences(); public android.content.SharedPreferences getSharedPreferences(String n,int m){return prefs;} public String getPackageName(){return \"com.nuvio.tv\";} public Manager getPackageManager(){return new Manager();} public static class Manager { public Info getPackageInfo(String n,int f){return new Info();} } public static class Info { public String versionName=\"1.1.0-beta.6\"; } }");
        sources.put("android.app.ActivityThread", "package android.app; public class ActivityThread { public static final Application APP=new Application(); public static Application currentApplication(){return APP;} }");
        sources.put("android.os.Looper", "package android.os; public class Looper { public static Looper getMainLooper(){return new Looper();} }");
        sources.put("android.os.Handler", "package android.os; public class Handler { public Handler(Looper l){} public boolean postDelayed(Runnable r,long delay){r.run();return true;} }");
        sources.put("android.os.SystemClock", "package android.os; public class SystemClock { public static long elapsedRealtime(){return System.nanoTime()/1000000;} }");
        sources.put("android.util.Log", "package android.util; public class Log { public static int d(String t,String m){return 0;} public static int w(String t,String m){throw new AssertionError(m);} public static int e(String t,String m,Throwable e){throw new AssertionError(m,e);} }");
        sources.put("fixture.NextUp", "package fixture; public class NextUp { public String a=\"tt3981938\",c=\"Rage of Bahamut\"; public int h=2,i=8; public Integer x=2,y=7; }");
        sources.put("fixture.Resume", "package fixture; public class Resume { public String getContentId(){return \"resume-id\";} public String getName(){return \"Undead Unluck\";} public Integer getSeason(){return 1;} public Integer getEpisode(){return 8;} }");
        sources.put("fixture.Card", "package fixture; public class Card { public String r=\"Undead Unluck\"; }");
        sources.put("fixture.Revision", "package fixture; public class Revision { public int value; public Integer getValue(){return value;} public void setValue(Integer v){value=v;} }");
        List<String> compile = new ArrayList<>(List.of("-classpath", System.getProperty("java.class.path"), "-d", dir.toString()));
        for (var entry : sources.entrySet()) {
            Path file = dir.resolve(entry.getKey().replace('.', '/') + ".java");
            Files.createDirectories(file.getParent()); Files.writeString(file, entry.getValue()); compile.add(file.toString());
        }
        try (var files = Files.list(Path.of(args[0]))) { files.filter(f -> f.toString().endsWith(".java")).forEach(f -> compile.add(f.toString())); }
        check(ToolProvider.getSystemJavaCompiler().run(null, null, null, compile.toArray(String[]::new)) == 0, "Runtime compilation failed");

        CountDownLatch oldStarted = new CountDownLatch(1), releaseOld = new CountDownLatch(1);
        java.util.concurrent.atomic.AtomicInteger requests = new java.util.concurrent.atomic.AtomicInteger();
        StringBuilder json = new StringBuilder("{\"meta\":{\"videos\":[");
        for (int season = 1; season <= 2; season++) for (int episode = 1; episode <= (season == 1 ? 12 : 24); episode++) {
            if (json.charAt(json.length()-1) != '[') json.append(',');
            json.append("{\"season\":").append(season).append(",\"episode\":").append(episode).append(",\"released\":\"2017-01-01T00:00:00Z\"}");
        }
        byte[] body = json.append("]}}").toString().getBytes(java.nio.charset.StandardCharsets.UTF_8);
        URL.setURLStreamHandlerFactory(protocol -> "https".equals(protocol) ? new URLStreamHandler() {
            protected URLConnection openConnection(URL url) {
                return new HttpURLConnection(url) {
                    public void connect() {} public void disconnect() {} public boolean usingProxy(){return false;}
                    public int getResponseCode() { return 200; }
                    public InputStream getInputStream() throws IOException {
                        if (requests.incrementAndGet() == 1) {
                            oldStarted.countDown();
                            try { if (!releaseOld.await(5, TimeUnit.SECONDS)) throw new IOException("Test timed out"); }
                            catch (InterruptedException error) { throw new IOException(error); }
                        }
                        return new ByteArrayInputStream(body);
                    }
                };
            }
        } : null);
        List<URL> runtimeUrls = new ArrayList<>();
        runtimeUrls.add(dir.toUri().toURL());
        for (String entry : System.getProperty("java.class.path").split(java.util.regex.Pattern.quote(File.pathSeparator)))
            runtimeUrls.add(Path.of(entry).toUri().toURL());
        try (URLClassLoader loader = new URLClassLoader(runtimeUrls.toArray(URL[]::new), ClassLoader.getPlatformClassLoader())) {
            Class<?> bridge = loader.loadClass("software.santodan.extension.nuvioremaining.NuvioRemainingEpisodes");
            Object app = loader.loadClass("android.app.ActivityThread").getField("APP").get(null);
            Object prefs = app.getClass().getField("prefs").get(app);
            Map<String,Object> values = (Map<String,Object>) prefs.getClass().getField("values").get(prefs);
            List<Integer> writes = (List<Integer>) prefs.getClass().getField("writes").get(prefs);
            values.put("enabled", true);
            values.put("count_v4_tt3981938", 17); values.put("count_v4_tt3981938_seed", "[2, 8, 2, 7]");
            Object card = loader.loadClass("fixture.NextUp").getConstructor().newInstance();
            bridge.getMethod("register", Object.class).invoke(null, card);
            Map<String,Integer> counts = (Map<String,Integer>) value(bridge, "REMAINING");
            check(Objects.equals(counts.get("tt3981938"), 17), "Matching cached seed was not restored");
            ((Map<String,Long>) value(bridge, "VISIBLE")).put("tt3981938", System.nanoTime()/1000000);
            Method fetch = bridge.getDeclaredMethod("fetchRemaining", String.class, int.class, int.class, Integer.class, Integer.class);
            fetch.setAccessible(true); fetch.invoke(null, "tt3981938", 2, 8, 2, 7);
            check(oldStarted.await(5, TimeUnit.SECONDS), "Old request never started");
            card.getClass().getField("i").set(card, 20); card.getClass().getField("y").set(card, 19);
            bridge.getMethod("register", Object.class).invoke(null, card);
            check(!counts.containsKey("tt3981938"), "Changed seed retained stale count");
            releaseOld.countDown();
            long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
            while (!Objects.equals(counts.get("tt3981938"), 5) && System.nanoTime() < deadline) Thread.sleep(20);
            check(Objects.equals(counts.get("tt3981938"), 5), "New seed did not retry promptly");
            check(!writes.contains(17), "Old asynchronous request published 17 after the seed changed");
            counts.clear(); values.put("count_v4_tt3981938_seed", "[2, 8, 2, 7]");
            bridge.getMethod("register", Object.class).invoke(null, card);
            check(!counts.containsKey("tt3981938"), "Mismatched persistent seed restored a stale count");
            // Aired metadata can precede quick-sync membership. Publish counts without
            // another full provider sync or another card composition.
            Field airedField=bridge.getDeclaredField("latestAiredById"); airedField.setAccessible(true);
            airedField.set(null, Map.of("tt3981938", Set.of("1:1","1:2","1:3")));
            bridge.getMethod("refreshWatchedHistory", Map.class).invoke(null, Map.of("tt3981938",Set.of("1:1","1:2")));
            deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(5);
            while(!Objects.equals(counts.get("tt3981938"),1)&&System.nanoTime()<deadline)Thread.sleep(20);
            check(Objects.equals(counts.get("tt3981938"),1),"Restored startup history did not publish visible remaining count");
            bridge.getMethod("refreshWatchedHistory", Map.class).invoke(null, Map.of("tt3981938",Set.of("1:1","1:2","1:3")));
            deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(5);
            while(!Objects.equals(counts.get("tt3981938"),0)&&System.nanoTime()<deadline)Thread.sleep(20);
            check(Objects.equals(counts.get("tt3981938"),0),"Completed startup history retained a stale count");
            Object revision=loader.loadClass("fixture.Revision").getConstructor().newInstance();
            Field revisionField=bridge.getDeclaredField("revisionState");revisionField.setAccessible(true);revisionField.set(null,revision);
            airedField.set(null,Map.of("resume-id",Set.of("1:7","1:8","1:9")));
            bridge.getMethod("prepareBadge",Object.class).invoke(null,loader.loadClass("fixture.Card").getConstructor().newInstance());
            bridge.getMethod("registerProgress",Object.class).invoke(null,loader.loadClass("fixture.Resume").getConstructor().newInstance());
            check((int)revision.getClass().getField("value").get(revision)>0,"Late first-card registration did not invalidate composition");
            bridge.getMethod("refreshWatchedHistory",Map.class).invoke(null,Map.of("resume-id",Set.of("1:7","1:8")));
            deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(5);
            while(!Objects.equals(counts.get("resume-id"),1)&&System.nanoTime()<deadline)Thread.sleep(20);
            check(Objects.equals(counts.get("resume-id"),1),"Resume card required a native NextUpInfo/full sync to show its count");
        }
        System.out.println("PASS: stale request rejection, changed-seed invalidation, immediate retry and persistent seed validation");
    }
    private static Object value(Class<?> owner, String name) throws Exception { Field field=owner.getDeclaredField(name);field.setAccessible(true);return field.get(null); }
    private static void check(boolean condition, String message) { if (!condition) throw new AssertionError(message); }
}
