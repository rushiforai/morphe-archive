import com.android.tools.smali.dexlib2.iface.*;import com.android.tools.smali.dexlib2.iface.instruction.*;import com.android.tools.smali.dexlib2.iface.reference.*;import java.util.*;
public final class VerifyBbsMenuHooks {
 static void ok(boolean b,String s){if(!b)throw new AssertionError(s);}
 static boolean hook(Instruction i,String part){return i instanceof ReferenceInstruction r&&r.getReference().toString().contains(part);}
 static Method parse(ClassDef c){for(Method m:c.getMethods())if(m.getParameterTypes().size()==3&&m.getParameterTypes().get(0).equals("Ljava/lang/String;")&&m.getParameterTypes().get(1).equals("Ljava/lang/String;"))return m;throw new AssertionError("parse method");}
 static void preserved(Method before,Method after,boolean parser){
  ok(before.getImplementation().getRegisterCount()==after.getImplementation().getRegisterCount(),"register count preserved");var original=VerifySearchHistoryHooks.code(before);var patched=VerifySearchHistoryHooks.code(after);var stripped=new ArrayList<Instruction>();int hooks=0;
  for(int n=0;n<patched.size();n++){Instruction i=patched.get(n);
   if(hook(i,"BbsMenuHtml;->")||hook(i,"ExternalBoardGroups;->")){
    if(hook(i,"BbsMenuHtml;->prepare")){ok(n==0,"sanitize before native parsing");var r=(RegisterRangeInstruction)i;int url=after.getImplementation().getRegisterCount()-3;ok(r.getStartRegister()==url&&r.getRegisterCount()==2,"native URL and content arguments");}
    hooks++;if(!hook(i,"regroupLegacy"))n++;continue;
   }stripped.add(i);
  }
  ok(hooks==(parser?2:1),"expected scoped hook count");ok(original.size()==stripped.size(),"original instruction count");for(int n=0;n<original.size();n++)ok(VerifySearchHistoryHooks.key(original.get(n)).equals(VerifySearchHistoryHooks.key(stripped.get(n))),"original instruction "+n);
 }
 public static void main(String[]a)throws Exception{
  String v=a[0];var before=VerifySearchHistoryHooks.classes(a[1]);var after=VerifySearchHistoryHooks.classes(a[2]);String worker="Ljp/syoboi/a2chMate/bbs/BBSMenuUpdateWork;";preserved(parse(before.get(worker)),parse(after.get(worker)),true);
  String group=v.equals("191")?"Lo/MediationServiceImpla;":v.equals("226")?"Lo/ConscryptSocketAdapterCompanion;":"Lo/GoogleApiActivity;";Method bm=null,am=null;
  for(Method m:before.get(group).getMethods())if((!v.equals("242")&&m.getName().equals("<init>"))||(v.equals("242")&&m.getParameterTypes().equals(List.of("Ljava/util/List;","Ljava/util/Collection;","Ljava/lang/String;","Ljava/lang/String;"))))bm=m;
  ok(bm!=null,"fixed grouping factory");for(Method m:after.get(group).getMethods())if(m.getName().equals(bm.getName())&&m.getParameterTypes().equals(bm.getParameterTypes()))am=m;preserved(bm,am,false);
  System.out.println("PASS "+v+": BBS parser/group factory native instructions/registers preserved; scoped input/count/group hooks only");
 }
}
