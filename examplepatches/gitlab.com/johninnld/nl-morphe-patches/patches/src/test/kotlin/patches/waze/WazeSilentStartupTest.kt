package patches.waze

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File

class WazeSilentStartupTest {
 @Test fun providerOwnershipObserverRunsAfterTheRealCarSessionHasInitialized() {
  val path=System.getenv("WAZE_ORIGINAL_APK");assumeNotNull(path)
  val dex=DexFileFactory.loadDexContainer(File(path!!),Opcodes.getDefault())
  val original=dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
   .single { it.type=="Landroidx/car/app/Session;" }.methods.single { it.name=="<init>" && it.parameterTypes.isEmpty() }
  val method=MutableMethod(original);val before=method.implementation!!.instructions.toList()
  patches.shared.observeNavigationProviderSession(method)
  val after=method.implementation!!.instructions.toList()
  assertEquals(before.size+1,after.size);assertEquals(before.dropLast(1),after.dropLast(2))
  val hook=after[after.size-2]
  assertEquals(Opcode.INVOKE_STATIC_RANGE,hook.opcode)
  assertEquals("Lnl/johninnl/navigation/startup/ProviderLifecycle;->observeCarSession(Ljava/lang/Object;)V",(hook as ReferenceInstruction).reference.toString())
  assertEquals(method.implementation!!.registerCount-1,(hook as RegisterRangeInstruction).startRegister)
  assertEquals(1,hook.registerCount);assertEquals(Opcode.RETURN_VOID,after.last().opcode)
  assertThrows(IllegalStateException::class.java) { patches.shared.observeNavigationProviderSession(method) }
 }

 private fun originalCarMethod(type:String,name:String,parameters:List<String>): MutableMethod {
  val path=System.getenv("WAZE_ORIGINAL_APK");assumeNotNull(path)
  val dex=DexFileFactory.loadDexContainer(File(path!!),Opcodes.getDefault())
  val original=dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
   .single { it.type==type }.methods.single { it.name==name && it.parameterTypes.map(CharSequence::toString)==parameters }
  return MutableMethod(original)
 }

 @Test fun carKeepAlivePreservesTheNativeDecisionBeforeApplyingTheBroadcastSwitch() {
  val service="Lcom/waze/car_lib/WazeCarAppService;"
  val method=originalCarMethod(service,"a",listOf(service));val before=method.implementation!!.instructions.toList()
  val decision=before.indexOfFirst { (it as? ReferenceInstruction)?.reference.toString()=="Lcom/waze/car_lib/w;->b()Z" }+1
  assertEquals(Opcode.MOVE_RESULT,before[decision].opcode)
  val register=(before[decision] as OneRegisterInstruction).registerA
  preserveBroadcastsAfterCarSession(method)
  val after=method.implementation!!.instructions.toList()
  assertEquals(before.size+2,after.size)
  assertEquals(before.take(decision+1),after.take(decision+1))
  assertEquals(before.drop(decision+1),after.drop(decision+3))
  val hook=after[decision+1]
  assertEquals(Opcode.INVOKE_STATIC_RANGE,hook.opcode)
  assertEquals("Lorg/ungoogled/waze/NavigationBroadcasts;->keepAliveAfterCarSession(Z)Z",(hook as ReferenceInstruction).reference.toString())
  assertEquals(register,(hook as RegisterRangeInstruction).startRegister)
  assertEquals(1,hook.registerCount)
  assertEquals(Opcode.MOVE_RESULT,after[decision+2].opcode)
  assertEquals(register,(after[decision+2] as OneRegisterInstruction).registerA)
  assertEquals(Opcode.RETURN_VOID,after.last().opcode)
  assertThrows(IllegalStateException::class.java) { preserveBroadcastsAfterCarSession(method) }
 }

 @Test fun sharedAaosModeUsedByLoginCannotBeOverriddenByTheFeed() {
  val method=originalCarMethod("Lcom/waze/car_lib/platform/af;","b",emptyList())
  val before=method.implementation!!.instructions.toList()
  assertThrows(IllegalStateException::class.java) { preserveBroadcastsAfterCarSession(method) }
  assertEquals(before,method.implementation!!.instructions.toList())
 }

 @Test fun changedCarTeardownDecisionIsRejectedBeforeEditing() {
  val service="Lcom/waze/car_lib/WazeCarAppService;"
  val method=originalCarMethod(service,"a",listOf(service))
  val decision=method.implementation!!.instructions.indexOfFirst { (it as? ReferenceInstruction)?.reference.toString()=="Lcom/waze/car_lib/w;->b()Z" }
  method.replaceInstruction(decision,"invoke-interface {v0}, Lcom/waze/car_lib/w;->d()Z")
  val before=method.implementation!!.instructions.toList()
  assertThrows(IllegalStateException::class.java) { preserveBroadcastsAfterCarSession(method) }
  assertEquals(before,method.implementation!!.instructions.toList())
 }

 @Test fun coldApplicationNeverForcesAnActivityRelaunchFromStaleTaskHistory() {
  val path=System.getenv("WAZE_STARTUP_APK");assumeNotNull(path)
  val dex=DexFileFactory.loadDexContainer(File(path!!),Opcodes.getDefault())
  val original=dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.single { it.type=="Lcom/waze/ls;" }.methods.single { it.name=="onCreate" }
  val method=MutableMethod(original)
  val before=method.implementation!!.instructions.toList()
  val branch=before[49] as BuilderOffsetInstruction
  val target=branch.target
  val helper=Class.forName("patches.waze.WazeNavigationBroadcastPatchKt").getDeclaredMethod("suppressTaskRelaunch",MutableMethod::class.java)
  helper.isAccessible=true;helper.invoke(null,method)
  val after=method.implementation!!.instructions.toList()
  assertEquals(before.size,after.size);assertEquals(Opcode.GOTO_32,after[49].opcode)
  assertSame(target,(after[49] as BuilderOffsetInstruction).target)
 }
}
