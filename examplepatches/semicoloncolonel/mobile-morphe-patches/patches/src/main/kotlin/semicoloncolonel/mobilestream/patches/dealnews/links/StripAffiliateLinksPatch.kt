package semicoloncolonel.mobilestream.patches.dealnews.links

import semicoloncolonel.mobilestream.patches.dealnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.links.stripAffiliateLinksPatch

@Suppress("unused")
val stripAffiliateLinksPatch = stripAffiliateLinksPatch(
    Constants.COMPATIBILITY,
    category = "Privacy",
    description = "Opens each deal at the store's own page, without affiliate tags or click tracking.",
)
