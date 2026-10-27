import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.util.*;
import java.util.zip.*;
public final class VerifyUpdateConnectionHooks {
 static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);}
 public static void main(String[] args)throws Exception{
  int hooks=0,bridges=0;
  try(var zip=new ZipFile(args[0])){for(var entry:Collections.list(zip.entries()))if(entry.getName().matches("classes[0-9]*\\.dex"))
   try(var in=new java.io.BufferedInputStream(zip.getInputStream(entry))){for(var c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())
    for(var method:c.getMethods())if(method.getImplementation()!=null){
     var code=new ArrayList<Instruction>();method.getImplementation().getInstructions().forEach(code::add);
     for(int n=0;n<code.size();n++)if(code.get(n) instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference target){
      if(c.getType().equals("Lo/getLabel;")&&target.getDefiningClass().equals("Lapp/morphe/extension/chmate/NativeUpdatePolicy;")&&target.getName().equals("configure191")){
       hooks++;check(n+1<code.size(),"native execute follows policy");
       var next=(MethodReference)((ReferenceInstruction)code.get(n+1)).getReference();check(next.getName().equals("e"),"preserve native execute");
       int receiver=((RegisterRangeInstruction)code.get(n)).getStartRegister();
       var nativeCall=code.get(n+1);int original=nativeCall instanceof RegisterRangeInstruction v?v.getStartRegister():((FiveRegisterInstruction)nativeCall).getRegisterC();
       check(receiver==original,"call receiver is unchanged");
      }
      if(method.getDefiningClass().equals("Lapp/morphe/extension/chmate/NativeUpdatePolicy;")&&method.getName().equals("configure191")&&target.getName().equals("prepareRequest191")){
       bridges++;check(method.getImplementation().getRegisterCount()==8,"bridge locals separate from p0");
       var call=(FiveRegisterInstruction)code.get(n);check(call.getRegisterCount()==3&&call.getRegisterC()==7&&call.getRegisterD()==1&&call.getRegisterE()==0,"call, method, URL arguments retain p0");
       check(((MethodReference)((ReferenceInstruction)code.get(n+1)).getReference()).getName().equals("timeoutNanos"),"existing overall timeout retained");
      }
     }
    }
   }
  }
  check(hooks==15&&bridges==1,"15 existing reader sites and one request bridge: "+hooks+"/"+bridges);
  System.out.println("PASS scoped191 connection bridge operands, 15 original execute sites, existing timeout preserved");
 }
}
