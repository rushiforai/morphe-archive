import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import java.util.*;
import java.util.zip.*;
public class InspectFloatingFilterDex {
 public static void main(String[]args)throws Exception{
  try(ZipFile zip=new ZipFile(args[0])){for(var e:Collections.list(zip.entries()))if(e.getName().matches("classes[0-9]*\\.dex"))try(var in=new java.io.BufferedInputStream(zip.getInputStream(e))){
   for(ClassDef c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())if(c.getType().equals("Lapp/morphe/extension/chmate/i1;")||c.getType().equals("Lapp/morphe/extension/chmate/FloatingFilterButton$Binding;")){
    for(Method m:c.getMethods())if(m.getName().contains("lambda")||m.getName().equals("a")||m.getName().equals("onClick")){
     System.out.println(c.getType()+" "+m.getName());for(Instruction i:m.getImplementation().getInstructions())System.out.println(i.getOpcode()+" "+(i instanceof ReferenceInstruction r?r.getReference():""));
    }
   }
  }}
 }
}
