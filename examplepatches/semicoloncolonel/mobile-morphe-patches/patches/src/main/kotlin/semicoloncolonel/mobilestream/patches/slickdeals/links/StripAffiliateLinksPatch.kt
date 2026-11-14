package semicoloncolonel.mobilestream.patches.slickdeals.links

import semicoloncolonel.mobilestream.patches.slickdeals.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.links.stripAffiliateLinksPatch

@Suppress("unused")
val stripAffiliateLinksPatch = stripAffiliateLinksPatch(
    Constants.COMPATIBILITY,
    description = "Opens each deal at the store's own page, without affiliate tags or click tracking.",
)
