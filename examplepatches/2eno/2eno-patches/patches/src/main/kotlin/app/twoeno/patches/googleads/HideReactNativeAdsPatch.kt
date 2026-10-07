package app.twoeno.patches.googleads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.twoeno.patches.shared.Constants.COMPATIBILITY_INTERPALS
import app.twoeno.patches.shared.Constants.COMPATIBILITY_UNTAPPD
import app.twoeno.patches.shared.EXTENSION
import app.twoeno.patches.shared.EXTENSION_PACKAGE
import app.twoeno.patches.shared.parameterRegister
import app.morphe.util.p0Register

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/googleads/ReactNativeAdsPatch;"

/**
 * Blocks the ads of React Native apps using react-native-google-mobile-ads.
 * Every ad request is answered with a "no fill" error, so the app does not wait for the ad.
 */
@Suppress("unused")
val hideReactNativeAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Blocks banner, interstitial, rewarded, app open and native Google ads.",
) {
    compatibleWith(COMPATIBILITY_INTERPALS, COMPATIBILITY_UNTAPPD)

    extendWith(EXTENSION)

    execute {
        var blocked = 0

        BannerAdRequestFingerprint.methodOrNull?.apply {
            val thisRegister = p0Register
            addInstructions(
                0,
                """
                    invoke-static/range { v$thisRegister .. v${thisRegister + 1} }, $EXTENSION_CLASS->blockBannerAd(Ljava/lang/Object;Ljava/lang/Object;)V
                    return-void
                """,
            )
            blocked++
        }

        FullScreenAdLoadFingerprint.methodOrNull?.apply {
            // this, requestId, adUnitId
            val thisRegister = p0Register
            addInstructions(
                0,
                """
                    invoke-static/range { v$thisRegister .. v${thisRegister + 2} }, $EXTENSION_CLASS->blockFullScreenAd(Ljava/lang/Object;ILjava/lang/String;)V
                    return-void
                """,
            )
            blocked++
        }

        NativeAdLoadFingerprint.methodOrNull?.apply {
            val promiseRegister = parameterRegister(2)
            addInstructions(
                0,
                """
                    invoke-static/range { v$promiseRegister .. v$promiseRegister }, $EXTENSION_CLASS->blockNativeAd(Ljava/lang/Object;)V
                    return-void
                """,
            )
            blocked++
        }

        // Ads loaded by native code instead of the React Native module.
        BaseAdViewLoadAdFingerprint.methodOrNull?.apply {
            returnEarly()
            blocked++
        }

        if (blocked == 0) throw PatchException("Could not find any Google ads code")
    }
}
