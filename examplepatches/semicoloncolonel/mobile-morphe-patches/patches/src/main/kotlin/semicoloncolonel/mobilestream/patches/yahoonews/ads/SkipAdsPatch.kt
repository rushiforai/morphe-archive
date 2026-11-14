package semicoloncolonel.mobilestream.patches.yahoonews.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle
import semicoloncolonel.mobilestream.patches.shared.misc.disableExpoUpdatesPatch
import semicoloncolonel.mobilestream.patches.yahoonews.shared.Constants
import semicoloncolonel.mobilestream.patches.yahoonews.shared.SAPI_CONFIG
import semicoloncolonel.mobilestream.patches.yahoonews.shared.videoOptOutPatch

// ─────────────────────────────────────────────────────────────────────────────
// Yahoo News 100.1.1 — Skip ads.
//
// Yahoo News is an Expo / React Native app, and its screens are Hermes
// bytecode (version 98) in assets/index.android.bundle. Two components draw
// every ad outside video:
//
//   AdRow    the Taboola ad rows in the home and For You feeds. The feed
//            renders one for each row of type "ad".
//   AdSlot   the Yahoo display slots in native articles, in the body and in
//            the ad section at the end.
//
// Both now render nothing. mapAdSlot, which builds the slot data, is left
// alone: the feed code uses its result without a null check.
//
// Video ads: Yahoo's video player asks video-api.yql.yahoo.com for ad breaks
// (/v1/video/adbreaks) and ads (/v1/video/ads), at addresses it reads from
// SapiMediaItemProviderConfig. Both now point at an address that does not
// resolve, so no ad break is found and the video starts. The video player's
// ads opt-out is also on (VideoOptOutPatch).
//
// Expo updates are turned off so that the patched bundle stays in use.
// ─────────────────────────────────────────────────────────────────────────────

private val skipAdsInBundlePatch = rawResourcePatch {
    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart("AdRow", HermesBundle.Value.NULL)
        bundle.returnAtStart("AdSlot", HermesBundle.Value.NULL)
        file.writeBytes(bundle.toByteArray())
    }
}

private const val NO_ADS_URL = "https://video-api.invalid/"

internal object AdBreaksEndpointFingerprint : Fingerprint(
    definingClass = SAPI_CONFIG,
    name = "getThunderballAdbreaksEndpoint",
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
)

internal object AdsEndpointFingerprint : Fingerprint(
    definingClass = SAPI_CONFIG,
    name = "getThunderballAdsEndpoint",
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
)

private val skipVideoAdsPatch = bytecodePatch {
    execute {
        listOf(AdBreaksEndpointFingerprint, AdsEndpointFingerprint).forEach {
            it.method.addInstructions(
                0,
                """
                    const-string v0, "$NO_ADS_URL"
                    return-object v0
                """,
            )
        }
    }
}

@Suppress("unused")
val skipAdsPatch = resourcePatch(
    name = "Skip ads",
    description = "Removes the ads in the news feeds, in articles, and before videos.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(skipAdsInBundlePatch, skipVideoAdsPatch, videoOptOutPatch, disableExpoUpdatesPatch)
}
