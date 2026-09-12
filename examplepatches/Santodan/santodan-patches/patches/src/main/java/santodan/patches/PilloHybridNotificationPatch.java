package santodan.patches;

import app.morphe.patcher.patch.BytecodePatch;
import app.morphe.patcher.patch.PatchKt;
import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.Compatibility;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.util.*;
import java.util.logging.Logger;
import kotlin.Unit;

/** Make Pillo's light/banner alarm mode use fullscreen only while the device is locked. */
public final class PilloHybridNotificationPatch {
    public static final String NAME = "Pillo - Hybrid Lock-Screen Notifications";
    static final String PACKAGE = "xyz.rtrvr.pillo";
    static final String VERSION = "0.6.19";
    static final String TARGET = "Lxyz/rtrvr/pillo/alarm/process/StartAlarmProcess;";
    static final String ACTIVITY_UTIL = "Lxyz/rtrvr/pillo/utils/ActivityUtil;";
    static final String POWER_UTIL = "Lxyz/rtrvr/pillo/utils/PowerManagerUtil;";
    private static final Logger LOG = Logger.getLogger("app.morphe.patches.santodan");

    private PilloHybridNotificationPatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static BytecodePatch getPilloHybridNotificationPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Use fullscreen alarms while the phone is locked and banner notifications while it is unlocked. Select Pillo's Banner/Light notification mode.",
            false, builder -> {
                builder.compatibleWith(new Compatibility(
                    PACKAGE,
                    "Pillo",
                    null,
                    ApkFileType.APK,
                    null,
                    null,
                    Collections.singletonList(new AppTarget(VERSION, false, null)),
                    false
                ));
                builder.execute(context -> {
                    if (!PACKAGE.equals(context.getPackageMetadata().getPackageName())
                        || !VERSION.equals(context.getPackageMetadata().getVersionName()))
                        throw unsupported("Expected " + PACKAGE + " " + VERSION);
                    List<ClassDef> classes = new ArrayList<>();
                    context.classDefForEach(c -> { classes.add(c); return Unit.INSTANCE; });
                    if (classes.stream().noneMatch(c -> POWER_UTIL.equals(c.getType())))
                        throw unsupported("Pillo's lock-aware PowerManagerUtil is missing");
                    Match match = findUnique(classes);
                    MutableMethod target = context.mutableClassDefBy(TARGET).getMethods().stream()
                        .filter(m -> m.equals(match.method)).findFirst()
                        .orElseThrow(() -> unsupported("Matched alarm dispatcher cannot be made mutable"));
                    apply(target, match);
                    LOG.info("SantoDan 0.2.2: Pillo hybrid routing uses its lock-aware utility instance; fullscreen while locked, banner while unlocked.");
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static final class Match {
        final Method method;
        final int predicateIndex;
        final int contextRegister;
        Match(Method method, int predicateIndex, int contextRegister) {
            this.method = method;
            this.predicateIndex = predicateIndex;
            this.contextRegister = contextRegister;
        }
    }

    static IllegalStateException unsupported(String reason) {
        return new IllegalStateException("Unsupported Pillo bytecode: " + reason
            + ". No fallback patch was applied. Use the original Pillo 0.6.19 APK.");
    }

    static List<Instruction> instructions(Method method) {
        List<Instruction> result = new ArrayList<>();
        if (method.getImplementation() != null)
            for (Instruction i : method.getImplementation().getInstructions()) result.add(i);
        return result;
    }

    static boolean signature(MethodReference m, String result, String... parameters) {
        if (!result.equals(m.getReturnType()) || m.getParameterTypes().size() != parameters.length) return false;
        for (int n = 0; n < parameters.length; n++)
            if (!parameters[n].contentEquals(m.getParameterTypes().get(n))) return false;
        return true;
    }

    static boolean calls(Instruction instruction, String owner, String name, String result, String... parameters) {
        if (!(instruction instanceof ReferenceInstruction)) return false;
        Object reference = ((ReferenceInstruction) instruction).getReference();
        if (!(reference instanceof MethodReference)) return false;
        MethodReference method = (MethodReference) reference;
        return owner.equals(method.getDefiningClass()) && name.equals(method.getName())
            && signature(method, result, parameters);
    }

    static Match findUnique(List<? extends ClassDef> classes) {
        List<Match> matches = new ArrayList<>();
        for (ClassDef c : classes) {
            if (!TARGET.equals(c.getType())) continue;
            for (Method method : c.getMethods()) {
                if (!"invoke".equals(method.getName()) || !signature(method, "Ljava/lang/Object;",
                    "Landroid/content/Context;", "Ljava/lang/String;", "Lxyz/rtrvr/pillo/alarm/intent/Alarm;",
                    "Ljava/lang/String;", "Lkotlin/coroutines/Continuation;")) continue;
                List<Instruction> ins = instructions(method);
                for (int n = 0; n + 20 < ins.size(); n++) {
                    if (ins.get(n).getOpcode() != Opcode.SGET_OBJECT
                        || !(ins.get(n) instanceof ReferenceInstruction)
                        || !((ReferenceInstruction) ins.get(n)).getReference().toString()
                            .equals(ACTIVITY_UTIL + "->INSTANCE:" + ACTIVITY_UTIL)
                        || !calls(ins.get(n + 1), ACTIVITY_UTIL, "isAppForegrounded", "Z")
                        || ins.get(n + 2).getOpcode() != Opcode.MOVE_RESULT
                        || ins.get(n + 3).getOpcode() != Opcode.IF_EQZ) continue;
                    int resultRegister = ((OneRegisterInstruction) ins.get(n + 2)).getRegisterA();
                    if (((OneRegisterInstruction) ins.get(n + 3)).getRegisterA() != resultRegister) continue;
                    int contextRegister = -1;
                    boolean hasLightRoute = false;
                    for (int k = n + 4; k < Math.min(ins.size(), n + 40); k++) {
                        if (calls(ins.get(k), "Lxyz/rtrvr/pillo/alarm/process/StartFullScreenAlarmProcess;", "invoke",
                            "Ljava/lang/Object;", "Landroid/content/Context;", "Ljava/lang/String;", "Z",
                            "Ljava/util/List;", "Ljava/util/List;", "Ljava/lang/String;",
                            "Lxyz/rtrvr/pillo/alarm/interrupt/InterruptMethod;", "Lkotlin/coroutines/Continuation;")
                            && ins.get(k) instanceof RegisterRangeInstruction)
                            contextRegister = ((RegisterRangeInstruction) ins.get(k)).getStartRegister() + 1;
                        if (calls(ins.get(k), "Lxyz/rtrvr/pillo/alarm/process/StartLightReminderNotificationAlarmProcess;",
                            "invoke", "V", "Landroid/content/Context;", "Ljava/util/List;", "Ljava/util/List;"))
                            hasLightRoute = true;
                    }
                    if (contextRegister >= 0 && contextRegister <= 15 && resultRegister <= 15 && hasLightRoute)
                        matches.add(new Match(method, n, contextRegister));
                }
            }
        }
        if (matches.size() != 1)
            throw unsupported("Expected exactly one light-reminder foreground decision; found " + matches.size());
        return matches.get(0);
    }

    static void apply(MutableMethod target, Match match) {
        List<Instruction> before = instructions(target);
        if (!calls(before.get(match.predicateIndex + 1), ACTIVITY_UTIL, "isAppForegrounded", "Z"))
            throw unsupported("Alarm decision changed before patch execution");
        int resultRegister = ((OneRegisterInstruction) before.get(match.predicateIndex + 2)).getRegisterA();
        if (!(before.get(match.predicateIndex + 3) instanceof BuilderOffsetInstruction))
            throw unsupported("Alarm decision branch is not mutable");
        // Retain the original six code units and invoke Pillo's Kotlin object correctly:
        // SGET PowerManagerUtil.INSTANCE, then INVOKE_VIRTUAL with instance + Context.
        // isTrulyInteractive is true only while unlocked, so IF_NEZ selects the banner route;
        // false (screen off or keyguard locked) falls through to the full fullscreen workflow.
        target.getImplementation().replaceInstruction(match.predicateIndex,
            new BuilderInstruction21c(Opcode.SGET_OBJECT, resultRegister,
                new ImmutableFieldReference(POWER_UTIL, "INSTANCE", POWER_UTIL)));
        target.getImplementation().replaceInstruction(match.predicateIndex + 1,
            new BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 2, resultRegister, match.contextRegister, 0, 0, 0,
                new ImmutableMethodReference(POWER_UTIL, "isTrulyInteractive",
                    Collections.singletonList("Landroid/content/Context;"), "Z")));
        target.getImplementation().replaceInstruction(match.predicateIndex + 3,
            new BuilderInstruction21t(Opcode.IF_NEZ, resultRegister,
                ((BuilderOffsetInstruction) before.get(match.predicateIndex + 3)).getTarget()));
    }
}
