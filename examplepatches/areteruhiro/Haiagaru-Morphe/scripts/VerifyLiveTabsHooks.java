import java.util.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

/** Native command methods are unchanged; new bridge dispatches action 5 to both page kinds. */
public final class VerifyLiveTabsHooks {
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
 static Method command(ClassDef type){for(Method m:type.getMethods())if(m.getParameterTypes().equals(List.of("I","Ljava/lang/Object;"))&&m.getReturnType().equals("Z"))return m;throw new AssertionError(type.getType());}
 public static void main(String[] args)throws Exception{
  String v=args[0];var before=VerifySearchHistoryHooks.classes(args[1]);var after=VerifySearchHistoryHooks.classes(args[2]);
  String thread=v.equals("191")?"Lo/pa;":"Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;";
  String board=v.equals("191")?"Lo/r8lambdaGCnF6WpW_bFarRe7yCX2B6KzQ;":v.equals("226")?"Lo/Yhp5;":"Ljp/syoboi/a2chMate/ui/threadlist/ThreadListFragment;";
  Set<String> commands=new HashSet<>();
  for(String owner:List.of(thread,board)){
   Method b=command(before.get(owner)),a=command(after.get(owner));commands.add(a.toString());
   check(b.getImplementation().getRegisterCount()==a.getImplementation().getRegisterCount(),"native command registers");
   var bc=VerifySearchHistoryHooks.code(b);var ac=VerifySearchHistoryHooks.code(a);check(bc.size()==ac.size(),"native command instruction count");
   for(int i=0;i<bc.size();i++)check(VerifySearchHistoryHooks.key(bc.get(i)).equals(VerifySearchHistoryHooks.key(ac.get(i))),"native command preserved "+owner+":"+i);
  }
  Method bridge=null;for(Method m:after.get("Lapp/morphe/extension/chmate/OpenTabsRefresh;").getMethods())if(m.getName().equals("nativeRefresh"))bridge=m;
  check(bridge!=null&&bridge.getImplementation().getRegisterCount()==4,"bridge register layout");
  int calls=0;boolean five=false;
  for(var insn:bridge.getImplementation().getInstructions()){
   if(insn instanceof NarrowLiteralInstruction literal&&literal.getNarrowLiteral()==5)five=true;
   if(insn instanceof ReferenceInstruction ref&&ref.getReference() instanceof MethodReference method){
    check(commands.contains(method.toString()),"fixed native dispatcher only");
    check(insn instanceof FiveRegisterInstruction regs&&regs.getRegisterCount()==3&&regs.getRegisterC()==3&&regs.getRegisterD()==0&&regs.getRegisterE()==2,"receiver/action/source registers");calls++;
   }
  }
  check(five&&calls==2,"thread and board refresh action 5");
  System.out.println("PASS "+v+": native board/thread commands unchanged; fixed UI refresh bridge and registers verified");
 }
}
