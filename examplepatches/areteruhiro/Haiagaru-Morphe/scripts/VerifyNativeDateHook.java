import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import java.nio.ByteBuffer;
import java.util.*;
import java.util.zip.ZipFile;

/** Verify the native parser is preserved and the new wrapper owns its wide registers. */
public class VerifyNativeDateHook {
 static Method find(String apk,String name)throws Exception{
  try(var zip=new ZipFile(apk)){for(var e:Collections.list(zip.entries())){
   if(!e.getName().matches("classes[0-9]*\\.dex"))continue;
   for(var c:new DexBackedDexFile(null,ByteBuffer.wrap(zip.getInputStream(e).readAllBytes())).getClasses())
    if(c.getType().equals("Lo/r8lambda4fIVmDse184MJavTVTXSBZQF_UA;"))
     for(var m:c.getMethods())if(m.getName().equals(name)&&m.getParameterTypes().equals(List.of("Ljava/lang/String;")))return m;
  }}throw new AssertionError("Missing "+name);
 }
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
 static List<Instruction> code(Method m){var r=new ArrayList<Instruction>();m.getImplementation().getInstructions().forEach(r::add);return r;}
 public static void main(String[]args)throws Exception{
  var original=find(args[0],"b");var retained=find(args[1],"haiagaruNativeDrawDate");
  check(original.getImplementation().getRegisterCount()==retained.getImplementation().getRegisterCount(),"native registers");
  var a=code(original);var b=code(retained);check(a.size()==b.size(),"native instruction count");
  for(int n=0;n<a.size();n++){
   var x=a.get(n);var y=b.get(n);check(x.getOpcode()==y.getOpcode()&&x.getCodeUnits()==y.getCodeUnits(),"native opcode "+n);
   if(x instanceof OneRegisterInstruction r)check(r.getRegisterA()==((OneRegisterInstruction)y).getRegisterA(),"register A");
   if(x instanceof TwoRegisterInstruction r)check(r.getRegisterB()==((TwoRegisterInstruction)y).getRegisterB(),"register B");
   if(x instanceof ThreeRegisterInstruction r)check(r.getRegisterC()==((ThreeRegisterInstruction)y).getRegisterC(),"register C");
   if(x instanceof FiveRegisterInstruction r){var s=(FiveRegisterInstruction)y;check(r.getRegisterCount()==s.getRegisterCount()&&r.getRegisterC()==s.getRegisterC()&&r.getRegisterD()==s.getRegisterD()&&r.getRegisterE()==s.getRegisterE()&&r.getRegisterF()==s.getRegisterF()&&r.getRegisterG()==s.getRegisterG(),"invoke arguments");}
   if(x instanceof RegisterRangeInstruction r){var s=(RegisterRangeInstruction)y;check(r.getStartRegister()==s.getStartRegister()&&r.getRegisterCount()==s.getRegisterCount(),"invoke range");}
   if(x instanceof WideLiteralInstruction r)check(r.getWideLiteral()==((WideLiteralInstruction)y).getWideLiteral(),"literal");
   if(x instanceof ReferenceInstruction r)check(r.getReference().toString().equals(((ReferenceInstruction)y).getReference().toString()),"reference");
   if(x instanceof OffsetInstruction r)check(r.getCodeOffset()==((OffsetInstruction)y).getCodeOffset(),"branch");
  }
  var wrapper=find(args[1],"b");var w=code(wrapper);
  check(wrapper.getImplementation().getRegisterCount()==4&&w.size()==3,"wrapper layout");
  var call=(FiveRegisterInstruction)w.get(0);
  check(call.getRegisterCount()==2&&call.getRegisterC()==2&&call.getRegisterD()==3,"wrapper arguments");
  check(((ReferenceInstruction)call).getReference().toString().equals("Lapp/morphe/extension/chmate/NativeDrawDates;->parse(Ljava/lang/Object;Ljava/lang/String;)J"),"wrapper target");
  check(w.get(1).getOpcode().name().equals("MOVE_RESULT_WIDE")&&((OneRegisterInstruction)w.get(1)).getRegisterA()==0,"wide result");
  check(w.get(2).getOpcode().name().equals("RETURN_WIDE")&&((OneRegisterInstruction)w.get(2)).getRegisterA()==0,"wide return");
  System.out.println("PASS native parser instructions/registers preserved; wrapper arguments/wide result safe");
 }
}
