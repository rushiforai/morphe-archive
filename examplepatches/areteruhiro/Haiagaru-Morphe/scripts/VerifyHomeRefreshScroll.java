import java.util.*;import com.android.tools.smali.dexlib2.iface.*;

/** Exact 191 refresh completion only; compare every native method to the previous candidate. */
public final class VerifyHomeRefreshScroll {
 public static void main(String[] args)throws Exception{
  String owner="Lo/r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk;";
  var original=VerifySearchHistoryHooks.classes(args[0]).get(owner);var candidate=VerifySearchHistoryHooks.classes(args[1]).get(owner);
  Map<String,Method> after=new HashMap<>();for(Method m:candidate.getMethods())after.put(m.toString(),m);
  int methods=0,changed=0;
  for(Method before:original.getMethods()){
   Method next=after.remove(before.toString());if(next==null)throw new AssertionError("missing "+before);
   if(before.getImplementation()==null)continue;
   if(before.getImplementation().getRegisterCount()!=next.getImplementation().getRegisterCount())throw new AssertionError("changed registers");
   List<String> expected=new ArrayList<>(),actual=new ArrayList<>();for(var i:before.getImplementation().getInstructions())expected.add(VerifySearchHistoryHooks.key(i));for(var i:next.getImplementation().getInstructions())actual.add(VerifySearchHistoryHooks.key(i));
   if(before.getName().equals("e")&&before.getParameterTypes().equals(List.of("Lo/me;"))){
    if(!expected.get(36).contains("->n_()V"))throw new AssertionError("unexpected original jump");expected.set(36,"NOP");changed++;
   }
   if(!expected.equals(actual))throw new AssertionError("unexpected change "+before);methods++;
  }
  if(changed!=1||!after.isEmpty())throw new AssertionError("unexpected methods");
  System.out.println("PASS "+methods+" native HOME methods/registers retained; only completion scroll-to-top replaced with NOP");
 }
}
