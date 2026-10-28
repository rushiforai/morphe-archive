import com.android.tools.smali.dexlib2.*;import com.android.tools.smali.dexlib2.dexbacked.*;import com.android.tools.smali.dexlib2.iface.*;import com.android.tools.smali.dexlib2.iface.instruction.*;import com.android.tools.smali.dexlib2.iface.reference.*;import java.util.*;import java.util.zip.*;
public final class VerifyGlobalTitleSearchHooks {
 static Map<String,ClassDef> load(String apk)throws Exception{var out=new HashMap<String,ClassDef>();try(var z=new ZipFile(apk)){for(var e:Collections.list(z.entries()))if(e.getName().matches("classes[0-9]*\\.dex"))try(var in=new java.io.BufferedInputStream(z.getInputStream(e))){for(var c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())if(Set.of("Lo/getSdkVersion;","Lo/afterHandshake;","Lo/AXE3;").contains(c.getType()))out.put(c.getType(),c);}}return out;}
 public static void main(String[] args)throws Exception{
  var before=load(args[0]);var after=load(args[1]);int hooks=0;
  for(var c:after.values())for(var m:c.getMethods())if(m.getImplementation()!=null){var code=new ArrayList<Instruction>();m.getImplementation().getInstructions().forEach(code::add);if(code.isEmpty()||!(code.get(0) instanceof ReferenceInstruction r)||!(r.getReference() instanceof MethodReference ref)||!ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/GlobalTitleSearch;"))continue;
   Method original=null;for(var old:before.get(c.getType()).getMethods())if(old.getName().equals(m.getName())&&old.getParameterTypes().equals(m.getParameterTypes())&&old.getReturnType().equals(m.getReturnType()))original=old;
   if(original==null||original.getImplementation().getRegisterCount()!=m.getImplementation().getRegisterCount())throw new AssertionError("method/register preservation");
   var call=(RegisterRangeInstruction)code.get(0);int params=m.getParameterTypes().size()+1;if(call.getStartRegister()!=m.getImplementation().getRegisterCount()-params||call.getRegisterCount()!=2)throw new AssertionError("original provider/query registers");
   int prefix=ref.getName().equals("capture")?1:2;if(prefix==2&&(!(code.get(1) instanceof OneRegisterInstruction result)||code.get(1).getOpcode()!=Opcode.MOVE_RESULT_OBJECT||result.getRegisterA()!=call.getStartRegister()+1))throw new AssertionError("original TSV replacement register");
   var originalCode=new ArrayList<Instruction>();original.getImplementation().getInstructions().forEach(originalCode::add);if(code.size()!=originalCode.size()+prefix)throw new AssertionError("original instruction count");
   for(int n=0;n<originalCode.size();n++){var a=originalCode.get(n);var b=code.get(n+prefix);if(a.getOpcode()!=b.getOpcode())throw new AssertionError("native opcode changed");if(a instanceof ReferenceInstruction x&&!x.getReference().toString().equals(((ReferenceInstruction)b).getReference().toString()))throw new AssertionError("native reference changed");if(a instanceof OneRegisterInstruction x&&x.getRegisterA()!=((OneRegisterInstruction)b).getRegisterA())throw new AssertionError("native registers changed");}
   hooks++;
  }
  if(hooks!=2)throw new AssertionError("expected exactly two global search hooks, got "+hooks);System.out.println("PASS native global title search: original URL/parser instructions, registers and provider/query operands retained");
 }
}
