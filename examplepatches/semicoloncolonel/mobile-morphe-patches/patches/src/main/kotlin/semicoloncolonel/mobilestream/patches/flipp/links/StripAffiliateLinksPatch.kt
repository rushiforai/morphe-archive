package semicoloncolonel.mobilestream.patches.flipp.links

import semicoloncolonel.mobilestream.patches.flipp.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.links.stripAffiliateLinksPatch

@Suppress("unused")
val stripAffiliateLinksPatch = stripAffiliateLinksPatch(
    Constants.COMPATIBILITY,
    description = "Opens store links at the store's own page, without affiliate tags or click tracking.",
)
