package semicoloncolonel.mobilestream.patches.checkout51.links

import semicoloncolonel.mobilestream.patches.checkout51.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.links.stripAffiliateLinksPatch

@Suppress("unused")
val stripAffiliateLinksPatch = stripAffiliateLinksPatch(
    Constants.COMPATIBILITY,
    category = "Privacy",
    description = "Opens store links without affiliate tags or click tracking. Checkout 51 online cash back needs those, so it stops working.",
    use = false,
)
