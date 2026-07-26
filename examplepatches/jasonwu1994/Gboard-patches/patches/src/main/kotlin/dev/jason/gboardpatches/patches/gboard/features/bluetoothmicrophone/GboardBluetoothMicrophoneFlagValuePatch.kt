package dev.jason.gboardpatches.patches.gboard.features.bluetoothmicrophone

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

private const val BLUETOOTH_MICROPHONE_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/bluetoothmicrophone/GboardBluetoothMicrophone1777Runtime;"

internal val BLUETOOTH_MICROPHONE_FLAG_VALUE_DELEGATE_TEMPLATE = """
    invoke-static {v1, v$RESULT_REGISTER_TOKEN}, $BLUETOOTH_MICROPHONE_RUNTIME_CLASS->applyOverriddenFlagValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v$RESULT_REGISTER_TOKEN
""".trimIndent()

internal val gboardBluetoothMicrophoneFlagValuePatch = bytecodePatch(
    description = "在 17.7.7 rollout flag getter 後套用 Bluetooth microphone exact flag policy。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(GboardVersionBindings.flagBoolGetter)
            .applyBluetoothMicrophoneFlagValueOverride()
    }
}

internal fun MutableMethod.applyBluetoothMicrophoneFlagValueOverride() {
    injectFeatureFlagReturnOverrides(
        runtimeClass = BLUETOOTH_MICROPHONE_RUNTIME_CLASS,
        overrideShape = FEATURE_FLAG_OVERRIDE_SHAPE_WRITING_TOOLS,
        unsafeResultRegisters = setOf(FEATURE_FLAG_RECEIVER_REGISTER),
        delegateTemplate = BLUETOOTH_MICROPHONE_FLAG_VALUE_DELEGATE_TEMPLATE,
    )
}
