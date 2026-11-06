import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;

/** Exact native worker preservation and isolation from normal/registered patrol. */
public final class VerifyOpenTabsHooks {
 static void check(boolean b,String s){if(!b)throw new AssertionError(s);}
 static Method named(ClassDef owner,String name){for(Method m:owner.getMethods())if(m.getName().equals(name))return m;throw new AssertionError(name);}
 static boolean invokes(Instruction i,String part){return i instanceof ReferenceInstruction r&&r.getReference().toString().contains(part);}
 public static void main(String[] args)throws Exception{
  String v=args[0],worker="Ljp/syoboi/a2chMate/autocheck/AutoCheckWork;";
  var before=VerifySearchHistoryHooks.classes(args[1]);var after=VerifySearchHistoryHooks.classes(args[2]);
  Method b=null,a=null;
  for(Method m:before.get(worker).getMethods())if(m.getParameterTypes().size()==3&&m.getParameterTypes().get(2).equals("Z")&&m.getParameterTypes().get(1).toString().contains("List;"))b=m;
  check(b!=null,"group method");for(Method m:after.get(worker).getMethods())if(m.getName().equals(b.getName())&&m.getParameterTypes().equals(b.getParameterTypes()))a=m;
  check(a!=null&&a.getImplementation().getRegisterCount()==b.getImplementation().getRegisterCount(),"registers preserved");
  var original=VerifySearchHistoryHooks.code(b);var patched=VerifySearchHistoryHooks.code(a);var stripped=new ArrayList<Instruction>();int groups=0,rows=0;
  for(int i=0;i<patched.size();i++){
   var insn=patched.get(i);
   if(invokes(insn,"OpenTabsRefresh;->downloadGroup")){check(i==2,"scope override follows image patrol predicate");check(insn instanceof RegisterRangeInstruction r&&r.getRegisterCount()==4,"all arguments preserved");i++;groups++;continue;}
   if(invokes(insn,"OpenTabsRefresh;->downloadRows")){check(patched.get(i+1).getOpcode()==Opcode.MOVE_RESULT_OBJECT&&patched.get(i+2).getOpcode()==Opcode.CHECK_CAST,"native list type preserved");i+=2;rows++;continue;}
   stripped.add(insn);
  }
  check(groups==1&&rows==1&&stripped.size()==original.size(),"two scoped inserts only");
  for(int i=0;i<original.size();i++)check(VerifySearchHistoryHooks.key(original.get(i)).equals(VerifySearchHistoryHooks.key(stripped.get(i))),"original instruction "+i);
  String scheduler=v.equals("191")?"Lo/mdExternalSyntheticLambda0;":v.equals("226")?"Lo/settings;":"Lo/TTRewardVideoActivity8;";
  for(String name:List.of("haiagaruRefreshOpenThreads","haiagaruRefreshOpenBoards")){
   var code=VerifySearchHistoryHooks.code(named(after.get(scheduler),name));int scope=0;
   for(var i:code){check(!invokes(i,"RefreshTargets;->enqueue"),"does not recursively refresh registered targets");if(invokes(i,"OpenTabsRefresh;->writeScope"))scope++;}
   check(scope==1,"one persisted snapshot");
   check(code.stream().anyMatch(i->i instanceof ReferenceInstruction r&&r.getReference() instanceof StringReference s&&s.getString().equals(name.endsWith("Threads")?"haiagaru-open-threads":"haiagaru-open-boards")),"independent unique work name");
  }
  String editor=v.equals("191")?"Lo/MaxFullscreenAdImplExternalSyntheticLambda4;":v.equals("226")?"Lo/unsharedCopy;":"Lo/AdRequestBuilder;";
  check(after.get(editor).getMethods().iterator().hasNext(),"native NG editor retained");
  for(Method m:after.get(editor).getMethods())check(!m.getName().equals("onResume"),"auto-popup lifecycle hook removed");
  System.out.println("PASS "+v+": original worker instructions/registers preserved; scoped downloads/work names; NG popup hook removed");
 }
}
