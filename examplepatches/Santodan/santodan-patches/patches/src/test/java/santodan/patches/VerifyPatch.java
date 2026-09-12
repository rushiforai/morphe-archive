package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;

/** Integration checks on the supplied original DEX, including the failed-preflight regression. */
public final class VerifyPatch {
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
            PeafowlThemeOwnershipPatch.findUnique(classes);
            throw new AssertionError("Did not reject " + reason);
        } catch (IllegalStateException expected) {
            require(expected.getMessage().startsWith("Unsupported Peafowl bytecode:"), "Wrong rejection reason");
            System.out.println("PASS: rejects " + reason);
        }
    }

    // Interpret the actual four-instruction decision to verify both SKU cases. No
    // networking is mocked as successful: the offerings path must be unreachable.
    private static void checkRoute(List<Instruction> ins, PeafowlThemeOwnershipPatch.Match match,
                                   boolean originalFree, boolean expectedFree) {
        int[] regs = new int[256];
        Instruction result = ins.get(match.resultIndex);
        int resultRegister = ((OneRegisterInstruction) result).getRegisterA();
        regs[resultRegister] = result.getOpcode() == Opcode.MOVE_RESULT ? (originalFree ? 1 : 0)
            : ((NarrowLiteralInstruction) result).getNarrowLiteral();
        TwoRegisterInstruction xor = (TwoRegisterInstruction) ins.get(match.resultIndex + 1);
        regs[xor.getRegisterA()] = regs[xor.getRegisterB()]
            ^ ((NarrowLiteralInstruction) xor).getNarrowLiteral();
        TwoRegisterInstruction store = (TwoRegisterInstruction) ins.get(match.resultIndex + 2);
        boolean paidFlag = regs[store.getRegisterA()] != 0;
        int branch = match.resultIndex + 3;
        boolean taken = regs[((OneRegisterInstruction) ins.get(branch)).getRegisterA()] != 0;
        int next = taken ? PeafowlThemeOwnershipPatch.branchTarget(ins, branch) : branch + 1;
        require(taken == expectedFree && paidFlag != expectedFree, "Incorrect theme classification");
        if (expectedFree) {
            require(next == match.freeIndex && next > match.offeringsIndex, "Billing preflight remains reachable");
            require(PeafowlThemeOwnershipPatch.calls(ins.get(next + 4), "Landroid/os/Handler;",
                "post", "Z", "Ljava/lang/Runnable;"), "Native asynchronous theme setup lost");
        } else require(next < match.offeringsIndex, "Original paid path unexpectedly absent");
    }

    public static void main(String[] args) throws Exception {
        DexBackedDexFile dex = read(args[0]);
        List<ClassDef> classes = new ArrayList<>(dex.getClasses());
        PeafowlThemeOwnershipPatch.Match match = PeafowlThemeOwnershipPatch.findUnique(classes);
        System.out.println("PASS: unique theme initialization: " + match.method);
        mustReject(Collections.emptyList(), "unrelated APK");
        ClassDef original = classes.stream().filter(c -> c.getType().equals(match.method.getDefiningClass())).findFirst().orElseThrow();
        List<ClassDef> duplicate = new ArrayList<>(classes);
        duplicate.add(original);
        mustReject(duplicate, "ambiguous initialization");

        MutableClass wrongLiteral = new MutableClass(original);
        MutableMethod wrongMethod = wrongLiteral.getMethods().stream().filter(m -> m.equals(match.method)).findFirst().orElseThrow();
        int literalIndex = match.resultIndex - 2;
        int literalRegister = ((OneRegisterInstruction) PeafowlThemeOwnershipPatch.instructions(wrongMethod).get(literalIndex)).getRegisterA();
        wrongMethod.getImplementation().replaceInstruction(literalIndex,
            new BuilderInstruction21c(Opcode.CONST_STRING, literalRegister, new ImmutableStringReference("different")));
        List<ClassDef> wrongClasses = new ArrayList<>(classes);
        wrongClasses.set(wrongClasses.indexOf(original), wrongLiteral);
        mustReject(wrongClasses, "changed classification fingerprint");

        MutableClass modified = new MutableClass(original);
        MutableMethod target = modified.getMethods().stream().filter(m -> m.equals(match.method)).findFirst().orElseThrow();
        List<Instruction> before = PeafowlThemeOwnershipPatch.instructions(target);
        int registers = target.getImplementation().getRegisterCount();
        checkRoute(before, match, false, false);
        checkRoute(before, match, true, true);
        PeafowlThemeOwnershipPatch.apply(target, match);
        List<Instruction> after = PeafowlThemeOwnershipPatch.instructions(target);
        require(before.size() == after.size(), "Instruction count changed");
        require(registers == target.getImplementation().getRegisterCount(), "Register count changed");
        for (int n = 0; n < before.size(); n++) {
            if (n == match.resultIndex) {
                require(after.get(n).getOpcode() == Opcode.CONST_4, "Expected boolean constant");
                require(((NarrowLiteralInstruction) after.get(n)).getNarrowLiteral() == 1, "Free-theme result must be true");
                require(((OneRegisterInstruction) before.get(n)).getRegisterA()
                    == ((OneRegisterInstruction) after.get(n)).getRegisterA(), "Destination register changed");
                require(before.get(n).getCodeUnits() == after.get(n).getCodeUnits(), "Instruction width changed");
            } else require(before.get(n) == after.get(n), "Unexpected mutation at " + n);
        }
        System.out.println("PASS: exactly one equal-width replacement; registers and all other instructions preserved");
        checkRoute(after, match, false, true);
        checkRoute(after, match, true, true);
        System.out.println("PASS: paid and free themes skip the billing preflight and retain native Handler.post setup");
        classes.set(classes.indexOf(original), modified);
        mustReject(classes, "already patched initialization");
        DexPool.writeTo(args[1], new ImmutableDexFile(dex.getOpcodes(), classes));
        DexBackedDexFile roundTrip = read(args[1]);
        require(roundTrip.getClasses().size() == dex.getClasses().size(), "Class count changed");
        int verified = 0;
        for (ClassDef c : roundTrip.getClasses()) if (c.getType().equals(original.getType()))
            for (Method m : c.getMethods()) if (m.equals(match.method)) {
                List<Instruction> ins = PeafowlThemeOwnershipPatch.instructions(m);
                require(ins.get(match.resultIndex).getOpcode() == Opcode.CONST_4, "Patch lost in DEX round trip");
                checkRoute(ins, match, false, true);
                verified++;
            }
        require(verified == 1, "Patched method missing from written DEX");
        System.out.println("PASS: DEX writes/reloads with the corrected branch intact");
    }
}
