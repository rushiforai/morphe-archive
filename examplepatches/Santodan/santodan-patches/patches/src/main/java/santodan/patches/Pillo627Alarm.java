package santodan.patches;

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

/** Make Pillo's light/banner alarm mode use fullscreen only while the device is locked. */
final class Pillo627Alarm {
    static final String TARGET = "Lxyz/rtrvr/pillo/ui/alarm/process/StartAlarmProcess;";
    static final String ACTIVITY_UTIL = "Lxyz/rtrvr/pillo/shared/android/ActivityUtil;";
    static final String POWER_UTIL = "Lxyz/rtrvr/pillo/shared/android/PowerManagerUtil;";

    private Pillo627Alarm() {}

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
            + ". No fallback patch was applied. Use the original Pillo 0.6.27 app bundle.");
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
                    "Landroid/content/Context;", "Ljava/lang/String;", "Lxyz/rtrvr/pillo/models/alarm/Alarm;",
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
                    int address = 0;
                    for (int k = 0; k < n + 3; k++) address += ins.get(k).getCodeUnits();
                    int branchTarget = address + ((OffsetInstruction)ins.get(n + 3)).getCodeOffset();
                    int lightIndex = -1;
                    address = 0;
                    for (int k = 0; k < ins.size(); k++) {
                        if (address == branchTarget) { lightIndex = k; break; }
                        address += ins.get(k).getCodeUnits();
                    }
                    if (lightIndex <= n + 4 || lightIndex > n + 48) continue;
                    int contextRegister = -1;
                    boolean hasLightRoute = false;
                    int fullscreenCalls = 0;
                    for (int k = n + 4; k < lightIndex; k++) {
                        if (calls(ins.get(k), "Lxyz/rtrvr/pillo/ui/alarm/process/StartFullScreenAlarmProcess;", "invoke",
                            "Ljava/lang/Object;", "Landroid/content/Context;", "Ljava/lang/String;", "Z",
                            "Ljava/util/List;", "Ljava/util/List;", "Ljava/lang/String;",
                            "Lxyz/rtrvr/pillo/data/alarm/interrupt/InterruptMethod;", "Lkotlin/coroutines/Continuation;")
                            && ins.get(k) instanceof RegisterRangeInstruction) {
                            contextRegister = ((RegisterRangeInstruction) ins.get(k)).getStartRegister() + 1;
                            fullscreenCalls++;
                        }
                    }
                    for (int k = lightIndex; k < Math.min(ins.size(), lightIndex + 8); k++) {
                        if (calls(ins.get(k), "Lxyz/rtrvr/pillo/ui/alarm/process/StartLightReminderNotificationAlarmProcess;",
                            "invoke", "V", "Landroid/content/Context;", "Ljava/util/List;", "Ljava/util/List;")
                            && ins.get(k) instanceof FiveRegisterInstruction
                            && ((FiveRegisterInstruction)ins.get(k)).getRegisterD() == contextRegister)
                            hasLightRoute = true;
                    }
                    if (fullscreenCalls == 1 && contextRegister >= 0 && contextRegister <= 15 && resultRegister <= 15 && hasLightRoute)
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
