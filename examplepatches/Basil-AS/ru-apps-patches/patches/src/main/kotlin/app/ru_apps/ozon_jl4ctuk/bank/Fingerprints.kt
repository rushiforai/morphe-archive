// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/ozon/bank/Fingerprints.kt.
package app.ru_apps.ozon_jl4ctuk.bank

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
