package dev.lumi.dcinside;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload;
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import java.util.zip.*;
import java.io.*;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
/** Patch-time only: exact instruction shape, not a runtime hook or version guess. */
public final class MethodShape {
 public static String key(Method m){return m.getDefiningClass()+"->"+m.getName()+"("+String.join("",m.getParameterTypes())+")"+m.getReturnType();}
 public static String digest(Method m) {
  try {
   StringBuilder b=new StringBuilder(key(m)).append('|').append(m.getAccessFlags());
   var body=m.getImplementation();
   if(body!=null){
    b.append('|').append(body.getRegisterCount());
    for(var i:body.getInstructions()){
     b.append(';').append(i.getOpcode()).append(':').append(i.getCodeUnits());
     if(i instanceof OneRegisterInstruction x)b.append("a").append(x.getRegisterA());
     if(i instanceof TwoRegisterInstruction x)b.append("b").append(x.getRegisterB());
     if(i instanceof ThreeRegisterInstruction x)b.append("c").append(x.getRegisterC());
     if(i instanceof FiveRegisterInstruction x)b.append("r").append(x.getRegisterCount()).append(',').append(x.getRegisterC()).append(',').append(x.getRegisterD()).append(',').append(x.getRegisterE()).append(',').append(x.getRegisterF()).append(',').append(x.getRegisterG());
     if(i instanceof RegisterRangeInstruction x)b.append("range").append(x.getStartRegister()).append(',').append(x.getRegisterCount());
     if(i instanceof WideLiteralInstruction x)b.append("literal").append(x.getWideLiteral());
     if(i instanceof OffsetInstruction x)b.append("offset").append(x.getCodeOffset());
     if(i instanceof ReferenceInstruction x)b.append("ref").append(x.getReference());
     if(i instanceof DualReferenceInstruction x)b.append("ref2").append(x.getReference2());
     if(i instanceof SwitchPayload x)for(var e:x.getSwitchElements())b.append("case").append(e.getKey()).append(':').append(e.getOffset());
     if(i instanceof ArrayPayload x)b.append("array").append(x.getElementWidth()).append(x.getArrayElements());
    }
    for(var t:body.getTryBlocks()){b.append("try").append(t.getStartCodeAddress()).append(':').append(t.getCodeUnitCount());for(var h:t.getExceptionHandlers())b.append(h.getExceptionType()).append(':').append(h.getHandlerCodeAddress());}
   }
   byte[] hash=MessageDigest.getInstance("SHA-256").digest(b.toString().getBytes(StandardCharsets.UTF_8));
   StringBuilder hex=new StringBuilder();for(byte v:hash)hex.append(String.format(Locale.ROOT,"%02x",v&255));return hex.toString();
  }catch(Exception e){throw new IllegalStateException("Cannot validate patch target",e);}
 }
 /** Generate reviewed hashes from an original local APK; never bundles vendor bytecode. */
 public static void main(String[] args)throws Exception{
  var classes=new HashSet<>(java.nio.file.Files.readAllLines(java.nio.file.Path.of(args[1])));
  var result=new TreeMap<String,String>();
  try(var z=new ZipFile(args[0])){var es=z.entries();while(es.hasMoreElements()){var e=es.nextElement();if(!e.getName().matches("classes[0-9]*\\.dex"))continue;
   try(var in=new BufferedInputStream(z.getInputStream(e))){var dex=DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in);for(var c:dex.getClasses())if(classes.contains(c.getType()))for(var m:c.getMethods())result.put(key(m),digest(m));}
  }}
  try(var w=new PrintWriter(args[2],"UTF-8")){for(var e:result.entrySet())w.println(e.getKey()+"="+e.getValue());}
  System.out.println("Reviewed method hashes: "+result.size());
 }
}
