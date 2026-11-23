import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/** ReadSites apk "Ltype;->name:type"  -> prints each sget-object site with the following 3 instructions. */
public class ReadSites {
    public static void main(String[] a) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
        for (String d : c.getDexEntryNames()) {
            for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
                for (Method m : cd.getMethods()) {
                    MethodImplementation body = m.getImplementation();
                    if (body == null) continue;
                    List<Instruction> ins = new ArrayList<>();
                    for (Instruction i : body.getInstructions()) ins.add(i);
                    for (int i = 0; i < ins.size(); i++) {
                        Instruction x = ins.get(i);
                        if (x.getOpcode() != Opcode.SGET_OBJECT) continue;
                        String ref = ((ReferenceInstruction) x).getReference().toString();
                        if (!ref.equals(a[1])) continue;
                        System.out.println("SITE " + m + "  regs=" + body.getRegisterCount());
                        for (int k = i; k < Math.min(ins.size(), i + 4); k++) {
                            Instruction y = ins.get(k);
                            StringBuilder b = new StringBuilder("   " + k + " " + y.getOpcode());
                            if (y instanceof NarrowLiteralInstruction) b.append(" lit=").append(((NarrowLiteralInstruction) y).getNarrowLiteral());
                            if (y instanceof WideLiteralInstruction) b.append(" wide=").append(((WideLiteralInstruction) y).getWideLiteral());
                            if (y instanceof ReferenceInstruction) b.append(" ref=").append(((ReferenceInstruction) y).getReference());
                            System.out.println(b);
                        }
                    }
                }
            }
        }
    }
}
