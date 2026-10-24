import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import java.util.*;
import java.util.zip.*;
import java.nio.ByteBuffer;
public class DumpAnrMethods {
 public static void main(String[] args)throws Exception{
  try(var zip=new ZipFile(args[0])){for(var e:Collections.list(zip.entries()))if(e.getName().matches("classes[0-9]*\\.dex")){
   for(var c:new DexBackedDexFile(null,ByteBuffer.wrap(zip.getInputStream(e).readAllBytes())).getClasses()){
    if(!c.getType().equals(args.length>1?args[1]:"Lo/r8lambda4fIVmDse184MJavTVTXSBZQF_UA;"))continue;
    System.out.println(c.getType());for(var f:c.getFields())System.out.println("FIELD "+f);
    for(var m:c.getMethods()){if(args.length>2&&!m.getName().equals(args[2]))continue;System.out.println("METHOD "+m);if(m.getImplementation()==null)continue;
     int n=0;for(var i:m.getImplementation().getInstructions()){System.out.print((n++)+" "+i.getOpcode());
      if(i instanceof ReferenceInstruction r)System.out.print(" "+r.getReference());
      if(i instanceof OneRegisterInstruction r)System.out.print(" A="+r.getRegisterA());
      if(i instanceof TwoRegisterInstruction r)System.out.print(" B="+r.getRegisterB());
      if(i instanceof NarrowLiteralInstruction r)System.out.print(" literal="+r.getNarrowLiteral());
      if(i instanceof OffsetInstruction r)System.out.print(" offset="+r.getCodeOffset());System.out.println();
     }
    }
   }
  }}
 }
}
