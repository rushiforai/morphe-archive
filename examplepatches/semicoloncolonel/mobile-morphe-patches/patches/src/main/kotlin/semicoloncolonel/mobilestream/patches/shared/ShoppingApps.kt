package semicoloncolonel.mobilestream.patches.shared

import semicoloncolonel.mobilestream.patches.amazon.shared.Constants as Amazon
import semicoloncolonel.mobilestream.patches.bestbuy.shared.Constants as BestBuy
import semicoloncolonel.mobilestream.patches.checkout51.shared.Constants as Checkout51
import semicoloncolonel.mobilestream.patches.cvs.shared.Constants as Cvs
import semicoloncolonel.mobilestream.patches.dealnews.shared.Constants as DealNews
import semicoloncolonel.mobilestream.patches.dealseek.shared.Constants as DealSeek
import semicoloncolonel.mobilestream.patches.flipp.shared.Constants as Flipp
import semicoloncolonel.mobilestream.patches.homedepot.shared.Constants as HomeDepot
import semicoloncolonel.mobilestream.patches.lowes.shared.Constants as Lowes
import semicoloncolonel.mobilestream.patches.retailmenot.shared.Constants as RetailMeNot
import semicoloncolonel.mobilestream.patches.slickdeals.shared.Constants as Slickdeals
import semicoloncolonel.mobilestream.patches.target.shared.Constants as Target
import semicoloncolonel.mobilestream.patches.walgreens.shared.Constants as Walgreens
import semicoloncolonel.mobilestream.patches.walmart.shared.Constants as Walmart

// The shopping apps that every shared patch applies to. Spread into a
// compatibleWith() list: compatibleWith(Tubi.COMPATIBILITY, *SHOPPING_APPS).
internal val SHOPPING_APPS = arrayOf(
    DealSeek.COMPATIBILITY,
    DealNews.COMPATIBILITY,
    Slickdeals.COMPATIBILITY,
    RetailMeNot.COMPATIBILITY,
    Walmart.COMPATIBILITY,
    BestBuy.COMPATIBILITY,
    Amazon.COMPATIBILITY,
    Target.COMPATIBILITY,
    Cvs.COMPATIBILITY,
    Checkout51.COMPATIBILITY,
    Flipp.COMPATIBILITY,
    HomeDepot.COMPATIBILITY,
    Lowes.COMPATIBILITY,
    Walgreens.COMPATIBILITY,
)
