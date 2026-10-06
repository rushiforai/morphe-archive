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

/** Preserve the original Activity apply timing and other DynamicTheme helpers. */
public final class ThemePayload {
 public static void main(String[] args) throws Exception {
  DexFile dex=DexFileFactory.loadDexFile(new File(args[0]),Opcodes.getDefault());
  List<ClassDef> out=new ArrayList<>(); int redirects=0,settings=0;
  for(ClassDef c:dex.getClasses()) {
   List<Method> methods=new ArrayList<>();
   for(Method m:c.getMethods()) {
    MethodImplementation impl=m.getImplementation();
    if(c.getType().equals("Le/e/a/DynamicTheme;") && Arrays.asList("apply","isNight","textColor","background","button").contains(m.getName())) {
     List<BuilderInstruction> code=new ArrayList<>();
     code.add(new BuilderInstruction35c(Opcode.INVOKE_STATIC,1,1,0,0,0,0,new ImmutableMethodReference("Le/e/a/ThemeChoice;",m.getName(),m.getParameterTypes(),m.getReturnType())));
     if(!m.getReturnType().equals("V")) code.add(new BuilderInstruction11x(Opcode.MOVE_RESULT,0));
     code.add(m.getReturnType().equals("V")?new BuilderInstruction10x(Opcode.RETURN_VOID):new BuilderInstruction11x(Opcode.RETURN,0));
     impl=new ImmutableMethodImplementation(2,code,Collections.emptyList(),Collections.emptyList()); redirects++;
    }
    if(c.getType().equals("Lcom/sauzask/nicoid/NicoidSetting;") && m.getName().equals("onCreate")) {
     MutableMethodImplementation code=new MutableMethodImplementation(impl);
     for(int i=0;i<code.getInstructions().size();i++) {
      Instruction ins=code.getInstructions().get(i);
      if(ins instanceof ReferenceInstruction && ((ReferenceInstruction)ins).getReference() instanceof StringReference &&
       ((StringReference)((ReferenceInstruction)ins).getReference()).getString().equals("material_you_mode")) {
       int end=i;
       while(end<code.getInstructions().size()) {
        Instruction next=code.getInstructions().get(end);
        if(next instanceof ReferenceInstruction && ((ReferenceInstruction)next).getReference() instanceof MethodReference &&
         ((MethodReference)((ReferenceInstruction)next).getReference()).getName().equals("setOnPreferenceClickListener")) break;
        end++;
       }
       if(end>=code.getInstructions().size())throw new AssertionError("Settings listener missing");
       for(int n=end;n>=i;n--)code.removeInstruction(n);
       code.addInstruction(i,new BuilderInstruction35c(Opcode.INVOKE_STATIC,1,code.getRegisterCount()-2,0,0,0,0,new ImmutableMethodReference("Le/e/a/ThemeChoice;","settings",Arrays.asList("Landroid/preference/PreferenceActivity;"),"V")));
       settings++; break;
      }
     }
     impl=code;
    }
    methods.add(new ImmutableMethod(m.getDefiningClass(),m.getName(),m.getParameters(),m.getReturnType(),m.getAccessFlags(),m.getAnnotations(),m.getHiddenApiRestrictions(),impl));
   }
   out.add(new ImmutableClassDef(c.getType(),c.getAccessFlags(),c.getSuperclass(),c.getInterfaces(),c.getSourceFile(),c.getAnnotations(),c.getFields(),methods));
  }
  if(!(redirects==5&&settings==0 || redirects==0&&settings==1))throw new AssertionError("Hook counts: "+redirects+"/"+settings);
  DexPool.writeTo(args[1],new ImmutableDexFile(dex.getOpcodes(),out));
  System.out.println("Theme hooks verified: "+redirects+"/"+settings);
 }
}
