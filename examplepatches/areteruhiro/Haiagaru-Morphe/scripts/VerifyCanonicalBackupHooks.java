import java.util.*;import com.android.tools.smali.dexlib2.iface.*;import com.android.tools.smali.dexlib2.iface.instruction.*;import com.android.tools.smali.dexlib2.iface.reference.*;

/** Exact scoped I/O substitutions, register preservation and adjusted branch targets. */
public final class VerifyCanonicalBackupHooks {
 static final String H="Lapp/morphe/extension/chmate/NativeBackupPreferences;";
 static void ok(boolean v,String s){if(!v)throw new AssertionError(s);}
 static List<Instruction> code(Method m){List<Instruction> out=new ArrayList<>();m.getImplementation().getInstructions().forEach(out::add);return out;}
 static Method method(ClassDef c,Method original){for(Method m:c.getMethods())if(m.getName().equals(original.getName())&&m.getParameterTypes().equals(original.getParameterTypes())&&m.getReturnType().equals(original.getReturnType()))return m;throw new AssertionError(original);}
 static MethodReference ref(Instruction i){return i instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference m?m:null;}
 static int[] offsets(List<Instruction> code){int[] out=new int[code.size()+1];for(int n=0;n<code.size();n++)out[n+1]=out[n]+code.get(n).getCodeUnits();return out;}
 public static void main(String[] args)throws Exception{
  String v=args[0];var before=VerifySearchHistoryHooks.classes(args[1]);var after=VerifySearchHistoryHooks.classes(args[2]);
  String export=v.equals("191")?"Lo/setRevenueListener;":v.equals("226")?"Lo/readControlFrame;":"Ljp/syoboi/a2chMate/feature/backupandrestore/BackupAndRestoreViewModel;";
  String restore=v.equals("191")?"Lo/setFormat$2;":v.equals("226")?"Lo/getUtf8;":"Ljp/syoboi/a2chMate/feature/backupandrestore/BackupPreviewViewModel;";
  String allow=v.equals("191")?"Lo/showFullscreenAd$RemoteActionCompatParcelizer;":v.equals("226")?"Lo/CloseGuard$read;":"Lo/setBackupListener;";
  Method init=null;for(Method m:before.get(allow).getMethods())if(m.getName().equals("<clinit>"))init=m;
  var a=code(init);var b=code(method(after.get(allow),init));ok(a.size()==b.size(),"canonical allowlist length");
  for(int n=0;n<a.size();n++)ok(VerifySearchHistoryHooks.key(a.get(n)).equals(VerifySearchHistoryHooks.key(b.get(n))),"original allowlist is unchanged");
  int workers=0;
  for(String type:List.of(export,restore))for(Method m:before.get(type).getMethods()){
   boolean writing=type.equals(export);boolean selected=writing?m.getReturnType().equals("Ljava/io/File;")&&m.getName().equals(v.equals("191")?"d":v.equals("226")?"a":"d"):v.equals("191")?m.getName().equals("run"):m.getParameterTypes().equals(List.of(type,"Ljava/io/File;"))&&m.getReturnType().equals("V");
   if(!selected)continue;workers++;Method patched=method(after.get(type),m);ok(m.getImplementation().getRegisterCount()==patched.getImplementation().getRegisterCount(),"worker register count retained");
   a=code(m);b=code(patched);Set<Integer> allocations=new HashSet<>();
   for(int n=0;n<a.size();n++){var r=ref(a.get(n));if(r!=null&&r.getDefiningClass().equals("Ljava/io/File;")&&r.getName().equals("<init>")&&r.getParameterTypes().equals(List.of("Ljava/io/File;","Ljava/lang/String;"))){int target=((FiveRegisterInstruction)a.get(n)).getRegisterC();for(int k=n-1;k>=0;k--)if(a.get(k).getOpcode().name().equals("NEW_INSTANCE")&&((OneRegisterInstruction)a.get(k)).getRegisterA()==target){allocations.add(k);break;}}}
   int[] mapping=new int[a.size()];int p=0,files=0,prefs=0;
   if(v.equals("191")&&!writing){
    ok(ref(b.get(0)).toString().equals("Lapp/morphe/extension/chmate/NativeRestore191;->beginRestore(Ljava/lang/Object;)Z"),"existing duplicate-restore guard");
    ok(b.get(1).getOpcode().name().equals("MOVE_RESULT")&&b.get(2).getOpcode().name().equals("IF_NEZ")&&b.get(3).getOpcode().name().equals("RETURN_VOID")&&b.get(4).getOpcode().name().equals("NOP"),"existing restore guard control flow");
    p=5;
   }
   for(int n=0;n<a.size();n++){mapping[n]=p;Instruction x=a.get(n),y=b.get(p++);var r=ref(x);
    if(allocations.contains(n)){ok(y.getOpcode().name().equals("NOP"),"factory replaces matching allocation only");continue;}
    if(r!=null&&r.getDefiningClass().equals("Ljava/io/File;")&&r.getName().equals("<init>")&&r.getParameterTypes().equals(List.of("Ljava/io/File;","Ljava/lang/String;"))){
     var old=(FiveRegisterInstruction)x;var call=(FiveRegisterInstruction)y;ok(ref(y).getDefiningClass().equals(H)&&ref(y).getName().equals(writing?"exportFile":"restoreFile"),"correct I/O direction");ok(call.getRegisterCount()==2&&call.getRegisterC()==old.getRegisterD()&&call.getRegisterD()==old.getRegisterE(),"factory keeps parent and name operands");Instruction move=b.get(p++);ok(move.getOpcode().name().equals("MOVE_RESULT_OBJECT")&&((OneRegisterInstruction)move).getRegisterA()==old.getRegisterC(),"file result uses original object register");files++;continue;
    }
    if(r!=null&&r.getName().equals("getSharedPreferences")){ok(ref(y).getDefiningClass().equals(H)&&ref(y).getName().equals("preferences"),"restore targets real current-package preferences");if(x instanceof FiveRegisterInstruction old){var call=(FiveRegisterInstruction)y;ok(old.getRegisterC()==call.getRegisterC()&&old.getRegisterD()==call.getRegisterD()&&old.getRegisterE()==call.getRegisterE(),"preference context/name/mode operands retained");}prefs++;continue;}
    if(v.equals("191")&&!writing&&r!=null&&(r.getDefiningClass().equals("Ljava/lang/Thread;")||r.getDefiningClass().equals(restore))&&r.getName().equals("interrupted")){ok(ref(y).toString().equals("Lapp/morphe/extension/chmate/NativeRestore191;->isInterrupted()Z"),"existing safe interruption hook retained");continue;}
    ok(x.getOpcode()==y.getOpcode(),"unrelated opcode retained "+n);
    if(x instanceof OffsetInstruction||x instanceof SwitchPayload)continue;
    ok(VerifySearchHistoryHooks.key(x).equals(VerifySearchHistoryHooks.key(y)),"unrelated instruction retained "+n+" before="+VerifySearchHistoryHooks.key(x)+" after="+VerifySearchHistoryHooks.key(y));
   }
   ok(p==b.size()&&files>0&&(writing?prefs==0:prefs==1),"all I/O sites accounted for");int[] ac=offsets(a),bc=offsets(b);Map<Integer,Integer> byOffset=new HashMap<>();for(int n=0;n<a.size();n++)byOffset.put(ac[n],n);
   for(int n=0;n<a.size();n++)if(a.get(n) instanceof OffsetInstruction old){int target=byOffset.get(ac[n]+old.getCodeOffset());var changed=(OffsetInstruction)b.get(mapping[n]);ok(bc[mapping[n]]+changed.getCodeOffset()==bc[mapping[target]],"branch targets retained");}
   for(int n=0;n<a.size();n++)if(a.get(n) instanceof SwitchPayload payload){int owner=-1;for(int k=0;k<a.size();k++)if(a.get(k) instanceof OffsetInstruction jump&&ac[k]+jump.getCodeOffset()==ac[n]){owner=k;break;}ok(owner>=0,"switch owner");var cases=((SwitchPayload)b.get(mapping[n])).getSwitchElements();ok(cases.size()==payload.getSwitchElements().size(),"switch size");for(int k=0;k<cases.size();k++){var old=payload.getSwitchElements().get(k);int target=byOffset.get(ac[owner]+old.getOffset());ok(cases.get(k).getKey()==old.getKey()&&bc[mapping[owner]]+cases.get(k).getOffset()==bc[mapping[target]],"switch targets retained");}}
  }
  ok(workers==2,"both native workers verified");System.out.println("PASS "+v+" canonical backup allowlist/I-O operands/registers/branches");
 }
}
