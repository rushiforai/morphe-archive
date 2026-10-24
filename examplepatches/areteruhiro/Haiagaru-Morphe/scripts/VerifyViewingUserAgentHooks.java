import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;
import java.util.zip.*;
import java.nio.*;

public class VerifyViewingUserAgentHooks {
 static final String UA="Lapp/morphe/extension/chmate/ViewingUserAgent;";
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
 static Map<String,ClassDef> load(String path)throws Exception{
  Map<String,ClassDef> out=new HashMap<>();try(var zip=new ZipFile(path)){
   for(var entry:Collections.list(zip.entries()))if(entry.getName().matches("classes[0-9]*\\.dex")){
    byte[] bytes;try(var in=zip.getInputStream(entry)){bytes=in.readAllBytes();}
    for(var cls:new DexBackedDexFile(Opcodes.getDefault(),ByteBuffer.wrap(bytes)).getClasses())out.put(cls.getType(),cls);
   }
  }return out;
 }
 static List<Instruction> code(Method m){var out=new ArrayList<Instruction>();m.getImplementation().getInstructions().forEach(out::add);return out;}
 static int[] offsets(List<Instruction> code){int[] out=new int[code.size()+1];for(int i=0;i<code.size();i++)out[i+1]=out[i]+code.get(i).getCodeUnits();return out;}
 static boolean hook(Instruction i){return i instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference m&&m.getDefiningClass().equals(UA)&&m.getName().equals("prepareRequest");}
 public static void main(String[] args)throws Exception{
  String type=switch(args[0]){case "191"->"Lo/r8lambda17vlhACr7B0IDgCdn1Q67LKhir8;";case "226"->"Lo/zzdA;";default->"Lo/zzcvq;";};
  var before=load(args[1]);var after=load(args[2]);int methods=0,calls=0;
  check(!after.containsKey("Lapp/morphe/extension/chmate/ImgurUploadErrors;"),"cancelled upload changes absent");
  for(Method old:before.get(type).getMethods())if(old.getName().equals("<init>")){
   Method current=null;for(Method m:after.get(type).getMethods())if(m.getName().equals("<init>")&&m.getParameterTypes().equals(old.getParameterTypes()))current=m;
   check(current!=null,"constructor preserved");check(old.getImplementation().getRegisterCount()==current.getImplementation().getRegisterCount(),"register count preserved");
   var left=code(old);var right=code(current);int[] map=new int[left.size()+1];int cursor=0;
   for(int i=0;i<left.size();i++){
    map[i]=cursor;
    if(hook(right.get(cursor))){check(left.get(i).getOpcode()==Opcode.RETURN_VOID,"hook before return only");
     var invocation=(RegisterRangeInstruction)right.get(cursor);int words=old.getParameterTypes().stream().mapToInt(p->p.toString().equals("J")||p.toString().equals("D")?2:1).sum();
     check(invocation.getRegisterCount()==1&&invocation.getStartRegister()==old.getImplementation().getRegisterCount()-words-1,"constructor receiver preserved");cursor++;calls++;}
    Instruction a=left.get(i),b=right.get(cursor++);check(a.getOpcode()==b.getOpcode(),"original opcode");
    if(a instanceof OneRegisterInstruction r)check(r.getRegisterA()==((OneRegisterInstruction)b).getRegisterA(),"A operand");
    if(a instanceof TwoRegisterInstruction r)check(r.getRegisterB()==((TwoRegisterInstruction)b).getRegisterB(),"B operand");
    if(a instanceof ThreeRegisterInstruction r)check(r.getRegisterC()==((ThreeRegisterInstruction)b).getRegisterC(),"C operand");
    if(a instanceof FiveRegisterInstruction r){var s=(FiveRegisterInstruction)b;check(r.getRegisterCount()==s.getRegisterCount()&&r.getRegisterC()==s.getRegisterC()&&r.getRegisterD()==s.getRegisterD()&&r.getRegisterE()==s.getRegisterE()&&r.getRegisterF()==s.getRegisterF()&&r.getRegisterG()==s.getRegisterG(),"call operands");}
    if(a instanceof RegisterRangeInstruction r){var s=(RegisterRangeInstruction)b;check(r.getStartRegister()==s.getStartRegister()&&r.getRegisterCount()==s.getRegisterCount(),"range operands");}
    if(a instanceof ReferenceInstruction r)check(r.getReference().toString().equals(((ReferenceInstruction)b).getReference().toString()),"native reference");
    if(a instanceof WideLiteralInstruction r)check(r.getWideLiteral()==((WideLiteralInstruction)b).getWideLiteral(),"native literal");
   }
   map[left.size()]=cursor;check(cursor==right.size(),"no unexpected instructions");
   int[] x=offsets(left),y=offsets(right);
   for(int i=0;i<left.size();i++)if(left.get(i) instanceof OffsetInstruction branch){int target=Arrays.binarySearch(x,x[i]+branch.getCodeOffset());check(target>=0,"valid old branch");int j=map[i];if(hook(right.get(j)))j++;check(y[j]+((OffsetInstruction)right.get(j)).getCodeOffset()==y[map[target]],"branch retains destination including hook");}
   methods++;
  }
  int boundaries=0;for(ClassDef cls:after.values())if(!cls.getType().startsWith("Lapp/morphe/extension/"))for(Method m:cls.getMethods())if(m.getImplementation()!=null)for(Instruction ins:m.getImplementation().getInstructions())if(ins instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference ref&&ref.getDefiningClass().equals(UA))boundaries++;
  check(methods>0&&calls>=methods&&boundaries>calls,"constructor and java.net boundaries installed");
  System.out.println("PASS "+args[0]+" UA: "+methods+" constructors, operands/branches preserved, "+boundaries+" boundaries, cancelled upload helper absent");
 }
}
