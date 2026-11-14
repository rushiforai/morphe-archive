package semicoloncolonel.mobilestream.patches.retailmenot.links

import semicoloncolonel.mobilestream.patches.retailmenot.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.links.stripAffiliateLinksPatch

@Suppress("unused")
val stripAffiliateLinksPatch = stripAffiliateLinksPatch(
    Constants.COMPATIBILITY,
    category = "Privacy",
    description = "Opens store links without affiliate tags or click tracking. RetailMeNot cash back needs those, so cash back stops working.",
    use = false,
)
