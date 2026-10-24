import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import java.util.*;
import java.util.zip.*;
import java.nio.ByteBuffer;
public class InspectUnreadCalculations {
 public static void main(String[]args)throws Exception{
  try(var zip=new ZipFile(args[0])){for(var e:Collections.list(zip.entries()))if(e.getName().matches("classes[0-9]*\\.dex"))
   for(var c:new DexBackedDexFile(null,ByteBuffer.wrap(zip.getInputStream(e).readAllBytes())).getClasses())for(var m:c.getMethods()){
    if(m.getImplementation()==null)continue;boolean found=false;var lines=new ArrayList<String>();int n=0;
    for(var i:m.getImplementation().getInstructions()){
     String ref=i instanceof ReferenceInstruction r?r.getReference().toString():"";
     if(ref.contains(args[1]))found=true;
     String line=(n++)+" "+i.getOpcode()+" "+ref;
     if(i instanceof OneRegisterInstruction r)line+=" A="+r.getRegisterA();
     if(i instanceof TwoRegisterInstruction r)line+=" B="+r.getRegisterB();
     if(i instanceof ThreeRegisterInstruction r)line+=" C="+r.getRegisterC();
     if(i instanceof NarrowLiteralInstruction r)line+=" lit="+r.getNarrowLiteral();
     if(i instanceof FiveRegisterInstruction r)line+=" args="+r.getRegisterC()+","+r.getRegisterD()+","+r.getRegisterE()+","+r.getRegisterF()+","+r.getRegisterG();
     lines.add(line);
    }if(found){System.out.println("METHOD "+m);lines.forEach(System.out::println);}
   }
  }
 }
}
