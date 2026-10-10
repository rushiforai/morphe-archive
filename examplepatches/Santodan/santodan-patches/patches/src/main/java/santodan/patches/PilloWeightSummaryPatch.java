package santodan.patches;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.util.*;
import kotlin.Unit;

public final class PilloWeightSummaryPatch {
    public static final String NAME = "Pillo - Weight change summaries";
    static final String EXT = "Lsoftware/santodan/extension/pillosummary/PilloWeightSummary;";
    static final String VM = "Lxyz/rtrvr/pillo/ui/report/tracker/components/weight/WeightChartViewModel;";
    static final String CONTENT = "Lxyz/rtrvr/pillo/ui/report/tracker/components/weight/WeightChartContentKt;";
    static final String CARD = "Lxyz/rtrvr/pillo/ui/tracker/common/components/weight/WeightLineChartKt$WeightLineChart$2$1;";
    static final String FILTER = "Lxyz/rtrvr/pillo/ui/report/tracker/components/filter/";
    private PilloWeightSummaryPatch() {}

    public static BytecodePatch getPilloWeightSummaryPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Adds signed Total weight change, an All default filter, a selectable Last since date, and Last 30 days / Last 15 days / Change summaries using full profile history.",
            false, builder -> {
                builder.compatibleWith(new Compatibility("xyz.rtrvr.pillo", "Pillo", null, ApkFileType.APK,
                    null, null, List.of(new AppTarget("0.6.20", false, null)), false));
                builder.extendWith(() -> {
                    var stream = PilloWeightSummaryPatch.class.getClassLoader().getResourceAsStream("extensions/pillo-weight-summary.mpe");
                    if (stream == null) throw new IllegalStateException("Missing Pillo weight summary extension");
                    return stream;
                });
                builder.execute(context -> {
                    if (!"xyz.rtrvr.pillo".equals(context.getPackageMetadata().getPackageName())
                        || !"0.6.20".equals(context.getPackageMetadata().getVersionName()))
                        throw new IllegalStateException("Expected Pillo 0.6.20");
                    var vm = context.mutableClassDefBy(VM);
                    defaultAll(vm.getMethods().stream().filter(m -> m.getName().equals("<init>")).findFirst().orElseThrow());
                    redirect(vm.getMethods().stream().filter(m -> m.getName().equals("loadWeightRecordData")).findFirst().orElseThrow(),
                        "Lkotlin/collections/CollectionsKt;", "takeLast", "takeLast");
                    var content = context.mutableClassDefBy(CONTENT);
                    redirect(content.getMethods().stream().filter(m -> m.getName().equals("WeightChartContent")).findFirst().orElseThrow(),
                        FILTER + "ChooseTakeLastLayoutKt;", "rememberChooseTakeLastLayout", "rememberFilter");
                    var button = context.mutableClassDefBy(CONTENT.substring(0, CONTENT.length() - 1) + "$WeightChartContent$3$1;");
                    redirect(button.getMethods().stream().filter(m -> PilloHybridNotificationPatch.signature(m, "V",
                        "Landroidx/compose/foundation/layout/RowScope;", "Landroidx/compose/runtime/Composer;", "I")).findFirst().orElseThrow(),
                        FILTER + "TakeLastFilterBtnKt;", "TakeLastFilterBtn", "filterButton");
                    var card = context.mutableClassDefBy(CARD);
                    redirect(card.getMethods().stream().filter(m -> PilloHybridNotificationPatch.signature(m, "Ljava/lang/Object;",
                        "Ljava/lang/Object;", "Ljava/lang/Object;")).findFirst().orElseThrow(), CARD, "invoke", "render");
                    var render = card.getMethods().stream().filter(m -> PilloHybridNotificationPatch.signature(m, "V",
                        "Landroidx/compose/runtime/Composer;", "I")).findFirst().orElseThrow();
                    redirect(render, "Lxyz/rtrvr/pillo/ui/report/tracker/components/aggregate/LatestValueDisplayKt;", "LatestValueDisplay", "latest");
                    redirect(render, "Lxyz/rtrvr/pillo/ui/report/tracker/components/aggregate/AvgMinMaxRowKt;", "AvgMinMaxRow", "averages");
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }
    static void defaultAll(MutableMethod method) {
        var instructions = PilloHybridNotificationPatch.instructions(method);
        int matches = 0;
        for (int i = 0; i < instructions.size() - 1; i++) {
            var instruction = instructions.get(i);
            if (instruction instanceof NarrowLiteralInstruction
                && ((NarrowLiteralInstruction) instruction).getNarrowLiteral() == 5
                && PilloHybridNotificationPatch.calls(instructions.get(i + 1), "Ljava/lang/Integer;", "valueOf", "Ljava/lang/Integer;", "I")) {
                method.getImplementation().replaceInstruction(i, new BuilderInstruction31i(Opcode.CONST,
                    ((OneRegisterInstruction) instruction).getRegisterA(), Integer.MAX_VALUE));
                matches++;
            }
        }
        if (matches != 1) throw new IllegalStateException("Weight default filter changed or already patched");
    }
    static void redirect(MutableMethod method, String owner, String name, String replacement) {
        var instructions = PilloHybridNotificationPatch.instructions(method);
        int matches = 0;
        for (int i = 0; i < instructions.size(); i++) {
            var instruction = instructions.get(i);
            if (!(instruction instanceof ReferenceInstruction)) continue;
            var reference = ((ReferenceInstruction) instruction).getReference();
            if (!(reference instanceof MethodReference)) continue;
            var target = (MethodReference) reference;
            if (!target.getDefiningClass().equals(owner) || !target.getName().equals(name)) continue;
            List<String> parameters = new ArrayList<>();
            if (instruction.getOpcode() == Opcode.INVOKE_VIRTUAL) parameters.add("Ljava/lang/Object;");
            target.getParameterTypes().forEach(t -> parameters.add(t.toString().startsWith("L")
                && !t.toString().equals("Ljava/lang/String;") && !t.toString().equals("Ljava/util/List;") ? "Ljava/lang/Object;" : t.toString()));
            String result = replacement.equals("rememberFilter") ? "Ljava/lang/Object;" : target.getReturnType();
            var redirected = new ImmutableMethodReference(EXT, replacement, parameters, result);
            if (instruction instanceof RegisterRangeInstruction) {
                var call = (RegisterRangeInstruction) instruction;
                method.getImplementation().replaceInstruction(i, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                    call.getStartRegister(), call.getRegisterCount(), redirected));
            } else {
                var call = (FiveRegisterInstruction) instruction;
                method.getImplementation().replaceInstruction(i, new BuilderInstruction35c(Opcode.INVOKE_STATIC,
                    call.getRegisterCount(), call.getRegisterC(), call.getRegisterD(), call.getRegisterE(), call.getRegisterF(), call.getRegisterG(), redirected));
            }
            // The native controller is returned as Object by the reflection-based extension.
            if (replacement.equals("rememberFilter")) {
                int register = ((OneRegisterInstruction) instructions.get(i + 1)).getRegisterA();
                method.getImplementation().addInstruction(i + 2, new BuilderInstruction21c(Opcode.CHECK_CAST, register,
                    new com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference(target.getReturnType())));
            }
            matches++;
        }
        if (matches != 1) throw new IllegalStateException("Missing or ambiguous weight hook: " + owner + "->" + name);
    }
}
