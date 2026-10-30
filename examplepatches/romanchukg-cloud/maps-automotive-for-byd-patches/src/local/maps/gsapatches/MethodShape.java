// SPDX-License-Identifier: GPL-3.0-only
package local.maps.gsapatches;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
public final class MethodShape {
 public static String hash(Method m){
  try{
   StringBuilder s=new StringBuilder(m.toString()).append('|').append(m.getAccessFlags());
   var body=m.getImplementation();s.append('|').append(body.getRegisterCount());
   for(var i:body.getInstructions()){
    s.append('\n').append(i.getOpcode().name()).append('|').append(i.getCodeUnits());
    if(i instanceof FiveRegisterInstruction x)s.append('|').append(x.getRegisterCount()).append(',').append(x.getRegisterC()).append(',').append(x.getRegisterD()).append(',').append(x.getRegisterE()).append(',').append(x.getRegisterF()).append(',').append(x.getRegisterG());
    else if(i instanceof RegisterRangeInstruction x)s.append('|').append(x.getStartRegister()).append(',').append(x.getRegisterCount());
    else if(i instanceof ThreeRegisterInstruction x)s.append('|').append(x.getRegisterA()).append(',').append(x.getRegisterB()).append(',').append(x.getRegisterC());
    else if(i instanceof TwoRegisterInstruction x)s.append('|').append(x.getRegisterA()).append(',').append(x.getRegisterB());
    else if(i instanceof OneRegisterInstruction x)s.append('|').append(x.getRegisterA());
    if(i instanceof ReferenceInstruction x)s.append('|').append(x.getReference());
    if(i instanceof OffsetInstruction x)s.append('|').append(x.getCodeOffset());
    if(i instanceof WideLiteralInstruction x)s.append('|').append(x.getWideLiteral());
   }
   s.append("|try:").append(body.getTryBlocks().size());
   StringBuilder h=new StringBuilder();for(byte b:MessageDigest.getInstance("SHA-256").digest(s.toString().getBytes(StandardCharsets.UTF_8)))h.append(String.format("%02x",b&255));return h.toString();
  }catch(Exception e){throw new IllegalStateException("Cannot fingerprint method",e);}
 }
}
