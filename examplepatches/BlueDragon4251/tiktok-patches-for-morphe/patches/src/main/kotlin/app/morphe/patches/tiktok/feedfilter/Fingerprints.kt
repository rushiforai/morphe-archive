/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/feedfilter/Fingerprints.kt
 */
package app.morphe.patches.tiktok.feedfilter

import app.morphe.patcher.Fingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Exact TikTok 46.4.3 For You response post-processing path.
 *
 * Do not hook FeedItemList.getItems() globally: that model is also consumed by profile,
 * detail, series and other non-feed surfaces. The `fyp`/`first_feed_duration` evidence
 * uniquely anchors the real For You response path for this target.
 */
internal object ForYouFeedResponseFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/api/FeedApi;",
    name = "LIZIZ",
    returnType = "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;",
    parameters = listOf("LX/12h2;"),
    strings = listOf("fyp", "first_feed_duration"),
)

/**
 * Exact 46.4.3 cached For You `fetchFeeds` filter.
 *
 * Device testing proved that the cache path can render without passing through
 * FeedApi.LIZIZ(...), which previously let both short videos and ads bypass BlueIT.
 */
internal object ForYouCachedFeedFilterFingerprint : Fingerprint(
    definingClass = "LX/0MPw;",
    name = "LIZIZ",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;"),
    strings = listOf("fetchFeeds, filter by is ad", "fetchFeeds, filter by is duplicate"),
)

/** Exact 46.4.3 cached For You list read (`feed_use_cache_size` / `tryUseCache`). */
internal object ForYouCachedFeedReadFingerprint : Fingerprint(
    definingClass = "LX/0MPw;",
    name = "LJIJJ",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;",
    parameters = emptyList(),
    strings = listOf("feed_use_cache_size", "tryUseCache list size "),
)

/**
 * Final exact 46.4.3 Feed0VVManager commit runnable for the For You feed.
 *
 * This is later than the network/cache hooks. It receives the completed FeedItemList and
 * then runs TikTok's commercial processors (`filter_show_ad`, `filter_installed_ad`,
 * AdSessionPositionHelper/fyp, soft_ads and roi2) immediately before posting to feed UI.
 */
internal object ForYouFinalCommitFingerprint : Fingerprint(
    definingClass = "LY/ARunnableS0S0303000_29;",
    name = "run\$1",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("LY/ARunnableS0S0303000_29;"),
    strings = listOf(
        "Feed0VVManager@569f.commit\$1L",
        "full_feed_commit_process_data",
        "homepage_hot",
        "filter_show_ad",
        "filter_installed_ad",
        "fyp",
        "soft_ads",
        "roi2",
    ),
)

internal object FeedItemListGetItemsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/util/List;",
    custom = { method, classDef ->
        classDef.endsWith("/FeedItemList;") &&
            method.name == "getItems" &&
            method.parameterTypes.isEmpty()
    },
)

internal object FollowFeedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;",
    custom = { method, _ ->
        method.parameterTypes.size == 2
    },
)

internal object FollowFeedListGetItemsFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;",
    name = "getItems",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)

internal object TakoAiFeedButtonSetVisibleFingerprint : Fingerprint(
    definingClass = "/feed/assem/tikbot/TakoAssem;",
    returnType = "V",
    parameters = listOf("Z"),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>() }
            ?: emptyList()

        references.any {
            it.definingClass == "Lcom/bytedance/assem/arch/reused/ReusedUIAssem;" &&
                it.name == "LJJIJLIJ" &&
                it.returnType == "Landroid/view/View;"
        } && references.any {
            it.definingClass == "Landroid/view/View;" &&
                it.name == "getVisibility" &&
                it.returnType == "I"
        }
    },
)

internal object FollowFeedPresenterPostProcessFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;"),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>() }
            ?: emptyList()
        references.any {
            it.definingClass == "Lcom/ss/android/ugc/aweme/feed/model/Aweme;" &&
                it.name == "isAd"
        } && references.any {
            it.definingClass == "Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;" &&
                it.name == "setItems"
        } && references.any {
            it.definingClass == "Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;" &&
                it.name == "setInsertedResults"
        }
    },
)

internal object TakoAiFeedButtonBindFingerprint : Fingerprint(
    definingClass = "/feed/assem/tikbot/TakoAssem;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)
