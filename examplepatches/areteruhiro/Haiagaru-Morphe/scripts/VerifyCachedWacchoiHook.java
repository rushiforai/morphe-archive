import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.io.*;
import java.util.*;
import java.util.zip.*;

/** Validate the local-search return hook without relying on source compilation alone. */
public final class VerifyCachedWacchoiHook {
 static Method create(String apk,String type)throws Exception{
  try(var zip=new ZipFile(apk)){for(var es=zip.entries();es.hasMoreElements();){var e=es.nextElement();if(!e.getName().matches("classes(?:[0-9]+)?\\.dex"))continue;
   try(var in=new BufferedInputStream(zip.getInputStream(e))){for(var c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())if(c.getType().equals(type))for(var m:c.getMethods())if(m.getName().equals("onCreateView"))return m;}
  }}throw new AssertionError("Native search fragment missing "+type);
 }
 public static void main(String[] args)throws Exception{
  var original=create(args[0],args[2]);var patched=create(args[1],args[2]);
  if(original.getImplementation().getRegisterCount()!=patched.getImplementation().getRegisterCount())throw new AssertionError("Native registers changed");
  var a=new ArrayList<Instruction>();original.getImplementation().getInstructions().forEach(a::add);
  var b=new ArrayList<Instruction>();patched.getImplementation().getInstructions().forEach(b::add);
  int hooks=0;
  for(int i=0,j=0;i<a.size();i++,j++){
   if(a.get(i).getOpcode()==com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT){
    if(b.get(j).getOpcode()!=com.android.tools.smali.dexlib2.Opcode.MOVE_OBJECT_16)throw new AssertionError("Missing argument move");
    var ref=(MethodReference)((ReferenceInstruction)b.get(j+1)).getReference();
    if(!ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/CachedWacchoiSearch;")||!ref.getName().equals("wrap"))throw new AssertionError("Wrong hook");
    if(b.get(j+2).getOpcode()!=com.android.tools.smali.dexlib2.Opcode.MOVE_RESULT_OBJECT)throw new AssertionError("Missing return result");
    j+=3;hooks++;
   }
   if(!VerifyThumbnailRebind242.shape(a.get(i)).equals(VerifyThumbnailRebind242.shape(b.get(j))))throw new AssertionError("Unexpected native change "+i);
  }
  if(hooks==0||b.size()!=a.size()+3*hooks)throw new AssertionError("Unexpected hook size");
  System.out.println("PASS "+args[2]+" native registers/instructions retained; "+hooks+" cached-search wrapper");
 }
}
