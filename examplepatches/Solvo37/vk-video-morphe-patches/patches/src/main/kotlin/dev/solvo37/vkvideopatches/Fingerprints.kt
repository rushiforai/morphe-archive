package dev.solvo37.vkvideopatches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

internal object VideoFeaturesEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/vk/toggle/features/VideoFeatures;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList()
)

internal object ClipsFeaturesEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/vk/toggle/features/ClipsFeatures;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList()
)

internal object InAppUpdateBootstrapFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/vk/video/screens/main/MainActivity;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/vk/update/core/a;",
            name = "<init>"
        )
    )
)

internal object DiscoverAdBannerFingerprint : Fingerprint(
    definingClass = "Lcom/vk/api/generated/video/dto/VideoDiscoverAdsDto;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList()
)

internal object PixelStatsSingleFingerprint : Fingerprint(
    definingClass = "Ltq/d;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lio/reactivex/rxjava3/disposables/c;",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            definingClass = "Lio/reactivex/rxjava3/core/q;",
            name = "subscribe"
        )
    )
)

internal object PixelStatsBatchFingerprint : Fingerprint(
    definingClass = "Ltq/d;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lio/reactivex/rxjava3/disposables/c;",
    parameters = listOf("Ljava/lang/Iterable;"),
    filters = listOf(
        methodCall(
            definingClass = "Lio/reactivex/rxjava3/core/q;",
            name = "subscribe"
        )
    )
)

// VK Video 1.163 Clips feature/config provider (R8 names).
internal object ClipAdsPromoProviderFingerprint : Fingerprint(
    definingClass = "Lyo0/g;",
    name = "B",
    returnType = "Z",
    parameters = emptyList()
)

internal object ClipAdsStaticProviderFingerprint : Fingerprint(
    definingClass = "Lyo0/g;",
    name = "C",
    returnType = "Z",
    parameters = emptyList()
)

internal object ClipAdsLabelProviderFingerprint : Fingerprint(
    definingClass = "Lyo0/g;",
    name = "G",
    returnType = "Z",
    parameters = emptyList()
)

internal object ClipMarketAdProviderFingerprint : Fingerprint(
    definingClass = "Lyo0/g;",
    name = "J",
    returnType = "Z",
    parameters = emptyList()
)

internal object ClipMarketAdChoicesProviderFingerprint : Fingerprint(
    definingClass = "Lyo0/g;",
    name = "M",
    returnType = "Z",
    parameters = emptyList()
)

internal object ClipAdsVideoOwnerProviderFingerprint : Fingerprint(
    definingClass = "Lyo0/g;",
    name = "O",
    returnType = "Z",
    parameters = emptyList()
)

internal object ClipYandexAdParamsProviderFingerprint : Fingerprint(
    definingClass = "Lyo0/g;",
    name = "P",
    returnType = "Lwo0/k;",
    parameters = emptyList()
)

internal object ClipMarketAdHeaderClicksProviderFingerprint : Fingerprint(
    definingClass = "Lyo0/g;",
    name = "Q",
    returnType = "Lcom/vk/clips/sdk/shared/viewer/experiments/models/ClipsMarketAdHeaderClickConfig;",
    parameters = emptyList()
)

internal object ClipFeedEndRewatchAdProviderFingerprint : Fingerprint(
    definingClass = "Lyo0/g;",
    name = "R",
    returnType = "Z",
    parameters = emptyList()
)

internal object ClipSellerBannerCompanionProviderFingerprint : Fingerprint(
    definingClass = "Lyo0/g;",
    name = "X",
    returnType = "Lcom/vk/clips/sdk/shared/viewer/experiments/models/ClipsBannerCompanionConfig;",
    parameters = emptyList()
)

internal object ClipAdsVideoProviderFingerprint : Fingerprint(
    definingClass = "Lyo0/g;",
    name = "Y",
    returnType = "Z",
    parameters = emptyList()
)

internal object ClipAdsCarouselProviderFingerprint : Fingerprint(
    definingClass = "Lyo0/g;",
    name = "k",
    returnType = "Z",
    parameters = emptyList()
)

internal object ClipBannerCompanionProviderFingerprint : Fingerprint(
    definingClass = "Lyo0/g;",
    name = "l",
    returnType = "Lcom/vk/clips/sdk/shared/viewer/experiments/models/ClipsBannerCompanionConfig;",
    parameters = emptyList()
)

internal object ClipVideoFileAdsFeaturesParamsFingerprint : Fingerprint(
    definingClass = "Lcom/vk/clips/viewer/impl/adapters/ClipVideoFileAdapter;",
    name = "A3",
    returnType = "Lcom/vk/clips/sdk/models/ads/SdkClipsAdsFeaturesParams;",
    parameters = emptyList()
)

// VK Video 1.163 short-video server feed mapper. This is where server-side
// StaticAd / MarketAd / MyTarget DTOs become Clips SDK feed items.
internal object ClipServerFeedMapperFingerprint : Fingerprint(
    definingClass = "Lee1/j;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lk01/d;",
    parameters = listOf(
        "Lcom/vk/api/generated/shortVideo/dto/ShortVideoGetRecomResponseDto;",
        "Lve1/q;"
    )
)

// Runtime instream gate used by VideoAutoPlay before it switches the player
// into the MIDROLL ad path.
internal object MidrollRuntimeGateFingerprint : Fingerprint(
    definingClass = "Lx13/e;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(
        "Lcom/vk/dto/common/AdSection;",
        "Ljava/lang/Float;"
    )
)


// Lower Clips SDK converter. These fingerprints sit below the API response
// mapper, so they also catch ads injected client-side after feed parsing.
internal object ClipSdkAdVideoMapperFingerprint : Fingerprint(
    definingClass = "Lr11/d;",
    name = "g",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/vk/clips/sdk/shared/feed/model/FeedItem\$d;",
    parameters = listOf(
        "Lcom/vk/clips/sdk/shared/api/deps/video/SdkVideoFile;",
        "Lcom/vk/clips/sdk/shared/api/routing/models/ClipFeedCacheInfo;"
    )
)

internal object ClipSdkAdVideoDefaultMapperFingerprint : Fingerprint(
    definingClass = "Lr11/d;",
    name = "d",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lcom/vk/clips/sdk/shared/feed/model/FeedItem\$d;",
    parameters = listOf(
        "Lr11/d;",
        "Lcom/vk/clips/sdk/shared/api/deps/video/SdkVideoFile;",
        "Liz0/a;",
        "I"
    )
)

internal object ClipSdkIntermediateListFingerprint : Fingerprint(
    definingClass = "Lr11/d;",
    name = "f",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("Ljava/util/List;")
)

// Dedicated runtime path that requests an in-player midroll.
internal object MidrollRequestRunnableFingerprint : Fingerprint(
    definingClass = "Ln33/t;",
    name = "run",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList()
)

// Instream facade midpoint setup: reads the "midroll" section and calculates
// the time points stored into the ad engine.
internal object InstreamMidpointConfigFingerprint : Fingerprint(
    definingClass = "Lxo/a;",
    name = "d",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("F")
)

// Direct named-section entry point for instream ads.
internal object InstreamNamedSectionStartFingerprint : Fingerprint(
    definingClass = "Lxo/a;",
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)
// Home "For you" native MyTarget showcase card factory.
internal object HomeShowcaseCatalogFactoryFingerprint : Fingerprint(
    definingClass = "Lcom/vk/catalog2/common/ui/mvp/configuration/a;",
    name = "E",
    returnType = "Lcom/vk/catalog2/common/ui/holders/api/CatalogViewHolder;",
    parameters = listOf(
        "Lcom/vk/catalog2/common/dto/api/CatalogDataType;",
        "Lcom/vk/catalog2/common/dto/api/CatalogViewType;",
        "Lcom/vk/catalog2/common/dto/api/style/CatalogViewStyle;",
        "Lcom/vk/catalog2/common/dto/api/ui/UIBlock;",
        "Lai0/f;"
    )
)

// Real video-player advertising repository.
internal object VideoAdvertisementsRepositoryFingerprint : Fingerprint(
    definingClass = "Lcom/vk/libvideo/impl/di/VideoAdvertisementsComponentImpl;",
    name = "Q6",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/vk/libvideo/api/ad/VideoAdvertisementsRepository;",
    parameters = emptyList()
)

internal object VideoGetAdsResponseConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/vk/api/generated/video/dto/VideoGetAdsResponseDto;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Lcom/vk/api/generated/video/dto/VideoVideoAdsInstreamDto;",
        "Lcom/vk/api/generated/video/dto/VideoVideoAdsSportDto;",
        "Lcom/vk/api/generated/video/dto/VideoVideoAdsMobileDto;",
        "Lcom/vk/api/generated/video/dto/VideoVideoAdsBannersDto;"
    )
)

internal object VideoInstreamSectionsConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/vk/api/generated/video/dto/VideoVideoAdsInstreamSectionsDto;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Ljava/util/List;",
        "Ljava/util/List;",
        "Ljava/util/List;"
    )
)

// Profile menu data provider. This method only appends the "ad-free
// subscription" promotional item to the "My" screen.
internal object ProfileAdFreeMenuItemFingerprint : Fingerprint(
    definingClass = "Lwc6/q;",
    name = "i",
    returnType = "V",
    parameters = listOf("Ljava/util/ArrayList;")
)

