package semicoloncolonel.mobilestream.patches.viki.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.viki.shared.Constants

// Removes the free-tier preroll and midroll video ads by making media3's IMA
// ad-request builder (see Fingerprints.kt) throw before the ad is ever
// requested. media3 catches the IOException and falls back to its no-ads
// state, so the content plays with no breaks.
//
// This removes ads only. It never requests the ad and never reads or flips any
// premium, entitlement, or Viki Pass flag, so paid content stays behind the
// paywall exactly as before.
@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the preroll and midroll ads in free videos.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        ImaAdsRequestBuilderFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Ljava/io/IOException;
                const-string v1, "ads_blocked"
                invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
                throw v0
            """,
        )
    }
}
