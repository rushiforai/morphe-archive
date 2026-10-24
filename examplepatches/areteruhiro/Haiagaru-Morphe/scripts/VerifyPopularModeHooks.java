import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;
import java.util.zip.*;
public class VerifyPopularModeHooks {
 static Map<String,ClassDef> load(String path)throws Exception{Map<String,ClassDef> map=new HashMap<>();try(ZipFile z=new ZipFile(path)){for(var e:Collections.list(z.entries()))if(e.getName().matches("classes[0-9]*\\.dex"))try(var in=new java.io.BufferedInputStream(z.getInputStream(e))){for(ClassDef c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())map.put(c.getType(),c);}}return map;}
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
 static List<String> refs(Method m){List<String> result=new ArrayList<>();for(Instruction i:m.getImplementation().getInstructions())if(i instanceof ReferenceInstruction r&&!r.getReference().toString().contains("Lapp/morphe/extension/"))result.add(i.getOpcode()+" "+r.getReference());return result;}
 public static void main(String[]args)throws Exception{
  String v=args[0],type=v.equals("191")?"Lo/m9ExternalSyntheticLambda1;":v.equals("226")?"Lo/listener;":"Ljp/syoboi/a2chMate/ui/reslist/ResListFragmentViewModel$onBackPressedInput_delegatelambda0$3;";
  String name=v.equals("191")?"c":v.equals("226")?"b":"invokeSuspend";
  Method before=null,after=null;
  for(Method m:load(args[1]).get(type).getMethods())if(m.getName().equals(name)&&m.getParameterTypes().equals(v.equals("242")?List.of("Ljava/lang/Object;"):List.of("Z")))before=m;
  for(Method m:load(args[2]).get(type).getMethods())if(m.getName().equals(name)&&m.getParameterTypes().equals(v.equals("242")?List.of("Ljava/lang/Object;"):List.of("Z")))after=m;
  check(before!=null&&after!=null,"native render method found");check(before.getImplementation().getRegisterCount()==after.getImplementation().getRegisterCount(),"native register allocation unchanged");
  List<String> left=refs(before),right=refs(after);int pos=0;for(String r:right)if(pos<left.size()&&r.equals(left.get(pos)))pos++;check(pos==left.size(),"all native references retained in order");
  int capture=0,threshold=0;List<Instruction> code=new ArrayList<>();after.getImplementation().getInstructions().forEach(code::add);
  for(int i=0;i<code.size();i++)if(code.get(i) instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference ref){
   if(ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/PopularNativeRows;")){
    capture++;FiveRegisterInstruction call=(FiveRegisterInstruction)code.get(i);check(call.getRegisterCount()==2,"capture reads exactly two operands");
    check(call.getRegisterC()==(v.equals("191")?1:v.equals("226")?0:3)&&call.getRegisterD()==(v.equals("191")?4:v.equals("226")?2:0),"verified native capture operands");
   }
   if(ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/PopularReplies;")&&ref.getName().equals("selectThreshold")){
    threshold++;check(code.get(i-1).getOpcode()==Opcode.IGET,"threshold follows native read, never write");check(code.get(i+1).getOpcode()==Opcode.MOVE_RESULT,"threshold result consumed");
    int reg=((FiveRegisterInstruction)code.get(i)).getRegisterC();check(((TwoRegisterInstruction)code.get(i-1)).getRegisterA()==reg&&((OneRegisterInstruction)code.get(i+1)).getRegisterA()==reg,"threshold changes only loaded value");
   }
  }
  check(capture==1&&threshold>0,"exactly one native tree capture and threshold hook");System.out.println("PASS "+v+" native popularity registers, references, capture operands and "+threshold+" threshold reads");
  if(v.equals("242")) {
   ClassDef renderer=load(args[2]).get("Lo/emptyToNull;");Method found=null;
   for(Method m:renderer.getMethods())if(m.getName().equals("c")&&m.getParameterTypes().size()==14&&m.getParameterTypes().get(3).equals("Lo/zzacn;"))found=m;
   check(found!=null,"native display mode parameter found");Instruction observer=null;int observers=0;
   // Other extension entry hooks may precede this observer after patch composition.
   for(Instruction instruction:found.getImplementation().getInstructions())if(instruction instanceof ReferenceInstruction r&&r.getReference().toString().contains("observeConfigWithMode")){observer=instruction;observers++;}
   check(observers==1,"observer receives actual Normal/Tree mode exactly once");
   RegisterRangeInstruction range=(RegisterRangeInstruction)observer;check(range.getRegisterCount()==5&&range.getStartRegister()==found.getImplementation().getRegisterCount()-14+3,"observer reads p3..p7 without changing native arguments");
   System.out.println("PASS 242 actual Normal/Tree parameter forwarded independently of filter selection");
  }
 }
}
