import com.android.tools.smali.dexlib2.*;import com.android.tools.smali.dexlib2.dexbacked.*;import com.android.tools.smali.dexlib2.iface.*;import com.android.tools.smali.dexlib2.iface.instruction.*;import com.android.tools.smali.dexlib2.iface.reference.*;import java.util.*;import java.util.zip.*;
public final class VerifyMediaCounterHooks {
 static Map<String,ClassDef> load(String path)throws Exception{var result=new HashMap<String,ClassDef>();try(var zip=new ZipFile(path)){for(var e:Collections.list(zip.entries()))if(e.getName().matches("classes[0-9]*\\.dex"))try(var in=new java.io.BufferedInputStream(zip.getInputStream(e))){for(var c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())if(Set.of("Ljp/syoboi/a2chMate/activity/ImagesViewer2Activity;","Lo/VN10;").contains(c.getType()))result.put(c.getType(),c);}}return result;}
 public static void main(String[] args)throws Exception{
  var before=load(args[0]);int hooks=0;
  for(var c:load(args[1]).values())for(var m:c.getMethods())if(m.getImplementation()!=null){var code=new ArrayList<Instruction>();m.getImplementation().getInstructions().forEach(code::add);
   for(int index=0;index<code.size();index++)if(code.get(index) instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference call&&call.getName().equals("setNativeCounter")){
    Method original=null;for(var old:before.get(c.getType()).getMethods())if(old.getName().equals(m.getName())&&old.getParameterTypes().equals(m.getParameterTypes()))original=old;
    if(original==null||original.getImplementation().getRegisterCount()!=m.getImplementation().getRegisterCount())throw new AssertionError("counter method/register changed");
    var oldCode=new ArrayList<Instruction>();original.getImplementation().getInstructions().forEach(oldCode::add);if(oldCode.size()!=code.size())throw new AssertionError("counter instruction count");
    for(int n=0;n<code.size();n++){Instruction a=oldCode.get(n),b=code.get(n);if(n==index){if(a.getOpcode()!=Opcode.INVOKE_VIRTUAL||b.getOpcode()!=Opcode.INVOKE_STATIC||!((MethodReference)((ReferenceInstruction)a).getReference()).getName().equals("setText"))throw new AssertionError("only native text setter replaced");var x=(FiveRegisterInstruction)a;var y=(FiveRegisterInstruction)b;if(x.getRegisterCount()!=2||y.getRegisterCount()!=2||x.getRegisterC()!=y.getRegisterC()||x.getRegisterD()!=y.getRegisterD())throw new AssertionError("native TextView and label operands changed");}else{
     if(a.getOpcode()!=b.getOpcode())throw new AssertionError("original opcode");if(a instanceof ReferenceInstruction x&&!x.getReference().toString().equals(((ReferenceInstruction)b).getReference().toString()))throw new AssertionError("original reference");if(a instanceof OneRegisterInstruction x&&x.getRegisterA()!=((OneRegisterInstruction)b).getRegisterA())throw new AssertionError("original register");if(a instanceof OffsetInstruction x&&x.getCodeOffset()!=((OffsetInstruction)b).getCodeOffset())throw new AssertionError("original branch");
    }}hooks++;
   }
  }
  if(hooks!=1)throw new AssertionError("one counter hook expected, got "+hooks);System.out.println("PASS counter replaces only native label setter; native paging, arguments, registers and branches retained");
 }
}
