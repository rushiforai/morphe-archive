import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import java.io.File;
public class DexDump {
 public static void main(String[] args) throws Exception {
  var container=DexFileFactory.loadDexContainer(new File(args[0]),Opcodes.getDefault());
  for(String dex:container.getDexEntryNames()) for(ClassDef c:container.getEntry(dex).getDexFile().getClasses()) {
   if(!c.getType().equals(args[1]))continue;
   System.out.println(c.getType()+" extends "+c.getSuperclass()+" "+c.getInterfaces());
   for(Field f:c.getFields())System.out.println("FIELD "+f);
   for(Method m:c.getMethods()) {
    if(args.length>2&&!m.getName().equals(args[2]))continue;
    System.out.println("METHOD "+m);
    var impl=m.getImplementation();if(impl==null)continue;
    System.out.println("REGISTERS "+impl.getRegisterCount());
    int i=0;for(Instruction ins:impl.getInstructions()) {
     String extra=ins instanceof ReferenceInstruction?((ReferenceInstruction)ins).getReference().toString():ins instanceof WideLiteralInstruction?Long.toString(((WideLiteralInstruction)ins).getWideLiteral()):"";
     String regs="";
     if(ins instanceof OneRegisterInstruction)regs+="v"+((OneRegisterInstruction)ins).getRegisterA();
     if(ins instanceof TwoRegisterInstruction)regs+=",v"+((TwoRegisterInstruction)ins).getRegisterB();
     if(ins instanceof ThreeRegisterInstruction)regs+=",v"+((ThreeRegisterInstruction)ins).getRegisterC();
     System.out.println((i++)+" "+ins.getOpcode()+" "+regs+" "+extra);
    }
   }
  }
 }
}
