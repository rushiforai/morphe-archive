package santodan.patches;
import java.util.*;
import com.android.tools.smali.dexlib2.iface.ClassDef;
/** Exact original-DEX signatures used by the 0.6.27 runtime. */
final class Pillo627Contracts {
    static void summary(List<? extends ClassDef> classes) {
        Pillo627.requireField(classes, "Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lg3/n3;", true);
        Pillo627.requireField(classes, "Lkotlin/Unit;->a:Lkotlin/Unit;", true);
        Pillo627.require(classes, "Lg3/m3;->getValue()Ljava/lang/Object;");
        Pillo627.require(classes, "Lg3/n1;->setValue(Ljava/lang/Object;)V");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/report/tracker/components/filter/TakeLastOption;-><init>(ILjava/lang/String;)V");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/report/tracker/components/filter/ChooseTakeLastLayoutKt;->rememberChooseTakeLastLayout$lambda$0$0(Landroid/content/Context;)Ljava/util/List;");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/report/tracker/components/filter/ChooseTakeLastLayoutKt;->rememberChooseTakeLastLayout(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lg3/q;II)Lxyz/rtrvr/pillo/ui/compose/BottomSheetController;");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/report/tracker/components/filter/FilterBtnKt;->FilterBtn(Ls3/s;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lg3/q;II)V");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/report/tracker/components/filter/TakeLastFilterBtnKt;->TakeLastFilterBtn(Ls3/s;ZILkotlin/jvm/functions/Function0;Lg3/q;II)V");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/report/tracker/components/aggregate/LatestValueDisplayKt;->LatestValueDisplay(Ls3/s;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lg3/q;II)V");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/report/tracker/components/aggregate/AvgMinMaxRowKt;->ValueDisplay(Ls3/s;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lg3/q;II)V");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/report/tracker/components/aggregate/AvgMinMaxRowKt;->AvgMinMaxRow(Ls3/s;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lg3/q;II)V");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/components/row/DividedRowKt;->DividedRow-Ou1YvPQ(Ls3/s;FJLe2/i1;Lkotlin/jvm/functions/Function2;Lg3/q;II)V");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/compose/ModifierExtensionKt;->clickableNoRipple(Ls3/s;Lkotlin/jvm/functions/Function0;)Ls3/s;");
        // Obfuscated Compose Modifier.Companion instance: the empty modifier the date cell starts from.
        Pillo627.requireField(classes, "Ls3/p;->a:Ls3/p;", true);

        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/compose/EffectsKt;->rememberMutableStateOf(Ljava/lang/Object;Lg3/q;I)Lg3/n1;");
        Pillo627.require(classes, "Lg3/v;->k(Lg3/i2;)Ljava/lang/Object;");
        Pillo627.require(classes, "Ljv/e;->s1(ILjava/util/List;)Ljava/util/List;");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/models/tracker/weight/WeightRecordDataWithTime;->getTime()Lorg/threeten/bp/j;");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/models/tracker/weight/WeightRecordDataWithTime;->getWeight()Lxyz/rtrvr/pillo/models/tracker/weight/WeightUtil$Weight;");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/models/tracker/weight/WeightUtil$Weight;->changeUnit(Lxyz/rtrvr/pillo/models/tracker/weight/WeightUnit;)Lxyz/rtrvr/pillo/models/tracker/weight/WeightUtil$Weight;");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/models/tracker/weight/WeightUtil$Weight;->getValueWithPrecision(I)F");
    }
    static void progress(List<? extends ClassDef> classes) {
        Pillo627.requireField(classes, "Lxyz/rtrvr/pillo/models/tracker/chart/TrackerMetricType;->WEIGHT:Lxyz/rtrvr/pillo/models/tracker/chart/TrackerMetricType;", true);
        Pillo627.requireField(classes, "Lxyz/rtrvr/pillo/ui/tracker/log/edit/EditLoggedTrackerEventActivity;->Companion:Lxyz/rtrvr/pillo/ui/tracker/log/edit/EditLoggedTrackerEventActivity$Companion;", true);
        Pillo627.require(classes, "Lg3/v;->d0(I)V");
        Pillo627.require(classes, "Lg3/v;->t()V");
        Pillo627.require(classes, "Lg3/q0;->c(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Lg3/q;)V");
        Pillo627.require(classes, "Lg3/n0;->dispose()V");
        Pillo627.require(classes, "Lg3/u1;-><init>(I)V");
        Pillo627.require(classes, "Lkotlin/comparisons/ComparisonsKt;->t(Lmw/o2;Lg3/q;I)Lg3/n1;");
        Pillo627.require(classes, "Ljw/q1;->b(Ljava/util/concurrent/CancellationException;)V");
        Pillo627.require(classes, "Landroidx/lifecycle/j1;-><init>(Lkotlin/reflect/KClass;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V");
        Pillo627.require(classes, "Landroidx/lifecycle/j1;->getValue()Ljava/lang/Object;");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/tracker/reading/ViewTrackerReadingListViewModel;->initialize(Landroidx/activity/ComponentActivity;Ljava/lang/String;Lxyz/rtrvr/pillo/models/tracker/chart/TrackerMetricType;)Ljw/q1;");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/tracker/reading/ViewTrackerReadingListViewModel;->access$get_selectedUserProfile$p(Lxyz/rtrvr/pillo/ui/tracker/reading/ViewTrackerReadingListViewModel;)Lmw/w1;");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/tracker/reading/ViewTrackerReadingListViewModel;->getReadingEntryGroups()Ljava/util/List;");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/tracker/reading/ViewTrackerReadingListViewModel;->getLoggableTrackerType()Lxyz/rtrvr/pillo/models/entities/tracker/TrackerType;");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/models/profile/UserProfile;->getUserProfileId()Ljava/lang/String;");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/tracker/reading/ViewTrackerReadingListState;-><init>(Lxyz/rtrvr/pillo/models/tracker/chart/TrackerMetricType;Ljava/util/List;Lxyz/rtrvr/pillo/models/entities/tracker/TrackerType;)V");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/tracker/reading/ViewTrakcerReadingListScreenKt;->TrackerChartContent(Ls3/s;Ljava/lang/String;Lxyz/rtrvr/pillo/models/tracker/chart/TrackerMetricType;Lxyz/rtrvr/pillo/ui/tracker/reading/ViewTrackerReadingListViewModel;Lg3/q;II)V");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/tracker/reading/ViewTrakcerReadingListScreenKt;->ViewTrackerReadingListContent$lambda$4$0$1$0(Lxyz/rtrvr/pillo/ui/tracker/reading/ViewTrackerReadingListState;Lg3/l1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;Lg2/u;)Lkotlin/Unit;");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/tracker/log/edit/EditLoggedTrackerEventActivity$Companion;->startActivity(Landroid/content/Context;J)V");
        Pillo627.require(classes, "Lz0/l;->c(Ls3/s;Lg2/c0;Le2/i1;Le2/k;Ls3/d;La2/h2;ZLy1/b1;Lkotlin/jvm/functions/Function1;Lg3/q;II)V");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/tracker/reading/ViewTrackerReadingListActivity$special$$inlined$viewModels$default$1;-><init>(Landroidx/activity/ComponentActivity;)V");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/tracker/reading/ViewTrackerReadingListActivity$special$$inlined$viewModels$default$2;-><init>(Landroidx/activity/ComponentActivity;)V");
        Pillo627.require(classes, "Lxyz/rtrvr/pillo/ui/tracker/reading/ViewTrackerReadingListActivity$special$$inlined$viewModels$default$3;-><init>(Lkotlin/jvm/functions/Function0;Landroidx/activity/ComponentActivity;)V");
        Pillo627.require(classes, "Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;");
    }
}
