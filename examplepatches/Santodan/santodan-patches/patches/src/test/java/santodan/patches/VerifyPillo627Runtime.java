package santodan.patches;

import software.santodan.extension.pillobackup.LocalArchive;
import software.santodan.extension.pillosummary.PilloWeightSummary627;
import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.nio.file.*;
import java.util.*;
import javax.tools.ToolProvider;

/** Host checks for version isolation, renderer cleanup, and observer lifecycle. */
public final class VerifyPillo627Runtime {
    static void check(boolean condition, String message) { if (!condition) throw new AssertionError(message); }
    public static final class Job {
        int cancelled;
        public void b(java.util.concurrent.CancellationException ignored) { cancelled++; }
    }
    public static final class Model {
        final Job job = new Job();
        int starts;
        boolean fail;
        public Job initialize(android.content.Context host, String profile, Object metric) {
            starts++;
            if (fail) throw new IllegalStateException("native initialize failed");
            return job;
        }
    }
    public static final class Profile {
        final String id;
        Profile(String id) { this.id = id; }
        public String getUserProfileId() { return id; }
    }
    static void source(Path root, String name, String text) throws IOException {
        Path file = root.resolve(name); Files.createDirectories(file.getParent()); Files.writeString(file, text);
    }
    public static void main(String[] args) throws Exception {
        Path root = Files.createTempDirectory(Path.of(args[0]), "pillo-627-runtime-");
        try {
            Path database = root.resolve("pillo.db"); Files.writeString(database, "database bytes");
            Map<String, File> roots = Map.of("database", database.toFile());
            File archive = root.resolve("backup.zip").toFile();
            LocalArchive.write(archive, roots, "0.6.27");
            File stage = root.resolve("restore").toFile();
            check(LocalArchive.extract(archive, stage, "0.6.27").getString("appVersion").equals("0.6.27"), "Wrong backup version");
            check(Files.readString(stage.toPath().resolve("data/database")).equals("database bytes"), "Archive bytes changed");
            File wrong = root.resolve("wrong-version").toFile();
            try { LocalArchive.extract(archive, wrong, "0.6.20"); throw new AssertionError("Accepted incompatible archive"); }
            catch (IOException expected) { check(!wrong.exists(), "Rejected archive left staged files"); }
            File legacy = root.resolve("legacy.zip").toFile();
            LocalArchive.write(legacy, roots, "0.6.20");
            File legacyStage = root.resolve("legacy-stage").toFile();
            check(LocalArchive.extract(legacy, legacyStage, "0.6.27", "0.6.20").getString("appVersion").equals("0.6.20"), "Approved migration source rejected");
            check(Files.readString(legacyStage.toPath().resolve("data/database")).equals("database bytes"), "Migration extraction changed source bytes");
            File unsupported = root.resolve("unsupported.zip").toFile();
            LocalArchive.write(unsupported, roots, "0.6.19");
            File unsupportedStage = root.resolve("unsupported-stage").toFile();
            try { LocalArchive.extract(unsupported, unsupportedStage, "0.6.27", "0.6.20"); throw new AssertionError("Accepted unsupported source version"); }
            catch (IOException expected) { check(!unsupportedStage.exists(), "Unsupported source left staged files"); }
            System.out.println("PASS: 0.6.27 archive round-trip, version isolation, rejected staging cleanup");

            Path stubs = root.resolve("stubs"); Files.createDirectories(stubs);
            source(stubs, "g3/n0.java", "package g3; public interface n0 { void dispose(); }");
            source(stubs, "xyz/rtrvr/pillo/ui/tracker/common/components/weight/WeightLineChartKt.java",
                "package xyz.rtrvr.pillo.ui.tracker.common.components.weight; public class WeightLineChartKt {" +
                "public static Runnable callback; public static Object WeightLineChart_TN_CM5M$lambda$12$0(" +
                "Object a,Object b,Object c,Object d,Object e,float f,Object g,float h,float i,float j,boolean k,Object l,Object m,int n) {" +
                "callback.run(); return null; }}");
            Pillo627ImportFixture.prepare(stubs);
            List<String> compile = new ArrayList<>(List.of("-d", stubs.toString()));
            try (var paths = Files.walk(stubs)) { paths.filter(p -> p.toString().endsWith(".java")).forEach(p -> compile.add(p.toString())); }
            int result = ToolProvider.getSystemJavaCompiler().run(null, null, null, compile.toArray(new String[0]));
            check(result == 0, "Native stub compilation failed");
            URL classes = PilloWeightSummary627.class.getProtectionDomain().getCodeSource().getLocation();
            try (URLClassLoader loader = new URLClassLoader(new URL[]{stubs.toUri().toURL(), classes}, VerifyPillo627Runtime.class.getClassLoader()) {
                @Override protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
                    if (Pillo627ImportFixture.child(name) || name.contains("PilloWeightSummary627") || name.contains("PilloProgressWeight627") || name.equals("g3.n0") || name.endsWith("WeightLineChartKt")) {
                        Class<?> type = findLoadedClass(name);
                        if (type == null) type = findClass(name);
                        if (resolve) resolveClass(type);
                        return type;
                    }
                    return super.loadClass(name, resolve);
                }
            }) {
                Class<?> progress = loader.loadClass("software.santodan.extension.pillosummary.PilloProgressWeight627");
                Method observer = progress.getDeclaredMethod("observer", Object.class, android.content.Context.class, Object.class);
                observer.setAccessible(true);
                Model model = new Model();
                Object effect = observer.invoke(null, model, null, new Object());
                Object disposable = Class.forName("kotlin.jvm.functions.Function1").getMethod("invoke", Object.class).invoke(effect, new Object());
                check(model.starts == 1, "Observer did not initialize native reading model");
                Method dispose = loader.loadClass("g3.n0").getMethod("dispose");
                dispose.invoke(disposable); dispose.invoke(disposable);
                check(model.job.cancelled == 1, "Observer cancellation was not idempotent");
                model.fail = true;
                try { Class.forName("kotlin.jvm.functions.Function1").getMethod("invoke", Object.class).invoke(effect, new Object()); throw new AssertionError("Swallowed native failure"); }
                catch (InvocationTargetException expected) { /* Failure reaches the composition caller. */ }
                Method profile = progress.getDeclaredMethod("chartProfileId", Object.class); profile.setAccessible(true);
                check(profile.invoke(null, new Object[]{null}) == null, "Null profile changed");
                check(profile.invoke(null, new Profile("family")).equals("family"), "Selected profile lost");
                try { profile.invoke(null, new Profile("")); throw new AssertionError("Accepted empty profile sentinel"); }
                catch (InvocationTargetException expected) { }
                System.out.println("PASS: native observer initialization/failure, one-time cancellation, selected-profile contract");

                Class<?> summary = loader.loadClass("software.santodan.extension.pillosummary.PilloWeightSummary627");
                Field rendering = summary.getDeclaredField("rendering"); rendering.setAccessible(true);
                @SuppressWarnings("unchecked") ThreadLocal<Object> state = (ThreadLocal<Object>) rendering.get(null);
                Object previous = new Object(), records = new Object(), unit = new Object(); state.set(previous);
                Class<?> chart = loader.loadClass("xyz.rtrvr.pillo.ui.tracker.common.components.weight.WeightLineChartKt");
                chart.getField("callback").set(null, (Runnable) () -> {
                    Object[] captured = (Object[]) state.get();
                    check(captured[0] == records && captured[1] == unit, "Renderer lost native state/unit");
                    throw new IllegalStateException("native render failed");
                });
                Method render = Arrays.stream(summary.getMethods()).filter(m -> m.getName().equals("render")).findFirst().orElseThrow();
                try { render.invoke(null, null, unit, null, null, null, 0f, null, 0f, 0f, 0f, false, records, null, 0); throw new AssertionError("Swallowed render failure"); }
                catch (InvocationTargetException expected) { }
                check(state.get() == previous, "Renderer leaked profile state after exception"); state.remove();
                check(PilloWeightSummary627.format(PilloWeightSummary627.delta(List.of(110.7, 105.0), false)).equals("-5.7"), "Signed total changed");
                check(PilloWeightSummary627.takeLast(2, List.of(1,2,3)).equals(List.of(2,3)), "Reordered native takeLast arguments changed history");
                System.out.println("PASS: explicit render captures, exception cleanup, signed totals, reordered takeLast ABI");
                Class<?> importer = loader.loadClass("software.santodan.extension.pilloweight.PilloWeightImport627");
                Method save = importer.getDeclaredMethod("importEntries", List.class, String.class); save.setAccessible(true);
                var entries = software.santodan.extension.pilloweight.WeightBackup.parse("{\"weights\":[{\"date\":1751583600000,\"weight\":105},{\"date\":1751683600000,\"weight\":104}]}", true);
                check(save.invoke(null, entries, "owner").equals(2), "Asynchronous import failed");
                check(save.invoke(null, entries, "owner").equals(0), "Reimport duplicated records");
                check(save.invoke(null, entries, "family").equals(2), "Family profile did not remain separate");
                Object repository = loader.loadClass("xyz.rtrvr.pillo.data.persistence.database.AppDatabaseManager").getField("repo").get(null);
                Class<?> repo = repository.getClass();
                repo.getField("failAfter").setInt(repository, 5);
                try { save.invoke(null, entries, "partial"); throw new AssertionError("Partial failure swallowed"); }
                catch (InvocationTargetException expected) { check(expected.getCause().getMessage().contains("Saved 1 of 2"), "Partial progress lost"); }
                repo.getField("failAfter").setInt(repository, 999);
                check(save.invoke(null, entries, "partial").equals(1), "Retry did not skip saved record");
                repo.getField("reject").setBoolean(repository, true);
                try { save.invoke(null, entries, "rejected"); throw new AssertionError("Unconfirmed write accepted"); }
                catch (InvocationTargetException expected) { check(expected.getCause().getMessage().contains("Saved 0 of 2"), "Write rejection lost"); }
                System.out.println("PASS: 0.6.27 firstOnIO/suspend ABI, asynchronous writes, duplicates, profiles, partial retry and write rejection");
            }
        } finally { LocalArchive.delete(root.toFile()); }
    }
}
