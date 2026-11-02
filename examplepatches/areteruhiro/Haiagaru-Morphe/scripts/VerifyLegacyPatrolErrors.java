import java.util.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

/** Compare worker bodies with only the scoped wrapper and session calls removed. */
public class VerifyLegacyPatrolErrors {
 public static void main(String[] args)throws Exception{
  var before=VerifyNativeReaderUiHooks.load(args[0]);var after=VerifyNativeReaderUiHooks.load(args[1]);
  String owner="Ljp/syoboi/a2chMate/autocheck/AutoCheckWork;";var old=before.get(owner);var current=after.get(owner);
  Method wrapper=null;for(var m:current.getMethods())if(m.getName().equals("haiagaruPatrolBoardFetch"))wrapper=m;
  if(wrapper==null)throw new AssertionError("wrapper missing");
  List<Instruction> code=new ArrayList<>();wrapper.getImplementation().getInstructions().forEach(code::add);
  if(code.size()!=6||code.get(3).getOpcode()!=Opcode.MOVE_EXCEPTION||code.get(5).getOpcode()!=Opcode.THROW||
    ((OneRegisterInstruction)code.get(3)).getRegisterA()!=((OneRegisterInstruction)code.get(5)).getRegisterA())throw new AssertionError("exception identity changed");
  var blocks=wrapper.getImplementation().getTryBlocks();
  if(blocks.size()!=1||blocks.get(0).getStartCodeAddress()!=0||blocks.get(0).getCodeUnitCount()!=4||
    blocks.get(0).getExceptionHandlers().size()!=1||!"Ljava/lang/Exception;".equals(blocks.get(0).getExceptionHandlers().get(0).getExceptionType()))throw new AssertionError("catch scope changed");
  String nativeTarget=VerifyNativeReaderUiHooks.ref(code.get(0));int changed=0;
  for(var m:current.getMethods()){
   if(m.getName().equals("haiagaruPatrolBoardFetch")||m.getImplementation()==null)continue;
   Method original=null;for(var o:old.getMethods())if(VerifyNativeReaderUiHooks.key(o).equals(VerifyNativeReaderUiHooks.key(m)))original=o;
   if(original==null)throw new AssertionError("unexpected method "+m);
   List<Instruction> ins=new ArrayList<>();m.getImplementation().getInstructions().forEach(ins::add);Set<Integer> skip=new HashSet<>();
   boolean replaced=false;
   for(int i=0;i<ins.size();i++){String r=VerifyNativeReaderUiHooks.ref(ins.get(i));if(r.startsWith("Lapp/morphe/extension/chmate/PatrolErrorDetails;->"))skip.add(i);if(r.contains("->haiagaruPatrolBoardFetch("))replaced=true;}
   if(skip.isEmpty()&&!replaced)continue;
   if(original.getImplementation().getRegisterCount()!=m.getImplementation().getRegisterCount())throw new AssertionError("register count changed");
   var expected=VerifyNativeReaderUiHooks.normalize(original,Collections.emptySet());var actual=VerifyNativeReaderUiHooks.normalize(m,skip);
   if(expected.size()!=actual.size())throw new AssertionError("instruction count");
   for(int i=0;i<actual.size();i++)if(actual.get(i).contains("->haiagaruPatrolBoardFetch(")){
    String a=actual.get(i),e=expected.get(i),marker=a.contains(" range")?" range":" args";
    if(!e.contains(nativeTarget)||!a.substring(a.indexOf(marker)).equals(e.substring(e.indexOf(marker))))throw new AssertionError("native arguments changed");
    actual.set(i,e);
   }
   if(!expected.equals(actual))throw new AssertionError("native body/branch target changed: "+m);
   changed++;
  }
  if(changed!=2)throw new AssertionError("expected board fetch and worker lifecycle only");
  System.out.println("PASS "+args[2]+": worker registers/instructions/arguments/targets retained, original exception rethrown, catch scoped to board fetch");
 }
}
