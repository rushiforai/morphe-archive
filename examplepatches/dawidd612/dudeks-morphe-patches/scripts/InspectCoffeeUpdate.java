import java.io.*;import java.util.*;import com.android.tools.smali.dexlib2.*;import com.android.tools.smali.dexlib2.iface.*;import com.android.tools.smali.dexlib2.iface.instruction.*;import com.android.tools.smali.dexlib2.iface.reference.*;
class InspectCoffeeUpdate {
 public static void main(String[] a)throws Exception{
 var d=DexFileFactory.loadDexContainer(new File(a[0]),Opcodes.getDefault());
 for(var e:d.getDexEntryNames()) for(var c:d.getEntry(e).getDexFile().getClasses()){
 var methods=new ArrayList<Method>();c.getMethods().forEach(methods::add);
 var fields=new ArrayList<Field>();c.getFields().forEach(fields::add);
 if(methods.isEmpty()) for(var f:fields) if(AccessFlags.STATIC.isSet(f.getAccessFlags()) && f.getInitialValue()==null && (f.getType().equals("Ljava/lang/String;")||f.getType().equals("Ljava/lang/reflect/Method;"))) System.out.println("FIELD "+c.getType()+" "+f.getName()+" "+f.getType());
 for(var m:methods){
 if(c.getType().contains("unity/androidbridge")||c.getType().startsWith("Lcom/tapblaze/")&&!c.getType().contains("/R")) System.out.println("METHOD "+m);
 if(m.getImplementation()!=null) for(var i:m.getImplementation().getInstructions()) if(i instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference ref&&ref.getDefiningClass().equals("Lcom/pairip/VMRunner;")&&ref.getName().equals("invoke"))System.out.println("VM "+m);
 }
 }
 }
}
