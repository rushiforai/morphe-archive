package patches.wuplaymobile;
import static org.junit.Assert.*;
import java.util.*;
import java.lang.reflect.*;
import org.junit.Test;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
public class MobileIdentityTest {
 private MutableMethod fixture(int resultRegister) {
  var signer=new ImmutableMethodReference("Landroidx/core/os/HandlerCompat$Api28Impl;","signingCertSha256",List.of("Landroid/content/Context;"),"Ljava/lang/String;");
  var identity=new ImmutableMethodReference("Lapp/wuplay/androidtv/network/BuildIdentity;","<init>",List.of("Ljava/lang/String;"),"V");
  List<Instruction> code=List.of(new ImmutableInstruction35c(Opcode.INVOKE_STATIC,1,2,0,0,0,0,signer),new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT,resultRegister),new ImmutableInstruction35c(Opcode.INVOKE_DIRECT,2,1,3,0,0,0,identity),new ImmutableInstruction10x(Opcode.RETURN_VOID));
  return new MutableMethod(new ImmutableMethod("Lapp/wuplay/androidtv/AppContainer;","<init>",List.of(new ImmutableMethodParameter("Lapp/wuplay/android/MobileApplication;",Set.of(),null),new ImmutableMethodParameter("Ljava/lang/Integer;",Set.of(),null)),"V",65537,Set.of(),Set.of(),new ImmutableMethodImplementation(19,code,List.of(),List.of())));
 }
 private void apply(MutableMethod method) throws Exception {
  try {Class.forName("patches.wuplaymobile.MobileIdentity").getDeclaredMethod("retain",MutableMethod.class).invoke(null,method);}
  catch(ClassNotFoundException e){throw new AssertionError("Mobile registration metadata preservation is missing",e);}
  catch(InvocationTargetException e){if(e.getCause() instanceof Exception)throw (Exception)e.getCause();throw e;}
 }
 @Test public void retainsValidatedInputCertificateOnlyInBuildMetadata() throws Exception {
  var method=fixture(3);apply(method);var code=method.getImplementation().getInstructions();
  assertEquals(5,code.size());assertEquals(Opcode.INVOKE_STATIC,code.get(0).getOpcode());
  assertEquals("signingCertSha256",((MethodReference)((ReferenceInstruction)code.get(0)).getReference()).getName());
  assertEquals(Opcode.CONST_STRING,code.get(2).getOpcode());assertEquals(3,((OneRegisterInstruction)code.get(2)).getRegisterA());
  assertEquals("ae406f7d398ae1ae418238f83d07554e6aa6cf5855b66edb9c4c85995d435e7f",((StringReference)((ReferenceInstruction)code.get(2)).getReference()).getString());
 }
 @Test public void rejectsMismatchedDataFlowBeforeMutation() throws Exception {
  var method=fixture(4);try{apply(method);fail("accepted wrong certificate register");}catch(IllegalStateException expected){}
  assertEquals(4,method.getImplementation().getInstructions().size());
 }
}
