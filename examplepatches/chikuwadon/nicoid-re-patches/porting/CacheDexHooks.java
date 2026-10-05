import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;
/** Give DEX-only cache helpers the same SAF File constructors as the app methods. */
public class CacheDexHooks {
 static String owner(String type){switch(type){case "Ljava/io/File;":return "Le/e/a/CacheFile;";case "Ljava/io/FileInputStream;":return "Le/e/a/CacheInputStream;";case "Ljava/io/FileOutputStream;":return "Le/e/a/CacheOutputStream;";default:return type;}}
 public static void main(String[] args)throws Exception {
  DexFile dex=DexFileFactory.loadDexFile(new File(args[0]),Opcodes.getDefault());List<ClassDef> out=new ArrayList<>();int count=0;
  for(ClassDef c:dex.getClasses()){
   List<Method> methods=new ArrayList<>();
   for(Method m:c.getMethods()){
    MethodImplementation impl=m.getImplementation();if(impl==null){methods.add(m);continue;}
    MutableMethodImplementation next=new MutableMethodImplementation(impl);
    for(int i=0;i<next.getInstructions().size();i++){
     Instruction ins=next.getInstructions().get(i);if(!(ins instanceof ReferenceInstruction))continue;Reference ref=((ReferenceInstruction)ins).getReference();
     if(ins.getOpcode()==Opcode.NEW_INSTANCE && ref instanceof TypeReference){String type=((TypeReference)ref).getType(),n=owner(type);if(!n.equals(type)){next.replaceInstruction(i,new BuilderInstruction21c(Opcode.NEW_INSTANCE,((OneRegisterInstruction)ins).getRegisterA(),new ImmutableTypeReference(n)));count++;}}
     else if(ref instanceof MethodReference){MethodReference r=(MethodReference)ref;String n=owner(r.getDefiningClass());if(!n.equals(r.getDefiningClass())&&r.getName().equals("<init>")){
      ImmutableMethodReference replacement=new ImmutableMethodReference(n,r.getName(),r.getParameterTypes(),r.getReturnType());
      if(ins instanceof FiveRegisterInstruction){FiveRegisterInstruction f=(FiveRegisterInstruction)ins;next.replaceInstruction(i,new BuilderInstruction35c(ins.getOpcode(),f.getRegisterCount(),f.getRegisterC(),f.getRegisterD(),f.getRegisterE(),f.getRegisterF(),f.getRegisterG(),replacement));}
      else if(ins instanceof RegisterRangeInstruction){RegisterRangeInstruction f=(RegisterRangeInstruction)ins;next.replaceInstruction(i,new BuilderInstruction3rc(ins.getOpcode(),f.getStartRegister(),f.getRegisterCount(),replacement));}
      else throw new IllegalStateException("Unsupported constructor instruction");count++;
     }}
    }
    methods.add(new ImmutableMethod(m.getDefiningClass(),m.getName(),m.getParameters(),m.getReturnType(),m.getAccessFlags(),m.getAnnotations(),m.getHiddenApiRestrictions(),next));
   }
   out.add(new ImmutableClassDef(c.getType(),c.getAccessFlags(),c.getSuperclass(),c.getInterfaces(),c.getSourceFile(),c.getAnnotations(),c.getFields(),methods));
  }
  DexPool.writeTo(args[1],new ImmutableDexFile(dex.getOpcodes(),out));System.out.println("SAF helper hooks: "+count);
 }
}
