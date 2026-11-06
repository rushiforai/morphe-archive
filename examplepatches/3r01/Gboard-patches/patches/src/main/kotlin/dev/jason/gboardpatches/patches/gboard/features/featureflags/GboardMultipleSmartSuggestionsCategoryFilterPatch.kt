package dev.jason.gboardpatches.patches.gboard.features.featureflags

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationPlan
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationState
import dev.jason.gboardpatches.patches.gboard.shared.applyVerified
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.isInvoke
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private val REMOVE_UNDO_CALL =
    RuntimeCallId.MULTIPLE_SMART_SUGGESTIONS_RUNTIME_REMOVE_UNDO_CATEGORY
private val REMOVE_UNDO_DESCRIPTOR = RuntimeAbiCatalog.abi(REMOVE_UNDO_CALL).reference
private const val PROACTIVE_SUGGESTIONS_CLASS = "Lipl;"
private const val PROACTIVE_SUGGESTIONS_METHOD = "k"
private const val PROACTIVE_SUGGESTIONS_REFERENCE =
    "Lipl;->k(Ljava/util/EnumMap;)Z"

internal val gboardMultipleSmartSuggestionsCategoryFilterPatch = bytecodePatch(
    description = "阻止 undo/redo proactive actions 取代 Gboard toolbar。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        findMutableMethodOrThrow(
            PROACTIVE_SUGGESTIONS_CLASS,
            PROACTIVE_SUGGESTIONS_METHOD,
            "Z",
            listOf("Ljava/util/EnumMap;"),
        )
            .removeUndoProactiveCategory()
    }
}

internal fun MutableMethod.removeUndoProactiveCategory() {
    applyVerified(
        VerifiedTransformationPlan(
            targetName = PROACTIVE_SUGGESTIONS_REFERENCE,
            classify = MutableMethod::classifyUndoCategoryFilter,
            mutate = { method ->
                method.addInstructions(
                    0,
                    RuntimeCallEmitter.invoke(REMOVE_UNDO_CALL, "p1"),
                )
                method
            },
        ),
    )
}

private fun MutableMethod.classifyUndoCategoryFilter(): VerifiedTransformationState {
    val instructions = implementation?.instructions
        ?: error("Proactive suggestions show target has no implementation")
    val referenceCount = instructions.count { instruction ->
        instruction.isMethodReference(REMOVE_UNDO_DESCRIPTOR)
    }
    val categoryRegister = implementation!!.registerCount - 1
    return when (referenceCount) {
        0 -> VerifiedTransformationState.STOCK
        1 -> if (
            instructions.firstOrNull()
                ?.isInvoke("INVOKE_STATIC", REMOVE_UNDO_DESCRIPTOR, categoryRegister) == true
        ) {
            VerifiedTransformationState.PATCHED
        } else {
            VerifiedTransformationState.MALFORMED
        }
        else -> VerifiedTransformationState.MALFORMED
    }
}
