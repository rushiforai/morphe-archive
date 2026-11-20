import java.io.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
public class Inspect {
 public static void main(String[] args) throws Exception {
  var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
  for(var name:dex.getDexEntryNames()) for(var c:dex.getEntry(name).getDexFile().getClasses()) {
   if(!c.getType().contains(args[1])) continue;
   System.out.println("CLASS "+c.getType());
   for(var f:c.getFields()) System.out.println("FIELD "+f+" = "+f.getInitialValue());
   for(var m:c.getMethods()) {
    System.out.println("METHOD "+m+" flags="+m.getAccessFlags());
    if(m.getImplementation()==null) continue;
    System.out.println("registers="+m.getImplementation().getRegisterCount());
    int i=0;
    for(var x:m.getImplementation().getInstructions()) {
     String s=(i++)+" "+x.getOpcode();
     if(x instanceof OneRegisterInstruction a) s+=" v"+a.getRegisterA();
     if(x instanceof TwoRegisterInstruction a) s+=",v"+a.getRegisterB();
     if(x instanceof FiveRegisterInstruction a) s+=" regs="+a.getRegisterCount()+":"+a.getRegisterC()+","+a.getRegisterD()+","+a.getRegisterE()+","+a.getRegisterF()+","+a.getRegisterG();
     if(x instanceof ReferenceInstruction a) s+=" "+a.getReference();
     if(x instanceof NarrowLiteralInstruction a) s+=" #"+a.getNarrowLiteral();
     if(x instanceof OffsetInstruction a) s+=" offset="+a.getCodeOffset();
     System.out.println(s);
    }
   }
  }
 }
}
