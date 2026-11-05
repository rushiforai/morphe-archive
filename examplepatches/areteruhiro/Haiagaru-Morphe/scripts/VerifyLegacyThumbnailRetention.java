import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import java.util.*;

/** Compare old/new patched DEX: retain every native instruction except one 3-instruction guard. */
public final class VerifyLegacyThumbnailRetention {
 public static void main(String[] args)throws Exception{
  boolean old=args[2].equals("191");String type=old?"Lo/qaf;":"Lo/TTRewardExpressVideoActivity;";
  var before=VerifyThumbnailRequery242.owner(args[0],type);var after=VerifyThumbnailRequery242.owner(args[1],type);
  Map<String,Method> methods=new HashMap<>();for(var m:after.getMethods())methods.put(VerifyThumbnailRequery242.key(m),m);
  int changed=0,checked=0;
  for(var m:before.getMethods()){
   if(m.getImplementation()==null)continue;var n=methods.get(VerifyThumbnailRequery242.key(m));if(n==null)throw new AssertionError("method lost");
   if(m.getImplementation().getRegisterCount()!=n.getImplementation().getRegisterCount())throw new AssertionError("registers changed");
   var a=VerifyThumbnailRequery242.ops(m);var b=VerifyThumbnailRequery242.ops(n);
   if(m.getName().equals(old?"b":"d")&&m.getParameterTypes().equals(List.of("Z"))){
    if(a.size()!=28||b.size()!=31)throw new AssertionError("retry size");
    if(b.get(4).getOpcode()!=Opcode.IF_NEZ||((OneRegisterInstruction)b.get(4)).getRegisterA()!=3||((OffsetInstruction)b.get(4)).getCodeOffset()!=6)throw new AssertionError("manual bypass");
    if(b.get(5).getOpcode()!=Opcode.IGET_OBJECT)throw new AssertionError("bitmap guard");
    var field=(FieldReference)((ReferenceInstruction)b.get(5)).getReference();
    if(!field.getDefiningClass().equals(type)||!field.getName().equals(old?"c":"b"))throw new AssertionError("wrong bitmap");
    if(b.get(6).getOpcode()!=Opcode.IF_NEZ||((OneRegisterInstruction)b.get(6)).getRegisterA()!=0)throw new AssertionError("loaded bypass");
    // Removing the guard must recover every original operand and branch.
    b.subList(4,7).clear();changed++;
   }
   if(!a.stream().map(VerifyThumbnailRebind242::shape).toList().equals(b.stream().map(VerifyThumbnailRebind242::shape).toList()))throw new AssertionError("native method changed: "+m);
   checked++;
  }
  if(changed!=1)throw new AssertionError("retry guard missing");
  System.out.println("PASS "+args[2]+": "+checked+" native methods preserved; only automatic loaded-image clear bypassed");
 }
}
