import java.util.*;
import java.util.zip.*;
import java.io.*;
import app.zonghome.patches.CharcoalResources;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
public class HomeLayoutRegression {
 public static void main(String[] args)throws Exception {
  try(ZipFile original=new ZipFile(args[0]);ZipFile built=new ZipFile(args[1])){
   byte[] table=original.getInputStream(original.getEntry("resources.arsc")).readAllBytes();
   byte[] home=built.getInputStream(built.getEntry("res/layout/frag_home.xml")).readAllBytes();
   var ids=new CharcoalResources().viewIds(table,Set.of("cardSms","cardInternet","cardMins","tvTariff","btnLoan"));
   for(String key:List.of("cardSms","tvTariff","btnLoan"))
    if(InitialVisibilityTest.visibility(home,ids.get(key))!=8)throw new AssertionError("First-frame hiding missing: "+key);
   for(String key:List.of("cardInternet","cardMins"))
    if((InitialVisibilityTest.views(home).get(ids.get(key)).get(0x010100f4) & 0xffffff00)!=0)throw new AssertionError("Remaining card width must stay match-constraint");
   int constructors=0,binds=0;
   for(var entry:Collections.list(built.entries()))if(entry.getName().matches("classes[0-9]*\\.dex")){
    var dex=DexBackedDexFile.fromInputStream(Opcodes.getDefault(),new BufferedInputStream(built.getInputStream(entry)));
    for(var cls:dex.getClasses()){
     if(cls.getType().startsWith("Lcom/zong/customercare/view/adapter/HomeTrayAdapter"))
      for(var method:cls.getMethods())if(method.getImplementation()!=null)
       for(var instruction:method.getImplementation().getInstructions())
        if(instruction instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference reference && reference.getDefiningClass().equals("Lapp/zonghome/extension/RowStyling;"))
         throw new AssertionError("Home shortcuts adapter must not receive row styling hooks");
     if(!List.of("UsageDetailsAdapter","BundleAdapter","ParentBundleAdapter").stream().anyMatch(n->cls.getType().startsWith("Lcom/zong/customercare/view/adapter/"+n)))continue;
     for(var method:cls.getMethods())if(method.getImplementation()!=null){
      int returns=0,inflationCalls=0,bindingCalls=0, instructionIndex=0;
      for(var ins:method.getImplementation().getInstructions()){
       if(ins.getOpcode()==Opcode.RETURN_VOID)returns++;
       if(ins instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference m && m.getDefiningClass().equals("Lapp/zonghome/extension/RowStyling;")){
        if(instructionIndex!=0)throw new AssertionError("Late hook can use overwritten parameters: "+cls.getType()); if(m.getName().equals("onInflatedView"))inflationCalls++;
        if(m.getName().equals("onBound"))bindingCalls++;
       }
       instructionIndex++;
      }
      if(inflationCalls>0){if(inflationCalls!=1)throw new AssertionError("Repeated constructor hook");constructors++;}
      if(bindingCalls>0){if(bindingCalls!=1)throw new AssertionError("Repeated binding hook");binds++;}
     }
    }
   }
   if(constructors<3 || binds<3)throw new AssertionError("Missing primary adapter row hooks");
   System.out.println("PASS: first-frame Home hides, match-constraint widths, "+constructors+" entry hooks in row constructors and "+binds+" bind methods");
  }
 }
}
