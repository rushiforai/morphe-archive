package semicoloncolonel.mobilestream.patches.ebay.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.ebay.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// eBay 6.244.0.1 bundles AppsFlyer, the Meta SDK, and Firebase Analytics. The
// manifest kill switches turn off Firebase Analytics and Meta's auto-logged
// events and ad-ID collection, and the host blocklist drops AppsFlyer, the
// Firebase Analytics upload, and Meta's app-event paths at every
// URL.openConnection call and at every OkHttp client, whose public API this
// build keeps. A blocked request fails like an offline network, which these
// SDKs already tolerate.
//
// Not touched: eBay's own first-party analytics (Pulsar), Crashlytics crash
// reporting, sign-in, Meta's Graph API sign-in, search, and push.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops AppsFlyer, the Meta SDK, and Firebase Analytics.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()
    }
}
