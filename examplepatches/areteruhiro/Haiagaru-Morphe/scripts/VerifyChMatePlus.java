import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/** Run with the Morphe Desktop all.jar on the classpath, followed by
 * original191.apk patched191.apk original243.apk patched243.apk. */
public class VerifyChMatePlus {
    static List<Instruction> instructions(String apk, String owner, String name) throws Exception {
        var container = DexFileFactory.loadDexContainer(new File(apk), Opcodes.getDefault());
        for (String entry : container.getDexEntryNames()) {
            for (ClassDef cls : container.getEntry(entry).getDexFile().getClasses()) {
                if (!cls.getType().equals(owner)) continue;
                for (Method method : cls.getMethods()) {
                    if (method.getName().equals(name) && method.getReturnType().equals("V")
                            && method.getParameterTypes().size() == 1) {
                        var result = new ArrayList<Instruction>();
                        method.getImplementation().getInstructions().forEach(result::add);
                        return result;
                    }
                }
            }
        }
        throw new AssertionError("Missing method: " + owner + "->" + name);
    }

    static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    static String signature(Instruction i) {
        return i.getOpcode() + (i instanceof ReferenceInstruction r
                ? ":" + r.getReference() : "");
    }

    public static void main(String[] args) throws Exception {
        check(args.length == 4, "Expected original and patched APKs for 191 and 243");
        var before = instructions(args[0], "Lo/m9ExternalSyntheticLambda1;", "c");
        var after = instructions(args[1], "Lo/m9ExternalSyntheticLambda1;", "c");
        check(before.size() == after.size(), "191 instruction count changed");
        var gates = new HashSet<Integer>();
        for (int i = 1; i < before.size(); i++) {
            if (before.get(i) instanceof ReferenceInstruction r
                    && r.getReference() instanceof FieldReference f
                    && f.getDefiningClass().equals("Ljp/syoboi/a2chMate/Prefs;")
                    && Set.of("b", "A").contains(f.getName())
                    && f.getType().equals("Lo/m1b$read;")) {
                check(before.get(i - 1).getOpcode() == Opcode.IF_EQZ, "Missing original gate");
                check(after.get(i - 1).getOpcode() == Opcode.NOP, "Gate still active");
                check(after.get(i + 3).getOpcode() == Opcode.IF_EQZ, "Preference OFF branch lost");
                gates.add(i - 1);
            }
        }
        check(gates.size() == 2, "Expected troll and copy-paste 2 gates");
        for (int i = 0; i < before.size(); i++) {
            if (!gates.contains(i)) check(signature(before.get(i)).equals(signature(after.get(i))),
                    "Unrelated 191 filter instruction changed at " + i);
        }
        before = instructions(args[2], "Lo/zzbso;", "d");
        after = instructions(args[3], "Lo/zzbso;", "d");
        check(before.size() == after.size(), "243 instruction count changed");
        for (int i = 0; i < before.size(); i++) {
            check(signature(before.get(i)).equals(signature(after.get(i))),
                    "Stock 243 detector registration changed at " + i);
        }
        System.out.println("PASS: 191 both gates removed, OFF branches retained; 243 stock filter registration retained.");
    }
}
