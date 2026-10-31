package santodan.patches;

import java.nio.file.Path;

/** Minimal 0.6.27 reflection ABI, with asynchronous native suspension. */
final class Pillo627ImportFixture {
    static void prepare(Path root) throws Exception {
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
    static boolean child(String name) {
        return name.contains("PilloWeightImport627") || name.startsWith("kotlin.coroutines.") || name.equals("kotlin.ResultKt")
            || name.startsWith("xyz.rtrvr.pillo.data.persistence.database.AppDatabaseManager")
            || name.startsWith("xyz.rtrvr.pillo.models.entities.tracker.Tracker")
            || name.equals("xyz.rtrvr.pillo.models.entities.tracker.type.weight.WeightTrackerRecord")
            || name.equals("xyz.rtrvr.pillo.shared.coroutine.FlowExtensionsKt");
    }
}
