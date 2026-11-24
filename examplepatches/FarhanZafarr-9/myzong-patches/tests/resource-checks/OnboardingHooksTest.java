import java.io.*;
import java.util.*;
import java.util.zip.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
public class OnboardingHooksTest {
 public static void main(String[] args)throws Exception {
 int style=0,paste=0;
 try(var zip=new ZipFile(args[0])){for(var e:Collections.list(zip.entries())){
 if(!e.getName().matches("classes[0-9]*\\.dex"))continue;
 var dex=DexBackedDexFile.fromInputStream(Opcodes.getDefault(),new BufferedInputStream(zip.getInputStream(e)));
 for(var c:dex.getClasses())if(c.getType().startsWith("Lcom/zong/customercare/view/ui/"))for(var m:c.getMethods()){
 var impl=m.getImplementation();if(impl==null)continue;int index=0;
 for(var ins:impl.getInstructions()){
 if(ins instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference ref &&
 (ref.getDefiningClass().equals("Lapp/zonghome/extension/OnboardingStyling;")||ref.getDefiningClass().equals("Lapp/zonghome/extension/OtpPasteEditText;"))){
 boolean isPaste=ref.getName().equals("wrap");
 if(index!=0 || ins.getOpcode()!=Opcode.INVOKE_STATIC_RANGE)throw new AssertionError("Unsafe entry: "+m);
 int slots=1;for(var p:m.getParameterTypes())slots+=p.equals("J")||p.equals("D")?2:1;
 if(((RegisterRangeInstruction)ins).getStartRegister()!=impl.getRegisterCount()-slots+1)throw new AssertionError("Wrong p1");
 if(!m.getName().equals(isPaste?"onCreateView":"onViewCreated"))throw new AssertionError("Wrong callback");
 if(isPaste)paste++;else style++;
 }index++;
 }
 }
 }}
 if(style!=Integer.parseInt(args[1])||paste!=Integer.parseInt(args[2]))throw new AssertionError("Counts "+style+"/"+paste);
 System.out.println("PASS: "+style+" form styling and "+paste+" paste hooks use original p1 at callback entry");
 }
}
