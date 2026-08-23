package dev.jason.gboardpatches.patches.gboard.features.spacebarlogo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val SPACEBAR_LOGO_BEFORE_BIND_DELEGATE = RuntimeCallEmitter.invoke(
    RuntimeCallId.SPACEBAR_LOGO_RUNTIME_BEFORE_SOFT_KEY_BOUND,
    "p0, p1",
)

internal val SPACEBAR_LOGO_AFTER_BIND_DELEGATE = RuntimeCallEmitter.invoke(
    RuntimeCallId.SPACEBAR_LOGO_RUNTIME_AFTER_SOFT_KEY_BOUND,
    "p0, p1",
)

internal val gboardSpacebarLogoSoftKeyPatch = bytecodePatch(
    description = "在 SoftKeyView bind 前後委派空白鍵圖示顯示。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        injectSpacebarLogoDelegates()
    }
}

context(context: BytecodePatchContext)
private fun injectSpacebarLogoDelegates() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(GboardVersionBindings.softKeyBind)

    mutableMethod.returnInstructionIndices()
        .asReversed()
        .forEach { returnIndex ->
            mutableMethod.addInstructions(returnIndex, SPACEBAR_LOGO_AFTER_BIND_DELEGATE)
        }
    mutableMethod.addInstructions(0, SPACEBAR_LOGO_BEFORE_BIND_DELEGATE)
}
