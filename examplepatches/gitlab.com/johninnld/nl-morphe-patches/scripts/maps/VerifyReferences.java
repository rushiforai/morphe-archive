import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/** Check direct references emitted by the Maps extension and injected account rows. */
public class VerifyReferences {
 static Map<String,ClassDef> classes=new HashMap<>();
 static ClassLoader boot;
 static boolean frameworkMethod(String owner,MethodReference ref) {
  if(owner==null||(!owner.startsWith("Landroid/")&&!owner.startsWith("Ljava/")))return false;
  try {
   Class<?> c=Class.forName(owner.substring(1,owner.length()-1).replace('/', '.'),false,boot);
   for(Class<?> current=c;current!=null;current=current.getSuperclass()) for(java.lang.reflect.Method m:current.getDeclaredMethods()) {
    if(!m.getName().equals(ref.getName())||!m.getReturnType().descriptorString().equals(ref.getReturnType()))continue;
    var ps=Arrays.stream(m.getParameterTypes()).map(Class::descriptorString).toList();
    if(ps.equals(ref.getParameterTypes()))return true;
   }
  }catch(ReflectiveOperationException|LinkageError ignored){}
  return false;
 }
 static boolean method(String owner, MethodReference ref, Set<String> seen) {
  if(owner==null||!seen.add(owner))return false;
  ClassDef c=classes.get(owner);if(c==null)return frameworkMethod(owner,ref);
  for(Method m:c.getMethods())if(m.getName().equals(ref.getName())&&m.getReturnType().equals(ref.getReturnType())&&m.getParameterTypes().equals(ref.getParameterTypes()))return true;
  if(ref.getName().equals("<init>"))return false;
  if(method(c.getSuperclass(),ref,seen))return true;
  for(String i:c.getInterfaces())if(method(i,ref,seen))return true;
  return false;
 }
 static boolean field(String owner,FieldReference ref,Set<String> seen) {
  if(owner==null||!seen.add(owner))return false;
  ClassDef c=classes.get(owner);if(c==null)return false;
  for(Field f:c.getFields())if(f.getName().equals(ref.getName())&&f.getType().equals(ref.getType()))return true;
  if(field(c.getSuperclass(),ref,seen))return true;
  for(String i:c.getInterfaces())if(field(i,ref,seen))return true;
  return false;
 }
 static void verifyNativeObservations() {
  ClassDef bridge=classes.get("Lazqb;");
  if(bridge==null)throw new IllegalStateException("Missing native speed/limit bridge");
  for(String[] expected:new String[][]{{"G","onNativeSpeedMps"},{"H","onNativeLimitInput"}}) {
   Method setter=null;
   for(Method m:bridge.getMethods())if(m.getName().equals(expected[0])&&m.getReturnType().equals("V"))setter=m;
   if(setter==null||setter.getImplementation()==null)throw new IllegalStateException("Missing native setter "+expected[0]);
   Instruction entry=setter.getImplementation().getInstructions().iterator().next();
   if(!(entry instanceof ReferenceInstruction)||!(((ReferenceInstruction)entry).getReference() instanceof MethodReference))throw new IllegalStateException("Native setter does not record every call");
   MethodReference hook=(MethodReference)((ReferenceInstruction)entry).getReference();
   if(!hook.getDefiningClass().equals("Lorg/ungoogled/ui/SpeedAlerts;")||!hook.getName().equals(expected[1]))throw new IllegalStateException("Native observation hook is behind a display-change gate");
  }
  System.out.println("Verified both native observation hooks run before display-change branches");
 }
 static Set<String> accessErrors=new TreeSet<>();
 static Method resolveMethod(String owner,MethodReference ref,Set<String> seen) {
  if(owner==null||!seen.add(owner))return null;
  ClassDef c=classes.get(owner);if(c==null)return null;
  for(Method m:c.getMethods())if(m.getName().equals(ref.getName())&&m.getReturnType().equals(ref.getReturnType())&&m.getParameterTypes().equals(ref.getParameterTypes()))return m;
  if(ref.getName().equals("<init>"))return null;
  Method found=resolveMethod(c.getSuperclass(),ref,seen);if(found!=null)return found;
  for(String i:c.getInterfaces()){found=resolveMethod(i,ref,seen);if(found!=null)return found;}
  return null;
 }
 static Field resolveField(String owner,FieldReference ref,Set<String> seen) {
  if(owner==null||!seen.add(owner))return null;
  ClassDef c=classes.get(owner);if(c==null)return null;
  for(Field f:c.getFields())if(f.getName().equals(ref.getName())&&f.getType().equals(ref.getType()))return f;
  Field found=resolveField(c.getSuperclass(),ref,seen);if(found!=null)return found;
  for(String i:c.getInterfaces()){found=resolveField(i,ref,seen);if(found!=null)return found;}
  return null;
 }
 static void access(String caller,Reference reference) {
  String owner=reference instanceof MethodReference?((MethodReference)reference).getDefiningClass():reference instanceof FieldReference?((FieldReference)reference).getDefiningClass():reference instanceof TypeReference?((TypeReference)reference).getType():null;
  if(owner!=null)while(owner.startsWith("["))owner=owner.substring(1);
  if(!caller.startsWith("Lorg/ungoogled/")||owner==null||owner.startsWith("Lorg/ungoogled/"))return;
  ClassDef c=classes.get(owner);if(c==null)return; // Missing definitions are reported by the resolution check.
  if(!AccessFlags.PUBLIC.isSet(c.getAccessFlags()))accessErrors.add("class "+owner+" from "+caller);
  if(reference instanceof MethodReference) {
   Method resolved=resolveMethod(owner,(MethodReference)reference,new HashSet<>());
   if(resolved!=null&&!AccessFlags.PUBLIC.isSet(resolved.getAccessFlags()))accessErrors.add("method "+resolved+" from "+caller);
  }else if(reference instanceof FieldReference) {
   Field resolved=resolveField(owner,(FieldReference)reference,new HashSet<>());
   if(resolved!=null&&!AccessFlags.PUBLIC.isSet(resolved.getAccessFlags()))accessErrors.add("field "+resolved+" from "+caller);
  }
 }
 static boolean owned(String owner){return classes.containsKey(owner)||owner.matches("L[a-z]+;")||owner.startsWith("Lorg/ungoogled/");}
 public static void main(String[] args)throws Exception {
  boot=new java.net.URLClassLoader(new java.net.URL[]{new File(args[1]).toURI().toURL()});
  var container=DexFileFactory.loadDexContainer(new File(args[0]),Opcodes.getDefault());
  for(String dex:container.getDexEntryNames())for(ClassDef c:container.getEntry(dex).getDexFile().getClasses())classes.put(c.getType(),c);
  Set<String> errors=new TreeSet<>();int checked=0;
  for(ClassDef c:classes.values())for(Method m:c.getMethods()) {
   if(!c.getType().startsWith("Lorg/ungoogled/")&&!m.getName().startsWith("ua"))continue;
   if(m.getImplementation()==null)continue;
   for(Instruction i:m.getImplementation().getInstructions()) {
    if(!(i instanceof ReferenceInstruction))continue;
    Reference r=((ReferenceInstruction)i).getReference();access(c.getType(),r);boolean valid=true;String owner=null;
    if(r instanceof MethodReference){var ref=(MethodReference)r;owner=ref.getDefiningClass();if(owned(owner))valid=method(owner,ref,new HashSet<>());}
    else if(r instanceof FieldReference){var ref=(FieldReference)r;owner=ref.getDefiningClass();if(owned(owner))valid=field(owner,ref,new HashSet<>());}
    else if(r instanceof TypeReference){owner=((TypeReference)r).getType();if(owned(owner))valid=classes.containsKey(owner);}
    if(owner!=null&&owned(owner)){checked++;if(!valid)errors.add(m+" -> "+r);}
   }
  }
  verifyNativeObservations();
  System.out.println("Checked "+checked+" Maps extension references; missing "+errors.size());
  for(String error:errors)System.out.println(error);
  System.out.println("Inaccessible native references "+accessErrors.size());
  for(String error:accessErrors)System.out.println(error);
  if(!errors.isEmpty()||!accessErrors.isEmpty())System.exit(1);
 }
}
