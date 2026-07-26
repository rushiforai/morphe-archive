package dev.jason.gboardpatches.patches.gboard.features.zhuyintraditionalsimplifiedtoggle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal const val ZHUYIN_TOGGLE_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/zhuyintoggle/" +
        "GboardZhuyinTraditionalSimplifiedToggleRuntime;"

private val softKeyMetadataType = GboardVersionBindings.softKeyBind.parameterTypes[0]

internal val ZHUYIN_TOGGLE_PATCH_INCOMING_METADATA_DELEGATE = """
    invoke-static {p0, p1}, $ZHUYIN_TOGGLE_RUNTIME_CLASS->patchIncomingSoftKeyMetadata(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, $softKeyMetadataType
""".trimIndent()

internal val ZHUYIN_TOGGLE_AFTER_BIND_DELEGATE = """
    invoke-static {p0}, $ZHUYIN_TOGGLE_RUNTIME_CLASS->afterSoftKeyBound(Ljava/lang/Object;)V
""".trimIndent()

internal val gboardZhuyinTraditionalSimplifiedToggleSoftKeyPatch = bytecodePatch(
    description = "修正注音 ㄥ 上滑繁簡切換鍵的 SoftKeyView bind-time metadata。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(GboardVersionBindings.softKeyBind)
        mutableMethod.addInstructions(0, ZHUYIN_TOGGLE_PATCH_INCOMING_METADATA_DELEGATE)
        val returnIndices = mutableMethod.returnInstructionIndices()
        check(returnIndices.isNotEmpty()) {
            "Could not find normal return in generated SoftKeyView bind target"
        }
        returnIndices
            .asReversed()
            .forEach { returnIndex ->
                mutableMethod.addInstructions(returnIndex, ZHUYIN_TOGGLE_AFTER_BIND_DELEGATE)
            }
    }
}
