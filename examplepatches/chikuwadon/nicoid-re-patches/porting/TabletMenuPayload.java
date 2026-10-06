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

/** Rebind the current player before a restored menu fragment is attached. */
public final class TabletMenuPayload {
 public static void main(String[] args) throws Exception {
  DexFile dex= DexFileFactory.loadDexFile(new File(args[0]), Opcodes.getDefault());
  List<ClassDef> out=new ArrayList<>(); int hooks=0;
  String menu="Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;", adapter="Le/e/a/k3;";
  List<ClassDef> classes=new ArrayList<>(dex.getClasses());
  String pager="Landroidx/viewpager/widget/ViewPager;";
  if(classes.stream().noneMatch(c->c.getType().equals(pager))) {
   MultiDexContainer<? extends DexFile> apk=DexFileFactory.loadDexContainer(new File(args[2]),Opcodes.getDefault());
   for(String entry:apk.getDexEntryNames()) for(ClassDef c:apk.getEntry(entry).getDexFile().getClasses()) if(c.getType().equals(pager)) {
    List<Method> selected=new ArrayList<>();
    for(Method m:c.getMethods()) if(m.getName().equals("a")&&m.getParameterTypes().equals(Arrays.asList("I","I"))) selected.add(m);
    classes.add(new ImmutableClassDef(c.getType(),c.getAccessFlags(),c.getSuperclass(),c.getInterfaces(),c.getSourceFile(),c.getAnnotations(),c.getFields(),selected));
   }
  }
  for(ClassDef cls:classes) {
   List<Method> methods=new ArrayList<>();
   for(Method m:cls.getMethods()) {
    MutableMethodImplementation code=m.getImplementation()==null?null:new MutableMethodImplementation(m.getImplementation());
    if(code!=null && cls.getType().equals("Landroidx/viewpager/widget/ViewPager;") && m.getName().equals("a") && m.getParameterTypes().equals(Arrays.asList("I","I"))) {
     for(int i=0;i<code.getInstructions().size();i++) {
      Instruction ins=code.getInstructions().get(i);
      if(!(ins instanceof ReferenceInstruction)) continue;
      Object ref=((ReferenceInstruction)ins).getReference();
      if(!(ref instanceof MethodReference)) continue;
      MethodReference r=(MethodReference)ref;
      if(r.getDefiningClass().equals("Ld/k/a/o;") && r.getName().equals("a") && r.getParameterTypes().equals(Arrays.asList("Landroidx/fragment/app/Fragment;"))) {
       // Original v1 is the adapter and v4 is the restored fragment; v5 is dead here.
       Label skip=code.newLabelForIndex(i);
       code.addInstruction(i++,new BuilderInstruction22c(Opcode.INSTANCE_OF,5,1,new ImmutableTypeReference(adapter)));
       code.addInstruction(i++,new BuilderInstruction21t(Opcode.IF_EQZ,5,skip));
       code.addInstruction(i++,new BuilderInstruction22c(Opcode.INSTANCE_OF,5,4,new ImmutableTypeReference(menu)));
       code.addInstruction(i++,new BuilderInstruction21t(Opcode.IF_EQZ,5,skip));
       code.addInstruction(i++,new BuilderInstruction21c(Opcode.CHECK_CAST,1,new ImmutableTypeReference(adapter)));
       code.addInstruction(i++,new BuilderInstruction21c(Opcode.CHECK_CAST,4,new ImmutableTypeReference(menu)));
       code.addInstruction(i++,new BuilderInstruction22c(Opcode.IGET_OBJECT,5,1,new ImmutableFieldReference(adapter,"k","Le/e/a/l3/g;")));
       code.addInstruction(i++,new BuilderInstruction22c(Opcode.IPUT_OBJECT,5,4,new ImmutableFieldReference(menu,"a0","Le/e/a/l3/g;")));
       hooks++; break;
      }
     }
    }
    methods.add(new ImmutableMethod(m.getDefiningClass(),m.getName(),m.getParameters(),m.getReturnType(),m.getAccessFlags(),m.getAnnotations(),m.getHiddenApiRestrictions(),code));
   }
   out.add(new ImmutableClassDef(cls.getType(),cls.getAccessFlags(),cls.getSuperclass(),cls.getInterfaces(),cls.getSourceFile(),cls.getAnnotations(),cls.getFields(),methods));
  }
  if(hooks!=1) throw new AssertionError("Restored menu hook count: "+hooks);
  DexPool.writeTo(args[1],new ImmutableDexFile(dex.getOpcodes(),out));
  System.out.println("Restored menu callback hook inserted");
 }
}
