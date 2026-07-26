package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val MDD_PROVISIONING_RUNTIME_DESCRIPTOR =
    "$ADVANCED_VOICE_RUNTIME_CLASS->afterMddProviderConstructed(Ljava/lang/Object;)V"

internal val ADVANCED_VOICE_MDD_PROVISIONING_DELEGATE = """
    invoke-static {p0}, $MDD_PROVISIONING_RUNTIME_DESCRIPTOR
""".trimIndent()

internal val gboardAdvancedVoiceMddProvisioningPatch = bytecodePatch(
    description = "在 17.7.7 qzh constructor 成功後要求 stock zh-TW MDD provisioning。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val method = findMutableMethodOrThrow(
            GboardAdvancedVoice1777Bindings.mddProviderConstructor,
        )
        method.applyAdvancedVoiceMddProvisioningDelegate()
    }
}

internal fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
    .applyAdvancedVoiceMddProvisioningDelegate() {
    applyAdvancedVoiceFingerprintGuard(
        GboardAdvancedVoice1777Bindings.mddProviderConstructor.descriptor(),
        MDD_PROVISIONING_RUNTIME_DESCRIPTOR,
        GboardAdvancedVoice1777Bindings.mddProviderStockFingerprint,
        GboardAdvancedVoice1777Bindings.mddProviderPatchedFingerprint,
    ) {
        injectAdvancedVoiceBeforeReturns(
            MDD_PROVISIONING_RUNTIME_DESCRIPTOR,
            ADVANCED_VOICE_MDD_PROVISIONING_DELEGATE,
        )
    }
}
