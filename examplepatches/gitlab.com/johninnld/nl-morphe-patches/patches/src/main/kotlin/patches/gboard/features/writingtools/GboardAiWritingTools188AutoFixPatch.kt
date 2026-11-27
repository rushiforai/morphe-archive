package patches.gboard.features.writingtools

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import patches.gboard.Constants.COMPATIBILITY_GBOARD
import patches.gboard.shared.GboardMethodTarget
import patches.gboard.shared.findMutableMethodOrThrow
import patches.gboard.shared.generated.GboardVersionBindings
import patches.gboard.shared.isFieldReference
import patches.gboard.shared.isMethodReference
import patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import patches.gboard.shared.runtimeabi.RuntimeCallId

internal val autoFixAmbiguity188 = GboardMethodTarget("Lohu;", "a", listOf("Loig;"), "Logs;")
internal val autoFixRoute188 = GboardMethodTarget("Lrna;", "r", listOf("Lbatv;"), "Z")
internal val autoFixDispatch188 = GboardMethodTarget(
    "Lrna;", "g", listOf("Ljava/lang/Runnable;", "Lohv;", "Lakry;"), "V",
)
private val enabled = RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_IS_AUTO_FIX_ROUTING_ENABLED
private val route = RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_ALLOW_AUTO_FIX_ROUTE

internal val gboardAiWritingTools188AutoFixPatch = bytecodePatch(
    description = "Restore classified Auto Fix routing to native Proofread on Gboard 18.8.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)
    execute {
        check(GboardVersionBindings.targetVersion == "18.8.0-beta")
        findMutableMethodOrThrow(autoFixAmbiguity188).restoreAutoFixAcceptance188()
        findMutableMethodOrThrow(autoFixRoute188).restoreAutoFixRoute188()
        findMutableMethodOrThrow(autoFixDispatch188).restoreAutoFixDispatch188()
    }
}

private fun MutableMethod.alreadyCalls(call: RuntimeCallId): Boolean {
    val count = implementation!!.instructions.count {
        it.isMethodReference(RuntimeAbiCatalog.abi(call).reference)
    }
    check(count <= 1) { "Duplicate Auto Fix delegate in $definingClass->$name" }
    return count == 1
}

internal fun MutableMethod.restoreAutoFixAcceptance188() {
    check(autoFixAmbiguity188.matches(this))
    if (alreadyCalls(enabled)) return
    val code = checkNotNull(implementation)
    check(code.registerCount == 6)
    check(code.instructions.first().isMethodReference("Loig;->f()Lbatv;"))
    val stock = code.instructions.first()
    addInstructionsWithLabels(0, """
        invoke-virtual {p1}, Loig;->f()Lbatv;
        move-result-object v0
        ${RuntimeCallEmitter.invoke(enabled, "v0")}
        move-result v0
        if-eqz v0, :auto_fix_stock_acceptance
        sget-object v0, Logs;->e:Logs;
        return-object v0
    """.trimIndent(), ExternalLabel("auto_fix_stock_acceptance", stock))
}

internal fun MutableMethod.restoreAutoFixRoute188() {
    check(autoFixRoute188.matches(this))
    if (alreadyCalls(route)) return
    val code = checkNotNull(implementation)
    // This tiny stock method has NO local registers. Preserve the receiver until
    // contains() has consumed it, then reuse only the stock boolean result p0.
    check(code.registerCount == 2)
    check(code.instructions.first().isFieldReference("Lrna;->y:Lauaz;"))
    check(code.instructions.count { it.isMethodReference("Lauaz;->contains(Ljava/lang/Object;)Z") } == 1)
    val returns = code.instructions.indices.filter { code.instructions[it].opcode == Opcode.RETURN }
    check(returns.size == 1 && returns.single() == code.instructions.lastIndex)
    check((code.instructions.last() as OneRegisterInstruction).registerA == 0)
    addInstructions(returns.single(), """
        ${RuntimeCallEmitter.invoke(route, "p0, p1")}
        move-result p0
    """.trimIndent())
}

internal fun MutableMethod.restoreAutoFixDispatch188() {
    check(autoFixDispatch188.matches(this))
    if (alreadyCalls(enabled)) return
    val code = checkNotNull(implementation)
    check(code.registerCount == 6)
    check(code.instructions.first().isFieldReference("Laeaj;->a:Laeaj;")) // PROMPT
    check(code.instructions.count {
        it.isMethodReference("Lrna;->z(Laeaj;Ljava/lang/Runnable;Lohv;Lakry;)V")
    } == 1)
    val stock = code.instructions.first()
    val nativeContinuation = code.instructions[1]
    addInstructionsWithLabels(0, """
        if-eqz p2, :auto_fix_stock_dispatch
        iget-object v0, p2, Lohv;->b:Loig;
        if-eqz v0, :auto_fix_stock_dispatch
        invoke-virtual {v0}, Loig;->f()Lbatv;
        move-result-object v0
        ${RuntimeCallEmitter.invoke(enabled, "v0")}
        move-result v0
        if-eqz v0, :auto_fix_stock_dispatch
        sget-object v0, Laeaj;->e:Laeaj;
        goto :auto_fix_native_dispatch
    """.trimIndent(),
        ExternalLabel("auto_fix_stock_dispatch", stock),
        ExternalLabel("auto_fix_native_dispatch", nativeContinuation),
    )
}
