package semicoloncolonel.mobilestream.patches.siriusxm.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns
import semicoloncolonel.mobilestream.patches.siriusxm.shared.Constants

// SiriusXM 2610.4.0. Third-party services and the hosts they send to:
// Datadog session monitoring (datadoghq.com), Mux Data playback beacons
// (litix.io), Branch attribution (branch.io), Salesforce Marketing Cloud
// (igodigital.com), Salesforce Personalization, formerly Evergage
// (evergage.com), and AdsWizz listening measurement, which reads its setup
// from zc.adswizz.com. Firebase Analytics is turned off with its manifest
// kill switches. SiriusXM renames all of OkHttp, so hosts are blocked at
// URLConnection and at DNS (see BlockTrackers.kt).
//
// Not touched: sign-in, playback, downloads, push notifications, and
// SiriusXM's own servers.
@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Datadog, Mux, Branch, Salesforce, AdsWizz measurement, and Firebase Analytics.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()
        blockTrackersAtDns()
    }
}
