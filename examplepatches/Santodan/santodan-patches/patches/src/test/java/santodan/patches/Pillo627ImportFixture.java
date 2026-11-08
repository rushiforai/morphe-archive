package santodan.patches;

import java.nio.file.Path;

/** Minimal 0.6.27 reflection ABI, with asynchronous native suspension. */
final class Pillo627ImportFixture {
    static void prepare(Path root) throws Exception {
        VerifyPillo627Runtime.source(root, "kotlin/Unit.java", "package kotlin; public final class Unit { public static final Unit a = new Unit(); }");
        // JVM class files permit Kotlin's mangled names. Compile legal Java names
        // and rename equal-length UTF-8 constants after compilation below.
        VerifyPillo627Runtime.source(root, "xyz/rtrvr/pillo/ui/components/layout/SpacedColumnKt.java",
            "package xyz.rtrvr.pillo.ui.components.layout; import kotlin.jvm.functions.Function3; public class SpacedColumnKt {" +
            "public static void SpacedColumn_DzVHIIc(Object modifier,float space,Object alignment,Function3 content,Object composer,int flags,int defaults){" +
            "if(space!=8f || defaults!=5)throw new AssertionError(\"Column arguments\"); content.invoke(new Object(),composer,0); } }");
        VerifyPillo627Runtime.source(root, "xyz/rtrvr/pillo/ui/components/buttons/ButtonsKt.java",
            "package xyz.rtrvr.pillo.ui.components.buttons; import kotlin.jvm.functions.*; public class ButtonsKt {" +
            "public static int draws; public static Function0 click; public static Object composer; public static RuntimeException failure;" +
            "public static void ButtonM_jB83MbM(Object modifier,boolean full,String text,long background,long foreground,Function0 action,Object current,int flags,int defaults){" +
            "if(failure!=null)throw failure; if(!full || !text.equals(\"Import weights JSON\") || action==null || background!=101L || foreground!=202L || defaults!=1 || flags!=0)throw new AssertionError(\"Button arguments\");" +
            "draws++; click=action; composer=current; }" +
            "public static void ButtonM_vRFhKjU(Object modifier,boolean full,String text,long background,long foreground,Function2 prefix,Function0 action,Object current,int flags,int defaults){" +
            "if(prefix==null)throw new NullPointerException(\"Parameter specified as non-null is null: prefix\"); throw new AssertionError(\"Unexpected prefix overload\"); } }");
        for (int provider = 2; provider <= 3; provider++) {
            String name = "ButtonProps$" + provider;
            VerifyPillo627Runtime.source(root, "xyz/rtrvr/pillo/ui/components/buttons/" + name + ".java",
                "package xyz.rtrvr.pillo.ui.components.buttons; final class " + name + " { public static final " + name + " INSTANCE=new " + name + "();" +
                "public long invoke_WaAFU9c(Object composer,int flags){if(composer==null || flags!=0)throw new AssertionError(\"Theme context\");return " + (provider == 2 ? 101 : 202) + "L;} }");
        }
        VerifyPillo627Runtime.source(root, "xyz/rtrvr/pillo/ui/tracker/common/components/LoggingBottomBarKt.java",
            "package xyz.rtrvr.pillo.ui.tracker.common.components; public class LoggingBottomBarKt { public static int draws; public static Object[] args;" +
            "public static void LoggingBottomBar(Object modifier,Object back,Object next,boolean previous,boolean enabled,String label,Object composer,int flags,int defaults){" +
            "draws++;args=new Object[]{modifier,back,next,previous,enabled,label,composer,flags,defaults};} }");
        VerifyPillo627Runtime.source(root, "kotlin/coroutines/CoroutineContext.java", "package kotlin.coroutines; public interface CoroutineContext {}");
        VerifyPillo627Runtime.source(root, "kotlin/coroutines/Continuation.java", "package kotlin.coroutines; public interface Continuation { CoroutineContext getContext(); void resumeWith(Object result); }");
        VerifyPillo627Runtime.source(root, "kotlin/coroutines/EmptyCoroutineContext.java", "package kotlin.coroutines; public class EmptyCoroutineContext implements CoroutineContext { public static final EmptyCoroutineContext a = new EmptyCoroutineContext(); }");
        VerifyPillo627Runtime.source(root, "kotlin/coroutines/intrinsics/CoroutineSingletons.java", "package kotlin.coroutines.intrinsics; public enum CoroutineSingletons { a }");
        VerifyPillo627Runtime.source(root, "kotlin/ResultKt.java", "package kotlin; public class ResultKt { public static void b(Object value) { if(value instanceof Throwable) throw new IllegalStateException((Throwable)value); } }");
        VerifyPillo627Runtime.source(root, "xyz/rtrvr/pillo/models/entities/tracker/TrackerType.java", "package xyz.rtrvr.pillo.models.entities.tracker; public enum TrackerType { WEIGHT }");
        VerifyPillo627Runtime.source(root, "xyz/rtrvr/pillo/models/entities/tracker/type/weight/WeightTrackerRecord.java",
            "package xyz.rtrvr.pillo.models.entities.tracker.type.weight; public class WeightTrackerRecord {" +
            "public final float pounds; public final String note; public WeightTrackerRecord(float value,String note){pounds=value;this.note=note;} public float getWeightLbs(){return pounds;} }");
        StringBuilder constructor = new StringBuilder();
        for (int i = 0; i < 23; i++) { if (i > 0) constructor.append(','); constructor.append("Object a").append(i); }
        VerifyPillo627Runtime.source(root, "xyz/rtrvr/pillo/models/entities/tracker/TrackerEvent.java",
            "package xyz.rtrvr.pillo.models.entities.tracker; import xyz.rtrvr.pillo.models.entities.tracker.type.weight.WeightTrackerRecord; public class TrackerEvent {" +
            "public final String profile; public final Long date; public final WeightTrackerRecord weight; public TrackerEvent(" + constructor +
            "){profile=(String)a2;date=(Long)a8;weight=(WeightTrackerRecord)a14;} public Long getRecordedAtEpochSec(){return date;} public WeightTrackerRecord getWeightRecord(){return weight;} }");
        VerifyPillo627Runtime.source(root, "xyz/rtrvr/pillo/data/persistence/database/AppDatabaseManager.java",
            "package xyz.rtrvr.pillo.data.persistence.database; import java.util.*; import kotlin.coroutines.Continuation; import kotlin.coroutines.intrinsics.CoroutineSingletons; import xyz.rtrvr.pillo.models.entities.tracker.*;" +
            "public class AppDatabaseManager { public static final Companion Companion=new Companion(); public static final Repo repo=new Repo(); public static class Companion { public AppDatabaseManager getInstance(){return new AppDatabaseManager();} }" +
            "public Repo getTrackerEventRepository(){return repo;} public static class Repo { public final List<TrackerEvent> records=new ArrayList<>(); public int writes; public int failAfter=999; public boolean reject;" +
            "public Object findTrackedEventsByUserProfileIdAndTrackerType(String profile,TrackerType type){List<TrackerEvent> result=new ArrayList<>();for(TrackerEvent e:records)if(e.profile.equals(profile))result.add(e);return result;}" +
            "public Object insertWithConstraint(TrackerEvent event,Continuation continuation){if(writes>=failAfter)throw new IllegalStateException(\"native database failure\"); if(reject)return 0L; new Thread(()->{records.add(event);writes++;continuation.resumeWith((long)writes);}).start();return CoroutineSingletons.a;} } }");
        VerifyPillo627Runtime.source(root, "xyz/rtrvr/pillo/shared/coroutine/FlowExtensionsKt.java",
            "package xyz.rtrvr.pillo.shared.coroutine; import kotlin.coroutines.Continuation; import kotlin.coroutines.intrinsics.CoroutineSingletons; public class FlowExtensionsKt {" +
            "public static Object firstOnIO(Object flow,Continuation continuation){continuation.getContext();new Thread(()->continuation.resumeWith(flow)).start();return CoroutineSingletons.a;} }");
    }
    static void renameUiMethods(Path root) throws Exception {
        try (var paths = java.nio.file.Files.walk(root)) {
            for (Path file : paths.filter(p -> p.toString().endsWith(".class")).collect(java.util.stream.Collectors.toList())) {
                byte[] before = java.nio.file.Files.readAllBytes(file);
                String constants = new String(before, java.nio.charset.StandardCharsets.ISO_8859_1);
                String renamed = constants.replace("SpacedColumn_DzVHIIc", "SpacedColumn-DzVHIIc")
                    .replace("ButtonM_jB83MbM", "ButtonM-jB83MbM").replace("ButtonM_vRFhKjU", "ButtonM-vRFhKjU")
                    .replace("invoke_WaAFU9c", "invoke-WaAFU9c");
                if (!constants.equals(renamed)) java.nio.file.Files.write(file, renamed.getBytes(java.nio.charset.StandardCharsets.ISO_8859_1));
            }
        }
    }
    static boolean child(String name) {
        return name.contains("PilloWeightImport627") || name.startsWith("kotlin.coroutines.") || name.equals("kotlin.ResultKt") || name.equals("kotlin.Unit")
            || name.startsWith("xyz.rtrvr.pillo.ui.components.buttons.")
            || name.equals("xyz.rtrvr.pillo.ui.components.layout.SpacedColumnKt")
            || name.equals("xyz.rtrvr.pillo.ui.tracker.common.components.LoggingBottomBarKt")
            || name.startsWith("xyz.rtrvr.pillo.data.persistence.database.AppDatabaseManager")
            || name.startsWith("xyz.rtrvr.pillo.models.entities.tracker.Tracker")
            || name.equals("xyz.rtrvr.pillo.models.entities.tracker.type.weight.WeightTrackerRecord")
            || name.equals("xyz.rtrvr.pillo.shared.coroutine.FlowExtensionsKt");
    }
}
