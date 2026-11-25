package patches.waze
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.*
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File
class NavigationAudioHooksTest {
 private fun original(variable:String,owner:String,name:String):MutableMethod {
  val file=System.getenv(variable);assumeNotNull(file);val dex=DexFileFactory.loadDexContainer(File(file!!),Opcodes.getDefault())
  return MutableMethod(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.single { it.type==owner }.methods.single { it.name==name })
 }
 @Test fun wazeGateUsesItsNativeMutePredicateBeforeAudioFocus() {
  val method=original("WAZE_STARTUP_APK","Lcom/waze/sound/ex;","A")
  val helper=Class.forName("patches.shared.NavigationAudioHooksKt").getDeclaredMethod("gateProviderAudio",MutableMethod::class.java,Int::class.javaPrimitiveType,String::class.java)
  helper.isAccessible=true;helper.invoke(null,method,-1,"true")
  val code=method.implementation!!.instructions.toList();assertTrue(code.take(3).any{(it as? ReferenceInstruction)?.reference.toString().contains("ProviderAudio;->muted()Z")});assertTrue(code.take(6).any{it.opcode==Opcode.RETURN})
 }
 @Test fun flitsmeisterRequestGateCompletesItsExactNativeCallback() {
  val method=original("FLITSMEISTER_STARTUP_APK","Lt50;","a")
  val helper=Class.forName("patches.shared.NavigationAudioHooksKt").getDeclaredMethod("gateProviderAudio",MutableMethod::class.java,Int::class.javaPrimitiveType,String::class.java)
  helper.isAccessible=true;helper.invoke(null,method,7,"void")
  val code=method.implementation!!.instructions.toList();assertTrue(code.take(3).any{(it as? ReferenceInstruction)?.reference.toString().contains("ProviderAudio;->skip(Ljava/lang/Object;)Z")});assertTrue(code.take(5).any{it.opcode==Opcode.RETURN_VOID})
 }
 @Test fun constructorTrackingRunsBeforeR8ReusesParameterRegisters() {
  val method=original("FLITSMEISTER_STARTUP_APK","Lt50;","<init>")
  val helper=Class.forName("patches.shared.NavigationAudioHooksKt").getDeclaredMethod("trackProviderAudio",MutableMethod::class.java,Int::class.javaPrimitiveType,String::class.java)
  helper.isAccessible=true;helper.invoke(null,method,0,"trackQueue")
  val code=method.implementation!!.instructions.toList()
  val parent=code.indexOfFirst{(it as? ReferenceInstruction)?.reference.toString()=="Ljava/lang/Object;-><init>()V"}
  val track=code.indexOfFirst{(it as? ReferenceInstruction)?.reference.toString().contains("ProviderAudio;->trackQueue")}
  assertEquals("R8 reuses p0 later in this constructor",parent+1,track)
 }
}
