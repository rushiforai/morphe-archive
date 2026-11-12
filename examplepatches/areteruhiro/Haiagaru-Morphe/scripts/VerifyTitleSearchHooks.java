import java.util.*;import com.android.tools.smali.dexlib2.iface.*;import com.android.tools.smali.dexlib2.iface.instruction.*;
/** Scope is fixed to three 226 menu owners. Native prepare/dispatch code must be identical. */
public class VerifyTitleSearchHooks {
 static void ok(boolean b,String s){if(!b)throw new AssertionError(s);}
 static Method find(ClassDef c,String name,List<String> ps){for(Method m:c.getMethods())if(m.getName().equals(name)&&m.getParameterTypes().equals(ps))return m;throw new AssertionError(c.getType()+name);}
 static void same(Method a,Method b){ok(a.getImplementation().getRegisterCount()==b.getImplementation().getRegisterCount(),"registers "+a);var x=VerifySearchHistoryHooks.code(a);var y=VerifySearchHistoryHooks.code(b);ok(x.size()==y.size(),"instruction count "+a);for(int i=0;i<x.size();i++)ok(VerifySearchHistoryHooks.key(x.get(i)).equals(VerifySearchHistoryHooks.key(y.get(i))),"native instruction "+i+" "+a);}
 public static void main(String[]args)throws Exception{
  var before=VerifySearchHistoryHooks.classes(args[0]);var previous=VerifySearchHistoryHooks.classes(args[2]);var after=VerifySearchHistoryHooks.classes(args[1]);var params=List.of("Landroid/view/Menu;","Landroid/view/MenuInflater;");
  for(String type:List.of("Lo/Yhp5;","Ljp/syoboi/a2chMate/fragment/HomeFragment;","Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;")){
   var old=before.get(type);var patched=after.get(type);same(find(old,"b",params),find(patched,"haiagaruTitleSearchMenu",params));var wrapper=find(patched,"b",params);ok(wrapper.getImplementation().getRegisterCount()==7,"safe wrapper registers");int calls=0,search=0,find=0;for(var i:wrapper.getImplementation().getInstructions()){if(i instanceof ReferenceInstruction r){var s=r.getReference().toString();if(s.contains("haiagaruTitleSearchMenu"))calls++;if(s.contains("->findItem"))find++;}if(i instanceof NarrowLiteralInstruction l&&l.getNarrowLiteral()==0x7f090100)search++;}ok(calls==1&&search==1&&find==1,"one native call and guarded Search");
   for(Method m:previous.get(type).getMethods())if(m.getImplementation()!=null&&!m.getName().equals("b")&&!m.getName().startsWith("haiagaru"))same(m,find(patched,m.getName(),m.getParameterTypes().stream().map(Object::toString).toList()));
  }
  String base="Ljp/syoboi/a2chMate/fragment/RoidonListFragment;";same(find(previous.get(base),"d",List.of("Landroid/view/Menu;")),find(after.get(base),"d",List.of("Landroid/view/Menu;")));
  System.out.println("PASS: 226 board/HOME/thread menu additions; original inflaters, native per-page toolbar visibility and dispatch retained");
 }
}
