import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.nio.ByteBuffer;
import java.util.*;
import java.util.zip.*;
public class VerifyImageNgRuntimeSafety {
 static void check(boolean b,String s){if(!b)throw new AssertionError(s);}
 static Method score(String path)throws Exception{
  try(ZipFile z=new ZipFile(path)){
   for(var e:Collections.list(z.entries()))if(e.getName().matches("classes[0-9]*\\.dex"))
    for(var c:new DexBackedDexFile(null,ByteBuffer.wrap(z.getInputStream(e).readAllBytes())).getClasses())
     if(c.getType().equals("Lo/oca;"))for(var m:c.getMethods())if(m.getName().equals("VA_")&&m.getReturnType().equals("F"))return m;
  }throw new AssertionError("score missing");
 }
 static List<Instruction> instructions(Method m){List<Instruction> a=new ArrayList<>();m.getImplementation().getInstructions().forEach(a::add);return a;}
 public static void main(String[] args)throws Exception{
  Method original=score(args[0]),patched=score(args[1]);var old=instructions(original);var now=instructions(patched);
  check(patched.getImplementation().getRegisterCount()==original.getImplementation().getRegisterCount(),"register count");
  check(patched.getImplementation().getRegisterCount()>=4,"scratch is not parameter");
  check(((MethodReference)((ReferenceInstruction)now.get(0)).getReference()).getName().equals("allow191Inference"),"guard target");
  check(((OneRegisterInstruction)now.get(1)).getRegisterA()==0&&((OneRegisterInstruction)now.get(2)).getRegisterA()==0,"guard result and branch register");
  check(now.get(2).getOpcode().name().equals("IF_NEZ"),"safe branch");
  check(((OffsetInstruction)now.get(2)).getCodeOffset()==now.get(2).getCodeUnits()+now.get(3).getCodeUnits()+now.get(4).getCodeUnits(),"safe branch lands at original entry");
  check(((NarrowLiteralInstruction)now.get(3)).getNarrowLiteral()==0&&now.get(4).getOpcode().name().equals("RETURN"),"unsafe float zero return");
  check(now.size()==old.size()+5,"five added guard instructions");
  for(int i=0;i<old.size();i++){
   Instruction a=old.get(i),b=now.get(i+5);check(a.getOpcode()==b.getOpcode(),"original opcode "+i);
   if(a instanceof ReferenceInstruction x)check(x.getReference().toString().equals(((ReferenceInstruction)b).getReference().toString()),"original reference "+i);
   if(a instanceof OneRegisterInstruction x)check(x.getRegisterA()==((OneRegisterInstruction)b).getRegisterA(),"original A "+i);
   if(a instanceof TwoRegisterInstruction x)check(x.getRegisterB()==((TwoRegisterInstruction)b).getRegisterB(),"original B "+i);
   if(a instanceof ThreeRegisterInstruction x)check(x.getRegisterC()==((ThreeRegisterInstruction)b).getRegisterC(),"original C "+i);
   if(a instanceof FiveRegisterInstruction x){var y=(FiveRegisterInstruction)b;check(x.getRegisterCount()==y.getRegisterCount()&&x.getRegisterC()==y.getRegisterC()&&x.getRegisterD()==y.getRegisterD()&&x.getRegisterE()==y.getRegisterE()&&x.getRegisterF()==y.getRegisterF()&&x.getRegisterG()==y.getRegisterG(),"original invoke registers "+i);}
   if(a instanceof OffsetInstruction x)check(x.getCodeOffset()==((OffsetInstruction)b).getCodeOffset(),"original branch "+i);
  }
  System.out.println("PASS runtime gate; original "+old.size()+" instructions and registers preserved");
 }
}
