package app.morphe.patches.vk.ad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vk.shared.Constants.COMPATIBILITY_VK
import app.morphe.patches.vk.shared.references

private const val EXTENSION_CLASS = "Lapp/morphe/extension/vk/ad/FeedAdsFilter;"

private const val NEWS_ENTRY = "Lcom/vk/feed/core/models/news/NewsEntry;"
private const val POST_INTERACT = "Lcom/vkontakte/android/data/PostInteract;"

// Method names are obfuscated and change between VK releases, so fingerprints rely on
// parameter types, which R8 keeps. Names also get reshuffled: in 8.200 PostDisplayItemsBuilder.w
// builds InterestingStoriesEntry and p is an unrelated static helper.

private fun postDisplayItemsBuilderMethod(firstParameter: String) = Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "PostDisplayItemsBuilder.kt" &&
            method.parameterTypes.firstOrNull()?.toString() == firstParameter
    },
    returnType = "V"
)

// PostDisplayItemsBuilder.g (static helper returning ArrayList)
internal object PostDisplayItemsBuilderGFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "PostDisplayItemsBuilder.kt" },
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("L", NEWS_ENTRY, "L", "Ljava/lang/String;", "Ljava/lang/String;")
)

// PostDisplayItemsBuilder.f (main entry point for building display items); its sibling with
// the same shape takes PostInteract instead of the last two helpers
internal object PostDisplayItemsBuilderFFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "PostDisplayItemsBuilder.kt" &&
            method.parameterTypes.none { it.toString() == POST_INTERACT }
    },
    returnType = "V",
    parameters = listOf(NEWS_ENTRY, "L", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/ArrayList;", "L", "L")
)

// PostDisplayItemsBuilder.d (Post item builder)
internal object PostDisplayItemsBuilderDFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "PostDisplayItemsBuilder.kt" },
    returnType = "V",
    parameters = listOf(
        "Lcom/vk/dto/newsfeed/entries/Post;",
        NEWS_ENTRY,
        POST_INTERACT,
        "Ljava/lang/String;",
        "Ljava/util/ArrayList;",
        "L"
    )
)

// PostDisplayItemsBuilder.e (ShitAttachment builder)
internal val PostDisplayItemsBuilderEFingerprint =
    postDisplayItemsBuilderMethod("Lcom/vkontakte/android/attachments/ShitAttachment;")

// RecommendedMiniApp builder
internal val PostDisplayItemsBuilderWFingerprint =
    postDisplayItemsBuilderMethod("Lcom/vk/dto/newsfeed/entries/RecommendedMiniAppEntry;")

// ChannelsRecommendations builder
internal val PostDisplayItemsBuilderLFingerprint =
    postDisplayItemsBuilderMethod("Lcom/vk/feed/core/models/channels/ChannelsRecommendations;")

// GroupsSuggestions builder
internal val PostDisplayItemsBuilderRFingerprint =
    postDisplayItemsBuilderMethod("Lcom/vk/dto/common/GroupsSuggestions;")

// DzenArticlesBlock builder
internal val PostDisplayItemsBuilderOFingerprint =
    postDisplayItemsBuilderMethod("Lcom/vk/dto/newsfeed/entries/DzenArticlesBlock;")

// DzenStory builder (removed in 8.200)
internal val PostDisplayItemsBuilderPFingerprint =
    postDisplayItemsBuilderMethod("Lcom/vk/feed/core/models/dzen/DzenStory;")

// PostDisplayItemsBuilder.a (Carousel recommendations builder)
internal object PostDisplayItemsBuilderAFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "PostDisplayItemsBuilder.kt" },
    returnType = "V",
    parameters = listOf("Ljava/util/ArrayList;", "Lcom/vk/dto/discover/carousel/Carousel;")
)

// PostDisplayItemsBuilder.k (Carousel recommendations builder)
internal object PostDisplayItemsBuilderKFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "PostDisplayItemsBuilder.kt" },
    returnType = "V",
    parameters = listOf("Z", "Lcom/vk/dto/discover/carousel/Carousel;", "Ljava/util/ArrayList;")
)

// NewsfeedItemAdsBlockDtoToNewsEntryMapper.a
internal object NewsfeedAdsBlockMapperFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "NewsfeedItemAdsBlockDtoToNewsEntryMapper.kt" },
    returnType = NEWS_ENTRY
)

// NewsfeedItemPromoButtonDtoToPromoButtonMapper.a
internal object NewsfeedPromoButtonMapperFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "NewsfeedItemPromoButtonDtoToPromoButtonMapper.kt" },
    returnType = "Lcom/vk/feed/core/models/news/PromoButton;"
)

// Native ads enricher (removed in 8.200)
internal object NewsfeedAdsEnricherFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "NewsfeedEntriesNativeAdsEnricher.kt" },
    returnType = "V",
    parameters = listOf("Ljava/util/ArrayList;", "L")
)

internal object GetStoriesResponseConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/vk/dto/stories/model/GetStoriesResponse;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "I",
        "Ljava/lang/String;",
        "Ljava/util/List;",
        "Lcom/vk/dto/stories/model/StoriesAds;",
        "Ljava/lang/String;",
        "Lcom/vk/dto/stories/model/ideas/StoryIdeasBlock;"
    )
)

internal object PostDisplayItemListExtKFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "PostDisplayItemListExt.kt" },
    returnType = "V",
    parameters = listOf(
        "Ljava/util/List;",
        "Lcom/vkontakte/android/attachments/VideoSnippetAttachment;",
        NEWS_ENTRY,
        NEWS_ENTRY,
        "L"
    )
)

internal object SuperAppAdapterSetItemsFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "SuperAppAdapter.kt" },
    name = "setItems",
    returnType = "V",
    parameters = listOf("Ljava/util/List;")
)

internal object CatalogSectionConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/vk/catalog2/common/dto/api/section/CatalogSection;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/vk/catalog2/common/dto/api/CatalogDataType;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Lcom/vk/catalog2/common/dto/api/badge/CatalogBadge;",
        "Ljava/util/List;",
        "Ljava/util/List;",
        "Ljava/util/List;",
        "Lcom/vk/catalog2/common/dto/api/hint/CatalogHint;",
        "Lcom/vk/catalog2/common/dto/api/section/CatalogSectionStyle;",
        "Lcom/vk/catalog2/common/dto/api/section/CatalogHeaderStyle;",
        "Lcom/vk/catalog2/common/dto/api/section/CatalogAdBanner;",
        "Ljava/lang/String;"
    )
)

// Inserts the product attach view (sets up its blur background)
internal object ProductAttachesHolderImplDFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "ProductAttachesHolderImpl.kt" &&
            !classDef.type.contains("\$") &&
            method.parameterTypes.size == 1 &&
            method.references("->setupBlurContent(")
    },
    returnType = "V"
)

// Binds product attach data
internal object ProductAttachesHolderImplEFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "ProductAttachesHolderImpl.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf("Ljava/util/List;", "L", "L")
)

internal object ProductAttachesLargeViewBinderFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "ProductAttachesLargeViewBinder.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf("Ljava/util/List;", "L", "L", "L")
)

internal object ProductAttachesTileViewBinderFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "ProductAttachesTileViewBinder.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf("Ljava/util/List;", "L", "L", "L")
)

// Binds the clip item; its sibling with one parameter takes VkBlurContentView
internal object ClipProductAttachesLargeViewHolderFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "ClipProductAttachesLargeViewHolder.kt" &&
            !classDef.type.contains("\$") &&
            method.parameterTypes.size == 1 &&
            method.parameterTypes[0].toString() != "Lcom/vk/core/tool/view/vkblur/VkBlurContentView;"
    },
    returnType = "V"
)

internal object MarketAdsItemMviViewOnAttachedFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "MarketAdsItemMviView.kt" && !classDef.type.contains("\$") },
    name = "onAttachedToWindow",
    returnType = "V",
    parameters = emptyList()
)

// MVI render (Sj in 8.195, oj in 8.200)
internal object MarketAdsItemMviViewSjFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "MarketAdsItemMviView.kt" && !classDef.type.contains("\$") },
    returnType = "V",
    parameters = listOf("L", "Landroid/view/View;")
)

// Clip badge holders (removed in 8.200)
internal object ShopsMoreBadgeHolderFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "ShopsMoreBadgeHolder.kt" && classDef.type.contains("/badges/holders/") },
    returnType = "V",
    parameters = listOf("L")
)

internal object TopShopsMoreBadgeHolderFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "TopShopsMoreBadgeHolder.kt" && classDef.type.contains("/badges/holders/") },
    returnType = "V",
    parameters = listOf("L")
)

@Suppress("unused")
val feedAdsPatch = bytecodePatch(
    name = "Hide feed ads",
    description = "Hides sponsored posts, promo articles, and recommended mini-apps in newsfeed."
) {

    compatibleWith(COMPATIBILITY_VK)

    extendWith("extensions/vk.mpe")

    execute {
        // Modern MVI newsfeed: PostDisplayItemsBuilder.g returns empty list for ads
        PostDisplayItemsBuilderGFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->isAdItem(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :cond_not_ad
                    new-instance v0, Ljava/util/ArrayList;
                    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
                    return-object v0
                    :cond_not_ad
                """
            )
        }

        // Modern MVI newsfeed: PostDisplayItemsBuilder.f suppresses ad item dispatch and sanitizes attachments
        PostDisplayItemsBuilderFFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->isAdItem(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :cond_not_ad
                    return-void
                    :cond_not_ad
                    invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->sanitizePost(Ljava/lang/Object;)V
                """
            )
        }

        // Modern MVI newsfeed: PostDisplayItemsBuilder.d suppresses sponsored Post display and sanitizes attachments
        PostDisplayItemsBuilderDFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->isAdItem(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :cond_not_ad
                    return-void
                    :cond_not_ad
                    invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->sanitizePost(Ljava/lang/Object;)V
                """
            )
        }

        // Modern MVI newsfeed: suppress ShitAttachment (native ads)
        PostDisplayItemsBuilderEFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Modern MVI newsfeed: suppress RecommendedMiniAppEntry
        PostDisplayItemsBuilderWFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Modern MVI newsfeed: suppress ChannelsRecommendations
        PostDisplayItemsBuilderLFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Modern MVI newsfeed: suppress GroupsSuggestions
        PostDisplayItemsBuilderRFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Modern MVI newsfeed: suppress DzenArticlesBlock
        PostDisplayItemsBuilderOFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Modern MVI newsfeed: suppress DzenStory
        PostDisplayItemsBuilderPFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Modern MVI newsfeed: suppress Carousel recommendations
        PostDisplayItemsBuilderAFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }
        PostDisplayItemsBuilderKFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // DTO mapper: AdsBlock mapper returns null
        NewsfeedAdsBlockMapperFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """
            )
        }

        // DTO mapper: PromoButton mapper returns null
        NewsfeedPromoButtonMapperFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """
            )
        }

        // NOTE: The reflection-based `filterNewsfeedList` hooks on the data/pagination
        // layer (NewsfeedData ctor, NewsEntriesContainer ctor) and the hot presenter
        // path (EntriesListPresenter.m/n/K) were REMOVED. isAdItem does several
        // reflective getDeclaredField calls per Post and ran on every feed emission,
        // which made the feed load sluggishly; filtering the DTO containers also shrank
        // each page and broke pagination ("лента не охотно грузит"). Ads are still
        // hidden by the cheap PostDisplayItemsBuilder.* return-void suppressions and the
        // DTO mapper nulls below, which target ad types without touching the list.

        // Remove ads and null StoriesAds in GetStoriesResponse (stories list is short,
        // so this reflection is cheap and not on the main-feed hot path)
        GetStoriesResponseConstructorFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static { p3 }, $EXTENSION_CLASS->filterNewsfeedList(Ljava/util/List;)Ljava/util/List;
                    move-result-object p3
                    const/4 p4, 0x0
                """
            )
        }

        // Disable native ads enricher
        NewsfeedAdsEnricherFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Suppress VideoSnippetAttachment item display (ad card under videos)
        PostDisplayItemListExtKFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Filter promo/banner widgets from Services / Hub tab
        SuperAppAdapterSetItemsFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static { p1 }, $EXTENSION_CLASS->filterSuperAppWidgets(Ljava/util/List;)Ljava/util/List;
                    move-result-object p1
                """
            )
        }

        // Filter promo banners and ad blocks from VK Music and Catalog sections
        CatalogSectionConstructorFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static { p7 }, $EXTENSION_CLASS->filterCatalogBlocks(Ljava/util/List;)Ljava/util/List;
                    move-result-object p7
                    const/4 p13, 0x0
                """
            )
        }

        // Suppress product attach view insertion in clips
        ProductAttachesHolderImplDFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Suppress product attach data binding in clips
        ProductAttachesHolderImplEFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Suppress product attaches large view binding
        ProductAttachesLargeViewBinderFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Suppress product attaches tile view binding
        ProductAttachesTileViewBinderFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Suppress clip product attaches large view holder
        ClipProductAttachesLargeViewHolderFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Suppress clip market ads MVI view attaching to window
        MarketAdsItemMviViewOnAttachedFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Suppress clip market ads MVI view render
        MarketAdsItemMviViewSjFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Suppress shops more badge holder in clips
        ShopsMoreBadgeHolderFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Suppress top shops more badge holder in clips
        TopShopsMoreBadgeHolderFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }
    }
}

