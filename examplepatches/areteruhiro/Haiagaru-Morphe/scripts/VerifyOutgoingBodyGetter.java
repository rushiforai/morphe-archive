import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/** Check the pinned body getters without changing its native instructions or registers. */
public final class VerifyOutgoingBodyGetter {
    static Method body(String apk, String version) throws Exception {
        var dex = DexFileFactory.loadDexContainer(new File(apk), Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames())
            for (ClassDef type : dex.getEntry(entry).getDexFile().getClasses())
                if (type.getType().equals(version.equals("191") ? "Lo/p9ExternalSyntheticLambda6;" : "Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;"))
                    for (Method method : type.getMethods())
                        if (method.getName().equals(version.equals("191") ? "i" : version.equals("226") ? "j" : "f") && method.getParameterTypes().isEmpty()
                                && method.getReturnType().equals("Ljava/lang/String;")) return method;
        throw new AssertionError("Missing pinned body getter");
    }
    static List<Instruction> instructions(Method method) {
        List<Instruction> result = new ArrayList<>();
        method.getImplementation().getInstructions().forEach(result::add);
        return result;
    }
    static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
    public static void main(String[] args) throws Exception {
        String version = args[2];
        Method original = body(args[0], version), patched = body(args[1], version);
        check(original.getImplementation().getRegisterCount() == patched.getImplementation().getRegisterCount(), "Register count changed");
        check(original.getImplementation().getTryBlocks().size() == patched.getImplementation().getTryBlocks().size(), "Try blocks changed");
        List<Instruction> nativeCode = instructions(original), code = instructions(patched), retained = new ArrayList<>();
        Map<Integer,Instruction> addresses = new HashMap<>();
        int address = 0;
        for (Instruction instruction : code) { addresses.put(address, instruction); address += instruction.getCodeUnits(); }
        address = 0;
        for (Instruction instruction : code) {
            if (instruction instanceof OffsetInstruction branch) {
                Instruction target = addresses.get(address + branch.getCodeOffset());
                check(target == null || target.getOpcode() != Opcode.RETURN_OBJECT, "Native branch bypasses cleanup at return");
            }
            address += instruction.getCodeUnits();
        }
        int hooks = 0, returns = 0;
        for (int n = 0; n < code.size(); n++) {
            Instruction instruction = code.get(n);
            if (instruction instanceof ReferenceInstruction ref && ref.getReference() instanceof MethodReference call
                    && call.getDefiningClass().equals("Lapp/morphe/extension/chmate/Haiagaru;")
                    && call.getName().equals("cleanOutgoingBody")) {
                check(instruction instanceof RegisterRangeInstruction, "Hook must use range form");
                int register = ((RegisterRangeInstruction) instruction).getStartRegister();
                check(((RegisterRangeInstruction) instruction).getRegisterCount() == 1, "Hook argument count");
                check(code.get(n + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                        && ((OneRegisterInstruction) code.get(n + 1)).getRegisterA() == register, "Hook result register");
                check(code.get(n + 2).getOpcode() == Opcode.RETURN_OBJECT
                        && ((OneRegisterInstruction) code.get(n + 2)).getRegisterA() == register, "Hook must clean returned body");
                hooks++; n++; continue;
            }
            if (instruction.getOpcode() == Opcode.RETURN_OBJECT) returns++;
            retained.add(instruction);
        }
        check(hooks == returns && hooks > 0, "Every return must be cleaned");
        check(retained.size() == nativeCode.size(), "Native instruction count changed");
        for (int n = 0; n < nativeCode.size(); n++) {
            Instruction before = nativeCode.get(n), after = retained.get(n);
            check(before.getOpcode() == after.getOpcode(), "Native opcode changed at " + n);
            if (before instanceof ReferenceInstruction a && after instanceof ReferenceInstruction b)
                check(a.getReference().toString().equals(b.getReference().toString()), "Native reference changed at " + n);
            if (before instanceof OneRegisterInstruction a && after instanceof OneRegisterInstruction b)
                check(a.getRegisterA() == b.getRegisterA(), "Native destination changed at " + n);
            if (before instanceof TwoRegisterInstruction a && after instanceof TwoRegisterInstruction b)
                check(a.getRegisterB() == b.getRegisterB(), "Native source changed at " + n);
        }
        System.out.println("PASS " + version + " outgoing getter: " + hooks + " returns cleaned; native instructions/registers/try blocks retained");
    }
}
