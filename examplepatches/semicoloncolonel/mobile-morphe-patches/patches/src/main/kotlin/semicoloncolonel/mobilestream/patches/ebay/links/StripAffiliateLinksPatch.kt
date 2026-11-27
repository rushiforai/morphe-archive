package semicoloncolonel.mobilestream.patches.ebay.links

import semicoloncolonel.mobilestream.patches.ebay.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.links.stripAffiliateLinksPatch

// ─────────────────────────────────────────────────────────────────────────────
// eBay 6.244.0.1 — Strip affiliate links.
//
// eBay Partner Network links arrive as rover.ebay.com/rover/1/0/4 redirects
// that carry the real listing in the mpre parameter, and as listing URLs tagged
// with the EPN parameters mkcid, mkrid, mkevt, campid, toolid, and customid. The
// shared cleaner already unwraps the rover redirect and drops those parameters,
// so a listing opened, shared, or copied from the app carries no partner tag.
// eBay opens outbound links through Chrome Custom Tabs, WebView.loadUrl, and
// plain VIEW intents, all of which the cleaner covers.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val stripAffiliateLinksPatch = stripAffiliateLinksPatch(
    Constants.COMPATIBILITY,
    category = "Privacy",
    description = "Opens listings at eBay's own page, without eBay Partner Network affiliate tags or click tracking.",
)
