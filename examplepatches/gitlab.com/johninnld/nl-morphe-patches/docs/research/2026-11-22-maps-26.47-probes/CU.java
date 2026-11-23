import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import java.io.File;

/** CU apk class name params ret from to -> instructions with code-unit offsets and registers */
public class CU {
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
        int cu = 0, i = 0;
        int from = Integer.parseInt(a[5]), to = Integer.parseInt(a[6]);
        for (Instruction ins : m.getImplementation().getInstructions()) {
            if (cu >= from && cu <= to) {
                StringBuilder b = new StringBuilder();
                b.append("cu=").append(cu).append(" i=").append(i).append(" ").append(ins.getOpcode());
                if (ins instanceof ReferenceInstruction) b.append(" ref=").append(((ReferenceInstruction) ins).getReference());
                if (ins instanceof OneRegisterInstruction) b.append(" A=").append(((OneRegisterInstruction) ins).getRegisterA());
                if (ins instanceof TwoRegisterInstruction) b.append(" B=").append(((TwoRegisterInstruction) ins).getRegisterB());
                if (ins instanceof ThreeRegisterInstruction) b.append(" C=").append(((ThreeRegisterInstruction) ins).getRegisterC());
                if (ins instanceof FiveRegisterInstruction) {
                    FiveRegisterInstruction f = (FiveRegisterInstruction) ins;
                    b.append(" n=").append(f.getRegisterCount()).append(" C=").append(f.getRegisterC()).append(" D=").append(f.getRegisterD()).append(" E=").append(f.getRegisterE()).append(" F=").append(f.getRegisterF()).append(" G=").append(f.getRegisterG());
                }
                if (ins instanceof OffsetInstruction) b.append(" off=").append(((OffsetInstruction) ins).getCodeOffset());
                System.out.println(b);
            }
            cu += ins.getCodeUnits(); i++;
        }
    }
}
