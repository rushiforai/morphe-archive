// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/ozon/reviews/Fingerprints.kt.
package app.ru_apps.ozon_jl4ctuk.reviews

import app.morphe.patcher.Fingerprint

/** Matches the mapper that creates the post-purchase rating bottom sheet. */
object RateItemsMapperFingerprint : Fingerprint(
    definingClass = "Lru/ozon/app/android/ugc/widgets/rateItemsV2/core/RateItemsV2Mapper;",
    name = "invoke",
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Lru/ozon/app/android/ugc/widgets/rateItemsV2/data/RateItemsV2Wrapper;",
        "L",
    ),
)
