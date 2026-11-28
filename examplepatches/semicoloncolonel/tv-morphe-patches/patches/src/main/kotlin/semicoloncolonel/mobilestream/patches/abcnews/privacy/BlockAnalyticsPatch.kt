package semicoloncolonel.mobilestream.patches.abcnews.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.abcnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ABC News for Android TV 11.12.0 sends its analytics to mParticle, comScore,
// Datadog, Conviva, Chartbeat, Nielsen, and Adobe. The app keeps OkHttp's
// public API, so the shared layer attaches its blocklist to every OkHttp
// client as well as to URL.openConnection(). Unlike the phone app, the
// Android TV build has no Braze and no Firebase Analytics.
//
// Not touched: Disney's player configuration (bamgrid.com), video, the feeds,
// and the OneTrust privacy settings.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
