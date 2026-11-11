package semicoloncolonel.mobilestream.patches.costco.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.costco.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// Costco 26.10.2.2. Adobe Analytics (adobedtm.com, demdex.net, omtrdc.net),
// comScore (scorecardresearch.com), Kochava, including its rotating
// failover domains, and Firebase Analytics, which is turned off with its
// manifest kill switches. Hosts are blocked at OkHttp, URLConnection, and DNS.
//
// Not touched: sign-in and its security checks, the cart, payment, and the
// membership card.
@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Adobe Analytics, comScore, Kochava, and Firebase Analytics.",
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
