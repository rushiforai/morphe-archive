import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;

public class Dex {
    public static void main(String[] a) throws Exception {
        DexFile dex = DexFileFactory.loadDexFile(new File(a[0]), Opcodes.getDefault());
        String cmd = a[1];
        for (ClassDef c : dex.getClasses()) {
            if (cmd.equals("class") && c.getType().equals(a[2])) {
                System.out.println(c.getType() + " extends " + c.getSuperclass());
                for (Field f : c.getFields()) System.out.println("  F " + f.getName() + " : " + f.getType());
                for (Method m : c.getMethods()) System.out.println("  M " + m.getName() + "(" + String.join("", m.getParameterTypes().stream().map(Object::toString).toList()) + ")" + m.getReturnType());
            }
            if (cmd.equals("dis") && c.getType().equals(a[2])) {
                for (Method m : c.getMethods()) {
                    if (!m.getName().equals(a[3])) continue;
                    MethodImplementation im = m.getImplementation();
                    System.out.println("== " + m.getName() + " regs=" + (im==null?-1:im.getRegisterCount()));
                    if (im == null) continue;
                    int off = 0;
                    for (Instruction i : im.getInstructions()) {
                        String r = "";
                        if (i instanceof ReferenceInstruction ri) {
                            Reference ref = ri.getReference();
                            r = ref instanceof MethodReference mr ? mr.getDefiningClass()+"->"+mr.getName()+"("+String.join("", mr.getParameterTypes().stream().map(Object::toString).toList())+")"+mr.getReturnType()
                              : ref instanceof FieldReference fr ? fr.getDefiningClass()+"->"+fr.getName()+":"+fr.getType()
                              : ref instanceof StringReference sr ? "\""+sr.getString()+"\""
                              : ref.toString();
                        }
                        String regs = "";
                        if (i instanceof OneRegisterInstruction o) regs += " v"+o.getRegisterA();
                        if (i instanceof TwoRegisterInstruction t) regs += " v"+t.getRegisterB();
                        if (i instanceof ThreeRegisterInstruction t3) regs += " v"+t3.getRegisterC();
                        if (i instanceof FiveRegisterInstruction f) { int n=f.getRegisterCount(); int[] rs={f.getRegisterC(),f.getRegisterD(),f.getRegisterE(),f.getRegisterF(),f.getRegisterG()}; regs+=" {"; for(int k=0;k<n;k++) regs+=(k>0?",":"")+"v"+rs[k]; regs+="}"; }
                        if (i instanceof RegisterRangeInstruction rr) regs+=" {v"+rr.getStartRegister()+".."+"v"+(rr.getStartRegister()+rr.getRegisterCount()-1)+"}";
                        String lit = i instanceof WideLiteralInstruction w ? " #"+w.getWideLiteral() : "";
                        System.out.printf("%04x %s%s%s %s%n", off, i.getOpcode().name, regs, lit, r);
                        off += i.getCodeUnits();
                    }
                }
            }
            if (cmd.equals("strref")) {
                for (Method m : c.getMethods()) {
                    MethodImplementation im = m.getImplementation();
                    if (im == null) continue;
                    for (Instruction i : im.getInstructions()) {
                        if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr && sr.getString().matches(a[2])) {
                            System.out.println(c.getType()+"->"+m.getName()+" : "+sr.getString());
                        }
                    }
                }
            }
            if (cmd.equals("callers")) {
                for (Method m : c.getMethods()) {
                    MethodImplementation im = m.getImplementation();
                    if (im == null) continue;
                    for (Instruction i : im.getInstructions()) {
                        if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr
                            && mr.getDefiningClass().equals(a[2]) && mr.getName().equals(a[3])) {
                            System.out.println(c.getType()+"->"+m.getName());
                            break;
                        }
                    }
                }
            }
        }
    }
}
