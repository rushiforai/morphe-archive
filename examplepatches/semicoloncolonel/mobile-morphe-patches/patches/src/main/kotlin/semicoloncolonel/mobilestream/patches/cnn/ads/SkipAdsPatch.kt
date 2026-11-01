package semicoloncolonel.mobilestream.patches.cnn.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cnn.shared.Constants

private const val COMPONENTS = "Lcom/cnn/mobile/android/phone/eight/core/components/"
private const val PLAY_CONFIG_BUILDER = "Lcom/turner/top/player/config/builders/PlayConfigBuilder;"

// CNN 26.21.0. Display ads come from Google Ad Manager and Dianomi; video ads
// come from the TOP player that plays CNN's articles and clips. All Access
// streaming plays in a separate player, which this patch does not touch.

// AdHelper's "dfp" gate (h() in 26.21.0, R8-renamed). When it is false, the
// ad loader already reports a failed load, the app's own no-fill path.
internal object DfpEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/cnn/mobile/android/phone/features/ads/AdHelper;",
    parameters = listOf(),
    returnType = "Z",
    strings = listOf("dfp"),
)

// The Compose components that draw an ad slot and its "Advertisement" label.
// Returning before they compose anything leaves no gap in the feed.
private class AdComponentFingerprint(component: String) : Fingerprint(
    definingClass = "$COMPONENTS$component;",
    name = "Content",
    parameters = listOf("Landroidx/compose/ui/Modifier;", "Landroidx/compose/runtime/Composer;", "I"),
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
    description = "Removes the banner and sponsored-content ads in the CNN app, and plays CNN " +
        "articles' videos and clips without ads. All Access streaming is not changed. " +
        "Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        DfpEnabledFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

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
