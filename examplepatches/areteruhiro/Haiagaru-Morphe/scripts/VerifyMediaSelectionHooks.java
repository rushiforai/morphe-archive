import java.util.*;import com.android.tools.smali.dexlib2.iface.*;import com.android.tools.smali.dexlib2.iface.instruction.*;import com.android.tools.smali.dexlib2.iface.reference.*;
/** Original selectors must retain every instruction, register and exception handler. */
public final class VerifyMediaSelectionHooks {
 static void ok(boolean b,String text){if(!b)throw new AssertionError(text);}
 static Method method(ClassDef c,String name,List<String> signature){for(var m:c.getMethods())if(m.getName().equals(name)&&m.getParameterTypes().equals(signature))return m;throw new AssertionError(name);}
 static void retained(Method old,Method now){ok(old.getImplementation().getRegisterCount()==now.getImplementation().getRegisterCount(),"native registers");var a=VerifySearchHistoryHooks.code(old);var b=VerifySearchHistoryHooks.code(now);ok(a.size()==b.size(),"native instruction count");for(int n=0;n<a.size();n++)ok(VerifySearchHistoryHooks.key(a.get(n)).equals(VerifySearchHistoryHooks.key(b.get(n))),"native instruction "+n);ok(old.getImplementation().getTryBlocks().size()==now.getImplementation().getTryBlocks().size(),"exception handlers");}
 public static void main(String[] args)throws Exception{
  String version=args[0];boolean modern=version.equals("242");var before=VerifySearchHistoryHooks.classes(args[1]);var after=VerifySearchHistoryHooks.classes(args[2]);
  String type=version.equals("191")?"Lo/lo;":modern?"Lo/TTRewardVideoActivity1;":"Ljp/syoboi/a2chMate/RoidonApp$RemoteActionCompatParcelizer;";
  var signature=modern?List.of("Landroid/app/Activity;","I","Landroid/view/View;","Ljava/util/ArrayList;","I","Ljava/util/ArrayList;"):List.of("Landroid/app/Activity;","Landroid/view/View;","Ljava/util/ArrayList;","I");String name=version.equals("191")?"b":"e";
  retained(method(before.get(type),name,signature),method(after.get(type),"haiagaruNativeViewerSelection",signature));
  var wrapper=method(after.get(type),name,signature);ok(wrapper.getImplementation().getRegisterCount()==signature.size()+1,"only one wrapper local");var code=VerifySearchHistoryHooks.code(wrapper);
  ok(code.get(0).getOpcode().name().equals("IF_EQZ")&&((OneRegisterInstruction)code.get(0)).getRegisterA()==(modern?3:2),"null clicked View never expands the native scope");
  var call=(FiveRegisterInstruction)code.get(1);ok(call.getRegisterC()==1&&call.getRegisterD()==(modern?4:3)&&call.getRegisterE()==(modern?5:4),"Activity/list/index forwarded");
  int clickedRegister=modern?3:2;ok(code.stream().noneMatch(i->i.getOpcode().name().startsWith("CONST")&&i instanceof OneRegisterInstruction r&&r.getRegisterA()==clickedRegister),"clicked native View must never be replaced with null");
  ok(((ReferenceInstruction)code.get(1)).getReference().toString().contains("wholeThreadSelection"),"selector runs before native size/type decision");
  String image=version.equals("191")?"Lo/qaf;":modern?"Lo/zzbes;":"Lo/TTRewardExpressVideoActivity;";var urlSignature=List.of("Ljava/lang/String;","I","I");
  Method oldUrl=method(before.get(image),"setImageUrl",urlSignature),newUrl=method(after.get(image),"setImageUrl",urlSignature);
  ok(oldUrl.getImplementation().getRegisterCount()==newUrl.getImplementation().getRegisterCount(),"native image URL registers");
  var oldCode=VerifySearchHistoryHooks.code(oldUrl);var newCode=VerifySearchHistoryHooks.code(newUrl);ok(newCode.size()==oldCode.size()+1,"only one thumbnail retry binding hook");
  ok(((ReferenceInstruction)newCode.get(0)).getReference().toString().contains("VideoThumbnailRetry;->bind"),"failure controls at URL binding");
  var urlArgs=(RegisterRangeInstruction)newCode.get(0);ok(urlArgs.getRegisterCount()==2&&urlArgs.getStartRegister()==newUrl.getImplementation().getRegisterCount()-4,"exact native view/URL parameters");
  for(int n=0;n<oldCode.size();n++)ok(VerifySearchHistoryHooks.key(oldCode.get(n)).equals(VerifySearchHistoryHooks.key(newCode.get(n+1))),"native image URL instruction "+n);
  if(version.equals("226")){
   var menuSignature=List.of("Landroid/view/Menu;","Landroid/view/MenuInflater;");retained(method(before.get("Lo/Yhp5;"),"b",menuSignature),method(after.get("Lo/Yhp5;"),"haiagaruBoardMenu",menuSignature));
   var menu=VerifySearchHistoryHooks.code(method(after.get("Lo/Yhp5;"),"b",menuSignature));ok(menu.stream().filter(i->i instanceof ReferenceInstruction r&&r.getReference().toString().contains("Menu;->add(")).count()==1,"one guarded Search addition");
   retained(method(before.get("Lo/Yhp5;"),"d",List.of("Landroid/view/Menu;")),method(after.get("Lo/Yhp5;"),"d",List.of("Landroid/view/Menu;")));
  }
  System.out.println("PASS "+version+": original media selector preserved, scoped argument expansion; 226 guarded Search with native prepare-menu unchanged");
 }
}
