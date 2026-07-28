package app.template.patches.ozon.account

import app.morphe.patcher.Fingerprint

object EntryBannerSingleMapperFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/regulardraw/widgets/entryBannerWidget/v1/core/single/" +
            "EntryBannerWidgetSingleMapper;",
    name = "invoke",
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Lru/ozon/app/android/regulardraw/widgets/entryBannerWidget/v1/data/" +
            "EntryBannerSubWidget\$Single;",
        "L",
    ),
)

object EntryBannerMultiMapperFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/regulardraw/widgets/entryBannerWidget/v1/core/multi/" +
            "EntryBannerWidgetMultiMapper;",
    name = "invoke",
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Lru/ozon/app/android/regulardraw/widgets/entryBannerWidget/v1/data/" +
            "EntryBannerSubWidget\$Multi;",
        "L",
    ),
)

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

object CellListMapperFingerprint : Fingerprint(
    definingClass = "Lru/ozon/app/android/common/cellList/v2/core/CellListV2Mapper;",
    name = "invoke",
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Lru/ozon/app/android/common/cellList/v2/data/CellListV2DTO;",
        "L",
    ),
)
