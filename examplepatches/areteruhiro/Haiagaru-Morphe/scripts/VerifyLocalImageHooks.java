import java.util.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
public final class VerifyLocalImageHooks {
 static void ok(boolean b,String label){if(!b)throw new AssertionError(label);}
 static Method method(ClassDef c,String name,List<String> args,String returns){for(Method m:c.getMethods())if(m.getName().equals(name)&&m.getParameterTypes().equals(args)&&m.getReturnType().equals(returns))return m;throw new AssertionError(name);}
 static String reference(Instruction i){return i instanceof ReferenceInstruction r?r.getReference().toString():"";}
 public static void main(String[] a)throws Exception{
  String v=a[0],owner=v.equals("191")?"Lo/ndc;":v.equals("226")?"Lo/setFilterBitmap;":"Lo/getEndpointPackageName;",name=v.equals("191")?"a":v.equals("226")?"e":"b";
  var before=VerifySearchHistoryHooks.classes(a[1]);var after=VerifySearchHistoryHooks.classes(a[2]);
  Method old=method(before.get(owner),name,List.of("Ljava/lang/String;"),"Ljava/io/InputStream;"),delegate=method(after.get(owner),"haiagaruNativeCachedImageStream",List.of("Ljava/lang/String;"),"Ljava/io/InputStream;"),wrapper=method(after.get(owner),name,List.of("Ljava/lang/String;"),"Ljava/io/InputStream;");
  ok(old.getImplementation().getRegisterCount()==delegate.getImplementation().getRegisterCount(),"cache registers retained");
  var nativeCode=VerifySearchHistoryHooks.code(old);var actual=VerifySearchHistoryHooks.code(delegate);ok(nativeCode.size()==actual.size(),"cache instruction count");
  for(int n=0;n<nativeCode.size();n++)ok(VerifySearchHistoryHooks.key(nativeCode.get(n)).equals(VerifySearchHistoryHooks.key(actual.get(n))),"cache native instruction "+n);
  var code=VerifySearchHistoryHooks.code(wrapper);ok(code.size()==4,"cache wrapper instruction count");
  ok(reference(code.get(0)).contains("->haiagaruNativeCachedImageStream("),"delegate invoked first");
  ok(code.get(1).getOpcode().name().equals("MOVE_RESULT_OBJECT")&&((OneRegisterInstruction)code.get(1)).getRegisterA()==0,"cache result retained");
  ok(reference(code.get(2)).equals("Lapp/morphe/extension/chmate/LocalImageArchive;->observe(Ljava/lang/String;)V"),"observer hook");
  ok(((FiveRegisterInstruction)code.get(2)).getRegisterC()==2,"observer receives URL parameter");
  ok(code.get(3).getOpcode().name().equals("RETURN_OBJECT")&&((OneRegisterInstruction)code.get(3)).getRegisterA()==0,"original cache stream returned");
  if(v.equals("242")){
   String popup="Lo/zzabe;";List<String> params=List.of("Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;");
   Method p=method(before.get(popup),"c",params,"V"),q=method(after.get(popup),"c",params,"V");
   ok(p.getImplementation().getRegisterCount()==q.getImplementation().getRegisterCount(),"popup registers unchanged");
   var expected=VerifySearchHistoryHooks.code(p);var patched=VerifySearchHistoryHooks.code(q);var remaining=new ArrayList<Instruction>();int hooks=0;
   for(int n=0;n<patched.size();n++){
    if(reference(patched.get(n)).equals("Lapp/morphe/extension/chmate/SiteThreadMetadata;->popupEpoch(JLjava/lang/Object;)J")){
     var invoke=(FiveRegisterInstruction)patched.get(n);ok(invoke.getRegisterCount()==3&&invoke.getRegisterC()==6&&invoke.getRegisterD()==7&&invoke.getRegisterE()==3,"popup exact wide and loaded response registers");
     ok(reference(patched.get(n-2)).equals("Ljava/lang/Number;->longValue()J"),"popup after native ID read");
     ok(patched.get(++n).getOpcode().name().equals("MOVE_RESULT_WIDE")&&((OneRegisterInstruction)patched.get(n)).getRegisterA()==6,"popup wide result");hooks++;
    }else remaining.add(patched.get(n));
   }
   ok(hooks==1&&remaining.size()==expected.size(),"one popup hook; all original instructions retained");
   for(int n=0;n<expected.size();n++)ok(VerifySearchHistoryHooks.key(expected.get(n)).equals(VerifySearchHistoryHooks.key(remaining.get(n))),"popup native instruction "+n);
  }
  System.out.println("PASS "+v+": native cache and popup register/instruction preservation");
 }
}
