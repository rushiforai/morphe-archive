package semicoloncolonel.mobilestream.patches.cnn.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cnn.shared.Constants

private const val COMPONENTS = "Lcom/cnn/mobile/android/phone/eight/core/components/"
private const val PLAY_CONFIG_BUILDER = "Lcom/turner/top/player/config/builders/PlayConfigBuilder;"

// CNN 26.21.0 and 26.23.0. Display ads come from Google Ad Manager and Dianomi;
// video ads come from the TOP player that plays CNN's articles and clips. All
// Access streaming plays in a separate player, which this patch does not touch.

// The Google Ad Manager ("dfp") load gate. Stopping it is the app's own no-fill
// path, so no display ad request is ever built. The gate moved between builds,
// so both forms are handled and at least one must be present:
//
//  - 26.21.0: AdHelper's "dfp" gate, a no-argument boolean (h() before R8).
//    Forcing it false makes the ad loader report a failed load.
internal object DfpEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/cnn/mobile/android/phone/features/ads/AdHelper;",
    parameters = listOf(),
    returnType = "Z",
    strings = listOf("dfp"),
)

//  - 26.23.0: the gate moved into GoogleAdViewModel.fetchAds, which checks the
//    "dfp" flag and either serves a cached ad or builds a new AdManagerAdView.
//    Returning before any of that loads no ad and shows none from the cache.
internal object FetchAdsFingerprint : Fingerprint(
    definingClass = "${COMPONENTS}GoogleAdViewModel;",
    returnType = "V",
    strings = listOf("DFP Ad retrieved from cache ordinal="),
)

// The Compose components that draw an ad slot and its "Advertisement" label.
// Returning before they compose anything leaves no gap in the feed. The one
// Content method per class is matched by name and void return; its parameter
// types are not pinned, because 26.23.0 obfuscates Compose's Modifier and
// Composer (26.21.0 left them with their library names).
private class AdComponentFingerprint(component: String) : Fingerprint(
    definingClass = "$COMPONENTS$component;",
    name = "Content",
    returnType = "V",
)

// The TOP player's builder already has disableAds(), which turns off its ad
// loader (and the BrightLine overlays it drives). withAds() becomes the same.
internal object WithAdsFingerprint : Fingerprint(
    definingClass = PLAY_CONFIG_BUILDER,
    name = "withAds",
    returnType = PLAY_CONFIG_BUILDER,
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the banner and sponsored-content ads, and the ads in videos and clips.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // The Google Ad Manager load gate, whichever build this is. 26.21.0 has
        // the AdHelper boolean; 26.23.0 has GoogleAdViewModel.fetchAds. At least
        // one must be present, so a future move is caught instead of passing silently.
        val dfpGate = DfpEnabledFingerprint.methodOrNull
        dfpGate?.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        val fetchAds = FetchAdsFingerprint.methodOrNull
        fetchAds?.addInstructions(0, "return-void")
        if (dfpGate == null && fetchAds == null) {
            throw PatchException("Google Ad Manager gate not found (AdHelper dfp or GoogleAdViewModel.fetchAds)")
        }

        listOf("GoogleAdComponent", "DianomiAdComponent").forEach {
            AdComponentFingerprint(it).method.addInstructions(0, "return-void")
        }

        WithAdsFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, $PLAY_CONFIG_BUILDER->disableAds()$PLAY_CONFIG_BUILDER
                move-result-object v0
                return-object v0
            """,
        )
    }
}
