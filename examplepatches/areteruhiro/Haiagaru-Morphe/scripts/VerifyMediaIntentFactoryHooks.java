import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.util.*;
import java.util.zip.*;
public final class VerifyMediaIntentFactoryHooks {
 static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);}
 static List<ClassDef> classes(String path)throws Exception{
  List<ClassDef> result=new ArrayList<>();try(var zip=new ZipFile(path)){for(var e:Collections.list(zip.entries()))if(e.getName().matches("classes[0-9]*\\.dex"))
   try(var in=new java.io.BufferedInputStream(zip.getInputStream(e))){for(var c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())
    if(c.getType().startsWith("Ljp/syoboi/a2chMate/activity/ImagesViewer2Activity"))result.add(c);}}return result;
 }
 static List<Instruction> code(Method m){var out=new ArrayList<Instruction>();m.getImplementation().getInstructions().forEach(out::add);return out;}
 public static void main(String[] args)throws Exception{
  ClassDef owner=null;Method delegate=null;
  for(var c:classes(args[1]))for(var m:c.getMethods())if(m.getName().equals("haiagaruNativeMediaIntent")){check(delegate==null,"one factory");owner=c;delegate=m;}
  check(delegate!=null,"factory delegate present");Method wrapper=null,original=null;
  for(var m:owner.getMethods())if(!m.getName().equals(delegate.getName())&&m.getReturnType().equals(delegate.getReturnType())&&m.getParameterTypes().equals(delegate.getParameterTypes()))wrapper=m;
  check(wrapper!=null,"wrapper retained");
  for(var c:classes(args[0]))if(c.getType().equals(owner.getType()))for(var m:c.getMethods())if(m.getName().equals(wrapper.getName())&&m.getParameterTypes().equals(wrapper.getParameterTypes()))original=m;
  check(original!=null,"original factory found");var before=code(original);var after=code(delegate);
  check(before.size()==after.size()&&original.getImplementation().getRegisterCount()==delegate.getImplementation().getRegisterCount(),"native code/register count unchanged");
  for(int i=0;i<before.size();i++){
   var a=before.get(i);var z=after.get(i);check(a.getOpcode()==z.getOpcode(),"native opcode");
   if(a instanceof OneRegisterInstruction r)check(r.getRegisterA()==((OneRegisterInstruction)z).getRegisterA(),"native destination");
   if(a instanceof TwoRegisterInstruction r)check(r.getRegisterB()==((TwoRegisterInstruction)z).getRegisterB(),"native source");
   if(a instanceof ReferenceInstruction r)check(r.getReference().toString().equals(((ReferenceInstruction)z).getReference().toString()),"native reference");
   if(a instanceof FiveRegisterInstruction r){var s=(FiveRegisterInstruction)z;check(r.getRegisterCount()==s.getRegisterCount()&&r.getRegisterC()==s.getRegisterC()&&r.getRegisterD()==s.getRegisterD()&&r.getRegisterE()==s.getRegisterE()&&r.getRegisterF()==s.getRegisterF()&&r.getRegisterG()==s.getRegisterG(),"native invocation arguments");}
   if(a instanceof OffsetInstruction r)check(r.getCodeOffset()==((OffsetInstruction)z).getCodeOffset(),"native branch");
  }
  var w=code(wrapper);check(w.size()==4,"four-instruction wrapper");int words=wrapper.getParameterTypes().size()+((wrapper.getAccessFlags()&8)==0?1:0);
  check(wrapper.getImplementation().getRegisterCount()==words+2,"independent result local");
  var invoke=(RegisterRangeInstruction)w.get(0);check(invoke.getStartRegister()==2&&invoke.getRegisterCount()==words,"all original arguments");
  check(((MethodReference)((ReferenceInstruction)w.get(0)).getReference()).getName().equals(delegate.getName()),"native delegate called");
  var hook=(FiveRegisterInstruction)w.get(2);check(hook.getRegisterCount()==2&&hook.getRegisterC()==0&&hook.getRegisterD()==((wrapper.getAccessFlags()&8)==0?3:2),"native intent and original Context retained");
  check(((MethodReference)((ReferenceInstruction)w.get(2)).getReference()).getName().equals("prepareNativeIntent"),"thread media target");
  check(((OneRegisterInstruction)w.get(3)).getRegisterA()==0,"same intent returned");
  System.out.println("PASS native thumbnail intent factory preserves body/arguments/branches and source Context: "+args[1]);
 }
}
