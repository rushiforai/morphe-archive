package semicoloncolonel.mobilestream.patches.pluto.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.pluto.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in the 17.2.0 phone build and the hosts they send to:
// Kochava (attribution, kochava.com), comScore (scorecardresearch.com),
// Nielsen (imrworldwide.com), Adobe Analytics / Experience Platform
// (demdex.net, adobedc.net, omtrdc.net, adobedtm.com), Conviva, Datadog,
// New Relic (newrelic.com, nr-data.net), Salesforce Marketing Cloud
// (igodigital.com), and Pluto's Tealium tag config (tm.pluto.tv). Pluto
// renames all of OkHttp, so only the URLConnection layer applies here (see
// BlockTrackers.kt). SDKs that send through the renamed OkHttp, such as
// Datadog, are not covered.
//
// Not touched: Crashlytics crash reporting, OneTrust / Ketch consent,
// sign-in, ads/playback/DRM. Ad-serving hosts are handled by Skip ads.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
