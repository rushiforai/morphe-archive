import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/** Find methods containing CHECK_CAST X ; INVOKE_VIRTUAL X->performClick()Z ; RETURN_VOID. */
public class ClickProbe {
    public static void main(String[] args) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
            for (Method m : cd.getMethods()) {
                if (m.getImplementation() == null) continue;
                List<Instruction> ins = new ArrayList<>();
                for (Instruction i : m.getImplementation().getInstructions()) ins.add(i);
                for (int k = 0; k + 2 < ins.size(); k++) {
                    if (ins.get(k).getOpcode() != Opcode.CHECK_CAST) continue;
                    String cast = ((TypeReference) ((ReferenceInstruction) ins.get(k)).getReference()).getType();
                    if (ins.get(k + 1).getOpcode() != Opcode.INVOKE_VIRTUAL) continue;
                    MethodReference mr = (MethodReference) ((ReferenceInstruction) ins.get(k + 1)).getReference();
                    if (!mr.getName().equals("performClick") || !mr.getDefiningClass().equals(cast)) continue;
                    if (ins.get(k + 2).getOpcode() != Opcode.RETURN_VOID) continue;
                    StringBuilder b = new StringBuilder(m.getName()).append('(');
                    for (var p : m.getParameterTypes()) b.append(p);
                    b.append(')').append(m.getReturnType());
                    System.out.println(cd.getType() + "  " + b + "  cast=" + cast + "  [" + d + "]");
                }
            }
        }
    }
}
