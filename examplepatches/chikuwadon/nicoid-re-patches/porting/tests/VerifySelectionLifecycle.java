import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
public class VerifySelectionLifecycle {
 public static void main(String[] args)throws Exception {
  DexFile dex=DexFileFactory.loadDexFile(new File(args[0]),Opcodes.getDefault());int checks=0;
  for(ClassDef c:dex.getClasses())for(Method m:c.getMethods()){
   boolean target=c.getType().equals("Lcom/sauzask/nicoid/NicoidVideoListFragment;")&&m.getName().equals("Y")||c.getType().equals("Lcom/sauzask/nicoid/NicoidCacheManagerActivity;")&&m.getName().equals("s");
   if(!target)continue;Instruction previous=null;int returns=0;
   for(Instruction i:m.getImplementation().getInstructions()){
    if(i.getOpcode()==Opcode.RETURN_VOID){returns++;if(!(previous instanceof ReferenceInstruction))throw new AssertionError("Missing exit hook");MethodReference r=(MethodReference)((ReferenceInstruction)previous).getReference();if(!r.getDefiningClass().equals("Le/e/a/BulkSelection;")||!r.getName().equals("modeChanged"))throw new AssertionError("Wrong exit hook");int register=((RegisterRangeInstruction)previous).getStartRegister();if(register!=m.getImplementation().getRegisterCount()-1)throw new AssertionError("Hook receives wrong instance register");}
    previous=i;
   }
   if(returns!=1)throw new AssertionError("Unexpected selection return paths");checks++;
  }
  if(checks!=2)throw new AssertionError("Missing selection methods");System.out.println("Native selection lifecycle: both back/exit paths invoke cleanup with the correct owner register");
 }
}
