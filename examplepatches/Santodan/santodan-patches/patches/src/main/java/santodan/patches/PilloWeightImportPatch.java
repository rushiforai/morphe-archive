package santodan.patches;

import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.BytecodePatch;
import app.morphe.patcher.patch.Compatibility;
import app.morphe.patcher.patch.PatchKt;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import kotlin.Unit;

/** File-picker import into Pillo's ordinary weight records. */
public final class PilloWeightImportPatch {
    public static final String NAME = "Pillo - Import weight history from JSON";
    static final String ACTIVITY = "Lxyz/rtrvr/pillo/ui/tracker/log/asneeded/LogTrackerEventAsNeededActivity;";
    static final String EXTENSION = "Lsoftware/santodan/extension/pilloweight/PilloWeightImport;";
    static final String EVENT = "Lxyz/rtrvr/pillo/models/entities/tracker/TrackerEvent;";
    static final String FOOTER = "Lxyz/rtrvr/pillo/ui/tracker/common/record/layout/weight/TrackerRecordLogLayoutWeightKt$LogWeightLayout$2;";
    static final String BOTTOM = "Lxyz/rtrvr/pillo/ui/tracker/common/components/LoggingBottomBarKt;";
    private PilloWeightImportPatch() {}

    public static BytecodePatch getPilloWeightImportPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Adds a native Import weights JSON button above Skip in Weight > Add record. Imports SWT backup weights with their dates into the selected profile, with kg/lb selection and duplicate skipping.",
            false, builder -> {
                builder.compatibleWith(new Compatibility("xyz.rtrvr.pillo", "Pillo", null,
                    ApkFileType.APK, null, null, List.of(new AppTarget("0.6.20", false, null)), false));
                builder.extendWith(PilloWeightImportPatch::extensionStream);
                builder.execute(context -> {
                    if (!"xyz.rtrvr.pillo".equals(context.getPackageMetadata().getPackageName())
                        || !"0.6.20".equals(context.getPackageMetadata().getVersionName()))
                        throw unsupported("Expected original Pillo 0.6.20");
                    List<ClassDef> classes = new ArrayList<>();
                    context.classDefForEach(c -> { classes.add(c); return Unit.INSTANCE; });
                    validate(classes);
                    MutableMethod target = context.mutableClassDefBy(ACTIVITY).getMethods().stream()
                        .filter(m -> m.getName().equals("onCreate") && PilloHybridNotificationPatch.signature(m, "V", "Landroid/os/Bundle;"))
                        .findFirst().orElseThrow(() -> unsupported("Missing Add record onCreate"));
                    apply(target);
                    MutableMethod footer = context.mutableClassDefBy(FOOTER).getMethods().stream()
                        .filter(m -> m.getName().equals("invoke") && PilloHybridNotificationPatch.signature(m, "V", "Landroidx/compose/runtime/Composer;", "I"))
                        .findFirst().orElseThrow(() -> unsupported("Missing native weight footer"));
                    applyFooter(footer);
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static IllegalStateException unsupported(String reason) {
        return new IllegalStateException("Unsupported Pillo weight import bytecode: " + reason);
    }

    static void requireMethod(List<? extends ClassDef> classes, String owner, String name, String result, String... parameters) {
        long matches = classes.stream().filter(c -> owner.equals(c.getType())).flatMap(c -> {
            List<Method> methods = new ArrayList<>(); c.getMethods().forEach(methods::add); return methods.stream();
        }).filter(m -> name.equals(m.getName()) && PilloHybridNotificationPatch.signature(m, result, parameters)).count();
        if (matches != 1) throw unsupported("Missing or ambiguous " + owner + "->" + name);
    }

    static void validate(List<? extends ClassDef> classes) {
        String root = "Lxyz/rtrvr/pillo/";
        String vm = root + "ui/tracker/log/asneeded/LogTrackerEventAsNeededViewModel;";
        String type = root + "models/entities/tracker/TrackerType;";
        String record = root + "models/entities/tracker/type/weight/WeightTrackerRecord;";
        String repo = root + "domain/tracker/TrackerEventRepository;";
        String profile = root + "models/profile/UserProfile;";
        requireMethod(classes, root + "ui/components/box/RoundedSurfaceKt;", "RoundedSurfaceClickable-5n8i6Mc", "V",
            "Landroidx/compose/ui/Modifier;", "F", "Landroidx/compose/foundation/BorderStroke;", "J",
            "Landroidx/compose/foundation/layout/PaddingValues;", "Lkotlin/jvm/functions/Function0;",
            "Lkotlin/jvm/functions/Function3;", "Landroidx/compose/runtime/Composer;", "I", "I");
        requireMethod(classes, root + "ui/components/buttons/ButtonsKt$ButtonM$7;", "<init>", "V",
            "Z", "Lkotlin/jvm/functions/Function2;", "Ljava/lang/String;", "J");
        requireMethod(classes, root + "shared/designsystem/theme/PilloSemanticColorKt;", "getLocalSemanticColor",
            "Landroidx/compose/runtime/ProvidableCompositionLocal;");
        requireMethod(classes, root + "shared/designsystem/theme/PilloSemanticColor;", "getAccent-0d7_KjU", "J");
        requireMethod(classes, "Landroidx/compose/foundation/layout/SizeKt;", "height-3ABfNKs", "Landroidx/compose/ui/Modifier;",
            "Landroidx/compose/ui/Modifier;", "F");
        requireMethod(classes, "Landroidx/compose/foundation/layout/PaddingKt;", "PaddingValues-a9UjIt4",
            "Landroidx/compose/foundation/layout/PaddingValues;", "F", "F", "F", "F");
        requireMethod(classes, root + "ui/theme/PilloTheme;", "getColor", root + "shared/designsystem/theme/PilloColor;",
            "Landroidx/compose/runtime/Composer;", "I");
        requireMethod(classes, root + "shared/designsystem/theme/PilloColor;", "getPilloBlue-0d7_KjU", "J");
        requireMethod(classes, "Landroidx/compose/ui/graphics/Color$Companion;", "getWhite-0d7_KjU", "J");
        requireMethod(classes, "Landroidx/compose/ui/Alignment$Companion;", "getEnd", "Landroidx/compose/ui/Alignment$Horizontal;");
        requireMethod(classes, "Landroidx/compose/foundation/layout/PaddingKt;", "padding-qDBjuR0$default", "Landroidx/compose/ui/Modifier;",
            "Landroidx/compose/ui/Modifier;", "F", "F", "F", "F", "I", "Ljava/lang/Object;");
        requireMethod(classes, FOOTER, "invoke", "V", "Landroidx/compose/runtime/Composer;", "I");
        requireMethod(classes, BOTTOM, "LoggingBottomBar", "V", "Landroidx/compose/ui/Modifier;",
            "Lkotlin/jvm/functions/Function0;", "Lkotlin/jvm/functions/Function0;", "Z", "Z", "Ljava/lang/String;",
            "Landroidx/compose/runtime/Composer;", "I", "I");
        requireMethod(classes, root + "ui/components/buttons/ButtonsKt;", "ButtonM-vRFhKjU", "V",
            "Landroidx/compose/ui/Modifier;", "Z", "Ljava/lang/String;", "J", "J", "Lkotlin/jvm/functions/Function2;",
            "Lkotlin/jvm/functions/Function0;", "Landroidx/compose/runtime/Composer;", "I", "I");
        requireMethod(classes, root + "ui/components/layout/SpacedColumnKt;", "SpacedColumn-DzVHIIc", "V",
            "Landroidx/compose/ui/Modifier;", "F", "Landroidx/compose/ui/Alignment$Horizontal;", "Lkotlin/jvm/functions/Function3;",
            "Landroidx/compose/runtime/Composer;", "I", "I");
        requireMethod(classes, "Landroidx/compose/material/icons/rounded/AddKt;", "getAdd", "Landroidx/compose/ui/graphics/vector/ImageVector;",
            "Landroidx/compose/material/icons/Icons$Rounded;");
        requireMethod(classes, "Landroidx/compose/material3/IconKt;", "Icon-ww6aTOc", "V", "Landroidx/compose/ui/graphics/vector/ImageVector;",
            "Ljava/lang/String;", "Landroidx/compose/ui/Modifier;", "J", "Landroidx/compose/runtime/Composer;", "I", "I");
        requireMethod(classes, ACTIVITY, "onCreate", "V", "Landroid/os/Bundle;");
        requireMethod(classes, ACTIVITY, "getVm", vm);
        requireMethod(classes, vm, "getUserProfile", profile);
        requireMethod(classes, vm, "getTrackerType", type);
        requireMethod(classes, profile, "getUserProfileId", "Ljava/lang/String;");
        requireMethod(classes, root + "data/persistence/database/AppDatabaseManager$Companion;", "getInstance",
            root + "data/persistence/database/AppDatabaseManager;");
        requireMethod(classes, root + "data/persistence/database/AppDatabaseManager;", "getTrackerEventRepository", repo);
        requireMethod(classes, record, "<init>", "V", "F", "Ljava/lang/String;");
        requireMethod(classes, record, "getWeightLbs", "F");
        requireMethod(classes, EVENT, "getRecordedAtEpochSec", "Ljava/lang/Long;");
        requireMethod(classes, EVENT, "getWeightRecord", record);
        requireMethod(classes, repo, "findTrackedEventsByUserProfileIdAndTrackerType", "Lkotlinx/coroutines/flow/Flow;",
            "Ljava/lang/String;", type);
        requireMethod(classes, repo, "insertWithConstraint", "Ljava/lang/Object;", EVENT, "Lkotlin/coroutines/Continuation;");
        requireMethod(classes, EVENT, "<init>", "V", "J", "Ljava/lang/Long;", "Ljava/lang/String;", type,
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

    static void apply(MutableMethod target) {
        List<Instruction> instructions = PilloHybridNotificationPatch.instructions(target);
        if (instructions.stream().anyMatch(i -> PilloHybridNotificationPatch.calls(i, EXTENSION, "attach", "V", "Landroid/app/Activity;")))
            throw unsupported("Importer is already installed");
        int returns = 0, index = -1;
        for (int i = 0; i < instructions.size(); i++) if (instructions.get(i).getOpcode() == Opcode.RETURN_VOID) { returns++; index = i; }
        int activity = target.getImplementation().getRegisterCount() - 2;
        if (returns != 1 || index != instructions.size() - 1 || activity < 0 || activity > 15)
            throw unsupported("Add record onCreate layout changed");
        target.getImplementation().addInstruction(index, new BuilderInstruction35c(Opcode.INVOKE_STATIC,
            1, activity, 0, 0, 0, 0, new ImmutableMethodReference(EXTENSION, "attach", List.of("Landroid/app/Activity;"), "V")));
    }

    static InputStream extensionStream() {
        InputStream stream = PilloWeightImportPatch.class.getClassLoader().getResourceAsStream("extensions/pillo-weight-import.mpe");
        if (stream == null) throw new IllegalStateException("Missing bundled Pillo weight import extension");
        return stream;
    }
    static void applyFooter(MutableMethod target) {
        List<Instruction> instructions = PilloHybridNotificationPatch.instructions(target);
        int index = -1;
        for (int i = 0; i < instructions.size(); i++) {
            Instruction instruction = instructions.get(i);
            if (!(instruction instanceof ReferenceInstruction)) continue;
            String reference = ((ReferenceInstruction) instruction).getReference().toString();
            if (reference.startsWith(EXTENSION + "->footer(")) throw unsupported("Native import button is already installed");
            if (reference.startsWith(BOTTOM + "->LoggingBottomBar(")) {
                if (index != -1) throw unsupported("Ambiguous native weight footer");
                index = i;
            }
        }
        if (index < 0 || instructions.get(index).getOpcode() != Opcode.INVOKE_STATIC_RANGE)
            throw unsupported("Native weight footer layout changed");
        RegisterRangeInstruction call = (RegisterRangeInstruction) instructions.get(index);
        if (call.getRegisterCount() != 9) throw unsupported("Native weight footer arguments changed");
        target.getImplementation().replaceInstruction(index, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            call.getStartRegister(), 9, new ImmutableMethodReference(EXTENSION, "footer", List.of(
                "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;", "Z", "Z", "Ljava/lang/String;",
                "Ljava/lang/Object;", "I", "I"), "V")));
    }
}
