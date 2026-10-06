import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.io.File;
import java.util.*;

/** Usage: original.apk patched.apk adapterDescriptor. Uses Morphe Desktop's classpath. */
public class VerifyLegacyAdAdapter {
    static List<Instruction> read(String apk, String owner) throws Exception {
        var dex = DexFileFactory.loadDexContainer(new File(apk), Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) {
            for (ClassDef cls : dex.getEntry(entry).getDexFile().getClasses()) {
                if (!cls.getType().equals(owner)) continue;
                for (Method method : cls.getMethods()) {
                    if (!method.getName().equals("getView")) continue;
                    var result = new ArrayList<Instruction>();
                    method.getImplementation().getInstructions().forEach(result::add);
                    return result;
                }
            }
        }
        throw new AssertionError("Adapter not found: " + owner);
    }
    static String reference(Instruction instruction) {
        return instruction instanceof ReferenceInstruction r ? r.getReference().toString() : "";
    }
    static List<String> assertions(List<Instruction> instructions) {
        var result = new ArrayList<String>();
        for (Instruction i : instructions) {
            if (i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference m
                    && m.getParameterTypes().toString().equals("[Ljava/lang/Object;, Ljava/lang/String;]")) {
                result.add(m + ":message=v" + ((FiveRegisterInstruction) i).getRegisterD());
            }
        }
        return result;
    }
    public static void main(String[] args) throws Exception {
        var original = read(args[0], args[2]);
        var patched = read(args[1], args[2]);
        if (!assertions(original).equals(assertions(patched)))
            throw new AssertionError("Null assertions changed: " + assertions(original) + " -> " + assertions(patched));
        int hooks = 0;
        for (int i = 0; i < patched.size(); i++) {
            if (!reference(patched.get(i)).contains("->hideLegacyThreadListAd(")) continue;
            hooks++;
            var call = (FiveRegisterInstruction) patched.get(i);
            var next = patched.get(i + 1);
            if (next.getOpcode() != Opcode.MOVE_OBJECT_FROM16
                    || ((TwoRegisterInstruction) next).getRegisterB() != call.getRegisterC())
                throw new AssertionError("Ad hook does not preserve returned View");
            int restored = ((TwoRegisterInstruction) next).getRegisterA();
            int returnIndex = i + 2;
            while (returnIndex < patched.size() && patched.get(returnIndex).getOpcode() != Opcode.RETURN_OBJECT) returnIndex++;
            if (returnIndex == patched.size()
                    || ((OneRegisterInstruction) patched.get(returnIndex)).getRegisterA() != restored)
                throw new AssertionError("Original View register not restored");
            if (call.getRegisterC() != call.getRegisterD() + 2
                    || call.getRegisterE() != call.getRegisterD() + 1)
                throw new AssertionError("Ad hook lost original adapter or position");
        }
        if (hooks != 1) throw new AssertionError("Expected one ad hook, got " + hooks);
        if (args[2].contains("m9ExternalSyntheticLambda1")
                && patched.stream().noneMatch(i -> reference(i).contains("->prepareLegacyFilterRow(")))
            throw new AssertionError("191 quick-filter hook was lost");
        System.out.println("PASS " + args[2] + ": original assertions and returned View preserved");
    }
}
