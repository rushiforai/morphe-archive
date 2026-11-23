import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import java.io.File;
import java.util.*;

/** InstrAt apk class name params ret index  -> prints instruction + register fields */
public class InstrAt {
    public static void main(String[] a) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
        ClassDef cd = null;
        for (String d : c.getDexEntryNames()) for (ClassDef x : c.getEntry(d).getDexFile().getClasses()) if (x.getType().equals(a[1])) cd = x;
        if (cd == null) { System.out.println("NO CLASS"); return; }
        Method m = null;
        for (Method x : cd.getMethods()) {
            StringBuilder b = new StringBuilder();
            for (CharSequence p : x.getParameterTypes()) b.append(p);
            if (x.getName().equals(a[2]) && b.toString().equals(a[3]) && x.getReturnType().equals(a[4])) { m = x; break; }
        }
        if (m == null) { System.out.println("NO METHOD"); return; }
        MethodImplementation body = m.getImplementation();
        System.out.println("REGISTERS " + body.getRegisterCount());
        int i = 0;
        for (Instruction ins : body.getInstructions()) {
            if (i >= Integer.parseInt(a[5]) - 2 && i <= Integer.parseInt(a[5]) + 1) {
                StringBuilder b = new StringBuilder();
                b.append(i).append(" ").append(ins.getOpcode());
                if (ins instanceof OneRegisterInstruction) b.append(" a=").append(((OneRegisterInstruction) ins).getRegisterA());
                if (ins instanceof TwoRegisterInstruction) b.append(" b=").append(((TwoRegisterInstruction) ins).getRegisterB());
                if (ins instanceof ThreeRegisterInstruction) b.append(" c=").append(((ThreeRegisterInstruction) ins).getRegisterC());
                if (ins instanceof FiveRegisterInstruction) {
                    FiveRegisterInstruction f = (FiveRegisterInstruction) ins;
                    b.append(" n=").append(f.getRegisterCount()).append(" C=").append(f.getRegisterC()).append(" D=").append(f.getRegisterD())
                     .append(" E=").append(f.getRegisterE()).append(" F=").append(f.getRegisterF()).append(" G=").append(f.getRegisterG());
                }
                if (ins instanceof ReferenceInstruction) b.append(" ref=").append(((ReferenceInstruction) ins).getReference());
                System.out.println(b);
            }
            i++;
        }
    }
}
