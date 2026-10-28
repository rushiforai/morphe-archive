import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;
/** Constructor state is untouched; registration reads its completed SavedStateHandle. */
public final class VerifyNativeMediaModelHook {
 static ClassDef model(String path)throws Exception{
  try(var zip=new java.util.zip.ZipFile(path)){for(var e:Collections.list(zip.entries()))if(e.getName().matches("classes[0-9]*\\.dex"))try(var in=new java.io.BufferedInputStream(zip.getInputStream(e))){for(var c:com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile.fromInputStream(com.android.tools.smali.dexlib2.Opcodes.getDefault(),in).getClasses())if(c.getType().equals("Ljp/syoboi/a2chMate/activity/ImagesViewerViewModel;"))return c;}}
  throw new AssertionError("Native model missing");
 }
 public static void main(String[] args)throws Exception{
  String type="Ljp/syoboi/a2chMate/activity/ImagesViewerViewModel;";Method before=null,after=null;
  for(var m:model(args[0]).getMethods())if(m.getName().equals("<init>"))before=m;
  for(var m:model(args[1]).getMethods())if(m.getName().equals("<init>"))after=m;
  if(before==null||after==null||before.getImplementation().getRegisterCount()!=after.getImplementation().getRegisterCount())throw new AssertionError("model/registers changed");
  var a=new ArrayList<Instruction>();before.getImplementation().getInstructions().forEach(a::add);int original=0,hooks=0;
  for(var i:after.getImplementation().getInstructions()){
   if(i instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference ref&&ref.getName().equals("registerNativeModel")){
    if(!ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/MediaViewerNavigation;")||!(i instanceof RegisterRangeInstruction range)||range.getStartRegister()!=after.getImplementation().getRegisterCount()-3||range.getRegisterCount()!=1||a.get(original).getOpcode()!=com.android.tools.smali.dexlib2.Opcode.RETURN_VOID)throw new AssertionError("model hook operands or position");hooks++;continue;
   }
   var prev=a.get(original++);if(prev.getOpcode()!=i.getOpcode())throw new AssertionError("original opcode changed");
   if(prev instanceof ReferenceInstruction r&&!r.getReference().toString().equals(((ReferenceInstruction)i).getReference().toString()))throw new AssertionError("original reference changed");
   if(prev instanceof OneRegisterInstruction r&&r.getRegisterA()!=((OneRegisterInstruction)i).getRegisterA())throw new AssertionError("original register changed");
  }
  if(hooks!=1||original!=a.size())throw new AssertionError("missing/extra instructions");
  System.out.println("PASS Compose media model registration preserves original constructor state and registers");
 }
}
