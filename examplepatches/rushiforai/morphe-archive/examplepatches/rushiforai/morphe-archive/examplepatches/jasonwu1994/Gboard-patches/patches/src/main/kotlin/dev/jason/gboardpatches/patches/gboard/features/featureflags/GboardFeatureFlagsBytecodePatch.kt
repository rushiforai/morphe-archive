package dev.jason.gboardpatches.patches.gboard.features.featureflags

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val FLAG_VALUE_CLASS = "Lmky;"
private const val FEATURE_FLAGS_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/featureflags/GboardFeatureFlagsRuntime;"

internal val gboardFeatureFlagsBytecodePatch = bytecodePatch(
    description = "在 Gboard rollout flag getter 單點強制回傳指定 flag 的 true 值"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        injectFeatureFlagOverride()
    }
}

context(context: BytecodePatchContext)
private fun injectFeatureFlagOverride() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = FLAG_VALUE_CLASS,
        name = "g",
        returnType = "Ljava/lang/Object;",
        parameterTypes = emptyList()
    )

    mutableMethod.addInstructions(0, FEATURE_FLAG_OVERRIDE_DELEGATE)
}

private val FEATURE_FLAG_OVERRIDE_DELEGATE = """
    iget-object v0, p0, $FLAG_VALUE_CLASS->a:Ljava/lang/String;

    invoke-static {v0}, $FEATURE_FLAGS_RUNTIME_CLASS->shouldForceFlagTrue(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_jasondev_continue_original

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    :cond_jasondev_continue_original
""".trimIndent()
