package semicoloncolonel.mobilestream.patches.washingtonpost.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.washingtonpost.shared.Constants

// WaPo phone 7.18.1. Every ad slot is a com.wapo.adsinf.BannerAdView, which
// runs the whole stack itself: Google Ad Manager, with Amazon and Nimbus
// bidding. Two methods drive it, renamed in this build:
//   n(config) — starts the ad request coroutine (and its refresh timer)
//   a(config) — the AdView interface call that swaps in the rendered ad
// The patch returns from n before anything is requested, and turns a into
// "hide this slot", so an empty slot does not leave a gap.
private const val BANNER_AD_VIEW = "Lcom/wapo/adsinf/BannerAdView;"

internal object BannerAdLoadFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == BANNER_AD_VIEW && method.name == "n" && method.parameterTypes.size == 1
    },
)

internal object BannerAdShowFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == BANNER_AD_VIEW && method.name == "a" && method.parameterTypes.size == 1 &&
            method.parameterTypes.first().toString() ==
            classDef.methods.first { it.name == "n" && it.parameterTypes.size == 1 }.parameterTypes.first().toString()
    },
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes ads from the Washington Post phone app: no ad slot requests an " +
        "ad, and each slot is hidden. Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        BannerAdLoadFingerprint.method.addInstructions(0, "return-void")

        // .locals 0, so only p0/p1 exist; p1 (the config) is not needed after.
        BannerAdShowFingerprint.method.addInstructions(
            0,
            """
                const/16 p1, 0x8
                invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V
                return-void
            """.trimIndent(),
        )
    }
}
