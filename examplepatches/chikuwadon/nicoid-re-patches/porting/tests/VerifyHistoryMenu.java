import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.analysis.*;
import com.android.tools.smali.dexlib2.analysis.reflection.ReflectionClassDef;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import java.io.*;
import java.net.*;
import java.util.*;
public class VerifyHistoryMenu {
 public static void main(String[] args)throws Exception {
  Map<String,ClassDef> classes=new HashMap<>();
  MultiDexContainer<? extends DexFile> dex=DexFileFactory.loadDexContainer(new File(args[0]),Opcodes.getDefault());
  for(String entry:dex.getDexEntryNames())for(ClassDef c:dex.getEntry(entry).getDexFile().getClasses())classes.put(c.getType(),c);
  URLClassLoader android=new URLClassLoader(new URL[]{new File(args[1]).toURI().toURL()});
  ClassProvider framework=type->{try{return new ReflectionClassDef(Class.forName(type.substring(1,type.length()-1).replace('/','.'),false,android));}catch(ClassNotFoundException e){return null;}};
  ClassPath path=new ClassPath(classes::get,framework);
  Method original=null;
  for(Method m:classes.get("Lcom/sauzask/nicoid/NicoidVideoListActivity;").getMethods())if(m.getName().equals("onCreateOptionsMenu"))original=m;
  if(original==null)throw new AssertionError("Missing method");
  List<Instruction> instructions=new ArrayList<>();for(Instruction i:original.getImplementation().getInstructions())instructions.add(i);
  int beforeSuper=-1,beforeReturn=-1;
  for(int i=0;i<instructions.size();i++){if(instructions.get(i).getOpcode()==Opcode.INVOKE_SUPER)beforeSuper=i;if(instructions.get(i).getOpcode()==Opcode.RETURN)beforeReturn=i;}
  if(beforeSuper<0||beforeReturn<0)throw new AssertionError("Missing anchor");
  boolean broken=check(original,path,beforeReturn,false);
  if(broken)throw new AssertionError("Old injection must fail regression");
  if(!check(original,path,beforeSuper,true))throw new AssertionError("Fixed injection invalid");
  System.out.println("History menu regression: old position passes Boolean; fixed position passes android.view.Menu");
  android.close();
 }
 static boolean check(Method original,ClassPath path,int at,boolean fixed)throws Exception {
  MutableMethodImplementation impl=new MutableMethodImplementation(original.getImplementation());
  int self=impl.getRegisterCount()-2,menu=self+1;
  impl.addInstruction(at,new BuilderInstruction35c(Opcode.INVOKE_STATIC,2,self,menu,0,0,0,new ImmutableMethodReference("Le/e/a/ListActions;","adjustHistoryMenu",Arrays.asList("Ljava/lang/Object;","Landroid/view/Menu;"),"V")));
  Method m=new ImmutableMethod(original.getDefiningClass(),original.getName(),original.getParameters(),original.getReturnType(),original.getAccessFlags(),original.getAnnotations(),original.getHiddenApiRestrictions(),impl);
  MethodAnalyzer analyzer=new MethodAnalyzer(path,m,null,false);
  if(analyzer.getAnalysisException()!=null)throw analyzer.getAnalysisException();
  for(AnalyzedInstruction a:analyzer.getAnalyzedInstructions()){
   Instruction i=a.getInstruction();if(!(i instanceof ReferenceInstruction))continue;
   Reference r=((ReferenceInstruction)i).getReference();if(!(r instanceof MethodReference)||!((MethodReference)r).getName().equals("adjustHistoryMenu"))continue;
   RegisterType actual=a.getPreInstructionRegisterType(menu);
   System.out.println((fixed?"Fixed":"Old")+" Menu register v"+menu+": "+actual);
   return actual.type!=null&&actual.type.getType().equals("Landroid/view/Menu;");
  }
  throw new AssertionError("Missing injected hook");
 }
}
