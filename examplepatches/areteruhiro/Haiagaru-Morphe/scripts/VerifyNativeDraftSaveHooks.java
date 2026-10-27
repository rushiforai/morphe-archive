import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.util.*;
import java.util.zip.*;
import java.io.*;

/** The external-post cleanup must use the same native draft writer as onPause. */
public final class VerifyNativeDraftSaveHooks {
 public static void main(String[] args)throws Exception {
  int checked=0;
  try(ZipFile zip=new ZipFile(args[0])){
   for(var es=zip.entries();es.hasMoreElements();){var entry=es.nextElement();
    if(!entry.getName().matches("classes[0-9]*\\.dex"))continue;
    try(var in=new BufferedInputStream(zip.getInputStream(entry))){
     for(var cls:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses()){
      if(!Set.of("Lo/p9ExternalSyntheticLambda6;","Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;").contains(cls.getType()))continue;
      Method wrapper=null,pause=null;
      for(var method:cls.getMethods()){
       if(method.getName().equals("haiagaruSaveExternalDraft"))wrapper=method;
       if(method.getName().equals("onPause")&&method.getParameterTypes().isEmpty())pause=method;
      }
      if(wrapper==null||pause==null||wrapper.getImplementation().getRegisterCount()!=2)throw new AssertionError("Native save wrapper missing");
      Set<String> writers=new HashSet<>();
      for(var i:pause.getImplementation().getInstructions())if(i instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference m
        &&m.getDefiningClass().equals(cls.getType())&&m.getParameterTypes().equals(List.of("Z"))&&m.getReturnType().equals("V"))writers.add(m.toString());
      int count=0;boolean force=false,delegate=false;
      for(var i:wrapper.getImplementation().getInstructions()){
       count++;
       if(i.getOpcode().name.equals("const/4")&&i instanceof NarrowLiteralInstruction n&&n.getNarrowLiteral()==1&&i instanceof OneRegisterInstruction r&&r.getRegisterA()==0)force=true;
       if(i instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference m&&writers.contains(m.toString())){
        if(!(i instanceof FiveRegisterInstruction regs)||regs.getRegisterCount()!=2||regs.getRegisterC()!=1||regs.getRegisterD()!=0)throw new AssertionError("Invalid owner/boolean registers");
        delegate=true;
       }
      }
      if(count!=3||!force||!delegate)throw new AssertionError("Draft writer delegation changed");
      checked++;
     }
    }
   }
  }
  if(checked!=1)throw new AssertionError("Expected one native posting editor");
  System.out.println("PASS native draft persistence wrapper: exact onPause writer, force=true, owner/registers preserved");
 }
}
