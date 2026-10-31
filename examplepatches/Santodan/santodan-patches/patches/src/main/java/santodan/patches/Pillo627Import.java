package santodan.patches;
import java.util.*;
import com.android.tools.smali.dexlib2.iface.ClassDef;
final class Pillo627Import {
    static void validate(List<? extends ClassDef> classes) {
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/shared/coroutine/FlowExtensionsKt;->firstOnIO(Lmw/l;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;");
        Pillo627.require(classes, "Lkotlin/ResultKt;->b(Ljava/lang/Object;)V");
        Pillo627.require(classes, "Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;");
        Pillo627.require(classes, "Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V");
        Pillo627.requireField(classes, "Lkotlin/coroutines/EmptyCoroutineContext;->a:Lkotlin/coroutines/EmptyCoroutineContext;", true);
        Pillo627.requireField(classes, "Lkotlin/coroutines/intrinsics/CoroutineSingletons;->a:Lkotlin/coroutines/intrinsics/CoroutineSingletons;", true);
        Pillo627.requireField(classes, "Lkotlin/Unit;->a:Lkotlin/Unit;", true);
        Pillo627.requireField(classes, "Lxyz/rtrvr/pillo/models/entities/tracker/TrackerType;->WEIGHT:Lxyz/rtrvr/pillo/models/entities/tracker/TrackerType;", true);
        Pillo627.requireField(classes, "Lxyz/rtrvr/pillo/data/persistence/database/AppDatabaseManager;->Companion:Lxyz/rtrvr/pillo/data/persistence/database/AppDatabaseManager$Companion;", true);
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/components/buttons/ButtonsKt;->ButtonM-vRFhKjU(Ls3/s;ZLjava/lang/String;JJLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;Lg3/q;II)V");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/components/layout/SpacedColumnKt;->SpacedColumn-DzVHIIc(Ls3/s;FLs3/d;Lkotlin/jvm/functions/Function3;Lg3/q;II)V");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/tracker/common/components/LoggingBottomBarKt;->LoggingBottomBar(Ls3/s;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;ZZLjava/lang/String;Lg3/q;II)V");
        String root = "Lxyz/rtrvr/pillo/";
        String vm = root + "ui/tracker/log/asneeded/LogTrackerEventAsNeededViewModel;";
        String type = root + "models/entities/tracker/TrackerType;";
        String record = root + "models/entities/tracker/type/weight/WeightTrackerRecord;";
        String repo = root + "data/repository/tracker/TrackerEventRepository;";
        String profile = root + "models/profile/UserProfile;";
        PilloWeightImportPatch.requireMethod(classes, PilloWeightImportPatch.ACTIVITY, "onCreate", "V", "Landroid/os/Bundle;");
        PilloWeightImportPatch.requireMethod(classes, PilloWeightImportPatch.ACTIVITY, "getVm", vm);
        PilloWeightImportPatch.requireMethod(classes, vm, "getUserProfile", profile);
        PilloWeightImportPatch.requireMethod(classes, vm, "getTrackerType", type);
        PilloWeightImportPatch.requireMethod(classes, profile, "getUserProfileId", "Ljava/lang/String;");
        PilloWeightImportPatch.requireMethod(classes, root + "data/persistence/database/AppDatabaseManager$Companion;", "getInstance",
            root + "data/persistence/database/AppDatabaseManager;");
        PilloWeightImportPatch.requireMethod(classes, root + "data/persistence/database/AppDatabaseManager;", "getTrackerEventRepository", repo);
        PilloWeightImportPatch.requireMethod(classes, record, "<init>", "V", "F", "Ljava/lang/String;");
        PilloWeightImportPatch.requireMethod(classes, record, "getWeightLbs", "F");
        PilloWeightImportPatch.requireMethod(classes, PilloWeightImportPatch.EVENT, "getRecordedAtEpochSec", "Ljava/lang/Long;");
        PilloWeightImportPatch.requireMethod(classes, PilloWeightImportPatch.EVENT, "getWeightRecord", record);
        PilloWeightImportPatch.requireMethod(classes, repo, "findTrackedEventsByUserProfileIdAndTrackerType", "Lmw/l;",
            "Ljava/lang/String;", type);
        PilloWeightImportPatch.requireMethod(classes, repo, "insertWithConstraint", "Ljava/lang/Object;", PilloWeightImportPatch.EVENT, "Lkotlin/coroutines/Continuation;");
        PilloWeightImportPatch.requireMethod(classes, PilloWeightImportPatch.EVENT, "<init>", "V", "J", "Ljava/lang/Long;", "Ljava/lang/String;", type,
            "Ljava/lang/Long;", "Ljava/lang/Long;", root + "models/entities/tracker/SnoozeReason;", "Z",
            "Ljava/lang/Long;", "Ljava/lang/Long;", "Ljava/lang/Long;", "Ljava/lang/Long;", "Ljava/lang/Long;",
            root + "models/entities/tracker/type/bp/BpTrackerRecord;", record,
            root + "models/entities/tracker/type/glucose/GlucoseTrackerRecord;",
            root + "models/entities/tracker/type/heartrate/HeartRateTrackerRecord;",
            root + "models/entities/tracker/type/hba1c/Hba1cTrackerRecord;",
            root + "models/entities/tracker/type/water/WaterTrackerRecord;",
            root + "models/entities/tracker/type/spo2/SpO2TrackerRecord;",
            root + "models/entities/tracker/type/temperature/BodyTemperatureTrackerRecord;",
            root + "models/entities/tracker/type/mood/MoodRecord;", root + "models/entities/tracker/type/sleep/SleepTrackerRecord;");
    }

}
