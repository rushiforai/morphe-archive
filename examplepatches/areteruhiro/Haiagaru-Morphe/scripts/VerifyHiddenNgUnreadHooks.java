import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.nio.ByteBuffer;
import java.util.*;
import java.util.zip.ZipFile;

/** Checks the actual generated invoke operands against the original total/read pair. */
public class VerifyHiddenNgUnreadHooks {
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
 static Map<String,Method> methods(String file)throws Exception{
  Map<String,Method> result=new HashMap<>();try(var zip=new ZipFile(file)){
   for(var e:Collections.list(zip.entries()))if(e.getName().matches("classes[0-9]*\\.dex"))
    for(var c:new DexBackedDexFile(null,ByteBuffer.wrap(zip.getInputStream(e).readAllBytes())).getClasses())
     for(var m:c.getMethods())if(m.getImplementation()!=null)result.put(m.toString(),m);
  }return result;
 }
 static List<Instruction> code(Method m){List<Instruction> result=new ArrayList<>();m.getImplementation().getInstructions().forEach(result::add);return result;}
 public static void main(String[]args)throws Exception{
  check(args.length==3,"original APK, patched APK, expected hook count required");
  var nativeMethods=methods(args[0]);int count=0;
  for(var m:methods(args[1]).values()){
   if(m.getDefiningClass().startsWith("Lapp/morphe/extension/"))continue;
   var instructions=code(m);
   for(int i=0;i<instructions.size();i++){
    var ins=instructions.get(i);
    if(!(ins instanceof ReferenceInstruction ref)||!(ref.getReference() instanceof MethodReference call)||!call.getDefiningClass().equals("Lapp/morphe/extension/chmate/HiddenNgUnread;")||!Set.of("total","totalFromStoredRead").contains(call.getName()))continue;
    count++;String originalKey=m.toString();
    if(m.getName().equals("haiagaruNativeHistorySort")){
     String nativeName=switch(m.getDefiningClass()){
      case "Lo/r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk;"->"a";
      case "Ljp/syoboi/a2chMate/fragment/HomeFragment;"->"b";
      default->throw new AssertionError("Unknown renamed history owner");
     };originalKey=originalKey.replace("->haiagaruNativeHistorySort(","->"+nativeName+"(");
    }
    var original=nativeMethods.get(originalKey);check(original!=null,"Native method missing "+m);
    check(m.getImplementation().getRegisterCount()==original.getImplementation().getRegisterCount(),"Native registers changed "+m);
    check(ins.getOpcode()==Opcode.INVOKE_STATIC,"Unexpected invoke format");var invoke=(FiveRegisterInstruction)ins;
    check(instructions.get(i+1).getOpcode()==Opcode.MOVE_RESULT,"Missing int result");int dest=((OneRegisterInstruction)instructions.get(i+1)).getRegisterA();
    boolean stored=call.getName().equals("totalFromStoredRead");check(invoke.getRegisterCount()==(stored?1:2),"Argument count");
    int subIndex=i+(stored?3:2);check(instructions.get(subIndex).getOpcode()==Opcode.SUB_INT_2ADDR,"Native subtraction missing");var sub=(TwoRegisterInstruction)instructions.get(subIndex);
    check(sub.getRegisterA()==dest,"Total result register changed");
    if(stored)check(instructions.get(i+2).getOpcode()==Opcode.IGET&&((TwoRegisterInstruction)instructions.get(i+2)).getRegisterA()==sub.getRegisterB(),"Stored-read load missing");
    else check(invoke.getRegisterD()==sub.getRegisterB(),"Read operand changed");
    boolean matched=false;var old=code(original);
    for(int j=0;j+(stored?2:1)<old.size();j++){
     if(old.get(j).getOpcode()!=Opcode.IGET)continue;var load=(TwoRegisterInstruction)old.get(j);
     if(load.getRegisterA()!=dest||load.getRegisterB()!=invoke.getRegisterC())continue;
     String total=((ReferenceInstruction)old.get(j)).getReference().toString();
     if(!Set.of("Lo/onAdDisplayed$setIcon;->k:I","Lo/Yy2$open;->m:I","Lo/zzauw;->a:I","Lo/getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ;->o:I").contains(total))continue;
     int next=j+(stored?2:1);if(old.get(next).getOpcode()!=Opcode.SUB_INT_2ADDR)continue;var previous=(TwoRegisterInstruction)old.get(next);
     if(previous.getRegisterA()!=dest||previous.getRegisterB()!=sub.getRegisterB())continue;
     if(stored){var read=old.get(j+1);if(read.getOpcode()!=Opcode.IGET||!((ReferenceInstruction)read).getReference().equals(((ReferenceInstruction)instructions.get(i+2)).getReference()))continue;}
     matched=true;break;
    }check(matched,"Original total/read operands not preserved "+m);
   }
  }check(count==Integer.parseInt(args[2]),"Unexpected hooks: "+count);System.out.println("PASS "+count+" native unread hooks: original registers, total/read operands and subtraction preserved");
 }
}
