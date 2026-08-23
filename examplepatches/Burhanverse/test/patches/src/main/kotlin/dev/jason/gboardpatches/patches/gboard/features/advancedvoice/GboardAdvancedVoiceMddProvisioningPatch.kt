package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings

import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private val MDD_PROVISIONING_RUNTIME_DESCRIPTOR = RuntimeAbiCatalog.abi(
    RuntimeCallId.ADVANCED_VOICE_RUNTIME_AFTER_MDD_PROVIDER_CONSTRUCTED,
).reference

internal val ADVANCED_VOICE_MDD_PROVISIONING_DELEGATE = """
    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ADVANCED_VOICE_RUNTIME_AFTER_MDD_PROVIDER_CONSTRUCTED,
        "p0",
    )}
""".trimIndent()

internal val gboardAdvancedVoiceMddProvisioningPatch = bytecodePatch(
    description = "在 17.7.7 qzh constructor 成功後要求 stock zh-TW MDD provisioning。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val method = findMutableMethodOrThrow(
            GboardVersionBindings.advancedVoiceMddProviderConstructor,
        )
        method.applyAdvancedVoiceMddProvisioningDelegate()
    }
}

internal fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
    .applyAdvancedVoiceMddProvisioningDelegate() {
    applyAdvancedVoiceFingerprintGuard(
        GboardVersionBindings.advancedVoiceMddProviderConstructor.reference,
        MDD_PROVISIONING_RUNTIME_DESCRIPTOR,
        GboardAdvancedVoice1777Fingerprints.mddProviderStock,
        GboardAdvancedVoice1777Fingerprints.mddProviderPatched,
    ) {
        injectAdvancedVoiceBeforeReturns(
            MDD_PROVISIONING_RUNTIME_DESCRIPTOR,
            ADVANCED_VOICE_MDD_PROVISIONING_DELEGATE,
        )
    }
}
