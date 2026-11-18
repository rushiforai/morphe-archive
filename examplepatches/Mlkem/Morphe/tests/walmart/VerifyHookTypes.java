import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.analysis.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import org.objectweb.asm.ClassReader;
import java.util.*;import java.util.zip.*;import java.io.*;

/** Analyze live DEX register types at injected calls, not just hook presence.
 * Framework inheritance comes from android.jar class headers (never executed).
 * This is a focused static regression check, not Android ART or an app launch test.
 */
public final class VerifyHookTypes {
 static final String EXT="Lapp/canada/walmart/";
 static final Map<String,ClassDef> classes=new HashMap<>();
 static ZipFile framework;
 static ClassDef resolve(String type) {
  if(classes.containsKey(type))return classes.get(type);
  if(!type.startsWith("L"))return null;
  String path=type.substring(1,type.length()-1)+".class";
  ZipEntry entry=framework.getEntry(path);
  try(InputStream in=entry!=null?framework.getInputStream(entry):ClassLoader.getSystemResourceAsStream(path)) {
   if(in==null)return null;
   ClassReader r=new ClassReader(in);
   List<String> interfaces=new ArrayList<>();for(String s:r.getInterfaces())interfaces.add("L"+s+";");
   ClassDef c=new ImmutableClassDef(type,r.getAccess(),r.getSuperName()==null?null:"L"+r.getSuperName()+";",interfaces,null,Collections.emptySet(),Collections.emptyList(),Collections.emptyList());
   classes.put(type,c);return c;
  }catch(IOException e){throw new RuntimeException(e);}
 }
 static boolean assignable(String actual,String expected,Set<String> seen) {
  if(actual.equals(expected)||expected.equals("Ljava/lang/Object;"))return true;
  if(!seen.add(actual))return false;
  if(actual.startsWith("["))return expected.equals("Ljava/lang/Cloneable;")||expected.equals("Ljava/io/Serializable;");
  ClassDef c=resolve(actual);if(c==null)return false;
  if(c.getSuperclass()!=null&&assignable(c.getSuperclass(),expected,seen))return true;
  for(String i:c.getInterfaces())if(assignable(i,expected,seen))return true;
  return false;
 }
 static MethodReference hook(Instruction i) {
  if(!(i instanceof ReferenceInstruction))return null;
  Reference ref=((ReferenceInstruction)i).getReference();
  return ref instanceof MethodReference&&((MethodReference)ref).getDefiningClass().startsWith(EXT)?(MethodReference)ref:null;
 }
 static String semanticType(MethodReference ref,int index,String declared) {
  String owner=ref.getDefiningClass();
  if(owner.equals(EXT+"TileHooks;"))return index==0?"Lcom/walmart/glass/lists/view/lists/h;":"Lcom/walmart/glass/lists/domain/ListItem$ListDetailItem;";
  if(owner.equals(EXT+"ListEnhancements;")&&ref.getName().equals("bindBrowse")&&index==1)return "LFW0/I0;";
  if(owner.equals(EXT+"AdCleaner;")&&ref.getName().equals("sponsored")&&index==1)return "LfX0/L0;";
  return declared;
 }
 static boolean bypassesHook(AnalyzedInstruction exit,String required) {
  Set<AnalyzedInstruction> seen=new HashSet<>();ArrayDeque<AnalyzedInstruction> todo=new ArrayDeque<>();todo.add(exit);
  while(!todo.isEmpty()){
   AnalyzedInstruction ai=todo.remove();if(!seen.add(ai))continue;
   if(ai.getInstructionIndex()<0)return true;
   MethodReference ref=hook(ai.getInstruction());if(ref!=null&&ref.toString().equals(required))continue;
   todo.addAll(ai.getPredecessors());
  }
  return false;
 }
 public static void main(String[]args)throws Exception {
  framework=new ZipFile(args[1]);List<Method> modified=new ArrayList<>();
  try(ZipFile z=new ZipFile(args[0])){for(Enumeration<? extends ZipEntry> entries=z.entries();entries.hasMoreElements();){
   ZipEntry e=entries.nextElement();if(!e.getName().matches("classes[0-9]*\\.dex"))continue;
   for(ClassDef c:DexBackedDexFile.fromInputStream(Opcodes.forApi(35),new BufferedInputStream(z.getInputStream(e))).getClasses()) {
    if(classes.put(c.getType(),c)!=null)throw new AssertionError("Duplicate class: "+c.getType());
    if(c.getType().startsWith(EXT))continue;
    for(Method m:c.getMethods())if(m.getImplementation()!=null)for(Instruction ins:m.getImplementation().getInstructions())if(hook(ins)!=null){modified.add(m);break;}
   }
  }}
  ClassPath cp=new ClassPath(Collections.singletonList((ClassProvider)VerifyHookTypes::resolve),false,ClassPath.NOT_ART);
  int calls=0,arguments=0,failures=0,returnPaths=0;
  for(Method method:modified){
   MethodAnalyzer analyzer=new MethodAnalyzer(cp,method,null,false);
   if(analyzer.getAnalysisException()!=null){System.out.println("ANALYSIS FAILED "+method+": "+analyzer.getAnalysisException());failures++;continue;}
   Set<String> required=new HashSet<>();
   for(AnalyzedInstruction ai:analyzer.getAnalyzedInstructions()){
    Instruction ins=ai.getInstruction();MethodReference ref=hook(ins);if(ref==null)continue;calls++;required.add(ref.toString());
    List<Integer> registers=new ArrayList<>();
    if(ins instanceof RegisterRangeInstruction){RegisterRangeInstruction r=(RegisterRangeInstruction)ins;for(int i=0;i<r.getRegisterCount();i++)registers.add(r.getStartRegister()+i);}
    else if(ins instanceof FiveRegisterInstruction){FiveRegisterInstruction r=(FiveRegisterInstruction)ins;int[] rs={r.getRegisterC(),r.getRegisterD(),r.getRegisterE(),r.getRegisterF(),r.getRegisterG()};for(int i=0;i<r.getRegisterCount();i++)registers.add(rs[i]);}
    else throw new AssertionError("Unexpected hook instruction "+ins);
    if(ins.getOpcode()!=Opcode.INVOKE_STATIC&&ins.getOpcode()!=Opcode.INVOKE_STATIC_RANGE)throw new AssertionError("Non-static hook "+ref);
    if(registers.size()!=ref.getParameterTypes().size())throw new AssertionError("Argument count "+ref);
    for(int i=0;i<registers.size();i++){
     arguments++;int reg=registers.get(i);RegisterType type=ai.getPreInstructionRegisterType(reg);
     String expected=semanticType(ref,i,ref.getParameterTypes().get(i).toString());
     boolean valid=type.category==RegisterType.NULL||(type.category==RegisterType.REFERENCE&&assignable(type.type.getType(),expected,new HashSet<>()));
     if(!valid){failures++;System.out.println("INVALID "+method.getDefiningClass()+"->"+method.getName()+" @"+Integer.toHexString(analyzer.getInstructionAddress(ai))+" "+ref.getName()+" arg"+i+" v"+reg+"="+type+" expected "+expected);}
    }
   }
   for(AnalyzedInstruction ai:analyzer.getAnalyzedInstructions()) {
    Opcode op=ai.getInstruction().getOpcode();
    if(op!=Opcode.RETURN&&op!=Opcode.RETURN_VOID&&op!=Opcode.RETURN_OBJECT&&op!=Opcode.RETURN_WIDE)continue;
    for(String ref:required){returnPaths++;if(bypassesHook(ai,ref)){failures++;System.out.println("BYPASSED "+method.getDefiningClass()+"->"+method.getName()+" return@"+Integer.toHexString(analyzer.getInstructionAddress(ai))+" can skip "+ref);}}
   }
  }
  framework.close();
  System.out.println("Checked "+calls+" injected calls / "+arguments+" arguments across "+modified.size()+" methods; failures="+failures);
  System.out.println("Checked "+returnPaths+" hook/return path requirements (including incoming branches).");
  if(calls==0||failures!=0)throw new AssertionError("Injected register-type verification failed");
 }
}
