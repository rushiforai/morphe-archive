package semicoloncolonel.mobilestream.patches.newsnation.tv

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.newsnation.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// NewsNation Android TV 4.71 is a Haystack app. Video ads are client-side:
// when an ad response arrives, the app puts the Ad objects into a singleton
// AdQueue, and the player plays whatever is in it before the content.
// addAds(List) now does nothing, so the queue is always empty and the player
// goes straight to the content.
//
// Ads stitched into live channels server-side are not affected. The phone app
// shares the package name and has no AdQueue. Morphe Manager can still select
// this patch for it, so it does nothing there.

internal object AdQueueAddAdsFingerprint : Fingerprint(
    definingClass = "Lcom/haystack/android/common/model/ads/AdQueue;",
    name = "addAds",
    parameters = listOf("Ljava/util/List;"),
    returnType = "V",
)

@Suppress("unused")
val skipAdsTvPatch = bytecodePatch(
    name = "Skip ads (Android TV)",
    description = "Removes the video ads before clips in the Android TV app.",
) {
    compatibleWith(Constants.TV_COMPATIBILITY)

    execute {
        AdQueueAddAdsFingerprint.methodOrNull?.returnEarly("return-void")
    }
}
