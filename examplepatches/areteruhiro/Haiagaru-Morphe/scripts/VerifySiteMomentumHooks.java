import java.util.*;import com.android.tools.smali.dexlib2.iface.*;import com.android.tools.smali.dexlib2.iface.instruction.*;import com.android.tools.smali.dexlib2.iface.reference.*;
public class VerifySiteMomentumHooks{
 static void ok(boolean value,String message){if(!value)throw new AssertionError(message);}
 public static void main(String[]a)throws Exception{
  String owner=a[0].equals("191")?"Lo/MaxAdViewImplb$RemoteActionCompatParcelizer;":a[0].equals("226")?"Lo/asciiToLowercase$read;":"Lo/zzavd$RemoteActionCompatParcelizer;";
  var before=VerifySearchHistoryHooks.classes(a[1]);var after=VerifySearchHistoryHooks.classes(a[2]);
  Method b=null,n=null;for(var m:before.get(owner).getMethods())if(m.getName().equals("compare"))b=m;for(var m:after.get(owner).getMethods())if(m.getName().equals("compare"))n=m;
  ok(b!=null&&n!=null,"native comparator present");ok(b.getImplementation().getRegisterCount()==n.getImplementation().getRegisterCount(),"register count retained");
  var original=VerifySearchHistoryHooks.code(b);var patched=VerifySearchHistoryHooks.code(n);int offset=patched.size()-original.size();ok(offset==6,"six instruction gate");
  for(int i=0;i<original.size();i++)ok(VerifySearchHistoryHooks.key(original.get(i)).equals(VerifySearchHistoryHooks.key(patched.get(i+offset))),"native comparator instruction "+i+" retained");
  ok(((ReferenceInstruction)patched.get(0)).getReference().toString().contains("SiteMomentumSort;->compare"),"new scoped comparator gate");
  int sortCalls=0;for(var t:after.values())for(var m:t.getMethods())if(m.getImplementation()!=null)for(var i:m.getImplementation().getInstructions())if(i instanceof ReferenceInstruction r&&r.getReference().toString().equals("Lapp/morphe/extension/chmate/SiteMomentumSort;->sort(Ljava/util/List;Ljava/util/Comparator;)V")){sortCalls++;System.out.println("sort scope: "+m);}
  ok(sortCalls==2,"exact primary and filter sorting calls: "+sortCalls);System.out.println("PASS "+a[0]+" momentum native instructions/registers and verified sort scopes");
 }
}
