// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/ozon/account/Fingerprints.kt.
package app.ru_apps.ozon_jl4ctuk.account

import app.morphe.patcher.Fingerprint

object EntryBannerContentMapperFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/regulardraw/widgets/entryBannerWidget/v2/core/" +
            "EntryBannerContentMapper;",
    name = "invoke",
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Lru/ozon/app/android/regulardraw/widgets/entryBannerWidget/v2/data/EntryBannerDTO;",
        "L",
    ),
)

object EntryBannerOverlayMapperFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/regulardraw/widgets/entryBannerWidget/v2/core/" +
            "EntryBannerOverlayMapper;",
    name = "invoke",
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Lru/ozon/app/android/regulardraw/widgets/entryBannerWidget/v2/data/EntryBannerDTO;",
        "L",
    ),
)

object DesignSystemAtomsMapperFingerprint : Fingerprint(
    definingClass = "Lru/ozon/app/android/widgets/designSystemAtoms/core/DsAtomsMapper;",
    name = "invoke",
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Lru/ozon/app/android/widgets/designSystemAtoms/data/DesignSystemAtomsDTO;",
        "L",
    ),
)

object LegacyCellListMapperFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/widgets/commonTextWidget/cellList/core/CellListV2Mapper;",
    name = "invoke",
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Lru/ozon/app/android/widgets/commonTextWidget/cellList/data/CellListV2DTO;",
        "L",
    ),
)

object ComposerCellListMapperFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/android/composerCommonViewKit/cellListV2/core/CellListV2Mapper;",
    name = "invoke",
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Lru/ozon/android/composerCommonViewKit/cellListV2/data/CellListV2DTO;",
        "L",
    ),
)
