package patches.bright

import app.morphe.patcher.patch.ResourcePatchContext

internal enum class NativePolicy { ADS, CONSENT }

// The hidden resource policies are composed before exposing a complete control.
// Tracking has no native AOT edits: its surfaces are manifest/provider level.
private val adEdits = nativeAdEdits
private val consentEdits = nativeConsentEdits

/** Compute and validate the complete ABI set before the first filesystem mutation. */
internal fun ResourcePatchContext.applyNativePolicy(policy: NativePolicy) {
    val packaged = listApkEntries("lib").filter { it.endsWith("/libapp.so") }.toSet()
    check(packaged == nativeAbis.map { "lib/$it/libapp.so" }.toSet()) { "Unexpected Bright ABI set" }
    val files = nativeAbis.associateWith { get("lib/$it/libapp.so") }
    val inputs = files.mapValues { it.value.readBytes() }
    val edits = when (policy) {
        NativePolicy.ADS -> adEdits
        NativePolicy.CONSENT -> consentEdits
    }
    val prior = when (policy) {
        NativePolicy.ADS -> nativeAbis.associateWith { emptyList<NativeEdit>() }
        // Consent composition restores the already-applied ads edits first.
        NativePolicy.CONSENT -> adEdits
    }
    val outputs = inputs.mapValues { (abi, input) ->
        transformNative(abi, input, edits.getValue(abi), prior.getValue(abi))
    }
    outputs.forEach { (abi, output) ->
        if (!output.contentEquals(inputs.getValue(abi))) files.getValue(abi).writeBytes(output)
    }
}
