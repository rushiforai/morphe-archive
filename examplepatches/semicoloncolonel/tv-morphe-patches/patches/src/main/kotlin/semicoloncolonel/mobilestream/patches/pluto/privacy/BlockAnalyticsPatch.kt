package semicoloncolonel.mobilestream.patches.pluto.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import semicoloncolonel.mobilestream.patches.pluto.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in the 17.2.0 phone build and the hosts they send to:
// Kochava (attribution, kochava.com), comScore (scorecardresearch.com),
// Nielsen (imrworldwide.com), Adobe Analytics / Experience Platform
// (demdex.net, adobedc.net, omtrdc.net, adobedtm.com), Conviva, Datadog,
// New Relic (newrelic.com, nr-data.net), and Salesforce Marketing Cloud
// (igodigital.com). Pluto's Tealium tag config (tm.pluto.tv) turns on the
// Sparrow tracker, which saves Continue Watching positions to
// sparrow.pluto.tv. Both are blocked only with the Aggressive level. Pluto
// renames all of OkHttp, so the interceptor cannot attach. Hosts are blocked
// at the URLConnection layer and at DNS, where OkHttp's default resolver
// calls InetAddress.getAllByName (see BlockTrackers.kt).
//
// Not touched: Crashlytics crash reporting, OneTrust / Ketch consent,
// sign-in, ads/playback/DRM. Ad-serving hosts are handled by Skip ads.
// ─────────────────────────────────────────────────────────────────────────────

// The shared blocker's switch for the hosts that save watch positions.
internal object BlockResumeTrackingFingerprint : Fingerprint(
    definingClass = "Lsemicoloncolonel/mobilestream/extension/shared/privacy/TrackerBlocker;",
    name = "blockResumeTracking",
    returnType = "Z",
)

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    val level by stringOption(
        key = "blockingLevel",
        default = "relaxed",
        values = mapOf(
            "Relaxed" to "relaxed",
            "Aggressive" to "aggressive",
        ),
        title = "Blocking level",
        description = "Relaxed keeps the two Pluto TV services that save your place, so Continue Watching keeps working. " +
            "Aggressive blocks them too, so Pluto TV does not remember where you stopped.",
        required = true,
    ) { it == "relaxed" || it == "aggressive" }

    execute {
        blockTrackers()
        blockTrackersAtDns()
        if (level == "aggressive") {
            BlockResumeTrackingFingerprint.method.returnEarly("const/4 v0, 0x1\nreturn v0")
        }
    }
}
