package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings

import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardFeatureFlagsBytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private val FLAG_VALUE_RUNTIME_DESCRIPTOR = RuntimeAbiCatalog.abi(
    RuntimeCallId.ADVANCED_VOICE_RUNTIME_AFTER_FLAG_VALUE,
).reference

internal val ADVANCED_VOICE_FLAG_VALUE_DELEGATE_TEMPLATE = """
    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ADVANCED_VOICE_RUNTIME_AFTER_FLAG_VALUE,
        "v1, v__RESULT__",
    )}

    move-result-object v__RESULT__
""".trimIndent()

internal val gboardAdvancedVoiceFlagValuePatch = bytecodePatch(
    description = "在 17.7.7 rollout flag getter 後套用 Advanced Voice exact flag policy。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardFeatureFlagsBytecodePatch)

    execute {
        val method = findMutableMethodOrThrow(GboardVersionBindings.flagBoolGetter)
        method.applyAdvancedVoiceFlagValueDelegate()
    }
}

internal fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
    .applyAdvancedVoiceFlagValueDelegate() = injectAdvancedVoiceResultDelegate(
        FLAG_VALUE_RUNTIME_DESCRIPTOR,
        ADVANCED_VOICE_FLAG_VALUE_DELEGATE_TEMPLATE,
    )
