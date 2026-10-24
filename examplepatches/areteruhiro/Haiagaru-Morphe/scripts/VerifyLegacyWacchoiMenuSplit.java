import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.util.*;
import java.util.zip.*;
public final class VerifyLegacyWacchoiMenuSplit {
 static Method load(String file)throws Exception{
  try(ZipFile zip=new ZipFile(file)){for(ZipEntry e:Collections.list(zip.entries()))if(e.getName().matches("classes[0-9]*\\.dex"))
   try(var in=new java.io.BufferedInputStream(zip.getInputStream(e))){for(ClassDef c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())if(c.getType().equals("Lo/pa;"))
    for(Method m:c.getMethods())if(m.getName().equals("c")&&m.getReturnType().equals("V")&&m.getParameterTypes().equals(Arrays.asList("Lo/processAdDisplayErrorPostbackForUserError;","Z","Z")))return m;}}
  throw new AssertionError("191 name menu missing");
 }
 static FiveRegisterInstruction nativeAnchor(Method m){for(var i:m.getImplementation().getInstructions())if(i instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference ref&&ref.getDefiningClass().equals("Lo/setExtraParameter;")&&ref.getName().equals("Td_"))return (FiveRegisterInstruction)i;throw new AssertionError("Native popup missing");}
 public static void main(String[] args)throws Exception{
  Method before=load(args[0]),after=load(args[1]);FiveRegisterInstruction nativeBefore=nativeAnchor(before),nativeAfter=nativeAnchor(after);
  if(before.getImplementation().getRegisterCount()!=after.getImplementation().getRegisterCount()||nativeBefore.getRegisterC()!=nativeAfter.getRegisterC())throw new AssertionError("Native registers changed");
  int count=0;for(var i:after.getImplementation().getInstructions())if(i instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference ref&&ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/WacchoiLongPressMenu;")){
   if(ref.getName().equals("appendLegacyForResponse"))throw new AssertionError("Name menu still uses body visibility");
   if(ref.getName().equals("appendLegacyForName")){FiveRegisterInstruction call=(FiveRegisterInstruction)i;int registers=after.getImplementation().getRegisterCount();
    if(call.getRegisterCount()!=3||call.getRegisterC()!=registers-4||call.getRegisterD()!=nativeAfter.getRegisterC()||call.getRegisterE()!=registers-3)throw new AssertionError("Selected response/owner/menu operands changed");count++;}}
  if(count!=1)throw new AssertionError("Expected one isolated name hook");
  System.out.println("PASS 191 name/body hook split: original native registers and selected response preserved");
 }
}
