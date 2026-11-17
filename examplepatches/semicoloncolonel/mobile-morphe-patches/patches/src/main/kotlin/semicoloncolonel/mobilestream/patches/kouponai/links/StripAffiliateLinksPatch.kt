package semicoloncolonel.mobilestream.patches.kouponai.links

import semicoloncolonel.mobilestream.patches.kouponai.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.links.stripAffiliateLinksPatch

// ─────────────────────────────────────────────────────────────────────────────
// Koupon 3.1.6 — Strip affiliate links.
//
// The app's JavaScript adds Koupon's Amazon Associates tag (kouponand-20 on
// Android) to every Amazon link before it opens it, for example
// amazon.com/dp/B0DWL8YJ2S?psc=1&tag=kouponand-20. The link leaves the app
// through React Native's Linking.openURL, which ends in startActivity, so the
// shared cleaner drops the tag there. Links shared or copied from the app are
// cleaned the same way.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val stripAffiliateLinksPatch = stripAffiliateLinksPatch(
    Constants.COMPATIBILITY,
    description = "Opens each deal at the store's own page, without Koupon's affiliate tag.",
    category = "Privacy",
)
