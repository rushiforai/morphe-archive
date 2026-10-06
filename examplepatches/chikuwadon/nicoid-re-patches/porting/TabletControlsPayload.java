import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;import java.util.*;
public final class TabletControlsPayload {
 public static void main(String[] args)throws Exception{
  DexFile dex=DexFileFactory.loadDexFile(new File(args[0]),Opcodes.getDefault());List<ClassDef> out=new ArrayList<>();int layouts=0,tags=0,removed=0;
  for(ClassDef c:dex.getClasses()){List<Method> methods=new ArrayList<>();for(Method m:c.getMethods()){
   MutableMethodImplementation code=m.getImplementation()==null?null:new MutableMethodImplementation(m.getImplementation());
   if(code!=null&&c.getType().equals("Lcom/sauzask/nicoid/NicoidVideoFragment;")&&m.getName().equals("i")&&m.getParameterTypes().equals(Arrays.asList("I"))){
    for(int i=code.getInstructions().size()-1;i>=0;i--)if(code.getInstructions().get(i).getOpcode()==Opcode.RETURN_VOID){code.addInstruction(i,new BuilderInstruction35c(Opcode.INVOKE_STATIC,1,code.getRegisterCount()-2,0,0,0,0,new ImmutableMethodReference("Le/e/a/FullscreenControls;","update",Arrays.asList("Ljava/lang/Object;"),"V")));layouts++;}
   }
   if(code!=null&&c.getType().equals("Lcom/sauzask/nicoid/NicoidVideoInfoFragment;")&&m.getName().equals("a")&&m.getParameterTypes().size()==3){
    for(int i=0;i<code.getInstructions().size();i++){Instruction ins=code.getInstructions().get(i);if(!(ins instanceof ReferenceInstruction))continue;Reference ref=((ReferenceInstruction)ins).getReference();if(!(ref instanceof MethodReference))continue;MethodReference r=(MethodReference)ref;
     if(r.getDefiningClass().equals("Lorg/json/JSONObject;")&&r.getName().equals("has")){code.addInstruction(i++,new BuilderInstruction35c(Opcode.INVOKE_STATIC,2,14,11,0,0,0,new ImmutableMethodReference("Le/e/a/TagDictionary;","apply",Arrays.asList("Landroid/widget/Button;","Lorg/json/JSONObject;"),"V")));tags++;}
     if(r.getName().equals("setCompoundDrawablesWithIntrinsicBounds")){code.replaceInstruction(i,new BuilderInstruction10x(Opcode.NOP));removed++;}
    }
   }
   methods.add(new ImmutableMethod(m.getDefiningClass(),m.getName(),m.getParameters(),m.getReturnType(),m.getAccessFlags(),m.getAnnotations(),m.getHiddenApiRestrictions(),code));}
   out.add(new ImmutableClassDef(c.getType(),c.getAccessFlags(),c.getSuperclass(),c.getInterfaces(),c.getSourceFile(),c.getAnnotations(),c.getFields(),methods));}
  if(layouts!=1||tags!=1||removed!=1)throw new AssertionError(layouts+"/"+tags+"/"+removed);
  DexPool.writeTo(args[1],new ImmutableDexFile(dex.getOpcodes(),out));System.out.println("PASS: layout refresh and metadata-aware dictionary hook");
 }
}
