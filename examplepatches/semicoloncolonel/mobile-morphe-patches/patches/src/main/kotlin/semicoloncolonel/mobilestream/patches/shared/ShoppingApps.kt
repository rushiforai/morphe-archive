package semicoloncolonel.mobilestream.patches.shared

import semicoloncolonel.mobilestream.patches.amazon.shared.Constants as Amazon
import semicoloncolonel.mobilestream.patches.bestbuy.shared.Constants as BestBuy
import semicoloncolonel.mobilestream.patches.cvs.shared.Constants as Cvs
import semicoloncolonel.mobilestream.patches.dealseek.shared.Constants as DealSeek
import semicoloncolonel.mobilestream.patches.homedepot.shared.Constants as HomeDepot
import semicoloncolonel.mobilestream.patches.target.shared.Constants as Target
import semicoloncolonel.mobilestream.patches.walgreens.shared.Constants as Walgreens
import semicoloncolonel.mobilestream.patches.walmart.shared.Constants as Walmart

// The shopping apps that every shared patch applies to. Spread into a
// compatibleWith() list: compatibleWith(Tubi.COMPATIBILITY, *SHOPPING_APPS).
internal val SHOPPING_APPS = arrayOf(
    DealSeek.COMPATIBILITY,
    Walmart.COMPATIBILITY,
    BestBuy.COMPATIBILITY,
    Amazon.COMPATIBILITY,
    Target.COMPATIBILITY,
    Cvs.COMPATIBILITY,
    HomeDepot.COMPATIBILITY,
    Walgreens.COMPATIBILITY,
)
