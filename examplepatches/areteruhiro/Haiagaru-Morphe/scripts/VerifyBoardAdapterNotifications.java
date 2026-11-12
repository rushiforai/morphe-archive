import java.util.*;
import com.android.tools.smali.dexlib2.iface.*;

/** Compare original notify and previous patched adapter to candidate, retaining existing hooks. */
public final class VerifyBoardAdapterNotifications {
 public static void main(String[] args)throws Exception{
  if(args.length!=4)throw new IllegalArgumentException("original.apk candidate.apk 191|226 previous-patched.apk");
  String owner=args[2].equals("191")?"Lo/m6dExternalSyntheticLambda0;":"Lo/getNextStreamIdokhttp;";
  ClassDef original=VerifySearchHistoryHooks.classes(args[0]).get(owner);
  ClassDef baseline=VerifySearchHistoryHooks.classes(args[3]).get(owner);
  ClassDef patched=VerifySearchHistoryHooks.classes(args[1]).get(owner);
  if(original==null||patched==null||baseline==null)throw new AssertionError("missing pinned adapter");
  Method nativeNotify=null;for(Method m:original.getMethods())if(m.getName().equals("notifyDataSetChanged"))nativeNotify=m;
  Map<String,Method> methods=new HashMap<>();for(Method m:patched.getMethods())methods.put(m.toString(),m);
  int count=0;
  for(Method before:baseline.getMethods()){
   Method after=methods.remove(before.toString());if(after==null)throw new AssertionError("missing method "+before);
   if(before.getImplementation()==null)continue;
   if(before.getImplementation().getRegisterCount()!=after.getImplementation().getRegisterCount())throw new AssertionError("register count changed");
   List<String> expected=new ArrayList<>(),actual=new ArrayList<>();
   for(var i:before.getImplementation().getInstructions())expected.add(VerifySearchHistoryHooks.key(i));
   for(var i:after.getImplementation().getInstructions())actual.add(VerifySearchHistoryHooks.key(i));
   if(before.getName().equals("notifyDataSetChanged")){
    List<String> nativeCode=new ArrayList<>();for(var i:nativeNotify.getImplementation().getInstructions())nativeCode.add(VerifySearchHistoryHooks.key(i));
    if(!nativeCode.equals(expected))throw new AssertionError("previous patch changed native notification");
    if(expected.size()!=4)throw new AssertionError("unexpected original notify shape");
    expected=Arrays.asList(expected.get(1),expected.get(2),expected.get(0),expected.get(3));
   }
   if(!expected.equals(actual))throw new AssertionError("instruction mismatch "+before);
   count++;
  }
  if(!methods.isEmpty())throw new AssertionError("unexpected new methods");
  System.out.println("PASS "+args[2]+": "+count+" methods; dirty flag precedes observers, original instructions and registers preserved");
 }
}
