// Ported from Solvo37/VK-Video-Morphe-Patches (GPLv3), dev/solvo37/vkvideopatches/Fingerprints.kt.
package app.ru_apps.vkvideo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
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
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList()
)

internal object PixelStatsSingleFingerprint : Fingerprint(
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

// Confirmed live (2026-10-08 census) against com.vk.vkvideo 1.165: VideoOpenTelemetryComponent
// is a DI-scoped interface with a single Z-returning, no-arg abstract method (its Kotlin source
// property is `isTracingEnabled`, confirmed via the class's own KProperty reflection metadata
// in its <clinit>) that gates the whole ru.ok.tracer/io.opentelemetry pipeline: an OkHttp
// request interceptor, CPU/network tech-stats collectors, and span/metric/log exporters that
// upload to a VK-owned backend. The implementing method's own short name is R8-unstable (seen
// as "R4" in this build) — matched here by definingClass + returnType + parameter shape instead
// of by name, same as VideoFeaturesEnabledFingerprint/ClipsFeaturesEnabledFingerprint above.
internal object OpenTelemetryTracingEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/vk/core/telemetry/VideoOpenTelemetryComponentImpl;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList()
)

internal object PixelStatsBatchFingerprint : Fingerprint(
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
    returnType = "Lcom/vk/clips/sdk/models/ads/SdkClipsAdsFeaturesParams;",
    parameters = emptyList()
)

// VK Video 1.163 short-video server feed mapper. This is where server-side
// StaticAd / MarketAd / MyTarget DTOs become Clips SDK feed items.
internal object ClipServerFeedMapperFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/vk/api/generated/shortVideo/dto/ShortVideoGetRecomResponseDto;",
            parameters = emptyList(),
            returnType = "Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedDto;"
        ),
        methodCall(
            definingClass = "Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedDto;",
            parameters = emptyList(),
            returnType = "Ljava/util/List;"
        )
    ),
    custom = { method, _ ->
        method.parameterTypes.size == 2 &&
            method.parameterTypes[0] == "Lcom/vk/api/generated/shortVideo/dto/ShortVideoGetRecomResponseDto;"
    }
)

// VK Video 1.164 also maps the same response inside a shared synthetic
// Function1 callback. The stable DTO calls identify that path without relying
// on its R8-renamed class or switch discriminator.
internal object ClipAlternateServerFeedMapperFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/vk/api/generated/shortVideo/dto/ShortVideoGetRecomResponseDto;",
            parameters = emptyList(),
            returnType = "Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedDto;"
        ),
        methodCall(
            definingClass = "Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedDto;",
            parameters = emptyList(),
            returnType = "Ljava/util/List;"
        )
    )
)

internal object ClipServerFeedConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedDto;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Ljava/util/List;", "Ljava/lang/String;")
)

// Runtime instream gate used by VideoAutoPlay before it switches the player
// into the MIDROLL ad path.
internal object MidrollRuntimeGateFingerprint : Fingerprint(
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
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/vk/clips/sdk/shared/feed/model/FeedItem\$d;",
    parameters = listOf(
        "Lcom/vk/clips/sdk/shared/api/deps/video/SdkVideoFile;",
        "Lcom/vk/clips/sdk/shared/api/routing/models/ClipFeedCacheInfo;"
    )
)

internal object ClipSdkAdVideoDefaultMapperFingerprint : Fingerprint(
    classFingerprint = ClipSdkAdVideoMapperFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lcom/vk/clips/sdk/shared/feed/model/FeedItem\$d;",
    parameters = listOf(
        "L",
        "Lcom/vk/clips/sdk/shared/api/deps/video/SdkVideoFile;",
        "L",
        "I"
    )
)

internal object ClipSdkIntermediateListFingerprint : Fingerprint(
    classFingerprint = ClipSdkAdVideoMapperFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("Ljava/util/List;"),
    filters = listOf(
        methodCall(
            definingClass = "this",
            parameters = listOf(
                "Lcom/vk/clips/sdk/shared/api/deps/video/SdkVideoFile;",
                "Lcom/vk/clips/sdk/shared/api/routing/models/ClipFeedCacheInfo;"
            ),
            returnType = "Lcom/vk/clips/sdk/shared/feed/model/FeedItem\$d;"
        )
    )
)

// Dedicated runtime path that requests an in-player midroll.
internal object MidrollRequestRunnableFingerprint : Fingerprint(
    name = "run",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("request_midroll")
    )
)

// Instream facade midpoint setup: reads the "midroll" section and calculates
// the time points stored into the ad engine.
internal object InstreamMidpointConfigFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("F"),
    filters = listOf(
        string("InstreamAd: Midpoints already configured"),
        string("midroll")
    )
)

// Direct named-section entry point for instream ads.
internal object InstreamNamedSectionStartFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        string("InstreamAdEngine: No section with name ")
    )
)
// Home "For you" native MyTarget showcase card factory.
//
// The methodCall filter targets the call this factory makes to build the real
// AdShowCaseBannerVh. Live decompile of a 2026-10 build confirmed that helper - still in
// the same class, still returning `AdShowCaseBannerVh` from the same two obfuscated-type
// params - was renamed by R8 from "a" to "J" (the enclosing factory method itself was also
// reshuffled from its old name onto the unrelated short name "g", which is why this
// fingerprint intentionally leaves its own name/definingClass unset and matches purely on
// this call-site shape).
internal object HomeShowcaseCatalogFactoryFingerprint : Fingerprint(
    returnType = "Lcom/vk/catalog2/common/ui/holders/api/CatalogViewHolder;",
    parameters = listOf(
        "Lcom/vk/catalog2/common/dto/api/CatalogDataType;",
        "Lcom/vk/catalog2/common/dto/api/CatalogViewType;",
        "Lcom/vk/catalog2/common/dto/api/style/CatalogViewStyle;",
        "Lcom/vk/catalog2/common/dto/api/ui/UIBlock;",
        "L"
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/vk/catalog2/common/ui/mvp/configuration/a;",
            name = "J"
        )
    )
)

// Real video-player advertising repository.
//
// `name` is an R8-assigned short identifier shared by this method and its interface
// declaration (VideoAdvertisementsComponent) - it shuffles on recompilation. Confirmed
// via live decompile of a 2026-10 build that it moved from "Q6" to "V6"; the return type
// (an unobfuscated API-boundary interface) still disambiguates it reliably.
internal object VideoAdvertisementsRepositoryFingerprint : Fingerprint(
    definingClass = "Lcom/vk/libvideo/impl/di/VideoAdvertisementsComponentImpl;",
    name = "V6",
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

// Primary Clips SDK list converter. Unlike the StaticAds/MarketAds converter
// above, this path receives ordinary-looking SdkVideoFile entries whose
// embedded SdkVideoAdInfo/ORD payload marks them as full-screen ads.
internal object ClipSdkVideoListMapperFingerprint : Fingerprint(
    classFingerprint = ClipSdkAdVideoMapperFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf(
        "Ljava/util/List;",
        "Lcom/vk/clips/sdk/shared/api/routing/models/ClipFeedCacheInfo;"
    ),
    filters = listOf(
        methodCall(
            definingClass = "this",
            parameters = listOf(
                "Lcom/vk/clips/sdk/shared/api/deps/video/SdkVideoFile;",
                "Lcom/vk/clips/sdk/shared/api/routing/models/ClipFeedCacheInfo;"
            ),
            returnType = "Lcom/vk/clips/sdk/shared/feed/model/FeedItem\$d;"
        )
    )
)

// Legacy per-video ad payload embedded directly in VideoVideoFullDto. This is
// the source consumed by VideoFullToVideoFileMapper for ordinary-video
// preroll/midroll playback, independently of VideoGetAdsResponseDto.
internal object VideoAdsConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/vk/api/generated/video/dto/VideoAdsDto;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "I",
        "Ljava/util/List;",
        "F",
        "Ljava/util/List;",
        "Lcom/vk/api/generated/base/dto/BaseBoolIntDto;",
        "Ljava/lang/Object;",
        "Lcom/vk/api/generated/base/dto/BaseBoolIntDto;"
    )
)

internal object VideoFullAdsGetterFingerprint : Fingerprint(
    definingClass = "Lcom/vk/api/generated/video/dto/VideoVideoFullDto;",
    returnType = "Lcom/vk/api/generated/video/dto/VideoAdsDto;",
    parameters = emptyList()
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

