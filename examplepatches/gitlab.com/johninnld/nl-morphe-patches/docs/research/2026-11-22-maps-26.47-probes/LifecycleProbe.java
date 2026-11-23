import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/** Find a no-arg void method whose body is: const 1 ; iput-boolean this.O ; return-void. */
public class LifecycleProbe {
    public static void main(String[] args) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
            for (Method m : cd.getMethods()) {
                if (m.getImplementation() == null) continue;
                if (m.getParameterTypes().size() != 0 || !m.getReturnType().equals("V")) continue;
                List<Instruction> ins = new ArrayList<>();
                for (Instruction i : m.getImplementation().getInstructions()) ins.add(i);
                for (int k = 0; k + 2 < ins.size(); k++) {
                    Instruction a = ins.get(k), b = ins.get(k + 1), r = ins.get(k + 2);
                    boolean c1 = (a.getOpcode() == Opcode.CONST_4 || a.getOpcode() == Opcode.CONST_16 || a.getOpcode() == Opcode.CONST)
                        && a instanceof WideLiteralInstruction && ((WideLiteralInstruction) a).getWideLiteral() == 1;
                    if (!c1) continue;
                    if (b.getOpcode() != Opcode.IPUT_BOOLEAN) continue;
                    FieldReference f = (FieldReference) ((ReferenceInstruction) b).getReference();
                    if (!f.getName().equals("O")) continue;
                    if (r.getOpcode() != Opcode.RETURN_VOID) continue;
                    System.out.println(cd.getType() + "  " + m.getName() + "()V  [" + d + "]  field=" + f);
                }
            }
        }
    }
}
