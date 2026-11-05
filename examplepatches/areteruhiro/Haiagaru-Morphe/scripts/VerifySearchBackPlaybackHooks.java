import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;

/** Compare against 1.23.0, including every native instruction and register. */
public final class VerifySearchBackPlaybackHooks {
 static Method method(ClassDef c,String name,List<String> parameters){for(Method m:c.getMethods())if(m.getName().equals(name)&&m.getParameterTypes().equals(parameters))return m;throw new AssertionError(c+" "+name);}
 static void retained(Method before,Method after,int prefix,int changes){
  VerifySearchHistoryHooks.check(before.getImplementation().getRegisterCount()==after.getImplementation().getRegisterCount(),"native registers");
  var b=VerifySearchHistoryHooks.code(before);var n=VerifySearchHistoryHooks.code(after);
  VerifySearchHistoryHooks.check(n.size()==b.size()+prefix,"instruction count");int different=0;
  for(int i=0;i<b.size();i++)if(!VerifySearchHistoryHooks.key(b.get(i)).equals(VerifySearchHistoryHooks.key(n.get(i+prefix))))different++;
  VerifySearchHistoryHooks.check(different==changes,"native instructions retained: "+different);
 }
 public static void main(String[] args)throws Exception{
  String v=args[0];boolean old=v.equals("191"),mid=v.equals("226");
  var b=VerifySearchHistoryHooks.classes(args[1]);var n=VerifySearchHistoryHooks.classes(args[2]);
  String image=old?"Lo/qaf;":mid?"Lo/TTRewardExpressVideoActivity;":"Lo/zzbes;",row=old?"Lo/qrExternalSyntheticLambda2;":mid?"Lo/setCornerBottomRightRadius;":"Lo/zzbhe;";
  var params=List.of("[Ljava/lang/CharSequence;","Z","Z");String bind=old?"a":"setImageLinks";
  retained(method(b.get(row),bind,params),method(n.get(row),bind,params),0,1);
  int calls=0;for(var i:VerifySearchHistoryHooks.code(method(n.get(row),bind,params)))if(i instanceof ReferenceInstruction r&&r.getReference().toString().contains("->haiagaruBindOverlay("))calls++;
  VerifySearchHistoryHooks.check(calls==1,"one native row overlay clear guarded");
  var url=List.of("Ljava/lang/String;","I","I");retained(method(b.get(image),"setImageUrl",url),method(n.get(image),"setImageUrl",url),1,0);
  for(var m:b.get(image).getMethods())if(m.getImplementation()!=null&&!m.getName().equals("setImageUrl"))retained(m,method(n.get(image),m.getName(),m.getParameterTypes().stream().map(Object::toString).toList()),0,0);
  String fragment=old?"Lo/pa;":"Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;";
  if(!mid){String update=old?"A":"q";Method after=method(n.get(fragment),update,List.of());retained(method(b.get(fragment),update,List.of()),after,1,0);
   var first=VerifySearchHistoryHooks.code(after).get(0);VerifySearchHistoryHooks.check(first.getOpcode().name().equals("INVOKE_SUPER_RANGE"),"native superclass updater");
  }else retained(method(b.get("Ljp/syoboi/a2chMate/fragment/RoidonListFragment;"),"v",List.of()),method(n.get("Ljp/syoboi/a2chMate/fragment/RoidonListFragment;"),"v",List.of()),0,0);
  System.out.println("PASS "+v+": Back delegation, row overlay guard, URL boundary; all other native image instructions/registers retained");
 }
}
