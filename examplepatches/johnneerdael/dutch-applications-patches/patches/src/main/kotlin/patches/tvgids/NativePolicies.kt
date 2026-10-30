package patches.tvgids

import app.morphe.patcher.patch.ResourcePatchContext

internal enum class NativePolicy { ADS, TRACKING, CONSENT }

// The hidden resource policies are composed before exposing a complete control.
private val adEdits = nativeAdEdits
private val trackingEdits = nativeTrackingEdits
private val consentEdits = nativeConsentEdits

/** Compute and validate every ABI before the first filesystem mutation. */
internal fun ResourcePatchContext.applyNativePolicy(policy: NativePolicy) {
    val packaged = listApkEntries("lib").filter { it.endsWith("/libapp.so") }.toSet()
    check(packaged == nativeAbis.map { "lib/$it/libapp.so" }.toSet()) { "Unexpected TVgids ABI set" }
    val files = nativeAbis.associateWith { get("lib/$it/libapp.so") }
    val inputs = files.mapValues { it.value.readBytes() }
    val edits = when (policy) {
        NativePolicy.ADS -> adEdits
        NativePolicy.TRACKING -> trackingEdits
        NativePolicy.CONSENT -> consentEdits
    }
    val prior = when (policy) {
        NativePolicy.ADS -> nativeAbis.associateWith { emptyList() }
        NativePolicy.TRACKING -> adEdits
        NativePolicy.CONSENT -> nativeAbis.associateWith { adEdits.getValue(it) + trackingEdits.getValue(it) }
    }
    val outputs = inputs.mapValues { (abi, input) ->
        transformNative(abi, input, edits.getValue(abi), prior.getValue(abi))
    }
    outputs.forEach { (abi, output) ->
        if (!output.contentEquals(inputs.getValue(abi))) files.getValue(abi).writeBytes(output)
    }
}
