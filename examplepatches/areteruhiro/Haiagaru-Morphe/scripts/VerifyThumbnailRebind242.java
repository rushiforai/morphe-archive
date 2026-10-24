import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.io.*;
import java.util.*;
import java.util.zip.*;

/** Original retry bytecode must be intact; only normal bind calls may change. */
public final class VerifyThumbnailRebind242 {
 static ClassDef row(String apk) throws Exception {
  try(ZipFile zip=new ZipFile(apk)){
   for(var entries=zip.entries();entries.hasMoreElements();){var e=entries.nextElement();
    if(!e.getName().matches("classes(?:[0-9]+)?\\.dex"))continue;
    try(var in=new BufferedInputStream(zip.getInputStream(e))){
     for(var c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())
      if(c.getType().equals("Lo/zzbhe;"))return c;
    }
   }
  }throw new AssertionError("Row missing");
 }
 static Method method(ClassDef row,String name){for(var m:row.getMethods())if(m.getName().equals(name))return m;throw new AssertionError(name);}
 static List<Instruction> ops(Method m){var out=new ArrayList<Instruction>();m.getImplementation().getInstructions().forEach(out::add);return out;}
 static String shape(Instruction i){
  String s=i.getOpcode().name();
  if(i instanceof ReferenceInstruction r)s+=" "+r.getReference();
  if(i instanceof FiveRegisterInstruction r)s+=" "+r.getRegisterCount()+":"+r.getRegisterC()+","+r.getRegisterD()+","+r.getRegisterE()+","+r.getRegisterF()+","+r.getRegisterG();
  if(i instanceof TwoRegisterInstruction r)s+=" "+r.getRegisterB();
  if(i instanceof OneRegisterInstruction r)s+=" "+r.getRegisterA();
  if(i instanceof NarrowLiteralInstruction r)s+=" "+r.getNarrowLiteral();
  if(i instanceof OffsetInstruction r)s+=" "+r.getCodeOffset();
  return s;
 }
 public static void main(String[] args)throws Exception{
  var before=row(args[0]);var after=row(args[1]);
  var retry=ops(method(before,"setImageLinks2"));var preserved=ops(method(after,"setImageLinks2"));
  if(!retry.stream().map(VerifyThumbnailRebind242::shape).toList().equals(preserved.stream().map(VerifyThumbnailRebind242::shape).toList()))throw new AssertionError("Explicit retry changed");
  var original=ops(method(before,"setImageLinks"));var bound=ops(method(after,"setImageLinks"));
  if(original.size()!=bound.size())throw new AssertionError("Binding instruction count changed");
  int changed=0;
  for(int n=0;n<original.size();n++){
   var a=original.get(n);var b=bound.get(n);
   if(shape(a).equals(shape(b)))continue;
   if(!(a instanceof ReferenceInstruction ar)||!(ar.getReference() instanceof MethodReference am)||!am.getName().equals("setImageLinks2")||!(b instanceof ReferenceInstruction br)||!(br.getReference() instanceof MethodReference bm)||!bm.getName().equals("haiagaruBindImageLinks"))throw new AssertionError("Unexpected native edit "+n);
   var x=(FiveRegisterInstruction)a;var y=(FiveRegisterInstruction)b;
   if(x.getRegisterC()!=y.getRegisterC()||x.getRegisterD()!=y.getRegisterD()||x.getRegisterE()!=y.getRegisterE()||x.getRegisterF()!=y.getRegisterF())throw new AssertionError("Operands changed");changed++;
  }
  var bridge=method(after,"haiagaruBindImageLinks");var code=ops(bridge);
  if(bridge.getImplementation().getRegisterCount()!=5||code.size()!=3||code.get(0).getOpcode()!=Opcode.CONST_4||((NarrowLiteralInstruction)code.get(0)).getNarrowLiteral()!=0)throw new AssertionError("Bridge registers/constant");
  var invoke=(FiveRegisterInstruction)code.get(1);
  if(invoke.getRegisterC()!=1||invoke.getRegisterD()!=2||invoke.getRegisterE()!=0||invoke.getRegisterF()!=4||code.get(2).getOpcode()!=Opcode.RETURN_VOID||changed==0)throw new AssertionError("Bridge arguments/return");
  System.out.println("PASS "+changed+" bind calls, original operands/branches and explicit retry intact, 5-register bridge passes requery=false");
 }
}
