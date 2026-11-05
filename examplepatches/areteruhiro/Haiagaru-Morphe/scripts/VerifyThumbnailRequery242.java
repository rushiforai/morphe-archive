import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.io.*;
import java.util.*;
import java.util.zip.*;

/** Verify all three temporary loading entry points and preserve completed decode handling. */
public final class VerifyThumbnailRequery242 {
 static ClassDef image(String apk)throws Exception{
  return owner(apk,"Lo/zzbes;");
 }
 static ClassDef owner(String apk,String type)throws Exception{
  try(var zip=new ZipFile(apk)){for(var entries=zip.entries();entries.hasMoreElements();){var e=entries.nextElement();if(!e.getName().matches("classes(?:[0-9]+)?\\.dex"))continue;
   try(var in=new BufferedInputStream(zip.getInputStream(e))){for(var c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())if(c.getType().equals(type))return c;}
  }}throw new AssertionError("Image class missing");
 }
 static String key(Method m){return m.getName()+m.getParameterTypes()+m.getReturnType();}
 static List<Instruction> ops(Method m){var out=new ArrayList<Instruction>();m.getImplementation().getInstructions().forEach(out::add);return out;}
 public static void main(String[] args)throws Exception{
  var original=image(args[0]);var patched=image(args[1]);var methods=new HashMap<String,Method>();for(var m:patched.getMethods())methods.put(key(m),m);int changed=0;
  for(var m:original.getMethods()){
   if(!(m.getName().equals("d")&&m.getParameterTypes().equals(List.of("Z")))&&!(m.getName().equals("f")&&m.getParameterTypes().equals(List.of("Lo/zzbes;"))))continue;
   if(m.getImplementation()==null)continue;var n=methods.get(key(m));if(n==null)throw new AssertionError("Method lost");
   if(m.getImplementation().getRegisterCount()!=n.getImplementation().getRegisterCount())throw new AssertionError("Native registers changed");
   var a=ops(m);var b=ops(n);if(a.size()!=b.size())throw new AssertionError("Native size changed "+key(m));
   for(int i=0;i<a.size();i++){
    if(VerifyThumbnailRebind242.shape(a.get(i)).equals(VerifyThumbnailRebind242.shape(b.get(i))))continue;
    if(!(m.getName().equals("d")&&m.getParameterTypes().equals(List.of("Z")))&&!(m.getName().equals("f")&&m.getParameterTypes().equals(List.of("Lo/zzbes;"))))throw new AssertionError("Unexpected method edit "+key(m));
    var ar=(MethodReference)((ReferenceInstruction)a.get(i)).getReference();var br=(MethodReference)((ReferenceInstruction)b.get(i)).getReference();
    if(!ar.getName().equals("c")||!br.getName().equals("haiagaruResetForRequery"))throw new AssertionError("Unexpected call target");
    var x=(FiveRegisterInstruction)a.get(i);var y=(FiveRegisterInstruction)b.get(i);if(x.getRegisterC()!=y.getRegisterC()||x.getRegisterD()!=y.getRegisterD()||x.getRegisterCount()!=2||y.getRegisterCount()!=2)throw new AssertionError("Operands changed");changed++;
   }
  }
  if(changed!=2)throw new AssertionError("Expected two guarded calls, got "+changed);
  Method guard=null;for(var m:patched.getMethods())if(m.getName().equals("haiagaruResetForRequery"))guard=m;
  if(guard==null)throw new AssertionError("Guard missing");
  if(guard.getImplementation().getRegisterCount()!=3)throw new AssertionError("Guard registers");
  // Existing stale-result protection may already alter completed callbacks.
  // Compare against the previous patched APK as well as the original entries.
  var callback=owner(args.length>2?args[2]:args[0],"Lo/zzbes$_init_lambda1;");
  var patchedCallback=owner(args[1],callback.getType());
  var callbacks=new HashMap<String,Method>();for(var m:patchedCallback.getMethods())callbacks.put(key(m),m);
  int extra=0;
  for(var m:callback.getMethods()){
   if(m.getImplementation()==null)continue;var n=callbacks.get(key(m));
   if(n==null||m.getImplementation().getRegisterCount()!=n.getImplementation().getRegisterCount())throw new AssertionError("Callback registers changed");
   var a=ops(m);var b=ops(n);if(a.size()!=b.size())throw new AssertionError("Callback size changed");
   for(int i=0;i<a.size();i++){
    if(VerifyThumbnailRebind242.shape(a.get(i)).equals(VerifyThumbnailRebind242.shape(b.get(i))))continue;
    if(!m.getName().equals("e")||!m.getParameterTypes().isEmpty())throw new AssertionError("Completed decode handling changed");
    if(a.get(i).getOpcode()!=Opcode.INVOKE_STATIC||b.get(i).getOpcode()!=Opcode.INVOKE_VIRTUAL)throw new AssertionError("Callback invoke changed");
    var ar=(MethodReference)((ReferenceInstruction)a.get(i)).getReference();var br=(MethodReference)((ReferenceInstruction)b.get(i)).getReference();
    if(!ar.getName().equals("e")||!ar.getDefiningClass().equals(original.getType())||!br.getName().equals("haiagaruResetForRequery"))throw new AssertionError("Callback target changed");
    var x=(FiveRegisterInstruction)a.get(i);var y=(FiveRegisterInstruction)b.get(i);
    if(x.getRegisterCount()!=2||y.getRegisterCount()!=2||x.getRegisterC()!=y.getRegisterC()||x.getRegisterD()!=y.getRegisterD())throw new AssertionError("Callback operands changed");extra++;
   }
  }
  if(extra!=1)throw new AssertionError("Expected third guarded loading callback");
  System.out.println("PASS: three temporary-state targets guarded; native registers/branches and completed decode/error handling preserved");
 }
}
