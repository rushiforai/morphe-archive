import java.util.*;import com.android.tools.smali.dexlib2.iface.instruction.*;
/** Primary sorts were missing from 191/226. Require them explicitly, beyond comparator unit tests. */
public class VerifySiteMomentumEntrypoints {
 public static void main(String[] a)throws Exception {
  var types=VerifySearchHistoryHooks.classes(a[1]);String owner=a[0].equals("191")?"Lo/r8lambdaGCnF6WpW_bFarRe7yCX2B6KzQ;":a[0].equals("226")?"Lo/Yhp5;":"Ljp/syoboi/a2chMate/ui/threadlist/ThreadListViewModel$r8lambda7IJBVrN0sHyidCAZufWEJFc7yY;";
  int found=0,total=0;
  for(var t:types.values())for(var m:t.getMethods())if(m.getImplementation()!=null)for(var i:m.getImplementation().getInstructions())if(i instanceof ReferenceInstruction r&&r.getReference().toString().equals("Lapp/morphe/extension/chmate/SiteMomentumSort;->sort(Ljava/util/List;Ljava/util/Comparator;)V")){total++;if(t.getType().equals(owner)){found++;System.out.println("primary sort: "+m);}}
  if(total!=2||found!=(a[0].equals("242")?2:1))throw new AssertionError("Missing primary or filter sort: "+total+"/"+found);
  System.out.println("PASS "+a[0]+" primary and filter sort entries");
 }
}
