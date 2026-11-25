package dev.jason.gboardpatches.patches.gboard.features.writingtools

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.addHelperMethodIfMissing
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.isOpcode
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAiWritingTools1853PreferenceObserverPatch = bytecodePatch(
    description = "Observe the 18.5.4 official proofreading and collaboration preferences, keeping the original values and stock backend.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)
    execute {
        val target = GboardMethodTarget("Lcei;", "x", listOf("I", "Z"), "Z")
        val original = target.resolve(this)
        check(original.accessFlags == (AccessFlags.PUBLIC.value or AccessFlags.FINAL.value))
        val owner = mutableClass("Lcei;")
        check(owner.methods.none { it.name == "morpheWritingToolsStockRead" })
        if (original.implementation!!.instructions.any { it.isMethodReference("Lcei;->morpheCursorStockx(IZ)Z") }) {
            val returns = original.implementation!!.instructions.indices.filter { original.implementation!!.instructions[it].isOpcode("RETURN") }
            check(returns.size == 1 && original.implementation!!.registerCount == 4)
            original.addInstructions(returns.single(), RuntimeCallEmitter.invoke(
                RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_NOTE_OFFICIAL_PREFERENCE, "p1, v0"))
            return@execute
        }
        val renamed = ImmutableMethod(original.definingClass, "morpheWritingToolsStockRead", original.parameters,
            "Z", AccessFlags.PRIVATE.value or AccessFlags.FINAL.value, original.annotations,
            original.hiddenApiRestrictions, original.implementation).toMutable()
        check(owner.methods.remove(original) && owner.methods.add(renamed))
        owner.addHelperMethodIfMissing("x", original.parameterTypes.map { it.toString() }, "Z", original.accessFlags, 4,
            writingToolsObserverBody(original.definingClass))
    }
}

internal fun writingToolsObserverBody(owner: String) = """
    invoke-direct {p0, p1, p2}, $owner->morpheWritingToolsStockRead(IZ)Z
    move-result v0
    ${RuntimeCallEmitter.invoke(RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_NOTE_OFFICIAL_PREFERENCE, "p1, v0")}
    return v0
""".trimIndent()
