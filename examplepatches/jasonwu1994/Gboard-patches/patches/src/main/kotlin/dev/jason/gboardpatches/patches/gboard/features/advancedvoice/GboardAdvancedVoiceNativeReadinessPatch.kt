package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val NATIVE_READINESS_RUNTIME_DESCRIPTOR =
    "$ADVANCED_VOICE_RUNTIME_CLASS->afterNativeReadiness(Z)Z"

internal val ADVANCED_VOICE_NATIVE_READINESS_DELEGATE_TEMPLATE = """
    invoke-static {v__RESULT__}, $NATIVE_READINESS_RUNTIME_DESCRIPTOR

    move-result v__RESULT__
""".trimIndent()

internal val gboardAdvancedVoiceNativeReadinessPatch = bytecodePatch(
    description = "在 17.7.7 ric#a() 後只依 memoized dictation_jni readiness 提升結果。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val method = findMutableMethodOrThrow(
            GboardAdvancedVoice1777Bindings.nativeReadiness,
        )
        method.applyAdvancedVoiceNativeReadinessDelegate()
    }
}

internal fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
    .applyAdvancedVoiceNativeReadinessDelegate() {
    applyAdvancedVoiceFingerprintGuard(
        descriptor = GboardAdvancedVoice1777Bindings.nativeReadiness.descriptor(),
        runtimeDescriptor = NATIVE_READINESS_RUNTIME_DESCRIPTOR,
        stockFingerprint = GboardAdvancedVoice1777Bindings.nativeReadinessStockFingerprint,
        patchedFingerprint = GboardAdvancedVoice1777Bindings.nativeReadinessPatchedFingerprint,
    ) {
        injectAdvancedVoiceResultDelegate(
            NATIVE_READINESS_RUNTIME_DESCRIPTOR,
            ADVANCED_VOICE_NATIVE_READINESS_DELEGATE_TEMPLATE,
        )
    }
}
