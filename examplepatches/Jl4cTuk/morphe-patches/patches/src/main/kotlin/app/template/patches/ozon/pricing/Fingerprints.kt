package app.template.patches.ozon.pricing

import app.morphe.patcher.Fingerprint

/** Matches the text getter for an individual component of an Ozon price atom. */
object PriceComponentTextFingerprint : Fingerprint(
    definingClass = "Lru/ozon/uni/atoms/data/price/PriceDTO\$Component;",
    name = "getText",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/** Matches the separate discount label rendered next to an Ozon price atom. */
object PriceDiscountFingerprint : Fingerprint(
    definingClass = "Lru/ozon/uni/atoms/data/price/PriceDTO;",
    name = "getDiscount",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/** Matches the checkout-composer total view holder shared by the cart and checkout pages. */
object CartTotalBindFingerprint : Fingerprint(
    definingClass = "Lru/ozon/app/android/checkoutcomposer/total/presentation/main/TotalVH;",
    name = "bind",
    returnType = "V",
    parameters = listOf(
        "Lru/ozon/app/android/checkoutcomposer/total/models/TotalVO;",
        "L",
    ),
)
