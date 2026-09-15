package app.ahmedyarub.patches.instagram.distractionFree

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.library.instagram.patches.overrideMobileConfigBooleanFlag
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

/**
 * Adapted from brosssh's Instagram patches.
 * https://github.com/brosssh/morphe-patches
 *
 * The method reporting whether a feed item is an ad pod. Anchored on a log string rather than
 * on any obfuscated name, which is why it survives across app versions unchanged: the same
 * fingerprint resolves on both 439.0.0.37.89 and 446.0.0.49.77.
 */
private object DisableAdsFingerprint : Fingerprint(
    strings = listOf("Is ad pod"),
)

/**
 * `ig_android_controller_migration::use_v2_controller`.
 *
 * Turning the v2 feed controller off keeps the app on the path where the ad pod check above
 * is actually consulted.
 */
private const val USE_V2_CONTROLLER_FLAG = "110800::0"

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Hides ads in the feed.",
    default = true
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    dependsOn(
        overrideMobileConfigBooleanFlag(
            override = USE_V2_CONTROLLER_FLAG to false
        )
    )

    execute {
        DisableAdsFingerprint.method.returnEarly(false)
    }
}
