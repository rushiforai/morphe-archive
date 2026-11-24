package app.template.patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HELPER = "Lapp/template/extension/extension/SearchSheet;"
private object TouchFlow : Fingerprint(definingClass = "Lcom/waze/main_screen/s/u;", name = "invokeSuspend")
private object MapAction : Fingerprint(definingClass = "Lcom/waze/main_screen/s/r;", name = "invokeSuspend")
private object Collector : Fingerprint(definingClass = "Lcom/waze/main_screen/s/t;", name = "<init>", parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "I"))
private object Activity : Fingerprint(definingClass = "Lcom/waze/FreeMapAppActivity;", name = "onCreate", parameters = listOf("Landroid/os/Bundle;"))
private object TouchFlowNew : Fingerprint(definingClass = "Lcom/waze/main_screen/t/v;", name = "invokeSuspend")
private object MapActionNew : Fingerprint(definingClass = "Lcom/waze/main_screen/t/t;", name = "invokeSuspend")
private object CollectorNew : Fingerprint(definingClass = "Lcom/waze/main_screen/t/u;", name = "<init>", parameters = listOf("Lkotlinx/coroutines/ae;", "Lcom/waze/main_screen/t/ao;", "I"))

@Suppress("unused")
val compactSearchSheetPatch = patch(
    name = "Waze Minimize Search Bar",
    description = "Tap the map to hide or reveal the search bar; hide it after 10 seconds of inactivity.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Waze Mod", packageName = "com.chisadin.wazemod", apkFileType = ApkFileType.APK,
        appIconColor = 0x33CCFF, targets = listOf(AppTarget(version = "5.24.5.0")),
    ), Compatibility(
        name = "Waze", packageName = "com.waze", apkFileType = ApkFileType.APK,
        appIconColor = 0x33CCFF, targets = listOf(AppTarget(version = "5.24.5.0", isExperimental = true), AppTarget(version = "5.27.5.0", isExperimental = true)),
    ))
    extendWith("extensions/extension.mpe")
    execute {
        fun indices(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod, owner: String, name: String) =
            method.implementation!!.instructions.withIndex().filter { (_, insn) ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == owner && ref.name == name
            }.map { it.index }

        val newProfile = TouchFlowNew.matchOrNull() != null
        val flow = if (newProfile) TouchFlowNew.method else TouchFlow.method
        val flowCalls = indices(flow, "Lcom/waze/ui/o/d;", "h")
        check(flowCalls.size == 1)
        flow.replaceInstruction(flowCalls.single(), "invoke-virtual {v2}, Lcom/waze/ui/o/d;->g()Lkotlinx/coroutines/b/j;")

        val action = if (newProfile) MapActionNew.method else MapAction.method
        val actions = indices(action, if (newProfile) "Lcom/waze/main_screen/ae;" else "Lcom/waze/main_screen/ab;", "i")
        check(actions.size == 2)
        // First call is the map-touch coroutine; the other call retains normal behavior.
        action.replaceInstruction(actions.first(), "invoke-static {p1, v2}, $HELPER->toggle(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;")

        val collector = if (newProfile) CollectorNew.method else Collector.method
        val returns = collector.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        check(returns.size == 1)
        collector.addInstructions(returns.single().index, "invoke-static {p0}, $HELPER->register(Ljava/lang/Object;)V")

        val activity = Activity.method
        val onCreate = indices(activity, if (newProfile) "Lcom/waze/br;" else "Lcom/waze/bv;", "onCreate")
        check(onCreate.size == 1)
        activity.addInstructions(onCreate.single() + 1, "invoke-static {p0}, $HELPER->install(Landroid/app/Activity;)V")
    }
}
