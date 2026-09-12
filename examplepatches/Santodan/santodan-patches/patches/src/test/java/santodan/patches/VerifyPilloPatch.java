package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;

/** Integration checks for the Pillo 0.6.19 alarm dispatcher. */
public final class VerifyPilloPatch {
    private static void require(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    private static DexBackedDexFile read(String path) throws IOException {
        try (InputStream in = new BufferedInputStream(new FileInputStream(path))) {
            return DexBackedDexFile.fromInputStream(null, in);
        }
    }

    private static void mustReject(List<ClassDef> classes, String reason) {
        try {
            PilloHybridNotificationPatch.findUnique(classes);
            throw new AssertionError("Did not reject " + reason);
        } catch (IllegalStateException expected) {
            require(expected.getMessage().startsWith("Unsupported Pillo bytecode:"), "Wrong rejection reason");
            System.out.println("PASS: rejects " + reason);
        }
    }

    public static void main(String[] args) throws Exception {
        DexBackedDexFile dex = read(args[0]);
        List<ClassDef> classes = new ArrayList<>(dex.getClasses());
        PilloHybridNotificationPatch.Match match = PilloHybridNotificationPatch.findUnique(classes);
        System.out.println("PASS: unique Pillo light-reminder decision: " + match.method);
        mustReject(Collections.emptyList(), "unrelated DEX");

        ClassDef original = classes.stream().filter(c -> c.getType().equals(PilloHybridNotificationPatch.TARGET))
            .findFirst().orElseThrow();
        List<ClassDef> duplicate = new ArrayList<>(classes);
        duplicate.add(original);
        mustReject(duplicate, "ambiguous dispatcher");

        MutableClass modified = new MutableClass(original);
        MutableMethod target = modified.getMethods().stream().filter(m -> m.equals(match.method)).findFirst().orElseThrow();
        List<Instruction> before = PilloHybridNotificationPatch.instructions(target);
        int registers = target.getImplementation().getRegisterCount();
        int oldUnits = before.get(match.predicateIndex).getCodeUnits()
            + before.get(match.predicateIndex + 1).getCodeUnits()
            + before.get(match.predicateIndex + 2).getCodeUnits();
        PilloHybridNotificationPatch.apply(target, match);
        List<Instruction> after = PilloHybridNotificationPatch.instructions(target);

        require(before.size() == after.size(), "Instruction count changed");
        require(registers == target.getImplementation().getRegisterCount(), "Register count changed");
        require(after.get(match.predicateIndex).getOpcode() == Opcode.SGET_OBJECT
            && ((ReferenceInstruction) after.get(match.predicateIndex)).getReference().toString().equals(
                PilloHybridNotificationPatch.POWER_UTIL + "->INSTANCE:" + PilloHybridNotificationPatch.POWER_UTIL),
            "PowerManagerUtil instance was not loaded");
        require(after.get(match.predicateIndex + 1).getOpcode() == Opcode.INVOKE_VIRTUAL
            && PilloHybridNotificationPatch.calls(after.get(match.predicateIndex + 1),
                PilloHybridNotificationPatch.POWER_UTIL, "isTrulyInteractive", "Z", "Landroid/content/Context;"),
            "Lock-aware instance predicate was not installed");
        require(after.get(match.predicateIndex + 2).getOpcode() == Opcode.MOVE_RESULT,
            "Predicate result was not captured");
        require(after.get(match.predicateIndex + 3).getOpcode() == Opcode.IF_NEZ,
            "Unlocked state does not select the banner route");
        int newUnits = after.get(match.predicateIndex).getCodeUnits()
            + after.get(match.predicateIndex + 1).getCodeUnits()
            + after.get(match.predicateIndex + 2).getCodeUnits();
        require(oldUnits == newUnits, "Replacement changed branch layout");
        for (int n = 0; n < before.size(); n++)
            if (n < match.predicateIndex || n > match.predicateIndex + 3)
                require(before.get(n) == after.get(n), "Unexpected mutation at " + n);
        System.out.println("PASS: only the predicate changed; registers and branch layout are preserved");

        classes.set(classes.indexOf(original), modified);
        mustReject(classes, "already-patched dispatcher");
        DexPool.writeTo(args[1], new ImmutableDexFile(dex.getOpcodes(), classes));
        DexBackedDexFile roundTrip = read(args[1]);
        int verified = 0;
        for (ClassDef c : roundTrip.getClasses()) if (c.getType().equals(PilloHybridNotificationPatch.TARGET))
            for (var method : c.getMethods()) if (method.equals(match.method)) {
                List<Instruction> ins = PilloHybridNotificationPatch.instructions(method);
                require(PilloHybridNotificationPatch.calls(ins.get(match.predicateIndex + 1),
                    PilloHybridNotificationPatch.POWER_UTIL, "isTrulyInteractive", "Z", "Landroid/content/Context;"),
                    "Patch lost in DEX round trip");
                verified++;
            }
        require(verified == 1, "Patched dispatcher missing from written DEX");
        System.out.println("PASS: DEX writes and reloads with hybrid routing intact");
    }
}
