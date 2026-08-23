package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings

import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private val NATIVE_READINESS_RUNTIME_DESCRIPTOR = RuntimeAbiCatalog.abi(
    RuntimeCallId.ADVANCED_VOICE_RUNTIME_AFTER_NATIVE_READINESS,
).reference

internal val ADVANCED_VOICE_NATIVE_READINESS_DELEGATE_TEMPLATE = """
    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ADVANCED_VOICE_RUNTIME_AFTER_NATIVE_READINESS,
        "v__RESULT__",
    )}

    move-result v__RESULT__
""".trimIndent()

internal val gboardAdvancedVoiceNativeReadinessPatch = bytecodePatch(
    description = "在 17.7.7 ric#a() 後只依 memoized dictation_jni readiness 提升結果。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val method = findMutableMethodOrThrow(
            GboardVersionBindings.advancedVoiceNativeReadiness,
        )
        method.applyAdvancedVoiceNativeReadinessDelegate()
    }
}

internal fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
    .applyAdvancedVoiceNativeReadinessDelegate() {
    applyAdvancedVoiceFingerprintGuard(
        descriptor = GboardVersionBindings.advancedVoiceNativeReadiness.reference,
        runtimeDescriptor = NATIVE_READINESS_RUNTIME_DESCRIPTOR,
        stockFingerprint = GboardAdvancedVoice1777Fingerprints.nativeReadinessStock,
        patchedFingerprint = GboardAdvancedVoice1777Fingerprints.nativeReadinessPatched,
    ) {
        injectAdvancedVoiceResultDelegate(
            NATIVE_READINESS_RUNTIME_DESCRIPTOR,
            ADVANCED_VOICE_NATIVE_READINESS_DELEGATE_TEMPLATE,
        )
    }
}
