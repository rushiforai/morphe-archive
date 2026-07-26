package dev.jason.gboardpatches.patches.gboard.features.writingtools

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import dev.jason.gboardpatches.patches.gboard.features.featureflags.FEATURE_FLAG_OVERRIDE_SHAPE_WRITING_TOOLS
import dev.jason.gboardpatches.patches.gboard.features.featureflags.FEATURE_FLAG_RECEIVER_REGISTER
import dev.jason.gboardpatches.patches.gboard.features.featureflags.RESULT_REGISTER_TOKEN
import dev.jason.gboardpatches.patches.gboard.features.featureflags.injectFeatureFlagReturnOverrides
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAiWritingToolsFlagValuePatch = bytecodePatch(
    description = "依官方四顆 Writing tools switch 與 runtime 設定覆寫 neg#g()。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        injectFlagValueOverride()
    }
}

context(context: BytecodePatchContext)
private fun injectFlagValueOverride() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(GboardVersionBindings.flagBoolGetter)

    mutableMethod.applyWritingToolsFlagValueOverride()
}

internal fun MutableMethod.applyWritingToolsFlagValueOverride() {
    injectFeatureFlagReturnOverrides(
        runtimeClass = AI_WRITING_TOOLS_RUNTIME_CLASS,
        overrideShape = FEATURE_FLAG_OVERRIDE_SHAPE_WRITING_TOOLS,
        unsafeResultRegisters = setOf(FEATURE_FLAG_RECEIVER_REGISTER),
        delegateTemplate = FLAG_VALUE_DELEGATE_TEMPLATE,
    )
}

private val FLAG_VALUE_DELEGATE_TEMPLATE = """
    invoke-static {v1, v$RESULT_REGISTER_TOKEN}, $AI_WRITING_TOOLS_RUNTIME_CLASS->applyOverriddenFlagValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v$RESULT_REGISTER_TOKEN
""".trimIndent()
