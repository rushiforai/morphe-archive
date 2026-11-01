package patches.bright

import app.morphe.patcher.patch.resourcePatch

/**
 * Native advertising suppression in the Flutter AOT image. Every edit keeps
 * the original Dart calling conventions and completes through a genuine
 * shipped continuation:
 *  - `_GadState._loadBannerAd` completes through its original synchronous
 *    null-return tail before creating an ad or a listener.
 *  - publisher-marked advertorial records are filtered before home layout;
 *    the guarded leaf borrows the now-unreachable banner loader body.
 *  - `_GadState.build` always returns the shipped subscriber empty
 *    `SizedBox`; the ad-sized reserved layout disappears with it.
 *  - `InterstitialService.optionToRun` immediately completes with the
 *    function's own `ReturnAsyncNotFuture` null tail, so the article click
 *    continuation still awaits normally and pushes exactly one route.
 */
internal val adNative = resourcePatch {
    dependsOn(originalInput)
    execute { applyNativePolicy(NativePolicy.ADS) }
}

internal val nativeAdEdits = mapOf(
    "arm64-v8a" to listOf(
        NativeEdit(NativeRange("bannerRender", 0x542978, 0x18c,
            "abdc0b72f9a5041b485f23ac3be1d32fc12fc8da75efde0444bda8af39416ea7"), 0x5429b4,
            nativeBytes("a1002037"), nativeBytes("1f2003d5")),
        NativeEdit(NativeRange("interstitialOption", 0x549b1c, 0xfc,
            "ba01a9dc501900f6cc486d0371ce3cc96a0261e1465457ad70b36cc82bc24368"), 0x549b50,
            nativeBytes("61002036"), nativeBytes("01000014")),
    ) + nativeSponsoredEdits.getValue("arm64-v8a"),
)

internal fun nativeBytes(hex: String): ByteArray = ByteArray(hex.length / 2) { index ->
    ((Character.digit(hex[index * 2], 16) shl 4) or Character.digit(hex[index * 2 + 1], 16)).toByte()
}
