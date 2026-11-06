package semicoloncolonel.mobilestream.patches.dailywire.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.dailywire.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// The Daily Wire 3.5.21.
//
// - Video: before a clip plays, the app decides whether to request a pre-roll
//   by reading RemoteConfig.getPrerollsEnabled(); the video ad-tag use case
//   and playback guard all hang off that flag. It now always reports false,
//   so no pre-roll is requested and the clip starts straight away.
// - Banners: every display ad is drawn inside BillboardContainer, which draws
//   the "ADVERTISEMENT" label and the box around the banner: the slot pinned
//   to the top of articles, and the ad cards in the feeds and their loading
//   placeholders. It now draws nothing, so the label, the box, and the banner
//   are all gone and no space is left where they were.
//
// Members-only content stays locked (its entitlement and DRM are checked on
// the server), and any ads stitched into a stream server-side are not
// affected.

internal object PrerollsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/dailywire/thedailywire/app/config/RemoteConfig;",
    name = "getPrerollsEnabled",
    parameters = listOf(),
    returnType = "Z",
)

internal object BillboardContainerFingerprint : Fingerprint(
    definingClass = "Lcom/dailywire/thedailywire/app/ui/components/cards/ads/BillboardContainerKt;",
    name = "BillboardContainer",
    returnType = "V",
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the banner ads and their \"Advertisement\" slots, and the pre-roll ads before videos.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        PrerollsEnabledFingerprint.method.returnEarly(
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        BillboardContainerFingerprint.method.returnEarly("return-void")
    }
}
