package dev.jason.gboardpatches.patches.gboard.features.featureflags

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.mutableFieldOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private val FEATURE_FLAGS_RUNTIME_ABI = RuntimeAbiCatalog.abi(
    RuntimeCallId.FEATURE_FLAGS_RUNTIME_APPLY_OVERRIDDEN_FLAG_VALUE,
)

internal val gboardFeatureFlagsBytecodePatch = bytecodePatch(
    description = "在 Gboard rollout flag getter 原始結果後覆寫啟用中的 public flag"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        injectFeatureFlagOverride()
    }
}

context(context: BytecodePatchContext)
private fun injectFeatureFlagOverride() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(GboardVersionBindings.flagBoolGetter)
    mutableFieldOrThrow(GboardVersionBindings.flagNameField)

    mutableMethod.applyFeatureFlagValueOverride()
}

internal fun MutableMethod.applyFeatureFlagValueOverride() {
    injectFeatureFlagReturnOverrides(
        runtimeClass = FEATURE_FLAGS_RUNTIME_ABI.owner,
        overrideShape = FEATURE_FLAG_OVERRIDE_SHAPE_SHARED,
        unsafeResultRegisters = setOf(0, FEATURE_FLAG_RECEIVER_REGISTER),
        delegateTemplate = FEATURE_FLAG_VALUE_DELEGATE_TEMPLATE,
    )
}

private val FEATURE_FLAG_VALUE_DELEGATE_TEMPLATE = """
    iget-object v0, v1, ${GboardVersionBindings.flagNameField.reference}

    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.FEATURE_FLAGS_RUNTIME_APPLY_OVERRIDDEN_FLAG_VALUE,
        "v0, v$RESULT_REGISTER_TOKEN",
    )}

    move-result-object v$RESULT_REGISTER_TOKEN
""".trimIndent()
