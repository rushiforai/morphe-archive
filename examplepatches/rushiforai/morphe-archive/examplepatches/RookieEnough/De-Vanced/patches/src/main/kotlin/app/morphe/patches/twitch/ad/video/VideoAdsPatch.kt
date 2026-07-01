/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/twitch/ad/video/VideoAdsPatch.kt
 */
package app.morphe.patches.twitch.ad.video

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val blockVideoAdsPatch = bytecodePatch(
    name = "Block video ads",
    description = "Blocks video ads in streams and VODs.",
) {
    compatibleWith(AppCompatibilities.TWITCH)

    execute {
        // Unconditional ad eligibility spoof:
        // Return `Single.just(null)` so the app treats the player as ineligible.
        CheckAdEligibilityLambdaMethodFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    invoke-static {v0}, Lio/reactivex/Single;->just(Ljava/lang/Object;)Lio/reactivex/Single;
                    move-result-object p0
                    return-object p0
                """.trimIndent(),
            )
        }

        // If the app still exposes a `getShowAds()` flag, force it off.
        ContentConfigShowAdsMethodFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """.trimIndent(),
            )
        }
    }
}

