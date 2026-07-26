package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardFeatureFlagsBytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val FLAG_VALUE_RUNTIME_DESCRIPTOR =
    "$ADVANCED_VOICE_RUNTIME_CLASS->afterFlagValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"

internal val ADVANCED_VOICE_FLAG_VALUE_DELEGATE_TEMPLATE = """
    invoke-static {v1, v__RESULT__}, $FLAG_VALUE_RUNTIME_DESCRIPTOR

    move-result-object v__RESULT__
""".trimIndent()

internal val gboardAdvancedVoiceFlagValuePatch = bytecodePatch(
    description = "在 17.7.7 rollout flag getter 後套用 Advanced Voice exact flag policy。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardFeatureFlagsBytecodePatch)

    execute {
        val method = findMutableMethodOrThrow(GboardAdvancedVoice1777Bindings.flagValue)
        method.applyAdvancedVoiceFlagValueDelegate()
    }
}

internal fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
    .applyAdvancedVoiceFlagValueDelegate() = injectAdvancedVoiceResultDelegate(
        FLAG_VALUE_RUNTIME_DESCRIPTOR,
        ADVANCED_VOICE_FLAG_VALUE_DELEGATE_TEMPLATE,
    )
