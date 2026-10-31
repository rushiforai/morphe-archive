package santodan.patches;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.util.*;
import kotlin.Unit;

public final class PilloProgressWeightPatch {
    public static final String NAME = "Pillo - Weight in Progress";
    static final String TARGET = "Lxyz/rtrvr/pillo/ui/report/ProgressScreenKt$ProgressScreen$6;";
    static final String EXT = "Lsoftware/santodan/extension/pillosummary/PilloProgressWeight;";
    static final String READING = "Lxyz/rtrvr/pillo/ui/tracker/reading/";
    static final String METRIC = "Lxyz/rtrvr/pillo/models/tracker/chart/TrackerMetricType;";
    static final String COMPOSER = "Landroidx/compose/runtime/Composer;";
    static final List<String> LAZY = List.of("Landroidx/compose/ui/Modifier;",
        "Landroidx/compose/foundation/lazy/LazyListState;", "Landroidx/compose/foundation/layout/PaddingValues;", "Z",
        "Landroidx/compose/foundation/layout/Arrangement$Vertical;", "Landroidx/compose/ui/Alignment$Horizontal;",
        "Landroidx/compose/foundation/gestures/FlingBehavior;", "Z", "Landroidx/compose/foundation/OverscrollEffect;",
        "Lkotlin/jvm/functions/Function1;", COMPOSER, "I", "I");
    private PilloProgressWeightPatch() {}

    public static BytecodePatch getPilloProgressWeightPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Shows the native weight graph, weight-change summaries and dated record list below the existing Progress calendar. Includes Weight change summaries.",
            false, builder -> {
                builder.compatibleWith(new Compatibility("xyz.rtrvr.pillo", "Pillo", null, ApkFileType.APK,
                    null, null, List.of(new AppTarget("0.6.27", null, false, null, null), new AppTarget("0.6.20", null, false, null, null)), FormFactor.MOBILE, false));
                builder.dependsOn(PilloWeightSummaryPatch.getPilloWeightSummaryPatch());
                builder.execute(context -> {
                    if ("xyz.rtrvr.pillo".equals(context.getPackageMetadata().getPackageName())
                        && "0.6.27".equals(context.getPackageMetadata().getVersionName())) {
                        Pillo627.progressWeight(context);
                        return Unit.INSTANCE;
                    }
                    if (!"xyz.rtrvr.pillo".equals(context.getPackageMetadata().getPackageName())
                        || !"0.6.20".equals(context.getPackageMetadata().getVersionName()))
                        throw new IllegalStateException("Expected Pillo 0.6.20");
                    List<ClassDef> classes = new ArrayList<>();
                    context.classDefForEach(c -> { classes.add(c); return Unit.INSTANCE; });
                    validate(classes);
                    var methods = context.mutableClassDefBy(TARGET).getMethods().stream().filter(m ->
                        m.getName().equals("invoke") && PilloHybridNotificationPatch.signature(m, "V",
                            "Landroidx/compose/foundation/layout/PaddingValues;", COMPOSER, "I")).collect(java.util.stream.Collectors.toList());
                    if (methods.size() != 1) throw new IllegalStateException("Missing or ambiguous Progress content");
                    apply(methods.get(0));
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static void apply(MutableMethod method) {
        var instructions = PilloHybridNotificationPatch.instructions(method);
        List<Integer> matches = new ArrayList<>();
        for (int i = 0; i < instructions.size(); i++) {
            if (!(instructions.get(i) instanceof ReferenceInstruction)) continue;
            var reference = ((ReferenceInstruction) instructions.get(i)).getReference();
            if (!(reference instanceof MethodReference)) continue;
            var ref = (MethodReference) reference;
            if (ref.getDefiningClass().equals("Landroidx/compose/foundation/lazy/LazyDslKt;")
                && ref.getName().equals("LazyColumn") && ref.getReturnType().equals("V")
                && ref.getParameterTypes().equals(LAZY)) matches.add(i);
        }
        if (matches.size() != 1) throw new IllegalStateException("Progress LazyColumn changed or already patched");
        int index = matches.get(0);
        if (instructions.get(index).getOpcode() != Opcode.INVOKE_STATIC_RANGE
            || !(instructions.get(index) instanceof RegisterRangeInstruction)
            || ((RegisterRangeInstruction) instructions.get(index)).getRegisterCount() != 13)
            throw new IllegalStateException("Progress LazyColumn register contract changed");
        var call = (RegisterRangeInstruction) instructions.get(index);
        var parameters = LAZY.stream().map(t -> t.startsWith("L") ? "Ljava/lang/Object;" : t)
            .collect(java.util.stream.Collectors.toList());
        method.getImplementation().replaceInstruction(index, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            call.getStartRegister(), call.getRegisterCount(), new ImmutableMethodReference(EXT, "progress", parameters, "V")));
    }

    static void validate(List<? extends ClassDef> classes) {
        require(classes, READING + "ViewTrackerReadingListViewModel;", "access$get_selectedUserProfile$p",
            "Lkotlinx/coroutines/flow/MutableStateFlow;", READING + "ViewTrackerReadingListViewModel;");
        require(classes, "Lxyz/rtrvr/pillo/models/profile/UserProfile;", "getUserProfileId", "Ljava/lang/String;");
        require(classes, "Landroidx/lifecycle/compose/FlowExtKt;", "collectAsStateWithLifecycle",
            "Landroidx/compose/runtime/State;", "Lkotlinx/coroutines/flow/StateFlow;",
            "Landroidx/lifecycle/LifecycleOwner;", "Landroidx/lifecycle/Lifecycle$State;",
            "Lkotlin/coroutines/CoroutineContext;", COMPOSER, "I", "I");
        require(classes, READING + "ViewTrackerReadingListViewModel;", "initialize", "Lkotlinx/coroutines/Job;",
            "Landroidx/activity/ComponentActivity;", "Ljava/lang/String;", METRIC);
        require(classes, READING + "ViewTrackerReadingListViewModel;", "getReadingEntryGroups", "Ljava/util/List;");
        require(classes, READING + "ViewTrackerReadingListViewModel;", "getLoggableTrackerType", "Lxyz/rtrvr/pillo/models/entities/tracker/TrackerType;");
        require(classes, READING + "ViewTrackerReadingListState;", "<init>", "V", METRIC, "Ljava/util/List;",
            "Lxyz/rtrvr/pillo/models/entities/tracker/TrackerType;");
        require(classes, READING + "ViewTrakcerReadingListScreenKt;", "access$TrackerChartContent", "V",
            "Landroidx/compose/ui/Modifier;", "Ljava/lang/String;", METRIC, READING + "ViewTrackerReadingListViewModel;", COMPOSER, "I", "I");
        require(classes, READING + "ViewTrakcerReadingListScreenKt$ViewTrackerReadingListContent$2;",
            "invoke$lambda$6$lambda$4$lambda$3", "Lkotlin/Unit;", READING + "ViewTrackerReadingListState;",
            "Landroidx/compose/runtime/MutableIntState;", "Lkotlin/jvm/functions/Function2;", "Lkotlin/jvm/functions/Function1;",
            "Landroidx/compose/foundation/lazy/LazyListScope;");
        require(classes, "Landroidx/hilt/navigation/compose/HiltViewModelKt;", "createHiltViewModelFactory",
            "Landroidx/lifecycle/ViewModelProvider$Factory;", "Landroidx/lifecycle/ViewModelStoreOwner;", COMPOSER, "I");
        require(classes, "Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;", "getCurrent",
            "Landroidx/lifecycle/ViewModelStoreOwner;", COMPOSER, "I");
        require(classes, "Landroidx/lifecycle/ViewModelProvider;", "<init>", "V", "Landroidx/lifecycle/ViewModelStoreOwner;",
            "Landroidx/lifecycle/ViewModelProvider$Factory;");
        require(classes, "Landroidx/lifecycle/ViewModelProvider;", "get", "Landroidx/lifecycle/ViewModel;", "Ljava/lang/String;", "Ljava/lang/Class;");
        require(classes, "Landroidx/compose/runtime/EffectsKt;", "DisposableEffect", "V", "Ljava/lang/Object;",
            "Lkotlin/jvm/functions/Function1;", COMPOSER, "I");
        require(classes, "Landroidx/compose/runtime/SnapshotIntStateKt;", "mutableIntStateOf", "Landroidx/compose/runtime/MutableIntState;", "I");
        require(classes, "Landroidx/compose/runtime/DisposableEffectResult;", "dispose", "V");
        require(classes, "Lkotlinx/coroutines/Job;", "cancel", "V", "Ljava/util/concurrent/CancellationException;");
        require(classes, COMPOSER, "startReplaceGroup", "V", "I");
        require(classes, COMPOSER, "endReplaceGroup", "V");
        require(classes, "Lxyz/rtrvr/pillo/ui/tracker/log/edit/EditLoggedTrackerEventActivity$Companion;", "startActivity", "V",
            "Landroid/content/Context;", "J");
        var metric = classes.stream().filter(c -> c.getType().equals(METRIC)).findFirst().orElseThrow();
        boolean weight = false;
        for (var field : metric.getStaticFields()) if (field.getName().equals("WEIGHT") && field.getType().equals(METRIC)) weight = true;
        if (!weight) throw new IllegalStateException("Missing native WEIGHT metric");
    }
    private static void require(List<? extends ClassDef> classes, String owner, String name, String result, String... args) {
        PilloWeightImportPatch.requireMethod(classes, owner, name, result, args);
    }
}
