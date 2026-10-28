import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.util.*;import java.util.zip.*;
public class VerifyCachedSearchOrderHooks{
 static List<Method> methods(String path)throws Exception{List<Method> all=new ArrayList<>();try(var zip=new ZipFile(path)){for(var e:Collections.list(zip.entries()))if(e.getName().matches("classes[0-9]*\\.dex"))try(var in=new java.io.BufferedInputStream(zip.getInputStream(e))){for(var c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())if(c.getType().equals(argsOwner))c.getMethods().forEach(all::add);}}return all;}
 static String argsOwner;static void check(boolean b,String s){if(!b)throw new AssertionError(s);}
 static List<Instruction> code(Method m){List<Instruction> r=new ArrayList<>();m.getImplementation().getInstructions().forEach(r::add);return r;}
 public static void main(String[] args)throws Exception{
  boolean old=args[2].equals("191");argsOwner=old?"Ljp/syoboi/a2chMate/fragment/SearchFragment$1;":args[2].equals("226")?"Lo/deprecated_read;":"Lo/RDh4;";
  List<Method> originals=methods(args[0]),patched=methods(args[1]);int count=0;
  for(var m:patched)if(m.getImplementation()!=null){var p=code(m);int index=-1;for(int n=0;n<p.size();n++)if(p.get(n) instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference ref&&ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/CachedSearchOrder;"))index=n;
   if(index<0)continue;count++;final Method pm=m;Method original=originals.stream().filter(o->o.getName().equals(pm.getName())&&o.getParameterTypes().equals(pm.getParameterTypes())).findFirst().orElseThrow();
   var before=code(original);check(original.getImplementation().getRegisterCount()==m.getImplementation().getRegisterCount(),"native registers unchanged");
   if(old){check(((MethodReference)((ReferenceInstruction)p.get(index+1)).getReference()).getName().equals("notifyDataSetChanged"),"sort before native notify");
    int receiver=((RegisterRangeInstruction)p.get(index)).getStartRegister();check(((FiveRegisterInstruction)p.get(index+1)).getRegisterC()==receiver,"same adapter");p.remove(index);
   }else{check(index==0&&p.size()==before.size()+3,"bounded projection hook");int start=((RegisterRangeInstruction)p.get(0)).getStartRegister();
    check(start==m.getImplementation().getRegisterCount()-m.getParameterTypes().size(),"state only");
    check(((OneRegisterInstruction)p.get(1)).getRegisterA()==start&&((OneRegisterInstruction)p.get(2)).getRegisterA()==start,"replace own parameter only");p.subList(0,3).clear();}
   check(p.size()==before.size(),"native body length");for(int n=0;n<p.size();n++){var a=before.get(n);var b=p.get(n);check(a.getOpcode()==b.getOpcode(),"native opcode");if(a instanceof ReferenceInstruction r)check(r.getReference().toString().equals(((ReferenceInstruction)b).getReference().toString()),"native target");if(a instanceof OneRegisterInstruction r)check(r.getRegisterA()==((OneRegisterInstruction)b).getRegisterA(),"native A");if(a instanceof TwoRegisterInstruction r)check(r.getRegisterB()==((TwoRegisterInstruction)b).getRegisterB(),"native B");}
  }check(count==1,"one scoped cached search order hook");System.out.println("PASS "+args[2]+" cached-search scope, native registers/body and projection target");
 }
}
