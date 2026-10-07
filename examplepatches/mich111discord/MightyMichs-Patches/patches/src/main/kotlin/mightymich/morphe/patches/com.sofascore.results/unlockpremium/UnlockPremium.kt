package mightymich.morphe.patches.com.sofascore.results.unlockpremium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium & Remove Ads",
    description = "Unlocks SofaScore premium and disables ads.",
    default = false
) {
    compatibleWith(SofaScorePremiumCompatibility.SOFASCORE_PREMIUM)

    val getHasPremiumFingerprint = Fingerprint(
        definingClass = "Lcom/sofascore/local_persistence/UserAccount;",
        name = "getHasPremium",
        returnType = "Z"
    )

    val getForceHideAdsFingerprint = Fingerprint(
        definingClass = "Lcom/sofascore/local_persistence/UserAccount;",
        name = "getForceHideAds",
        returnType = "Z"
    )

    execute {
        getHasPremiumFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find getHasPremium method.")
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        getForceHideAdsFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find getForceHideAds method.")
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
    }
}
