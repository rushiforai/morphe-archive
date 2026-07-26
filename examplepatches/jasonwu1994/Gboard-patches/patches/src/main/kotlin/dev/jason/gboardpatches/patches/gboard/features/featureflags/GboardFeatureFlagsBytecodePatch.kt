package dev.jason.gboardpatches.patches.gboard.features.featureflags

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.mutableFieldOrThrow
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val FEATURE_FLAGS_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/featureflags/GboardFeatureFlagsRuntime;"

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
        runtimeClass = FEATURE_FLAGS_RUNTIME_CLASS,
        overrideShape = FEATURE_FLAG_OVERRIDE_SHAPE_SHARED,
        unsafeResultRegisters = setOf(0, FEATURE_FLAG_RECEIVER_REGISTER),
        delegateTemplate = FEATURE_FLAG_VALUE_DELEGATE_TEMPLATE,
    )
}

private val FEATURE_FLAG_VALUE_DELEGATE_TEMPLATE = """
    iget-object v0, v1, ${GboardVersionBindings.flagNameField.classType}->${GboardVersionBindings.flagNameField.name}:${GboardVersionBindings.flagNameField.type}

    invoke-static {v0, v$RESULT_REGISTER_TOKEN}, $FEATURE_FLAGS_RUNTIME_CLASS->applyOverriddenFlagValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v$RESULT_REGISTER_TOKEN
""".trimIndent()
