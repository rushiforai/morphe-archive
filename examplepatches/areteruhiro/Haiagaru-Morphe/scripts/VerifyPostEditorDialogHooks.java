import java.util.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
public final class VerifyPostEditorDialogHooks {
 static Method layout(ClassDef c){for(Method m:c.getMethods())if(m.getName().equals("onLayout")&&m.getParameterTypes().equals(List.of("Z","I","I","I","I")))return m;throw new AssertionError("layout");}
 static void ok(boolean b,String label){if(!b)throw new AssertionError(label);}
 public static void main(String[] a)throws Exception{
  Method before=layout(VerifySearchHistoryHooks.classes(a[0]).get("Lo/zzbgc;")),after=layout(VerifySearchHistoryHooks.classes(a[1]).get("Lo/zzbgc;"));
  ok(before.getImplementation().getRegisterCount()==after.getImplementation().getRegisterCount(),"register count unchanged");
  var actual=VerifySearchHistoryHooks.code(after);var remaining=new ArrayList<Instruction>();int hooks=0;
  for(int n=0;n<actual.size();n++){
   Instruction i=actual.get(n);if(i instanceof ReferenceInstruction r&&r.getReference().toString().equals("Lapp/morphe/extension/chmate/PostEditorDialogLayout;->fit(Landroid/view/ViewGroup;)V")){
    var invoke=(RegisterRangeInstruction)i;ok(invoke.getRegisterCount()==1&&invoke.getStartRegister()==after.getImplementation().getRegisterCount()-6,"root receiver register");
    ok(n+1<actual.size()&&actual.get(n+1).getOpcode().name().equals("RETURN_VOID"),"only at native layout exit");hooks++;
   }else remaining.add(i);
  }
  var expected=VerifySearchHistoryHooks.code(before);ok(hooks==1&&remaining.size()==expected.size(),"one hook and original instruction count");
  for(int n=0;n<expected.size();n++)ok(VerifySearchHistoryHooks.key(expected.get(n)).equals(VerifySearchHistoryHooks.key(remaining.get(n))),"original instruction "+n);
  System.out.println("PASS 242 editor layout: original registers and all instructions preserved");
 }
}
