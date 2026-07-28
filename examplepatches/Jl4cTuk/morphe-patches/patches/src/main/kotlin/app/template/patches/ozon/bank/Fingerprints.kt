package app.template.patches.ozon.bank

import app.morphe.patcher.Fingerprint

/** Matches the mapper for the Ozon Bank advertising banner carousel. */
object BankAdBannerMapperFingerprint : Fingerprint(
    definingClass = "Lru/ozon/app/android/bank/widgets/adBanner/core/AdBannerMapper;",
    name = "invoke",
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Lru/ozon/app/android/bank/widgets/adBanner/data/AdBannerDTO;",
        "L",
    ),
)
