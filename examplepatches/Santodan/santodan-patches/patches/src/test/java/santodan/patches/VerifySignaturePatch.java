package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;

/** Integration checks for the Peafowl signature-verification bypass on a real input DEX. */
public final class VerifySignaturePatch {
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
            PeafowlSignatureBypassPatch.findUnique(classes);
            throw new AssertionError("Did not reject " + reason);
        } catch (IllegalStateException expected) {
            require(expected.getMessage().startsWith("Unsupported Peafowl bytecode:"), "Wrong rejection reason");
            System.out.println("PASS: rejects " + reason);
        }
    }

    public static void main(String[] args) throws Exception {
        DexBackedDexFile dex = read(args[0]);
        List<ClassDef> classes = new ArrayList<>(dex.getClasses());
        PeafowlSignatureBypassPatch.Match match = PeafowlSignatureBypassPatch.findUnique(classes);
        System.out.println("PASS: unique signature verifier: " + match.method);

        mustReject(Collections.emptyList(), "unrelated APK");

        ClassDef original = classes.stream().filter(c -> c.getType().equals(match.method.getDefiningClass())).findFirst().orElseThrow();
        List<ClassDef> duplicate = new ArrayList<>(classes);
        duplicate.add(original);
        mustReject(duplicate, "ambiguous application class");

        // Corrupt the failure message so the verifier can no longer be fingerprinted.
        MutableClass wrong = new MutableClass(original);
        MutableMethod wrongMethod = wrong.getMethods().stream().filter(m -> m.equals(match.method)).findFirst().orElseThrow();
        List<Instruction> wrongIns = PeafowlSignatureBypassPatch.instructions(wrongMethod);
        int messageIndex = match.throwIndex - 2; // const-string MESSAGE
        int messageRegister = ((OneRegisterInstruction) wrongIns.get(messageIndex)).getRegisterA();
        wrongMethod.getImplementation().replaceInstruction(messageIndex,
            new BuilderInstruction21c(Opcode.CONST_STRING, messageRegister, new ImmutableStringReference("different")));
        List<ClassDef> wrongClasses = new ArrayList<>(classes);
        wrongClasses.set(wrongClasses.indexOf(original), wrong);
        mustReject(wrongClasses, "changed verifier fingerprint");

        MutableClass modified = new MutableClass(original);
        MutableMethod target = modified.getMethods().stream().filter(m -> m.equals(match.method)).findFirst().orElseThrow();
        List<Instruction> before = PeafowlSignatureBypassPatch.instructions(target);
        int registers = target.getImplementation().getRegisterCount();
        require(before.get(match.throwIndex).getOpcode() == Opcode.THROW, "Expected throw at the failure exit");
        require(before.get(0).getOpcode() == Opcode.INVOKE_SUPER, "Expected super.onCreate first");

        PeafowlSignatureBypassPatch.apply(target, match);
        List<Instruction> after = PeafowlSignatureBypassPatch.instructions(target);
        require(before.size() == after.size(), "Instruction count changed");
        require(registers == target.getImplementation().getRegisterCount(), "Register count changed");
        for (int n = 0; n < before.size(); n++) {
            if (n == match.throwIndex) {
                require(after.get(n).getOpcode() == Opcode.RETURN_VOID, "Failure exit must become return-void");
                require(before.get(n).getCodeUnits() == after.get(n).getCodeUnits(), "Instruction width changed");
            } else require(before.get(n) == after.get(n), "Unexpected mutation at " + n);
        }
        System.out.println("PASS: exactly one equal-width replacement (throw -> return-void); all else preserved");

        // The super.onCreate call and the whole verification body remain; only the
        // terminal throw is gone, so no SecurityException can escape onCreate.
        require(after.stream().noneMatch(i -> i.getOpcode() == Opcode.THROW), "A throw still remains in onCreate");
        System.out.println("PASS: no throw remains in the patched verifier");

        classes.set(classes.indexOf(original), modified);
        mustReject(classes, "already patched verifier");

        DexPool.writeTo(args[1], new ImmutableDexFile(dex.getOpcodes(), classes));
        DexBackedDexFile roundTrip = read(args[1]);
        require(roundTrip.getClasses().size() == dex.getClasses().size(), "Class count changed");
        int verified = 0;
        for (ClassDef c : roundTrip.getClasses()) if (c.getType().equals(original.getType()))
            for (Method m : c.getMethods()) if (m.equals(match.method)) {
                List<Instruction> ins = PeafowlSignatureBypassPatch.instructions(m);
                require(ins.get(match.throwIndex).getOpcode() == Opcode.RETURN_VOID, "Patch lost in DEX round trip");
                verified++;
            }
        require(verified == 1, "Patched method missing from written DEX");
        System.out.println("PASS: DEX writes/reloads with the neutralized verifier intact");
    }
}
